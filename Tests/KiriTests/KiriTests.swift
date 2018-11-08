import XCTest
@testable import Kiri

final class KiriTests: XCTestCase {
    static var allTests = [
        ("testStubResponse", testStubResponse)
    ]

    func testStubResponse() {
        let expectation = XCTestExpectation(description: "Stub Response")
        Kiri<KiriTestAPI>(request: .bearer).stubResponse { (response, _) in
            guard let response = response else {
                XCTFail("response is nil")
                return
            }

            do {
                let mock: BearerResponse = try response.decodeJSON()
                let stubRes: BearerResponse? = try response.request.mockResponse?.decodeJSON()
                XCTAssertEqual(mock.token, stubRes?.token)
            } catch {
                XCTFail()
            }

            XCTAssertTrue(response.plainText() == response.request.mockResponse?.plainText())
            XCTAssertTrue(response.response?.statusCode == 200)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10.0)
    }
}

enum KiriTestAPI {
    case bearer
}

class BearerResponse: Decodable {
    let authenticated: Bool
    let token: String
}

extension KiriTestAPI: RequestContainer {

    var mockResponse: Response? {
        let data = prepareMock()
        let httpresponse = HTTPURLResponse(url: endpoint.appendingPathComponent(path), statusCode: 200, httpVersion: nil, headerFields: nil)
        return Response(data: data, response: httpresponse, request: self)
    }

    var headers: HTTPHeaders {
        return ["Authorization": "Bearer testtoken"]
    }

    var path: String {
        return "/bearer"
    }

    var parameters: Parameters? {
        return nil
    }

    var encoding: URLEncoding {
        return URLEncoding.queryString
    }

    var endpoint: URL {
        return URL(string: "https://httpbin.org")!
    }

    var httpMethod: HTTPMethod {
      return .get
    }
}

// MARK: Test Helpers

extension KiriTestAPI {

    func prepareMock() -> Data {
        var responseData: Data?
        switch self {
        case .bearer:
            responseData = "{\"authenticated\": true,\"token\": \"testtoken\"}".data(using: .utf8)
        }

        return responseData ?? Data()
    }

}
