import Foundation

let dbRepository = DBRepository()

class DBRepository {
    func allProducts() -> String {
        do {
            return try NSString(contentsOfFile: "products.json", 
                encoding: NSUTF8StringEncoding) as String
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