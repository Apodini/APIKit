import XCTest
@testable import APIKit
import NIO

final class APIKitTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        struct AdminGuard: Guard {
            var authenticationType: AuthenticationType = .bearer
            
            func handler() -> EventLoopFuture<GuardResult> {
                "" as! EventLoopFuture<GuardResult>
            }
        }
        
        class Car: APIKitModel {
            required init?(_ description: String) {
                self.brand = "LosslessStringConvertible"
                self.price = 1.0
                self.description = description
            }
            
            var description: String
            
            let brand: String
            let price: Float
            
            init(brand: String, price: Float) {
                self.brand = brand
                self.price = price
                self.description = ""
            }
        }
        
        struct MyAPI: API {
            var content: APIComponent {
                Version("v1") {
                    Group {
                        ReadOne<Car>()
                    }.RESTGroup("cars")
                }
            }
        }
        
        let myAPI = MyAPI()
        let apiExport = myAPI.export()
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        let jsonResultData = try jsonEncoder.encode(apiExport)
        let output = String(data: jsonResultData, encoding: .utf8)!
        print(output)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
