public extension Array {
    func prepending(_ element: Element) -> [Element] {
        return [element] + self
    }

    func appending(_ element: Element) -> [Element] {
        var mutable = self
        mutable.append(element)
        return mutable
    }
}
