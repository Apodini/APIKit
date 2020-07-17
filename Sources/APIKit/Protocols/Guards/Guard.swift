import NIO

/// A protocol that defines the structure of a Guard.
public protocol Guard {
    /// Defines the `AuthenticationType` used for fetching the user credential information from the request.
    var authenticationType: AuthenticationType { get }
    
    /// Method that contains the authorization logic.
    ///
    /// - Returns: `GuardResult` wrapped by `EventLoopFuture`.
    func handler() -> EventLoopFuture<GuardResult>
}
