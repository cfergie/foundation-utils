public enum Async<Value> {
    case initial
    case loading
    case loaded(Value)
}

extension Async: Equatable where Value: Equatable {
}
