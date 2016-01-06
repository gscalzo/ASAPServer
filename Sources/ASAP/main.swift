import swiftra
import Foundation

#if os(Linux)
    import Glibc
#endif

struct ParamKeys {
    static let ProductID = "productID"
    static let UserEmail = "useremail"
}

get("/products") { req in
    print("Get /products")
    return dbRepository.allProducts()
}

post("/customer/:useremail/cart/:productID") { req in
    print("Add product to cart")
    guard let userEmail = req.params[ParamKeys.UserEmail],
        let productID = req.params[ParamKeys.ProductID] else {
            return Response(.BadRequest)
        }
    dbRepository.addToCartUser(userEmail, productID: productID)
    return "OK"
}

delete("/customer/:useremail/cart/:productID") { req in
    print("Remove product from cart")
    guard let userEmail = req.params[ParamKeys.UserEmail],
        let productID = req.params[ParamKeys.ProductID] else {
            return Response(.BadRequest)
        }
    dbRepository.removeFromCartUser(userEmail, productID: productID)
    return "OK"
}

post("/customer/:useremail/orders") { req in
    print("Create order from cart")
    guard let userEmail = req.params[ParamKeys.UserEmail] else {
            return Response(.BadRequest)
        }
    return dbRepository.orderCreatedFromCartUser(userEmail)
}

print("Starting...")
serve(8888)