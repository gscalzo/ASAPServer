import Foundation

let dbRepository = DBRepository()

class DBRepository {
    func allProducts() -> String {
        do {
            let productsAsNSString = try NSString(contentsOfFile: "products.json", 
                encoding: NSUTF8StringEncoding)
#if os(Linux)
            return productsAsNSString.bridge()
#else
            return productsAsNSString as String
#endif
        }
        catch {
            print("Error")    
        }
        return "{ products: [] }"
    }

    func addToCartUser(userEmail: String, productID: String) {
        // add to cart of the user
    }

    func removeFromCartUser(userEmail: String, productID: String) {
        // remove from cart of the user
    }

    func orderCreatedFromCartUser(userEmail: String) -> String {
        // create a new order from the cart
        return "1"
    }
}