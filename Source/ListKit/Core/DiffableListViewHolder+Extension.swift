
//
//  DiffableListViewHolder+Extension.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 04/10/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import UIKit
import ProtoKit

extension DiffableListViewHolder {

	func itemData<Item: ReusableView>(at indexPath: IndexPath) -> (Item, ListViewItemModel) {
		let model = sections[indexPath.section].cells[indexPath.row]
		let item: Item = listView.reusableItem(withIdentifier: model.reuseIdentifier, for: indexPath)
		return (item, model)
	}

	func headerFooterItemData<Item: ReusableView>(at indexPath: IndexPath, of kind: String) -> (Item, ListViewItemModel)? {
		let section = sections[indexPath.section]
		let identifier: String
		let headerFooterModel: ListViewItemModel
		switch kind {
		case UICollectionElementKindSectionHeader:
			guard let model = section.header else { return nil }
			identifier = model.reuseIdentifier
			headerFooterModel = model
		case UICollectionElementKindSectionFooter:
			guard let model = section.footer else { return nil }
			identifier = model.reuseIdentifier
			headerFooterModel = model
		default:
			return nil
		}
		let item: Item? = listView.reusableHeaderFooterItem(withIdentifier: identifier, for: indexPath, of: kind)
		guard let view = item else { return nil }
		return (view, headerFooterModel)
	}
}
