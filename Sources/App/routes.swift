import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    
    let quoteController = QuoteController()
    router.get("quotes", use: quoteController.index)
    router.post("quotes", use: quoteController.create)
//    router.delete("quotes", Quote.parameter, use: quoteController.delete)
    
}
