//
//  WishEventCreationViewController.swift
//  avmanushkinaPW4
//
//  Created by Анастасия on 05.02.2024.
//

import UIKit

final class WishEventCreationViewController: UIViewController {
    let titleView = UILabel()
    let titleTextField = UITextField()
    let descriptionTextField = UITextField()
    let titleCaption = UILabel()
    let descriptionCaption = UILabel()
    let startDatePicker = UIDatePicker()
    let startDatePickerCaption = UILabel()
    let endDatePicker = UIDatePicker()
    let endDatePickerCaption = UILabel()
    let createEventButton = UIButton()
    private var addEvent: ((WishEventModel) -> ())?
    let pickFromWishesButton = UIButton()
    let table: UITableView = UITableView(frame: .zero)
    
    override func viewDidLoad() {
        view.backgroundColor = WishMakerViewController.backgroudColor
        configureUI()
    }
    
    private func configureUI() {
        configureTitle()
        configureTitleTextField()
        configureTitleCaption()
        configureDescriptionTextField()
        configureDescriptionCaption()
        configureStartDatePicker()
        configureStartDatePickerCaption()
        configureEndDatePicker()
        configureEndDatePickerCaption()
        configureCreateEventButton()
        configurePickFromWishesButton()
        configureTable()
    }
    
