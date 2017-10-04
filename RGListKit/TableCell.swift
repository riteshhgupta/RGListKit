//
//  TableCell.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 27/12/16.
//  Copyright © 2016 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import ReactiveCocoa

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

	let model = MutableProperty<ItemModel?>(nil)

	@IBOutlet weak var titleLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		titleLabel.reactive.text <~ model
			.producer
			.skipNil()
			.map{ $0 as? TableCellModel }
			.skipNil()
			.map { $0.title }
	}
}

extension TableCell: ReactiveItemUI {}
