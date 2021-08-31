
import Foundation

struct CharacterDataContainer: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [CharactersResult]?
}
