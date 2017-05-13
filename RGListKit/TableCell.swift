//
//  TableCell.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 27/12/16.
//  Copyright © 2016 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

struct TableCellModel: ItemModel {
	var id: String
	let title: String
	var reuseIdentifier: String {
		return "TableCell"
	}
	var height: CGFloat {
		return 64.0
	}
	init(title: String) {
		self.title = title
		self.id = title
	}
}

final class TableCell: UITableViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	
}

extension TableCell: ItemUI {
	func configure(withModel model: ItemModel) {
		guard let item = model as? TableCellModel else { return }
		titleLabel.text = item.title
	}
}
