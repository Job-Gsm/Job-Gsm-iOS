import Moya
import Foundation

enum API {
    case signIn
    case signUp
}


extension API:TargetType{
    var baseURL: URL {
        return URL(string: "http://10.53.68.236:8081/")!
    }
    
    var path: String {
        switch self{
        case .signIn,
            .signUp:
            return "signin"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signIn,
            .signUp:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .signIn:
            return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
        case .signUp:
            return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
