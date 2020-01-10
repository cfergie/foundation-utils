import Foundation
#if canImport(UIKit)
import UIKit.UIImage
#endif

public extension URLSession {
    enum Error: Swift.Error {
        case noData
    }

    func dataTask<T: Decodable>(
        with url: URL,
        completionHandler: @escaping (Result<T, Swift.Error>) -> Void
    ) -> URLSessionDataTask {
        return self.dataTask(
            with: URLRequest(url: url),
            completionHandler: completionHandler
        )
    }

    func dataTask<T: Decodable>(
        with urlRequest: URLRequest,
        completionHandler: @escaping (Result<T, Swift.Error>) -> Void
    ) -> URLSessionDataTask {
        return dataTask(with: urlRequest) { (data, response, error) in
            completionHandler(Result {
                if let error = error {
                    throw error
                }

                guard let data = data else {
                    throw Error.noData
                }

                return try JSONDecoder().decode(T.self, from: data)
            })
        }
    }

    #if canImport(UIKit)
    func dataTask(
        with url: URL,
        completionHandler: @escaping (UIImage?) -> Void
    ) -> URLSessionDataTask {
        return dataTask(with: URLRequest(url: url), completionHandler: completionHandler)
    }

    func dataTask(
        with urlRequest: URLRequest,
        completionHandler: @escaping (UIImage?) -> Void
    ) -> URLSessionDataTask {
        return dataTask(with: urlRequest) { (data, _, _) in
            let image = data.map { UIImage(data: $0) } ?? nil
            completionHandler(image)
        }
    }
    #endif
}
