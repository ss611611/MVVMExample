//
//  PersonFollowingTableViewCellViewModel.swift
//  MVVMExample
//
//  Created by Jackie Lu on 2024/10/15.
//

import UIKit

struct PersonFollowingTableViewCellViewModel {
    let name: String
    let username: String
    var currentiyFollowing: Bool
    let image: UIImage?
    
    init(with model: Person) {
        name = model.name
        username = model.username
        currentiyFollowing = false
        image = UIImage(systemName: "person")
    }
}
