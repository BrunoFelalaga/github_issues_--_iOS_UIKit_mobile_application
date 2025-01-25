//
//  IssueTableViewCell.swift
//  You've Got Issues!
//
//  Created by Bruno Felalaga on 1/25/25.
//

import Foundation
import UIKit

class IssueTableViewCell: UITableViewCell {
     // weak so we can cell's deallocate subviews when cell is removed from memory
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var stateImageView: UIImageView!
}
