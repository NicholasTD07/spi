
enum CandidateType {
    case Empty, Special, English, Chinese
}

class Candidate: NSObject {
    let type: CandidateType
    let text: String
    let shuangpinString: String?
    let englishString: String?
    let specialString: String?
    
    var queryCode: String {
        get {
            switch type {
            case .Empty:
                return ""
            case .Special:
                return specialString!
            case .English:
                return englishString!
            case .Chinese:
                return shuangpinString!
            }
        }
    }
    
    var shuangpinAttributeString: String {
        get {
            switch type {
            case .Empty:
                return ""
            case .Special:
                return text
            case .English:
                return text.lowercaseString
            case .Chinese:
                return shuangpinString!
            }
        }
    }
    
    var shengmuAttributeString: String {
        get {
            switch type {
            case .Empty:
                return ""
            case .Special:
                return String(text[text.startIndex])
            case .English:
                return String(text[text.startIndex])
            case .Chinese:
                return getShengmuString(from: shuangpinString!)
            }
        }
    }
    
    var typeAttributeString: String {
        get {
            switch type {
            case .Special:
                return String(3)
            case .English:
                return String(2)
            case .Chinese:
                return String(1)
            default:
                assertionFailure("Wrong candidate type!")
            }
        }
    }
    
    init(text: String, withShuangpinString shuangpin: String) {
        self.type = .Chinese
        self.text = text
        self.shuangpinString = shuangpin
    }
    
    init(text: String, withEnglishString english: String) {
        self.type = .English
        self.text = text
        self.englishString = english
    }
    
    init(text: String, withSpecialString special: String) {
        self.type = .Special
        self.text = text
        self.specialString = special
    }
    
    init(text: String, type: CandidateType, queryString: String) {
        switch type {
        case .Empty:
            assertionFailure("Candidate init fail!")
        case .Special:
            self.type = .Special
            self.text = text
            self.specialString = queryString
        case .English:
            self.type = .English
            self.text = text
            self.englishString = queryString
        case .Chinese:
            self.type = .Chinese
            self.text = text
            self.shuangpinString = queryString
        }
    }

}