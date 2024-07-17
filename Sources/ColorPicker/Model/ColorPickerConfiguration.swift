import UIKit

public class ColorPickerConfiguration {
    public static var `default`: ColorPickerConfiguration { ColorPickerConfiguration() }
    
    public var colorPickers: [UIControl & ColorPicker] = [
        ClassicColorPicker(frame: .null)
    ]
    
    public var initialColorItems: [ColorItem]? = nil
    
    public var usesSwatchTool: Bool = true
    
    public var usesDropperTool: Bool = true
}
