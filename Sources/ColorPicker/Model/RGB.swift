import UIKit

public struct RGB {
    var r, g, b: Double
}

public extension RGB {
    func makeColor() -> UIColor {
        UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    var hsv: HSV {
        HSVA(makeColor()).hsv
    }
}

public struct RGBA {
    var rgb: RGB
    var a: Double
}

public extension RGBA {
    init(_ color: UIColor) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        self.rgb = RGB(r: r, g: g, b: b)
        self.a = a
    }
    
    func makeColor() -> UIColor {
        rgb.makeColor().withAlphaComponent(a)
    }
}

