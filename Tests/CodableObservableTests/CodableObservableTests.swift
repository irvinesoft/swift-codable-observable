import Foundation
import Observation
import Testing
import CodableObservable

@Observable
@CodableObservable
private final class TestModel: Codable {
    var id: Int
    var name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

@Test
func observableCodingKeysSupportsCodableDecodingFromJSON() throws {
    let json = #"{"id":42,"name":"alpha"}"#
    let data = Data(json.utf8)

    let decoded = try JSONDecoder().decode(TestModel.self, from: data)

    #expect(decoded.id == 42)
    #expect(decoded.name == "alpha")
}
