//
//  CollectionCell.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 01/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import ReactiveCocoa

struct CollectionCellModel: ListViewItemModel {
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

	let itemModel = MutableProperty<ListViewItemModel?>(nil)

	@IBOutlet var titleLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		titleLabel.reactive.text <~ itemModel
			.producer
			.skipNil()
			.map{ $0 as? CollectionCellModel }
			.skipNil()
			.map { $0.title }
	}
}

extension CollectionCell: ReactiveListViewItemModelInjectable {}
