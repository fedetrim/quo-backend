import FluentSQLite
import Vapor

struct Quote: SQLiteModel {
    var id: Int?
    var message: String
    var author: String?
    var creationDate: Date
    
    init(id: Int? = nil, message: String, author: String? = nil, creationDate: Date = Date()) {
        self.id = id
        self.message = message
        self.author = author
        self.creationDate = creationDate
    }
}

/// Allows `Quote` to be used as a dynamic migration.
extension Quote: Migration { }

/// Allows `Quote` to be encoded to and decoded from HTTP messages.
extension Quote: Content { }

/// Allows `Quote` to be used as a dynamic parameter in route definitions.
extension Quote: Parameter { }