    private func configureTitle() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.text = ConstantsWishEventCreationViewController.titleText
        titleView.textColor = WishMakerViewController.textColor
        titleView.font = UIFont.boldSystemFont(ofSize: ConstantsWishEventCreationViewController.fontSize)
        view.addSubview(titleView)
        titleView.pinCenterX(to: view)
        titleView.pinTop(to: view.safeAreaLayoutGuide.topAnchor, ConstantsWishEventCreationViewController.pinConstant)
        titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsWishEventCreationViewController.pinConstant).isActive = true
    }
    
    private func configureTitleTextField() {
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.backgroundColor = .white
        view.addSubview(titleTextField)
        titleTextField.placeholder = ConstantsWishEventCreationViewController.titlePlaceholderText
        titleTextField.textColor = .black
        titleTextField.layer.cornerRadius = ConstantsWishEventCreationViewController.cornerRadius
        titleTextField.pinLeft(to: titleView.leadingAnchor)
        titleTextField.pinTop(to: titleView.bottomAnchor, ConstantsWishEventCreationViewController.pinConstant)
        titleTextField.widthAnchor.constraint(equalTo: titleView.widthAnchor).isActive = true
        titleTextField.heightAnchor.constraint(equalToConstant: ConstantsWishEventCreationViewController.fieldHeight).isActive = true
    }
    
    private func configureTitleCaption() {
        titleCaption.text = ConstantsWishEventCreationViewController.titleCaptionText
        titleCaption.textColor = WishMakerViewController.textColor
        titleCaption.font = UIFont.systemFont(ofSize: ConstantsWishEventCreationViewController.captionTextSize)
        view.addSubview(titleCaption)
        titleCaption.pinTop(to: titleTextField.bottomAnchor, ConstantsWishEventCreationViewController.pinCaptionTopConstant)
        titleCaption.pinCenterX(to: view)
    }
    
    private func configureDescriptionTextField() {
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextField.backgroundColor = .white
        view.addSubview(descriptionTextField)
        descriptionTextField.placeholder = ConstantsWishEventCreationViewController.descriptionPlaceholderText
        descriptionTextField.textColor = .black
        descriptionTextField.layer.cornerRadius = ConstantsWishEventCreationViewController.cornerRadius
        descriptionTextField.pinLeft(to: titleView.leadingAnchor)
        descriptionTextField.pinTop(to: titleCaption.bottomAnchor, ConstantsWishEventCreationViewController.pinConstant)
        descriptionTextField.widthAnchor.constraint(equalTo: titleView.widthAnchor).isActive = true
        descriptionTextField.heightAnchor.constraint(equalToConstant: ConstantsWishEventCreationViewController.fieldHeight).isActive = true
    }
    
    private func configureDescriptionCaption() {
        descriptionCaption.text = ConstantsWishEventCreationViewController.descriptionCaptionText
        descriptionCaption.textColor = WishMakerViewController.textColor
        descriptionCaption.font = UIFont.systemFont(ofSize: ConstantsWishEventCreationViewController.captionTextSize)
        view.addSubview(descriptionCaption)
        descriptionCaption.pinTop(to: descriptionTextField.bottomAnchor, ConstantsWishEventCreationViewController.pinCaptionTopConstant)
        descriptionCaption.pinCenterX(to: view)
    }
    
    private func configureStartDatePicker() {
        startDatePicker.translatesAutoresizingMaskIntoConstraints = false
        startDatePicker.datePickerMode = .date
        
        if #available(iOS 13.4, *) {
            startDatePicker.preferredDatePickerStyle = .compact
        }
        
        view.addSubview(startDatePicker)
        startDatePicker.pinCenterX(to: view)
        startDatePicker.pinTop(to: descriptionCaption.bottomAnchor, ConstantsWishEventCreationViewController.pinConstant)
    }
    
    private func configureStartDatePickerCaption() {
        startDatePickerCaption.text = ConstantsWishEventCreationViewController.startDateCaptionText
        startDatePickerCaption.textColor = WishMakerViewController.textColor
        startDatePickerCaption.font = UIFont.systemFont(ofSize: ConstantsWishEventCreationViewController.captionTextSize)
        view.addSubview(startDatePickerCaption)
        startDatePickerCaption.pinTop(to: startDatePicker.bottomAnchor, ConstantsWishEventCreationViewController.pinCaptionTopConstant)
        startDatePickerCaption.pinCenterX(to: view)
    }
    
    private func configureEndDatePicker() {
        endDatePicker.translatesAutoresizingMaskIntoConstraints = false
        endDatePicker.datePickerMode = .date
        
        if #available(iOS 13.4, *) {
            endDatePicker.preferredDatePickerStyle = .compact
        }
        
        view.addSubview(endDatePicker)
        endDatePicker.pinCenterX(to: view)
        endDatePicker.pinTop(to: startDatePickerCaption.bottomAnchor, ConstantsWishEventCreationViewController.pinConstant)
    }
    
    private func configureEndDatePickerCaption() {
        endDatePickerCaption.text = ConstantsWishEventCreationViewController.endDateCaptionText
        endDatePickerCaption.textColor = WishMakerViewController.textColor
        endDatePickerCaption.font = UIFont.systemFont(ofSize: ConstantsWishEventCreationViewController.captionTextSize)
        view.addSubview(endDatePickerCaption)
        endDatePickerCaption.pinTop(to: endDatePicker.bottomAnchor, ConstantsWishEventCreationViewController.pinCaptionTopConstant)
        endDatePickerCaption.pinCenterX(to: view)
    }
    
    private func configureCreateEventButton() {
        createEventButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(createEventButton)
        createEventButton.backgroundColor = WishMakerViewController.textColor
        createEventButton.setTitleColor(WishMakerViewController.backgroudColor, for: .normal)
        createEventButton.setTitle(ConstantsWishEventCreationViewController.createEventButtonTitle, for: .normal)
        createEventButton.layer.cornerRadius = ConstantsWishEventCreationViewController.cornerRadius
        createEventButton.widthAnchor.constraint(equalTo: titleTextField.widthAnchor).isActive = true
        createEventButton.heightAnchor.constraint(equalTo: titleTextField.heightAnchor).isActive = true
        createEventButton.pinCenterX(to: view)
        createEventButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, ConstantsWishEventCreationViewController.pinConstant)
        createEventButton.addTarget(self, action: #selector(createEventButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func createEventButtonPressed() {
        if titleTextField.hasText {
            addEvent?(WishEventModel(title: titleTextField.text!, description: descriptionTextField.text ?? "", startDate: startDatePicker.date, endDate: endDatePicker.date))
            dismiss(animated: true)
        }
        return
    }
    
    func configureAction(action: ((WishEventModel) -> ())?) {
        addEvent = action
    }
    
    private func configureTable() {
        view.addSubview(table)
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: endDatePickerCaption.bottomAnchor, constant: ConstantsWishEventCreationViewController.tableTopAnchor).isActive = true
        table.widthAnchor.constraint(equalTo: titleTextField.widthAnchor).isActive = true
        table.heightAnchor.constraint(equalToConstant: ConstantsWishEventCreationViewController.tableHeight).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsWishEventCreationViewController.tableTopAnchor).isActive = true
        table.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.layer.cornerRadius = ConstantsWishStoringViewController.tableCornerRadius
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
        table.isHidden = true
    }
    
    private func configurePickFromWishesButton() {
        pickFromWishesButton.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.addSubview(pickFromWishesButton)
        pickFromWishesButton.backgroundColor = WishMakerViewController.textColor
        pickFromWishesButton.setTitle(ConstantsWishEventCreationViewController.pickTitle, for: .normal)
        pickFromWishesButton.setTitleColor(WishMakerViewController.backgroudColor, for: .normal)
        pickFromWishesButton.pinRight(to: titleTextField.trailingAnchor, ConstantsWishEventCreationViewController.pickButtonRightAnchor)
        pickFromWishesButton.layer.cornerRadius = ConstantsWishEventCreationViewController.pickButtonCornerRadius
        pickFromWishesButton.pinCenterY(to: titleTextField.centerYAnchor)
        pickFromWishesButton.setWidth(ConstantsWishEventCreationViewController.pickButtonWidth)
        pickFromWishesButton.setHeight(ConstantsWishEventCreationViewController.pickButtonHeight)
        pickFromWishesButton.addTarget(self, action: #selector(pickFromWishes), for: .touchUpInside)
    }
    
    @objc
    private func pickFromWishes() {
        if (table.isHidden) {
            table.isHidden = false
            pickFromWishesButton.setTitle(ConstantsWishEventCreationViewController.typeTitle, for: .normal)
        } else {
            table.isHidden = true
            pickFromWishesButton.setTitle(ConstantsWishEventCreationViewController.pickTitle, for: .normal)
        }
    }
}

extension WishEventCreationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WishStoringViewController.wishArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: WrittenWishCell.reuseId,
            for: indexPath
        )
        guard let wishCell = cell as? WrittenWishCell else { return cell }
        wishCell.configure(with: WishStoringViewController.wishArray[indexPath.row])
        return wishCell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        titleTextField.text = WishStoringViewController.wishArray[indexPath.row]
    }
}
