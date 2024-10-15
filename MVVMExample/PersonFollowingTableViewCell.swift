//
//  PersonFollowingTableViewCell.swift
//  MVVMExample
//
//  Created by Jackie Lu on 2024/10/15.
//

import UIKit

protocol PersonFollowingTableViewCellDelegate: AnyObject {
    func personFollowingTableViewCell(
        _ cell: PersonFollowingTableViewCell,
        didTapWith viewModel: PersonFollowingTableViewCellViewModel
    )
}

class PersonFollowingTableViewCell: UITableViewCell {
    static let identifier = "PresonFollowingTableViewCell"
    
    weak var delegate: PersonFollowingTableViewCellDelegate?
    
    private var viewModel: PersonFollowingTableViewCellViewModel?
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(userImageView)
        contentView.addSubview(button)
        contentView.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc private func didTapButton() {
        guard let viewModel = viewModel else { return }
        
        var newViewModel = viewModel
        newViewModel.currentiyFollowing = !viewModel.currentiyFollowing
        
        delegate?.personFollowingTableViewCell(self, didTapWith: newViewModel)
        
        prepareForReuse()
        configure(with: newViewModel)
    }
    
    func configure(with viewModel: PersonFollowingTableViewCellViewModel) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.name
        usernameLabel.text = viewModel.username
        userImageView.image = viewModel.image
        
        if viewModel.currentiyFollowing {
            button.setTitle("Unfollow", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        } else {
            button.setTitle("Follow", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .link
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageWidht = contentView.frame.size.height-10
        userImageView.frame = CGRect(x: 5, y: 5,
                                     width: imageWidht,
                                     height: imageWidht)
        nameLabel.frame = CGRect(x: imageWidht+10,
                                 y: 0,
                                 width: contentView.frame.size.width-imageWidht,
                                 height: contentView.frame.size.height/2)
        usernameLabel.frame = CGRect(x: imageWidht+10,
                                 y: contentView.frame.size.height/2,
                                 width: contentView.frame.size.width-imageWidht,
                                 height: contentView.frame.size.height/2)
        button.frame = CGRect(x: contentView.frame.size.width-120,
                                 y: 10,
                                 width: 110,
                                 height: contentView.frame.size.height-20)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        usernameLabel.text = nil
        userImageView.image = nil
        button.backgroundColor = nil
        button.layer.borderWidth = 0
        button.setTitle(nil, for: .normal)
    }
}
