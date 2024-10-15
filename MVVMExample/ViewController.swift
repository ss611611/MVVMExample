//
//  ViewController.swift
//  MVVMExample
//
//  Created by Jackie Lu on 2024/10/15.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    private var models = [Person]()

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(PersonFollowingTableViewCell.self, forCellReuseIdentifier: PersonFollowingTableViewCell.identifier)
        
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    private func configureModels() {
        let names = [
            "Joe", "Dan", "Jeff", "Jenny", "Emily"
        ]
        
        for name in names {
            models.append(Person(name: name))
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PersonFollowingTableViewCell.identifier, for: indexPath) as? PersonFollowingTableViewCell else {
                return UITableViewCell()
            }
        cell.configure(with: PersonFollowingTableViewCellViewModel(with: model))
        cell.delegate = self
        return cell
    }

}

extension ViewController: PersonFollowingTableViewCellDelegate {
    func personFollowingTableViewCell(_ cell: PersonFollowingTableViewCell, didTapWith viewModel: PersonFollowingTableViewCellViewModel) {
        
        
    }
}
