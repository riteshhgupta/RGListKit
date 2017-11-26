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

public protocol ReactiveItemUI {

	var model: MutableProperty<ItemModel?> { get }
}

public class ReactiveListManager: ListManager {}

public extension Reactive where Base: ReactiveListManager {

	var sections: BindingTarget<[SectionModel]> {
		return makeBindingTarget { (manager, sections) in manager.sections = sections }
	}
}

extension ReactiveListManager {

	func r_listableView(_ listableView: ListableView, itemAt indexPath: IndexPath) -> ListableViewItem {
		let (item, model) = itemData(at: indexPath)
		guard let cell = item as? ReactiveItemUI else { return item }
		cell.model.value = model
		return item
	}

	func r_viewForHeaderFooter(at indexPath: IndexPath, for listableView: ListableView, of kind: String) -> UIView? {
		guard let data = headerFooterItemData(at: indexPath, of: kind) else { return nil }
		let (view, model) = data
		guard let item = view as? ReactiveItemUI else { return view }
		item.model.value = model
		return view
	}
}
