import XCTest
@testable import Kiri

final class KiriTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

class TestResponse {}

class TestRequest: RequestContainer {
    var path: String = "/testpath"
    
    var parameters: Parameters?
    
    var encoding: URLEncoding = URLEncoding.queryString
    
    var endpoint: String = "https://example.com"
    
    var httpMethod: HTTPMethod = .get
    
    func response(data: Data) throws -> TestResponse {
        return TestResponse()
    }
    
    typealias responseType = TestResponse
    
    
}
