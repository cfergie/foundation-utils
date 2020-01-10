import Foundation

public struct Throwable<T: Decodable>: Decodable {
    public let result: Result<T, Swift.Error>

    public init(from decoder: Decoder) throws {
        self.result = Result {
            try T(from: decoder)
        }
    }
}
