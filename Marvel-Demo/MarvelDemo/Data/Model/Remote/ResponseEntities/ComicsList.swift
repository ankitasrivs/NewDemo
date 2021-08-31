

import Foundation

struct ComicsList: Codable {
    let available: Int?
    let collectionURI: String?
    let returned: Int?
    let items: [ComicsItem]?
}
