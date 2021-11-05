import Foundation
import Kitura

let router = Router()

router.get("/") { _, response, next in
    response.send("Hello cats!")
    next()
}

if #available(macOS 10.12, *) {
    initializePostRoutes(router: router)
} else {
    // Fallback on earlier versions
}
if #available(macOS 10.12, *) {
    initializePostRoutes(router: router)
} else {
    // Fallback on earlier versions
}
initializeUserRoutes(router: router)
try initializeImageRoutes(router: router)

Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()
