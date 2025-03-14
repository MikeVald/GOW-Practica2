//
//  MerchandiseTableViewCell.swift
//  GOW
//
//  Created by Edgar Michael Pérez Valdez on 12/03/25.
//

import UIKit

class MerchandiseTableViewCell: UITableViewCell {

    @IBOutlet weak var labelMerch: UILabel!
    @IBOutlet weak var imageviewMerch: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        labelMerch.setCustomFont(fontName: Constants.fontMenuTitle, size: Constants.fontSizeDefault, textStyle: .headline)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
