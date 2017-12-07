
//
//  ListManager+Extension.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 04/10/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import UIKit
import ProtoKit

extension ListManager {

	func itemData<Item: ReusableItem>(at indexPath: IndexPath) -> (Item, ItemModel) {
		let model = sections[indexPath.section].cells[indexPath.row]
		let item: Item = listView.reusableItem(withIdentifier: model.reuseIdentifier, for: indexPath)
		return (item, model)
	}

	func headerFooterItemData(at indexPath: IndexPath, of kind: String) -> (UIView, ItemModel)? {
		let section = sections[indexPath.row]
		let identifier: String
		let headerFooterModel: ItemModel
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
		let item = listView.reusableHeaderFooterItem(withIdentifier: identifier, for: indexPath, of: kind)!
		return (item, headerFooterModel)
	}
}
