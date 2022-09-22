import Moya
import Foundation

enum Services {
    case signUp(param: SignupRequest)
    case signIn(param: SigninRequest)
    case certification(param: CertificationRequest)
}


extension Services: TargetType {
    public var baseURL: URL {
        return URL(string: "http://10.120.74.59/")!
    }
    
    var path: String {
        switch self {
        case .signUp:
            return "user/signup"
        case .signIn:
            return "user/signin"
        case .certification:
            return "user/check/email"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signUp,.signIn,.certification:
            return .post
            
        }
    }
    
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .signUp(let param):
            return .requestJSONEncodable(param)
        case .signIn(let param):
            return .requestJSONEncodable(param)
        case .certification(let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return["Content-Type" :"application/json"]
        }
    }
}
