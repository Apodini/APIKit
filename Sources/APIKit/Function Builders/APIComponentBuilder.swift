/// A function builder used to aggregate multiple `APIComponents` into a single `APIComponent`
@_functionBuilder
public struct APIComponentBuilder {
    
    /// Transforms multiple `APIComponents` into one.
    ///
    /// - Parameter apiComponents: One or more `APIComponents` to transform into a
    /// single `APIComponent`.
    /// - Returns: A virtual `APIComponent` representing one of more `APIComponents`.
    public static func buildBlock(_ apiComponents: APIComponent...) -> APIComponent {
        apiComponents
    }
}
