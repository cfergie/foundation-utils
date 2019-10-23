import Foundation

public extension URLSession {
    enum Error: Swift.Error {
        case noData
    }

    func dataTask<T: Decodable>(
        with url: URL,
        completionHandler: @escaping (Result<T, Swift.Error>) -> Void
    ) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            do {
                if let error = error {
                    throw error
                }

                guard let data = data else {
                    throw Error.noData
                }

                let decoded = try JSONDecoder().decode(T.self, from: data)

                completionHandler(.success(decoded))
            } catch let error {
                completionHandler(.failure(error))
            }
        }
    }
}
