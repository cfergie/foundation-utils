import Foundation

public struct Throwable<T: Decodable>: Decodable {
    public let result: Result<T, Swift.Error>

    public init(from decoder: Decoder) throws {
        do {
            let value = try T(from: decoder)
            result = .success(value)
        } catch let error {
            result = .failure(error)
        }
    }
}
