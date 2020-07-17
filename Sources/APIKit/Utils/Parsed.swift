
/// An enum for wrapping parameter types.
enum Parsed<Value> {
    /// Parameter has a value
    case value(Value)
    /// Parameter is a definition only
    case definition(Void)
}
