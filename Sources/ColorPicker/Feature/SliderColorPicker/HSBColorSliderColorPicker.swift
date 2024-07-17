import UIKit

public class HSBColorSliderColorPicker: UIControl, ColorPicker {
    public let id: String = #function
    public let title: String = LocalizedString.hsb
    
    let hueSlider = ColorSliderWithInputView()
    
    private var _color: HSVA = .noop
    
    public var color: HSVA {
        get { _color }
        set {
            _color = newValue
            hueSlider.color = newValue
        }
    }
    
    public var continuously: Bool {
        [
            hueSlider.slider.panGestureRecognizer.state
        ].contains(.changed)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        hueSlider.slider.configuration = .hue
     //   hueSlider.textField.configuration = .radius
        hueSlider.titleLabel.text = LocalizedString.hue
        
        let vStack = UIStackView(arrangedSubviews: [hueSlider])
        vStack.axis = .vertical
        vStack.spacing = 16
        addSubview(vStack)
        
        vStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let valueSyncAction = UIAction { [unowned self] action in
            let slider = (action.sender as! ColorSliderWithInputView).slider
            self.color = slider.color
            self.sendActions(for: [.valueChanged, .primaryActionTriggered])
        }
        hueSlider.addAction(valueSyncAction, for: .primaryActionTriggered)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

