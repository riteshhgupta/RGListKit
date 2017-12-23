//
//  ListableView+UIKit.swift
//  ListableView
//
//  Created by Ritesh Gupta on 05/12/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

extension UITableView: ListableView {
	
	public var listDelegate: ListableViewDelegate? {
		get { return delegate as? ListableViewDelegate }
		set { delegate = newValue as? UITableViewDelegate }
	}
	
	public var listDatasource: ListableViewDatasource? {
		get { return dataSource as? ListableViewDatasource }
		set { dataSource = newValue as? UITableViewDataSource }
	}
	
	public func registerItem(with nib: UINib, for identifier: String) {
		register(nib, forCellReuseIdentifier: identifier)
	}
	
	public func registerHeaderFooterItem(with nib: UINib, for identifier: String, of kind: String) {
		register(nib, forHeaderFooterViewReuseIdentifier: identifier)
	}
	
	public func reusableItem<Item: ReusableView>(withIdentifier identifier: String, for indexPath: IndexPath) -> Item {
		return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! Item
	}
	
	public func reusableHeaderFooterItem<Item: ReusableView>(withIdentifier identifier: String, for indexPath: IndexPath, of kind: String) -> Item? {
		return dequeueReusableHeaderFooterView(withIdentifier: identifier) as? Item
	}
	
	public func reloadItems() {
		reloadData()
	}
}
