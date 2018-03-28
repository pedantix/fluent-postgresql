public protocol PostgreSQLModel: Model where Self.Database == PostgreSQLDatabase, Self.ID == Int {
    /// This model's unique identifier.
    var id: Int? { get set }
}

extension PostgreSQLModel {
    /// See `Model.idKey`
    public static var idKey: IDKey { return \.id }
}

public protocol PostgreSQLPivot: Pivot, PostgreSQLModel { }
