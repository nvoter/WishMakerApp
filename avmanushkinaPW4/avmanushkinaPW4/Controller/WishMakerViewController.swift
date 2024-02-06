//
//  WishMakerViewController.swift
//  avmanushkinaPW4
//
//  Created by Анастасия on 04.02.2024.
//

import UIKit

final class WishMakerViewController: UIViewController, UIColorPickerViewControllerDelegate {
    let titleView = UILabel()
    let descriptionView = UILabel()
    let stack = UIStackView()
    var backgroundRed: Double = ConstantsWishMakerViewController.backgroundDefaultValue
    var backgroundBlue: Double = ConstantsWishMakerViewController.backgroundDefaultValue
    var backgroundGreen: Double = ConstantsWishMakerViewController.backgroundDefaultValue
    let sliderRed = CustomSlider(title: ConstantsWishMakerViewController.redSliderTitle, min: ConstantsWishMakerViewController.sliderMinValue, max: ConstantsWishMakerViewController.sliderMaxValue)
    let sliderBlue = CustomSlider(title: ConstantsWishMakerViewController.blueSliderTitle, min: ConstantsWishMakerViewController.sliderMinValue, max: ConstantsWishMakerViewController.sliderMaxValue)
    let sliderGreen = CustomSlider(title: ConstantsWishMakerViewController.greenSliderTitle, min: ConstantsWishMakerViewController.sliderMinValue, max: ConstantsWishMakerViewController.sliderMaxValue)
    let hideSlidersButton = UIButton()
    let setRandomColorButton = UIButton()
    let colorPickerButton = UIButton()
    let addWishButton = UIButton()
    let scheduleButton = UIButton()
    static var backgroudColor = UIColor()
    static var textColor = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor(color: .cyan)
        configureUI()
    }
    
    private func configureUI() {
        configureTitle()
        configureDescription()
        configureSliders()
        configureHideSlidersButton()
        configureSetRandomColorButton()
        configureColorPickerButton()
        configureAddWishButton()
        configureScheduleButton()
    }
    
    private func configureTitle() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.text = ConstantsWishMakerViewController.titleText
        titleView.textColor = .black
        WishMakerViewController.textColor = .black
        titleView.font = UIFont.boldSystemFont(ofSize: ConstantsWishMakerViewController.fontSize)
        view.addSubview(titleView)
        titleView.pinTop(to: view.safeAreaLayoutGuide.topAnchor, ConstantsWishMakerViewController.topAnchor)
        titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsWishMakerViewController.leadingAnchor).isActive = true
    }
    
    private func configureDescription() {
        let title = view.subviews.first
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.text = ConstantsWishMakerViewController.descriptionText
        descriptionView.lineBreakMode = NSLineBreakMode.byWordWrapping
        descriptionView.numberOfLines = ConstantsWishMakerViewController.numberOfLines
        descriptionView.font = UIFont.systemFont(ofSize: ConstantsWishMakerViewController.descriptionFontSize)
        descriptionView.textColor = .black
        view.addSubview(descriptionView)
        NSLayoutConstraint.activate([
            descriptionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsWishMakerViewController.leadingAnchor),
            descriptionView.topAnchor.constraint(equalTo: title!.bottomAnchor, constant: ConstantsWishMakerViewController.descriptionTopAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantsWishMakerViewController.descriptionTrailingAnchor)
        ])
    }
    
    private func configureSliders() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        view.addSubview(stack)
        stack.layer.cornerRadius = ConstantsWishMakerViewController.stackCornerRadius
        stack.clipsToBounds = true
        
        for slider in [sliderRed, sliderBlue, sliderGreen] {
            stack.addArrangedSubview(slider)
            slider.changeColors(backgroundColor: .white, textColor: .black)
        }
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsWishMakerViewController.leadingAnchor),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: ConstantsWishMakerViewController.stackBottomAnchor)
        ])
        
        sliderRed.valueChanged = { [weak self] value in
            self?.backgroundRed = value
            self?.changeBackground()
        }
        
        sliderBlue.valueChanged = { [weak self] value in
            self?.backgroundBlue = value
            self?.changeBackground()
        }
        
        sliderGreen.valueChanged = { [weak self] value in
            self?.backgroundGreen = value
            self?.changeBackground()
        }
    }
    
    private func changeBackground() {
        let color: UIColor = UIColor(_colorLiteralRed: self.sliderRed.slider.value, green: self.sliderGreen.slider.value, blue: self.sliderBlue.slider.value, alpha: ConstantsWishMakerViewController.alpha)
        setBackgroundColor(color: color)
    }
    
    private func configureHideSlidersButton() {
        hideSlidersButton.setTitle(ConstantsWishMakerViewController.hideSlidersText, for: .normal)
        hideSlidersButton.backgroundColor = .white
        hideSlidersButton.setTitleColor(.black, for: .normal)
        hideSlidersButton.layer.cornerRadius = ConstantsWishMakerViewController.cornerRadius
        view.addSubview(hideSlidersButton)
        hideSlidersButton.addTarget(self, action: #selector(hideSliders), for: .touchUpInside)
        hideSlidersButton.pinCenterX(to: view)
        hideSlidersButton.pinWidth(to: stack)
        hideSlidersButton.pinTop(to: stack.bottomAnchor, ConstantsWishMakerViewController.buttonTop)
        hideSlidersButton.heightAnchor.constraint(equalToConstant: ConstantsWishMakerViewController.buttonHeight).isActive = true
    }
    
    @objc
    private func hideSliders() {
        if (stack.isHidden) {
            stack.isHidden = false
            hideSlidersButton.setTitle(ConstantsWishMakerViewController.hideSlidersText, for: .normal)
        } else {
            stack.isHidden = true
            hideSlidersButton.setTitle(ConstantsWishMakerViewController.showSlidersText, for: .normal)
        }
    }
    
    private func configureSetRandomColorButton() {
        setRandomColorButton.setTitle(ConstantsWishMakerViewController.setRandomColorText, for: .normal)
        setRandomColorButton.backgroundColor = .white
        setRandomColorButton.setTitleColor(.black, for: .normal)
        setRandomColorButton.layer.cornerRadius = ConstantsWishMakerViewController.cornerRadius
        view.addSubview(setRandomColorButton)
        setRandomColorButton.addTarget(self, action: #selector(setRandomColor), for: .touchUpInside)
        setRandomColorButton.pinCenterX(to: view)
        setRandomColorButton.pinWidth(to: stack)
        setRandomColorButton.pinTop(to: hideSlidersButton.bottomAnchor, ConstantsWishMakerViewController.buttonTop)
        setRandomColorButton.heightAnchor.constraint(equalToConstant: ConstantsWishMakerViewController.buttonHeight).isActive = true
    }
    
    @objc
    private func setRandomColor() {
        let color = UIColor(
            red: .random(in: ConstantsWishMakerViewController.sliderMinValue...ConstantsWishMakerViewController.sliderMaxValue),
            green: .random(in: ConstantsWishMakerViewController.sliderMinValue...ConstantsWishMakerViewController.sliderMaxValue),
            blue: .random(in: ConstantsWishMakerViewController.sliderMinValue...ConstantsWishMakerViewController.sliderMaxValue),
            alpha: CGFloat(ConstantsWishMakerViewController.alpha)
        )
        setBackgroundColor(color: color)
    }
    
    private func setBackgroundColor(color: UIColor) {
        view.backgroundColor = color
        WishMakerViewController.backgroudColor = color
        self.sliderRed.slider.value = Float((color.cgColor.components?[ConstantsWishMakerViewController.redComponent])!)
        self.sliderGreen.slider.value = Float((color.cgColor.components?[ConstantsWishMakerViewController.greenComponent])!)
        self.sliderBlue.slider.value = Float((color.cgColor.components?[ConstantsWishMakerViewController.blueComponent])!)
        stack.tintColor = WishMakerViewController.backgroudColor
        hideSlidersButton.setTitleColor(color, for: .normal)
        setRandomColorButton.setTitleColor(color, for: .normal)
        colorPickerButton.setTitleColor(color, for: .normal)
        addWishButton.setTitleColor(color, for: .normal)
        scheduleButton.setTitleColor(color, for: .normal)
        WishMakerViewController.textColor = getOppositeColor(color: color)
        titleView.textColor = WishMakerViewController.textColor
        descriptionView.textColor = WishMakerViewController.textColor
        hideSlidersButton.backgroundColor = WishMakerViewController.textColor
        setRandomColorButton.backgroundColor = WishMakerViewController.textColor
        colorPickerButton.backgroundColor = WishMakerViewController.textColor
        addWishButton.backgroundColor = WishMakerViewController.textColor
        scheduleButton.backgroundColor = WishMakerViewController.textColor
        for slider in [sliderRed, sliderBlue, sliderGreen] {
            slider.changeColors(backgroundColor: WishMakerViewController.textColor, textColor: WishMakerViewController.backgroudColor)
        }
    }
    
    private func configureColorPickerButton() {
        colorPickerButton.setTitle(ConstantsWishMakerViewController.pickColorText, for: .normal)
        colorPickerButton.backgroundColor = .white
        colorPickerButton.setTitleColor(.black, for: .normal)
        colorPickerButton.layer.cornerRadius = ConstantsWishMakerViewController.cornerRadius
        view.addSubview(colorPickerButton)
        colorPickerButton.pinCenterX(to: view)
        colorPickerButton.pinWidth(to: stack)
        colorPickerButton.pinTop(to: setRandomColorButton.bottomAnchor, ConstantsWishMakerViewController.buttonTop)
        colorPickerButton.heightAnchor.constraint(equalToConstant: ConstantsWishMakerViewController.buttonHeight).isActive = true
        if #available(iOS 14.0, *) {
            colorPickerButton.addTarget(self, action: #selector(colorPickerButtonPressed), for: .touchUpInside)
        } else {
            colorPickerButton.backgroundColor = .gray
        }
    }
    
    @available(iOS 14.0, *)
    @objc
    private func colorPickerButtonPressed() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        present(colorPicker, animated: true)
    }
    
    @available(iOS 14.0, *)
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        setBackgroundColor(color: viewController.selectedColor)
    }
    
    private func configureAddWishButton() {
        addWishButton.setTitle(ConstantsWishMakerViewController.addWishesText, for: .normal)
        addWishButton.backgroundColor = .white
        addWishButton.setTitleColor(.black, for: .normal)
        addWishButton.layer.cornerRadius = ConstantsWishMakerViewController.cornerRadius
        view.addSubview(addWishButton)
        addWishButton.addTarget(self, action: #selector(addWish), for: .touchUpInside)
        addWishButton.pinCenterX(to: view)
        addWishButton.pinWidth(to: stack)
        addWishButton.pinTop(to: colorPickerButton.bottomAnchor, ConstantsWishMakerViewController.buttonTop)
        addWishButton.heightAnchor.constraint(equalToConstant: ConstantsWishMakerViewController.buttonHeight).isActive = true
    }
    
    @objc
    private func addWish() {
        present(WishStoringViewController(), animated: true)
    }
    
    private func configureScheduleButton() {
        scheduleButton.setTitle(ConstantsWishMakerViewController.scheduleText, for: .normal)
        scheduleButton.backgroundColor = .white
        scheduleButton.setTitleColor(.black, for: .normal)
        scheduleButton.layer.cornerRadius = ConstantsWishMakerViewController.cornerRadius
        view.addSubview(scheduleButton)
        scheduleButton.addTarget(self, action: #selector(scheduleButtonPressed), for: .touchUpInside)
        scheduleButton.pinCenterX(to: view)
        scheduleButton.pinWidth(to: stack)
        scheduleButton.pinTop(to: addWishButton.bottomAnchor, ConstantsWishMakerViewController.buttonTop)
        scheduleButton.heightAnchor.constraint(equalToConstant: ConstantsWishMakerViewController.buttonHeight).isActive = true
    }
    
    @objc
    private func scheduleButtonPressed() {
        let vc = WishCalendarViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func getOppositeColor(color: UIColor) -> UIColor {
        return UIColor(_colorLiteralRed: (Float(ConstantsWishMakerViewController.rgbConstant) - Float((ConstantsWishMakerViewController.rgbConstant * (color.cgColor.components?[ConstantsWishMakerViewController.redComponent])!))) / Float(ConstantsWishMakerViewController.rgbConstant), green: (Float(ConstantsWishMakerViewController.rgbConstant) - Float((ConstantsWishMakerViewController.rgbConstant * (color.cgColor.components?[ConstantsWishMakerViewController.greenComponent])!))) / Float(ConstantsWishMakerViewController.rgbConstant), blue: (Float(ConstantsWishMakerViewController.rgbConstant) - Float((ConstantsWishMakerViewController.rgbConstant * (color.cgColor.components?[ConstantsWishMakerViewController.blueComponent])!))) / Float(ConstantsWishMakerViewController.rgbConstant), alpha: ConstantsWishMakerViewController.alpha)
    }
}
