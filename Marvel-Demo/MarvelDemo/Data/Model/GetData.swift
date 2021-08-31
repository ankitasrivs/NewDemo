

import Foundation
//Data Protocols
protocol DataCharactersProtocol {
    func getAllCharacters(offset: Int) throws -> CharactersViewModel
    func getCharacter(_ input: GellAllCharactersInput) throws -> CharactersViewModel
}
///Characters search protocols
final class  Charactersepo: DataCharactersProtocol {
    private let dataSource: DataSourceProtocol
    
    init(dataSource: DataSourceProtocol) {
        self.dataSource = dataSource
    }

    func getAllCharacters(offset: Int) throws -> CharactersViewModel {
        let response = try dataSource
            .getAllCharacters(inputParam: GellAllCharactersInput(offSet: offset ))
        return CharactersViewModel(response)
    }
    
    func getCharacter(_ input: GellAllCharactersInput) throws -> CharactersViewModel {
        let response = try dataSource
            .getAllCharacters(inputParam: input)
        return CharactersViewModel(response)
    }

}
