//
//  PersonTableViewCell.swift
//  OptimeTest
//
//  Created by Lena Soroka on 06.10.2022.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet weak var cellInnerView: UIView!
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var requestLabel: UILabel!
    @IBOutlet weak var unreadView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: Constants.cellIdentifier, bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with data: PersonData) {
        personImageView.image = data.personImage == nil ? #imageLiteral(resourceName: "personImage") : data.personImage
        nameLabel.text = data.name
        requestLabel.text = data.request
        unreadView.isHidden = data.isRead
    }
    
    private func configureUI() {
        unreadView.layer.cornerRadius = unreadView.bounds.height / 2
        personImageView.layer.cornerRadius = 8
        cellInnerView.layer.cornerRadius = 15
        cellInnerView.layer.borderWidth = 1
        cellInnerView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
}
