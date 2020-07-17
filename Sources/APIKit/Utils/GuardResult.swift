
/// An enum for guard authentication results.
public enum GuardResult {
    /// Guard (authorization) passed
    case passed(Void)
    /// Guard (authorization) not passed
    case error(Error)
}
