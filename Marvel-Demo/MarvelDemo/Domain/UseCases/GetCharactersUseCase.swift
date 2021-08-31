

import Foundation

final class GetCharactersUseCase {
    private let dataRepository: DataCharactersProtocol
    
    init(repository: DataCharactersProtocol) {
        dataRepository = repository
    }
    
    func execute(offset: Int) throws -> CharactersViewModel {
        return try dataRepository.getAllCharacters(offset: offset)
    }
}
