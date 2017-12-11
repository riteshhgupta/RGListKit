//
//  StackViewHolder
//  RGListKit
//
//  Created by Ritesh Gupta on 03/12/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit
import ProtoKit

open class StackViewHolder: ListViewHolder {
	
	let holderType = StackViewCollectionViewCell.self
	let dynamicConstraint: NSLayoutConstraint
	let isVertical: Bool
	
	public init(listView: ListableView, dynamicConstraint: NSLayoutConstraint, isVertical: Bool = true) {
		self.dynamicConstraint = dynamicConstraint
		self.isVertical = isVertical
		super.init(listView: listView)
		let bundle = Bundle(for: holderType)
		let nib = UINib(nibName: holderType.typeName, bundle: bundle)
		listView.register(nib: nib, for: holderType.typeName)
	}

	public var items: [StackViewItemModel] = [] {
		didSet {
			dynamicConstraint.constant = dynamicConstraintValue
			listView.reloadItems()
		}
	}

	override open func numberOfSectionsIn(listableView: ListableView) -> Int {
		return 1
	}
	
	override open func listableView(_ listableView: ListableView, numberOfItemsInSection section: Int) -> Int {
		return items.count
	}
	
	override open func listableView<Item: ReusableItem>(_ listableView: ListableView, itemForItemAt indexPath: IndexPath) -> Item {
		let model = items[indexPath.row]
		let item: Item = listableView.reusableItem(withIdentifier: holderType.typeName, for: indexPath)
		let holder = item as! (StackViewItemHolder & UIView)
		holder.attach(itemType: model.itemType).configure(with: model)
		return item
	}
	
	override open func listableView(_ listableView: ListableView, estimatedHeightForItemAt indexPath: IndexPath) -> CGFloat {
		return items[indexPath.row].estimatedHeight
	}
	
	override open func listableView(_ listableView: ListableView, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return items[indexPath.row].size
	}
}

extension StackViewHolder {
	
	var dynamicConstraintValue: CGFloat {
		if isVertical { return items.reduce(0, { $0 + $1.height }) }
		else { return items.reduce(0, { $0 + $1.width }) }
	}
}
