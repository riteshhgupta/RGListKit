//
//  CollectionCell.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 01/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

struct CollectionCellModel: ItemModel {
	var id: String
	var title: String
	
	var reuseIdentifier: String { return "CollectionCell" }
	var height: CGFloat { return 64.0 }
	var width: CGFloat { return 64.0 }
	
	init(title: String) {
		self.title = title
		self.id = title
	}
}

final class CollectionCell: UICollectionViewCell {
	
	@IBOutlet var titleLabel: UILabel!

}

extension CollectionCell: ItemUI {
	
	func configure(withModel model: ItemModel) {
		guard let item = model as? CollectionCellModel else { return }
		titleLabel.text = item.title
	}
}
