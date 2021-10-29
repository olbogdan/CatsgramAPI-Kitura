import Foundation
import Kitura

let router = Router()

router.get("/") { request, response, next in
    response.send("Hello world!")
    next()
}
initializePostRoutes(router: router)

Kitura.addHTTPServer(onPort: 8081, with: router)
Kitura.run()
