//
//  ColorSliderWithInputView.swift
//  ColorPicker
//
//  Created by noppe on 2022/03/13.
//

import Foundation
import UIKit

class ColorSliderWithInputView: UIControl {
    let slider = ColorSlider(frame: .null)
   // let textField = ColorSliderTextField(frame: .null)
    let titleLabel = ColorSliderTitleLabel(frame: .null)
    
    private var _color: HSVA = .noop
    
    var color: HSVA {
        get { _color }
        set {
            _color = newValue
            slider.color = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let hStack = UIStackView(arrangedSubviews: [slider])
        hStack.spacing = 14
        
        let vStack = UIStackView(arrangedSubviews: [titleLabel, hStack])
        vStack.spacing = 6
        vStack.axis = .vertical
        addSubview(vStack)
        vStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        //slider.snp.makeConstraints { make in
       //     make.width.equalTo(500)
      // }
        
        slider.addAction(UIAction { [unowned self] _ in
            self.color = slider.color
            self.sendActions(for: [.valueChanged, .primaryActionTriggered])
        }, for: .primaryActionTriggered)
        
       // textField.addAction(UIAction { [unowned self] _ in
         //   self.slider.value = self.textField.value
         //   self.sendActions(for: [.valueChanged, .primaryActionTriggered])
       // }, for: .editingDidEnd)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
