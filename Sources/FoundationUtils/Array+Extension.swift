public extension Array {
    func appending(_ element: Element) -> [Element] {
        var mutable = self
        mutable.append(element)
        return mutable
    }
}
