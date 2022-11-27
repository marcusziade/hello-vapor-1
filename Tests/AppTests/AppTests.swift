@testable import App
import XCTVapor

final class AppTests: XCTestCase {

    func testPokemon() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)

        try app.test(.GET, "pokemon") { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "This is the Pokémon endpoint")
        }
    }

    func testHelloWorld() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)

        try app.test(.GET, "hello") { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "Hello, world!")
        }
    }
}
