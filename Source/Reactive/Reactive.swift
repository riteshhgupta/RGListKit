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

public protocol ReactiveItemUI {

	var model: MutableProperty<ItemModel?> { get }
}

public extension Reactive where Base: ListManager {

	var sections: BindingTarget<[SectionModel]> {
		return makeBindingTarget { (manager, sections) in manager.sections = sections }
	}
}

public class ReactiveListManager: ListManager {}

extension ReactiveListManager {

	func r_listableView<Item: ReusableItem>(_ listableView: ListableView, itemAt indexPath: IndexPath) -> Item {
		let data: (Item, ItemModel) = itemData(at: indexPath)
		let (item, model) = data
		guard let cell = item as? ReactiveItemUI else { return item }
		cell.model.value = model
		return item
	}

	func r_viewForHeaderFooter(at indexPath: IndexPath, for listableView: ListableView, of kind: String) -> UIView? {
		guard let (view, model) = headerFooterItemData(at: indexPath, of: kind) else { return nil }
		guard let item = view as? ReactiveItemUI else { return view }
		item.model.value = model
		return view
	}
}
