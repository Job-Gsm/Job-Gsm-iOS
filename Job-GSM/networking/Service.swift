import Moya
import Foundation

enum LoginServices {
    case signUp(param: SignupRequest)
    case signIn(param: SigninRequest)
}


extension LoginServices: TargetType {
    public var baseURL: URL {
        return URL(string: "http://10.53.68.205:8081/")!
    }
    
    var path: String {
        switch self {
        case .signUp:
            return "user/signup"
        case .signIn:
            return "user/signin"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signUp,.signIn:
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
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return["Content-Type" :"application/json"]
        }
    }
}
