import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    app.get("pokemon") { req async -> String in
        "This is the Pokémon endpoint"
    }

    app.get("hello", ":name") { req async -> String in
        guard
            let name  = req.parameters.get("name"),
            name.count > 1
        else {
            return "Not a valid name. Must be longer than one letter"
        }
        return "Hello, \(name)"
    }
}
