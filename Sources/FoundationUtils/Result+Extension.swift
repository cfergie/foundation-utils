public extension Result {
    func map<NewSuccess>(_ transform: (Success) throws -> NewSuccess) -> Result<NewSuccess, Swift.Error> {
        do {
            let value = try self.get()

            let newValue = try transform(value)

            return .success(newValue)
        } catch let error {
            return .failure(error)
        }
    }

    func `default`(to defaultValue: Success) -> Success {
        do {
            return try self.get()
        } catch {
            return defaultValue
        }
    }
}
