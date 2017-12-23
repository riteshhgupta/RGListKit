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
		listView.registerItem(with: nib, for: holderType.typeName)
	}

	public var itemModels: [StackViewItemModel] = [] {
		didSet {
			dynamicConstraint.constant = dynamicConstraintValue
			listView.reloadItems()
		}
	}

	override open func numberOfSectionsIn(listableView: ListableView) -> Int {
		return 1
	}
	
	override open func listableView(_ listableView: ListableView, numberOfItemsInSection section: Int) -> Int {
		return itemModels.count
	}
	
	override open func listableView<Item: ReusableView>(_ listableView: ListableView, itemForItemAt indexPath: IndexPath) -> Item {
		let model = itemModels[indexPath.row]
		let item: Item = listableView.reusableItem(withIdentifier: holderType.typeName, for: indexPath)
		guard let holder = item as? StackViewItemHolder else { return item }
		let contentView = holder.attach(itemType: model.itemType)
		guard let stackItem = contentView as? StackViewItemModelInjectable else { return item }
		stackItem.itemModel?(model)
		return item
	}
	
	override open func listableView(_ listableView: ListableView, estimatedHeightForItemAt indexPath: IndexPath) -> CGFloat {
		return itemModels[indexPath.row].estimatedHeight
	}
	
	override open func listableView(_ listableView: ListableView, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return itemModels[indexPath.row].size
	}
}

extension StackViewHolder {
	
	var dynamicConstraintValue: CGFloat {
		if isVertical { return itemModels.reduce(0, { $0 + $1.height }) }
		else { return itemModels.reduce(0, { $0 + $1.width }) }
	}
}
