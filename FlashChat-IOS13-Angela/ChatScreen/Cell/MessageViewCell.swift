//
//  MessageViewCell.swift
//  FlashChat-IOS13-Angela
//
//  Created by Павел Грицков on 17.03.23.
//

import UIKit

class MessageViewCell: UITableViewCell {
    
    
    @IBOutlet weak var messageBubbleView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageBubbleView.layer.cornerRadius = messageBubbleView.frame.size.height / 5
    }
    
    func configure(text: String) {
        messageLabel.text = text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
