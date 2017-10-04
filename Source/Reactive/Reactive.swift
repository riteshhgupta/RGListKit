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

public class ReactiveListManager: ListManager {

	public let reactiveSections = MutableProperty<[SectionModel]?>(nil)

	public override init(listView: ListableView, shouldPerformBatchUpdate: Bool = true, delegate: AnyObject? = nil) {
		super.init(
			listView: listView,
			shouldPerformBatchUpdate: shouldPerformBatchUpdate,
			delegate: delegate
		)
		reactive.updateChanges <~ reactiveSections.producer.skipNil()
	}
}

fileprivate extension Reactive where Base: ReactiveListManager {

	var updateChanges: BindingTarget<[SectionModel]> {
		return makeBindingTarget { (manager, sections) in
			manager.sections = sections
		}
	}
}

extension ReactiveListManager {

	open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return r_listableView(tableView, itemAt: indexPath) as! UITableViewCell
	}

	open override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let indexPath = IndexPath(row: 0, section: section)
		return r_viewForHeaderFooter(at: indexPath, for: tableView, of: UICollectionElementKindSectionHeader)
	}

	open override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		let indexPath = IndexPath(row: 0, section: section)
		return r_viewForHeaderFooter(at: indexPath, for: tableView, of: UICollectionElementKindSectionFooter)
	}

	open override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return r_listableView(collectionView, itemAt: indexPath) as! UICollectionViewCell
	}

	open override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		return r_viewForHeaderFooter(at: indexPath, for: collectionView, of: kind) as! UICollectionReusableView
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
