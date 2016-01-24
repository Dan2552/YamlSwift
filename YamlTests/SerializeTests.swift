import Yaml
import XCTest
//TODO fix spacing
class SerializeTests: XCTestCase {

    func testNull() {
        XCTAssert(Yaml.serialize(.Null) == "")
    }
    
    func testBool() {
        XCTAssert(Yaml.serialize(.Bool(true)) == "true")
        XCTAssert(Yaml.serialize(.Bool(false)) == "false")
    }
    
    func testInt() {
        XCTAssert(Yaml.serialize(.Int(2552)) == "2552")
    }
    
    func testDouble() {
        XCTAssert(Yaml.serialize(.Double(25.52)) == "25.52")
        //TODO more to go here
    }
    
    func testString() {
        XCTAssert(Yaml.serialize(.String("Dan2552")) == "Dan2552")
    }
    
    func testBlockSeq() {
        let result = Yaml.serialize(Yaml.Array([1, 2]))
        XCTAssert(result == "- 1\n- 2")
    }
    
    func testBlockMap() {
        let result = Yaml.serialize(.Dictionary(["x": 1, "y": 2]))
        let validResults = [
            "x: 1\ny: 2",
            "y: 2\nx: 1"
        ]
            
        XCTAssert(validResults.contains(result))
    }
    
    func testUnicodeSurrogates() {
        let result = Yaml.serialize(.Dictionary(["x": "Dog‼🐶", "y": "𝒂𝑡"]))
        
        let validResults = [
            "x: Dog‼🐶\ny: 𝒂𝑡",
            "y: 𝒂𝑡\nx: Dog‼🐶"
        ]
        
        XCTAssert(validResults.contains(result))
    }
}
