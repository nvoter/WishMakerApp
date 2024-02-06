//
//  WishStoringViewController.swift
//  avmanushkinaPW4
//
//  Created by Анастасия on 04.02.2024.
//

import UIKit

final class WishStoringViewController: UIViewController {
    private let table: UITableView = UITableView(frame: .zero)
    public static var wishArray: [String] = UserDefaults.standard.array(forKey: ConstantsWishStoringViewController.wishesKey) as? [String] ?? []
    private let defaults = UserDefaults.standard

    override func viewDidLoad() {
        view.backgroundColor = WishMakerViewController.backgroudColor
        configureTable()
        if let savedWishes = defaults.object(forKey: ConstantsWishStoringViewController.wishesKey) as? [String] {
            WishStoringViewController.wishArray = savedWishes
        }
    }
    
    private func configureTable() {
        view.addSubview(table)
        table.pin(to: view, ConstantsWishStoringViewController.tablePin)
        table.backgroundColor = WishMakerViewController.backgroudColor
        table.dataSource = self
        table.separatorStyle = .none
        table.layer.cornerRadius = ConstantsWishStoringViewController.tableCornerRadius
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
        table.register(AddWishCell.self, forCellReuseIdentifier: AddWishCell.reuseId)
    }
}

extension WishStoringViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == ConstantsWishStoringViewController.addWishSection) {
            return ConstantsWishStoringViewController.addWishSectionNumberOfRows
        } else {
            return WishStoringViewController.wishArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == ConstantsWishStoringViewController.addWishSection) {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: AddWishCell.reuseId,
                for: indexPath
            )
            guard let addWishCell = cell as? AddWishCell else { return cell }
            addWishCell.addWish = { [weak self] value in
                WishStoringViewController.wishArray.append(value)
                self?.table.reloadData()
                self?.defaults.set(WishStoringViewController.wishArray, forKey: ConstantsWishStoringViewController.wishesKey)
            }
            return addWishCell
        } else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: WrittenWishCell.reuseId,
                for: indexPath
            )
            guard let wishCell = cell as? WrittenWishCell else { return cell }
            wishCell.configure(with: WishStoringViewController.wishArray[indexPath.row])
            return wishCell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ConstantsWishStoringViewController.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == ConstantsWishStoringViewController.addWishSection {
            return
        } else if editingStyle == .delete {
            WishStoringViewController.wishArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            table.reloadData()
            defaults.set(WishStoringViewController.wishArray, forKey: ConstantsWishStoringViewController.wishesKey)
        }
    }
}
