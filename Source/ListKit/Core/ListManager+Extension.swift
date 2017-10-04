
//
//  ListManager+Extension.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 04/10/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import UIKit

extension ListManager {

	func itemData(at indexPath: IndexPath) -> (ListableViewItem, ItemModel) {
		let model = sections[indexPath.section].cells[indexPath.row]
		let item = listView.dequeReusableItem(for: model.reuseIdentifier, at: indexPath)
		return (item, model)
	}

	func listableView(_ listableView: ListableView, itemAt indexPath: IndexPath) -> ListableViewItem {
		let (item, model) = itemData(at: indexPath)
		guard let cell = item as? ItemUI else { return item }
		cell.configure(withModel: model)
		return item
	}

	func headerFooterItemData(at indexPath: IndexPath, of kind: String) -> (UIView, ItemModel)? {
		let section = sections[indexPath.row]
		var identifier = ""
		var headerFooterModel: ItemModel?
		switch kind {
		case UICollectionElementKindSectionHeader:
			guard let model = section.header else { return nil }
			identifier = model.reuseIdentifier
			headerFooterModel = model
		case UICollectionElementKindSectionHeader:
			guard let model = section.footer else { return nil }
			identifier = model.reuseIdentifier
			headerFooterModel = model
		default:
			return nil
		}
		let item = listView.dequeueReusableHeaderFooterItem(for: identifier, at: indexPath, of: kind)
		return (item!, headerFooterModel!)
	}

	func viewForHeaderFooter(at indexPath: IndexPath, for listableView: ListableView, of kind: String) -> UIView? {
		guard let data = headerFooterItemData(at: indexPath, of: kind) else { return nil }
		let (view, model) = data
		guard let item = view as? ItemUI else { return view }
		item.configure(withModel: model)
		return view
	}
}
