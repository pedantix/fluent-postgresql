import Core

/// A type that is compatible with PostgreSQL schema and data.
public protocol PostgreSQLType:
    PostgreSQLColumnStaticRepresentable, PostgreSQLDataConvertible { }

extension PostgreSQLColumnStaticRepresentable where Self: PostgreSQLDataConvertible {
    /// The `PostgreSQLColumn` type that best represents this type.
    public static var postgreSQLColumn: PostgreSQLColumn { return .init(type: Self.postgreSQLDataType) }
}

/// A type that is supports being represented as JSONB in a PostgreSQL database.
public protocol PostgreSQLJSONType: PostgreSQLType, PostgreSQLJSONCustomConvertible { }

/// A type that is supports being represented as T[] in a PostgreSQL database.
public protocol PostgreSQLArrayType: PostgreSQLType, PostgreSQLArrayCustomConvertible { }

public protocol PostgreSQLEnumType: PostgreSQLType, Codable, RawRepresentable where Self.RawValue: PostgreSQLDataConvertible { }

/// MARK: Default Implementations

extension Data: PostgreSQLType { }
extension UUID: PostgreSQLType { }
extension Date: PostgreSQLType { }
extension Int: PostgreSQLType { }
extension Int8: PostgreSQLType { }
extension Int16: PostgreSQLType { }
extension Int32: PostgreSQLType { }
extension Int64: PostgreSQLType { }
extension UInt: PostgreSQLType { }
extension UInt8: PostgreSQLType { }
extension UInt16: PostgreSQLType { }
extension UInt32: PostgreSQLType { }
extension UInt64: PostgreSQLType { }
extension Float: PostgreSQLType { }
extension Double: PostgreSQLType { }
extension String: PostgreSQLType { }
extension Bool: PostgreSQLType { }
extension Array: PostgreSQLArrayType { }
extension PostgreSQLPoint: PostgreSQLType { }
