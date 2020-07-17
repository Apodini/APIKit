
/// Base Protocol for a model that is used by APIKit.
/// It is used as placeholder as in the current implementation stage we do not build on top of an ORM.
public protocol APIKitModel: Identifiable, LosslessStringConvertible, AnyObject {}
