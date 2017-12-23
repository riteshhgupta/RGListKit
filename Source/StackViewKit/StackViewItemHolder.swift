//
//  StackViewItemHolder.swift
//  GenericTable
//
//  Created by Ritesh Gupta on 03/12/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit
import ProtoKit

public protocol StackViewItemHolder: ReusableListViewItem {
	
	var item: Nibable? { get set }
	var holderView: UIView { get }
}

public extension StackViewItemHolder {
	
	public func attach(itemType: Nibable.Type) -> Nibable {
		guard let item = self.item else {
			let _item = itemType.instance()
			self.item = _item
			holderView.attach(subview: _item)
			return _item
		}
		return item
	}
}

public extension StackViewItemHolder where Self: UITableViewCell {
	
	public var holderView: UIView { return contentView }
}

public extension StackViewItemHolder where Self: UICollectionViewCell {
	
	public var holderView: UIView { return contentView }
}

