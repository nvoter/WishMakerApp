//
//  WishEventCell.swift
//  avmanushkinaPW4
//
//  Created by Анастасия on 05.02.2024.
//

import UIKit

final class WishEventCell: UICollectionViewCell {
    static let reuseId = ConstantsWishEventCell.reuseId
    
    private let wrapView: UIView = UIView()
    private let titleLabel: UILabel = UILabel()
    private let descriptionLabel: UILabel = UILabel()
    private let startDateLabel: UILabel = UILabel()
    private let endDateLabel: UILabel = UILabel()
    private let dateFormatter: DateFormatter = DateFormatter()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        dateFormatter.dateStyle = .medium
        configureUI()
    }
    
    private func configureUI() {
        configureWrap()
        configureTitleLabel()
        configureDescriptionLabel()
        configureStartDateLabel()
        configureEndDateLabel()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with event: WishEventModel) {
        titleLabel.text = event.title
        descriptionLabel.text = event.description
        startDateLabel.text = "Start Date: \(dateFormatter.string(from: event.startDate))"
        endDateLabel.text = "End Date: \(dateFormatter.string(from: event.endDate))"
    }

    private func configureWrap() {
        addSubview(wrapView)
        wrapView.backgroundColor = .white
        wrapView.layer.cornerRadius = ConstantsWishEventCell.cornerRadius
        wrapView.translatesAutoresizingMaskIntoConstraints = false
        wrapView.pinHorizontal(to: self, ConstantsWishEventCell.wrapOffset)
        wrapView.pinVertical(to: self, ConstantsWishEventCell.wrapOffset)
    }
    
    private func configureTitleLabel() {
        wrapView.addSubview(titleLabel)
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: ConstantsWishEventCell.titleLabelFontSize)
        titleLabel.numberOfLines = ConstantsWishEventCell.titleNumberOfLines
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.pinTop(to: wrapView, ConstantsWishEventCell.offsetConstant)
        titleLabel.pinHorizontal(to: wrapView, ConstantsWishEventCell.offsetConstant)
    }
    
    private func configureDescriptionLabel() {
        wrapView.addSubview(descriptionLabel)
        descriptionLabel.textColor = .black
        descriptionLabel.font = UIFont.systemFont(ofSize: ConstantsWishEventCell.descriptionLabelFontSize)
        descriptionLabel.numberOfLines = ConstantsWishEventCell.descriptionNumberOfLines
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.pinTop(to: titleLabel.bottomAnchor, ConstantsWishEventCell.offsetConstant)
        descriptionLabel.pinLeft(to: wrapView, ConstantsWishEventCell.offsetConstant)
    }
    
    private func configureStartDateLabel() {
        wrapView.addSubview(startDateLabel)
        startDateLabel.font = UIFont.systemFont(ofSize: ConstantsWishEventCell.dateFontSize)
        startDateLabel.translatesAutoresizingMaskIntoConstraints = false
        startDateLabel.pinHorizontal(to: wrapView, ConstantsWishEventCell.offsetConstant)
        startDateLabel.pinTop(to: descriptionLabel.bottomAnchor, ConstantsWishEventCell.offsetConstant)
    }
    
    private func configureEndDateLabel() {
        wrapView.addSubview(endDateLabel)
        endDateLabel.font = UIFont.systemFont(ofSize: ConstantsWishEventCell.dateFontSize)
        endDateLabel.translatesAutoresizingMaskIntoConstraints = false
        endDateLabel.pinHorizontal(to: wrapView, ConstantsWishEventCell.offsetConstant)
        endDateLabel.pinTop(to: startDateLabel.bottomAnchor, ConstantsWishEventCell.offsetConstant)
        endDateLabel.pinBottom(to: wrapView, ConstantsWishEventCell.offsetConstant)
    }
}
