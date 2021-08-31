

import Foundation

enum ApiError: Error {
    case service
}
//Data Source protocol to show filtered results
protocol DataSourceProtocol {
    func getAllCharacters(inputParam: GellAllCharactersInput?) throws -> ComicCharacters
}

final class NetworkingDataSource: DataSourceProtocol {
    private let authenticationManager: APIManager
    private let api = MarvelApiKeys()
    private let netClient = NetworkingClient()
    
    init () {
        authenticationManager = APIManager(apiNetworking: api)
    }
    
    /// Get all characters based on search
    /// - Parameter inputParam:
    /// - Throws: Error
    /// - Returns: characters
    func getAllCharacters(inputParam: GellAllCharactersInput?) throws -> ComicCharacters {
        let path = "/v1/public/characters"
        let base = api.baseUrl
        let parameters: [String: Any] = {
           let paramsAuth = authenticationManager
                .generateParameters()
                .dictionary ?? [:]
            let inputParams = inputParam?.dictionary ?? [:]
            return paramsAuth.merging(inputParams) { $1 }
        }()
        
        let result = netClient
            .requestApi(url: base + path,
                     queryParams: parameters,
                     method: .get)
        switch result {
        case .success(let response):
            return try JSONDecoder().decode(ComicCharacters.self, from: response.data)
        case .failure(let error):
            switch error {
            case .unknown, .timeout, .custom:
                throw ApiError.service
            }
        }
    }
}
