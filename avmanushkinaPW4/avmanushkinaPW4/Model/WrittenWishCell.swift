//
//  WrittenWishCell.swift
//  avmanushkinaPW4
//
//  Created by Анастасия on 04.02.2024.
//

import UIKit

final class WrittenWishCell: UITableViewCell {
    static let reuseId = ConstantsWrittenWishCell.reuseId
    private let wishLabel: UILabel = UILabel()
    var onCellTapped: ((String) -> Void)?
    
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
        wrap.backgroundColor = ConstantsWrittenWishCell.wrapColor
        wrap.layer.cornerRadius = ConstantsWrittenWishCell.wrapRadius
        wrap.addSubview(wishLabel)
        wrap.pinVertical(to: self, ConstantsWrittenWishCell.wrapOffsetV)
        wrap.pinHorizontal(to: self, ConstantsWrittenWishCell.wrapOffsetH)
        wishLabel.pin(to: wrap, ConstantsWrittenWishCell.wishLabelOffset)
    }
    
    func configure(with wish: String) {
        wishLabel.text = wish
    }
}
