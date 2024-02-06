//
//  CustomSlider.swift
//  avmanushkinaPW4
//
//  Created by Анастасия on 04.02.2024.
//

import UIKit

final class CustomSlider: UIView {

    var valueChanged: ((Double) -> Void)?
    var slider = UISlider()
    var titleView = UILabel()
    
    init(title: String, min: Double, max: Double) {
        super.init(frame: .zero)
        titleView.text = title
        slider.minimumValue = Float(min)
        slider.maximumValue = Float(max)
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }
    
    private func configureUI() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        for view in [slider, titleView] {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleView.topAnchor.constraint(equalTo: topAnchor, constant: ConstantsCustomSlider.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ConstantsCustomSlider.leadingAnchor),
            
            slider.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            slider.centerXAnchor.constraint(equalTo: centerXAnchor),
            slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: ConstantsCustomSlider.centerXAnchor),
            slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ConstantsCustomSlider.leadingAnchor)
        ])
    }
    
    @objc
    private func sliderValueChanged() {
        valueChanged?(Double(slider.value))
    }
    
    func changeColors(backgroundColor: UIColor, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        titleView.textColor = textColor
    }
}
