//
//  Constants.swift
//  avmanushkinaPW4
//
//  Created by Анастасия on 04.02.2024.
//

import UIKit

enum ConstantsWishMakerViewController {
    static let titleText: String = "WishMaker"
    static let descriptionText: String = "The background color can be changed by sliders and buttons"
    static let fontSize: CGFloat = 32
    static let topAnchor: CGFloat = 30
    static let numberOfLines: Int = 0
    static let redSliderTitle: String = "Red"
    static let blueSliderTitle: String = "Blue"
    static let greenSliderTitle: String = "Green"
    static let sliderMinValue: Double = 0
    static let sliderMaxValue: Double = 1
    static let stackCornerRadius: CGFloat = 20
    static let alpha: Float = 1
    static let leadingAnchor: CGFloat = 15
    static let descriptionFontSize: CGFloat = 18
    static let descriptionTopAnchor: CGFloat = 15
    static let descriptionTrailingAnchor: CGFloat = -15
    static let backgroundDefaultValue: Double = 0
    static let stackBottomAnchor: CGFloat = -280
    static let hideSlidersText: String = "Hide sliders"
    static let showSlidersText: String = "Show sliders"
    static let cornerRadius: CGFloat = 15
    static let buttonTop: CGFloat = 10
    static let buttonHeight: CGFloat = 40
    static let setRandomColorText: String = "Set random color"
    static let pickColorText: String = "Pick color"
    static let addWishesText: String = "Add wishes"
    static let redComponent: Int = 0
    static let greenComponent: Int = 1
    static let blueComponent: Int = 2
    static let scheduleText: String = "Schedule wish granting"
    static let rgbConstant: CGFloat = 255
}

enum ConstantsCustomSlider {
    static let topAnchor: CGFloat = 15
    static let leadingAnchor: CGFloat = 15
    static let centerXAnchor: CGFloat = -10
}

enum ConstantsWishStoringViewController {
    static let numberOfSections: Int = 2
    static let wishesKey: String = "wishesarray"
    static let tablePin: CGFloat = 10
    static let tableCornerRadius: CGFloat = 20
    static let addWishSection: Int = 0
    static let addWishSectionNumberOfRows: Int = 1
}

enum ConstantsWrittenWishCell {
    static let wrapColor: UIColor = .white
    static let wrapRadius: CGFloat = 10
    static let wrapOffsetV: CGFloat = 3
    static let wrapOffsetH: CGFloat = 10
    static let wishLabelOffset: CGFloat = 8
    static let reuseId: String = "WrittenWishCell"
}

enum ConstantsAddWishCell {
    static let reuseId: String = "AddWishCell"
    static let wrapColor: UIColor = .white
    static let wrapRadius: CGFloat = 10
    static let wrapOffsetV: CGFloat = 3
    static let wrapOffsetH: CGFloat = 10
    static let wishLabelOffset: CGFloat = 8
    static let addButtonText: String = "Add"
    static let addButtonRadius: CGFloat = 10
    static let addButtonOffsetH: CGFloat = 2
    static let addButtonOffsetW: CGFloat = 2
    static let addButtonViewWidth: CGFloat = 40
    static let addedTextRadius: CGFloat = 10
    static let addedTextOffsetH: CGFloat = 4
    static let addedTextOffsetW: CGFloat = 4
    static let addedTextPlacehoder: String = "Type your wish..."
}

enum ConstantsWishEventCell {
    static let reuseId: String = "WishEventCell"
    static let cornerRadius: CGFloat = 10
    static let wrapOffset: CGFloat = 5
    static let titleNumberOfLines = 0
    static let descriptionNumberOfLines = 0
    static let offsetConstant: CGFloat = 10
    static let endDateLabelText: String = "End Date: "
    static let titleLabelFontSize: CGFloat = 16
    static let descriptionLabelFontSize: CGFloat = 14
    static let dateFontSize: CGFloat = 12
}

enum ConstantsWishEventCreationViewController {
    static let titleText: String = "Create new event"
    static let fontSize: CGFloat = 32
    static let pinConstant: CGFloat = 20
    static let cornerRadius: CGFloat = 15
    static let titlePlaceholderText: String = " Type title..."
    static let fieldHeight: CGFloat = 40
    static let titleCaptionText: String = "Add event title"
    static let captionTextSize: CGFloat = 18
    static let pinCaptionTopConstant: CGFloat = 5
    static let descriptionPlaceholderText: String = " Type description..."
    static let descriptionCaptionText: String = "Add event description"
    static let startDateCaptionText: String = "Add event start date"
    static let endDateCaptionText: String = "Add event end date"
    static let createEventButtonTitle: String = "Create event"
    static let pickButtonRightAnchor: CGFloat = 10
    static let pickButtonCornerRadius: CGFloat = 5
    static let pickButtonWidth: CGFloat = 40
    static let pickButtonHeight: CGFloat = 30
    static let tableTopAnchor: CGFloat = 20
    static let tableHeight: CGFloat = 250
    static let typeTitle: String = "Type"
    static let pickTitle: String = "Pick"
}

enum ConstantsWishCalendarViewController {
    static let titleViewText: String = "Events Calendar"
    static let fontSize: CGFloat = 32
    static let pinConstant: CGFloat = 15
    static let addEventButtonTitle: String = "Add new event"
    static let cornerRadius: CGFloat = 15
    static let pinButtonConstant: CGFloat = 10
    static let buttonHeight: CGFloat = 40
    static let reuseId: String = "WishEventCell"
    static let widthConstant: CGFloat = 10
    static let heightConstant: CGFloat = 130
    static let eventsArrayKey: String = "eventsarray"
}
