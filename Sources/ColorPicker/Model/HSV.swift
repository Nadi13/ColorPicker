import UIKit

public struct HSV: Equatable, Hashable {
    var h, s, v: Double
}

public extension HSV {
    func makeColor() -> UIColor {
        UIColor(hue: h, saturation: s, brightness: v, alpha: 1)
    }
    
    var rgb: RGB {
        RGBA(makeColor()).rgb
    }
}

public struct HSVA: Equatable, Hashable {
    var hsv: HSV
    var a: Double
}

public extension HSVA {
    public init(_ color: UIColor) {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var v: CGFloat = 0
        var a: CGFloat = 0
        color.getHue(&h, saturation: &s, brightness: &v, alpha: &a)
        self.hsv = HSV(h: h, s: s, v: v)
        self.a = a
    }
    
    public func makeColor() -> UIColor {
        hsv.makeColor().withAlphaComponent(a)
    }
}

public extension HSVA {
    static var noop: HSVA = HSVA(hsv: HSV(h: 0, s: 0, v: 0), a: 0)
}
