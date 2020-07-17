import NIO

/// A class that provides the default `Guard` behaviour.
public class DefaultGuard: Guard {
    /// Defines the `AuthenticationType` used for fetching the user credential information from the request.
    public var authenticationType: AuthenticationType = .bearer
    
    /// The update implementation of the handler function.
    /// Currently it is a placeholder, as we do not have a web framework included (out of the Bachelors Thesis' scope).
    public func handler() -> EventLoopFuture<GuardResult> {
        "" as! EventLoopFuture<GuardResult>
    }
}
