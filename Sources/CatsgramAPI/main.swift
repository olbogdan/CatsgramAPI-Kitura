import Foundation
import Kitura

let router = Router()

router.get("/") { request, response, next in
    response.send("Hello world!")
    next()
}
initializePostRoutes(router: router)

Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()
