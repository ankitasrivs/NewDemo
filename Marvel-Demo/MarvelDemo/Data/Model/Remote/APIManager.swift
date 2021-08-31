
import Foundation
import CryptoKit

struct ApiKeyParameters: Codable {
    let apiKey: String
    let timeStamp: Int
    let hash: String
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "apikey"
        case timeStamp = "ts"
        case hash
    }
}
//APi managr class
final class APIManager {
    private var apiNetworking: ApiProtocol
    
    init(apiNetworking: ApiProtocol) {
        self.apiNetworking = apiNetworking
    }
    
    func generateParameters() -> ApiKeyParameters {
        let timeStamp = Int(Date().timeIntervalSince1970)
        let hash = "\(timeStamp)" + apiNetworking.privateApiKey + apiNetworking.publicApiKey
        let md5 = Insecure.MD5.hash(data: hash.data(using: .utf8) ?? Data())
            .map { String(format: "%02hhx", $0 )}.joined()
        return ApiKeyParameters(apiKey: apiNetworking.publicApiKey, timeStamp: timeStamp, hash: md5)
    }
}
