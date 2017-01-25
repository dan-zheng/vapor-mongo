import Vapor
import Fluent

final class Link : Model {
    var id: Node?
    var fullLink: String
    var shortLink: String
    
    init(url: String) {
        self.fullLink = url
        self.shortLink = url
    }
    
    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        fullLink = try node.extract("fullLink")
        shortLink = try node.extract("shortLink")
    }
    
    public func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "fullLink": fullLink,
            "shortLink": shortLink
        ])
    }
    
    static func prepare(_ database: Database) throws {
        //
    }
    
    static func revert(_ database: Database) throws {
        //
    }
}
