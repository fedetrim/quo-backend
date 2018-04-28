import Vapor

/// Controlers basic CRUD operations on `Quote`s.
final class QuoteController {
    /// Returns a list of all `Quote`s.
    func index(_ req: Request) throws -> Future<[Quote]> {
        return Quote.query(on: req).all()
    }

    /// Saves a decoded `Quote` to the database.
    func create(_ req: Request) throws -> Future<Quote> {
        struct QuoteDTO: Decodable {
            var message: String
            var author: String?
        }
        
        return try req.content.decode(QuoteDTO.self).flatMap(to: Quote.self) { quoteDTO in
            let quote = Quote(message: quoteDTO.message, author: quoteDTO.author, creationDate: Date())
            return quote.save(on: req)
        }
    }

//    /// Deletes a parameterized `Quote`.
//    func delete(_ req: Request) throws -> Future<HTTPStatus> {
//        return try req.parameters.next(Quote).flatMap(to: Void.self) { todo in
//            return todo.delete(on: req)
//        }.transform(to: .ok)
//    }
}
