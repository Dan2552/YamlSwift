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

    func testFlowSeq() {
        XCTAssert(Yaml.serialize(.Array([])) == "[]")
        print(Yaml.serialize(Yaml.Array([true, false, true])))
        XCTAssert(Yaml.serialize(.Array([true, false, true])) == "[true, false, true]")
        //TODO more of these for sure
    }
    
    func testBlockSeq() {
// TODO
//        
//        let yaml = Yaml.load("- 1\n- 2")
//        (lldb) po yaml.value!
//            ▿ Array([Int(1), Int(2)])
//            ▿ Array : 2 elements
//        ▿ [0] : Int(1)
//        - Int : 1
//        ▿ [1] : Int(2)
//        - Int : 2
//        
//        XCTAssert(Yaml.serialize(???) == "- 1\n- 2")
    }
    
    func testFlowMap() {
// TODO
//        let yaml = Yaml.load("{}")
//        (lldb) po yaml
//            ▿ Result<Yaml>
//            ▿ Value : <Box<Yaml>: 0x1002203a0>
//        (lldb) po yaml.value!
//            ▿ Dictionary([:])
//            - Dictionary : 0 elements
//        
//        XCTAssert(Yaml.serialize(???) == "{}")
    }
    
    func testBlockMap() {
        
    }
    
    func testDirectives() {
        
    }
    
    func testReserves() {
        
    }
    
    func testAliases() {
        
    }
    
    func testUnicodeSurrogates() {
        
    }
}
