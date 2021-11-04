import Foundation
import Kitura

let router = Router()

router.get("/") { _, response, next in
    response.send("Hello cats!")
    next()
}

initializePostRoutes(router: router)
initializeUserRoutes(router: router)
try initializeImageRoutes(router: router)

Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()
