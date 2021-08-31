
import Foundation

struct CharactersResult: Codable {
    let id: Int?
    let name: String?
    let resultDescription: String?
    let dateModified: String?
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics: ComicsList
    let series: ComicsList
    let stories: Stories?
    let events: ComicsList?
    let urls: [URLElement]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case resultDescription = "description"
        case dateModified = "modified"
        case thumbnail
        case resourceURI
        case comics
        case series
        case stories
        case events
        case urls
    }
}
