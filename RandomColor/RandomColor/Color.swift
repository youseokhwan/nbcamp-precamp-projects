import Foundation

struct Color {
    var red = CGFloat(1.0)
    var green = CGFloat(1.0)
    var blue = CGFloat(1.0)
    
    var rgbText: String {
        return "R: \(Int(red * 255)), G: \(Int(green * 255)), B: \(Int(blue * 255))"
    }
    
    mutating func updateRandomRGB() {
        red = CGFloat.random(in: 0...1)
        green = CGFloat.random(in: 0...1)
        blue = CGFloat.random(in: 0...1)
    }
    
    mutating func resetRGB() {
        red = CGFloat(1.0)
        green = CGFloat(1.0)
        blue = CGFloat(1.0)
    }
}
