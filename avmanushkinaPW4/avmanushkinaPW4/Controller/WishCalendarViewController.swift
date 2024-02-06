//
//  WishCalendarViewController.swift
//  avmanushkinaPW4
//
//  Created by Анастасия on 05.02.2024.
//

import UIKit

final class WishCalendarViewController: UIViewController {
    private let collectionView: UICollectionView = UICollectionView( frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()
    )
    let titleView = UILabel()
    let addEventButton = UIButton()
    private let defaults = UserDefaults.standard
    private let calendarManager = CalendarManager()
    
    var eventsArray: [WishEventModel] = []
    
    override func viewDidLoad() {
        view.backgroundColor = WishMakerViewController.backgroudColor
        configureTitle()
        configureAddEventButton()
        configureCollection()
        loadEventsArray()
    }
    
    private func configureTitle() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.text = ConstantsWishCalendarViewController.titleViewText
        titleView.font = UIFont.boldSystemFont(ofSize: ConstantsWishCalendarViewController.fontSize)
        view.addSubview(titleView)
        titleView.textColor = WishMakerViewController.textColor
        titleView.pinCenterX(to: view)
        titleView.pinTop(to: view.safeAreaLayoutGuide.topAnchor, ConstantsWishCalendarViewController.pinConstant)
        titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsWishCalendarViewController.pinConstant).isActive = true
    }
    
    private func configureAddEventButton() {
        addEventButton.setTitle(ConstantsWishCalendarViewController.addEventButtonTitle, for: .normal)
        addEventButton.backgroundColor = WishMakerViewController.textColor
        addEventButton.setTitleColor(WishMakerViewController.backgroudColor, for: .normal)
        addEventButton.layer.cornerRadius = ConstantsWishCalendarViewController.cornerRadius
        view.addSubview(addEventButton)
        addEventButton.addTarget(self, action: #selector(addEvent), for: .touchUpInside)
        addEventButton.pinCenterX(to: view)
        addEventButton.pinTop(to: titleView.bottomAnchor, ConstantsWishCalendarViewController.pinButtonConstant)
        addEventButton.heightAnchor.constraint(equalToConstant: ConstantsWishCalendarViewController.buttonHeight).isActive = true
        addEventButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsWishCalendarViewController.pinButtonConstant).isActive = true
    }
    
    @objc
    private func addEvent() {
        let destinationView = WishEventCreationViewController()
        destinationView.configureAction { event in
            self.eventsArray.append(event)
            self.collectionView.reloadData()
            let encoder = JSONEncoder()
                        if let encoded = try? encoder.encode(self.eventsArray) {
                            UserDefaults.standard.set(encoded, forKey: ConstantsWishCalendarViewController.eventsArrayKey)
                        }
            self.calendarManager.create(eventModel: event)
        }
        present(destinationView, animated: true)
    }
    
    private func configureCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = WishMakerViewController.backgroudColor
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            layout.invalidateLayout()
        }
        
        collectionView.register(WishEventCell.self, forCellWithReuseIdentifier: ConstantsWishCalendarViewController.reuseId)
        
        view.addSubview(collectionView)
        collectionView.pinHorizontal(to: view)
        collectionView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        collectionView.pinTop(to: addEventButton.bottomAnchor, ConstantsWishCalendarViewController.pinButtonConstant)
    }
    
    private func loadEventsArray() {
            let decoder = JSONDecoder()
        if let savedEventsArray = UserDefaults.standard.object(forKey: ConstantsWishCalendarViewController.eventsArrayKey) as? Data,
               let loadedEventsArray = try? decoder.decode([WishEventModel].self, from: savedEventsArray) {
                eventsArray = loadedEventsArray
                return
            }
            eventsArray = []
        }
}

// MARK: - UICollectionViewDataSource
extension WishCalendarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WishEventCell.reuseId, for: indexPath)
        
        guard let wishEventCell = cell as? WishEventCell else {
            return cell
        }
        
        let event = eventsArray[indexPath.row]
        wishEventCell.configure(with: WishEventModel(title: event.title, description: event.description, startDate: event.startDate, endDate: event.endDate))
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension WishCalendarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Adjust cell size as needed
        return CGSize(width: collectionView.bounds.width - ConstantsWishCalendarViewController.widthConstant, height: ConstantsWishCalendarViewController.heightConstant)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell tapped at index \(indexPath.item)")
    }
}
