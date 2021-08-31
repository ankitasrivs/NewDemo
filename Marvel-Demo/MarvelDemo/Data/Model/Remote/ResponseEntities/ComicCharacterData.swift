
import Foundation

struct ComicCharacterData: Codable {
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    let results: [CharactersResult]?
}
