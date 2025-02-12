import UIKit

extension UIColor {
    convenience init(_ color: Color) {
        self.init(red: color.red, green: color.green, blue: color.blue, alpha: 1.0)
    }
}
