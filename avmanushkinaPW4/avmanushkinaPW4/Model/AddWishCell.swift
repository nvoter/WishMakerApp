//
//  AddWishCell.swift
//  avmanushkinaPW4
//
//  Created by Анастасия on 04.02.2024.
//

import UIKit

final class AddWishCell: UITableViewCell, UITextViewDelegate {
    static let reuseId = ConstantsAddWishCell.reuseId
    private let addButton: UIButton = UIButton(type: .system)
    let addedText: UITextField = UITextField()
    var addWish: ((String) -> ())?
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear
        let wrap: UIView = UIView()
        contentView.addSubview(wrap)
        configureWrap(wrap: wrap)
        configureAddWishButton(wrap: wrap)
        configureTextView(wrap: wrap)
    }
    
    private func configureWrap(wrap: UIView) {
        wrap.backgroundColor = ConstantsAddWishCell.wrapColor
        wrap.layer.cornerRadius = ConstantsAddWishCell.wrapRadius
        wrap.pinVertical(to: self, ConstantsAddWishCell.wrapOffsetV)
        wrap.pinHorizontal(to: self, ConstantsAddWishCell.wrapOffsetH)
    }
    
    private func configureAddWishButton(wrap: UIView) {
        addButton.translatesAutoresizingMaskIntoConstraints = false;
        wrap.addSubview(addButton)
        addButton.backgroundColor = WishMakerViewController.textColor
        addButton.setTitleColor(WishMakerViewController.backgroudColor, for: .normal)
        addButton.setTitle(ConstantsAddWishCell.addButtonText, for: .normal)
        addButton.layer.cornerRadius = ConstantsAddWishCell.addButtonRadius
        addButton.pinVertical(to: wrap, ConstantsAddWishCell.addButtonOffsetH)
        addButton.pinRight(to: wrap.trailingAnchor, ConstantsAddWishCell.addButtonOffsetW)
        addButton.setWidth(ConstantsAddWishCell.addButtonViewWidth)
        addButton.addTarget(self, action: #selector(addWishButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func addWishButtonPressed() {
        if (addedText.hasText) {
            addWish?(addedText.text ?? "")
            addedText.text = ""
        }
    }
    
    private func configureTextView(wrap: UIView) {
        addedText.textColor = .black
        addedText.layer.cornerRadius = ConstantsAddWishCell.addedTextRadius
        addedText.translatesAutoresizingMaskIntoConstraints = false
        addedText.placeholder = ConstantsAddWishCell.addedTextPlacehoder
        wrap.addSubview(addedText)
        addedText.pinRight(to: addButton.leadingAnchor, ConstantsAddWishCell.addedTextOffsetW)
        addedText.pinLeft(to: wrap.leadingAnchor, ConstantsAddWishCell.addedTextOffsetW)
        addedText.pinVertical(to: wrap, ConstantsAddWishCell.addedTextOffsetH)
    }
}

