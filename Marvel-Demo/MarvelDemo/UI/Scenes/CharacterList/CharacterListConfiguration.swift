
import Foundation

struct CharacterListConfiguration {
    
    static let repository: DataCharactersProtocol =  Charactersepo(dataSource: NetworkingDataSource())
    
    
}
