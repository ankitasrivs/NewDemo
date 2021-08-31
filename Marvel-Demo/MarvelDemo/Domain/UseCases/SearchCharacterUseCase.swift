

import Foundation

final class SearchCharacterUseCase {
    private let dataRepository: DataCharactersProtocol
    
    init(repository: DataCharactersProtocol) {
        dataRepository = repository
    }
    
    func execute(input: GellAllCharactersInput) throws -> CharactersViewModel {
        let name = input.name?.isEmpty ?? true ? nil : input.name
        let nameStartsWith = input.nameStartsWith?.isEmpty ?? true ? nil : input.nameStartsWith
        return try dataRepository.getCharacter(GellAllCharactersInput(name: name,
                                                                      nameStartsWith: nameStartsWith,
                                                                      comics: input.comics))
    }
}
