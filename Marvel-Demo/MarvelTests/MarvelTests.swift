

import XCTest
@testable import Marvel

class MarvelTests: XCTestCase {
    private var sut =  Charactersepo(dataSource: NetworkingDataSource())

    func test_getAllCharacters() {
        do {
            let response = try sut.getAllCharacters(offset: 0)
            XCTAssertFalse(response.characters.isEmpty , "This test failure as total characters")
        } catch let error {
            XCTFail("Throw error: \(error)")
        }
    }
    
    func test_search_characte() {
        do {
            let response = try sut.getCharacter(GellAllCharactersInput(nameStartsWith: "alpha"))
            XCTAssertFalse(response.characters.isEmpty , "This test failure")
        } catch let error {
            XCTFail("Throw error: \(error)")
        }
    }
}
