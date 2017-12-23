//
//  Reactive.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 04/10/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa
import ProtoKit

public protocol ReactiveListViewItemModelInjectable {
	
	var itemModel: MutableProperty<ListViewItemModel?> { get }
}


public protocol ReactiveStackViewItemModelInjectable {
	
	var itemModel: MutableProperty<StackViewItemModel?> { get }
}

public extension Reactive where Base: ReactiveDiffableListViewHolder {
	
	var sections: BindingTarget<[SectionModel]> {
		return makeBindingTarget { $0.sections = $1 }
	}
}

public extension Reactive where Base: ReactiveStackViewHolder {
	
	var itemModels: BindingTarget<[StackViewItemModel]> {
		return makeBindingTarget { $0.itemModels = $1 }
	}
}

public class ReactiveDiffableListViewHolder: DiffableListViewHolder {
	
	override open func listableView<Item: ReusableView>(_ listableView: ListableView, itemForItemAt indexPath: IndexPath) -> Item {
		let data: (Item, ListViewItemModel) = itemData(at: indexPath)
		let (item, model) = data
		guard let cell = item as? ReactiveListViewItemModelInjectable else { return item }
		cell.itemModel.value = model
		return item
	}
}

public class ReactiveStackViewHolder: StackViewHolder {
	
	override open func listableView<Item: ReusableView>(_ listableView: ListableView, itemForItemAt indexPath: IndexPath) -> Item {
		let model = itemModels[indexPath.row]
		let item: Item = listableView.reusableItem(withIdentifier: holderType.typeName, for: indexPath)
		guard let holder = item as? StackViewItemHolder else { return item }
		let contentView = holder.attach(itemType: model.itemType)
		guard let stackItem = contentView as? ReactiveStackViewItemModelInjectable else { return item }
		stackItem.itemModel.value = model
		return item
	}
}
