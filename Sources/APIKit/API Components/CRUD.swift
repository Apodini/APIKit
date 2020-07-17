import NIO

public class CRUD<T: APIKitModel>: APIComponent {
    public var content: APIComponent {
        Group {
            Create<T>()
            Group {
                ReadAll<T>()
                ReadOne<T>()
                Update<T>()
                Delete<T>()
            }.RESTGroup(.constant(String(describing: T.self)))
        }
    }
}
