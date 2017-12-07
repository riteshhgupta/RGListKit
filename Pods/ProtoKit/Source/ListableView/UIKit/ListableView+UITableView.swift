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
	
	public func register(nib: UINib, for identifier: String) {
		register(nib, forCellReuseIdentifier: identifier)
	}
	
	public func reusableItem<Item: ReusableItem>(withIdentifier identifier: String, for indexPath: IndexPath) -> Item {
		return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! Item
	}
	
	public func reusableHeaderFooterItem(withIdentifier identifier: String, for indexPath: IndexPath, of kind: String) -> UIView? {
		return dequeueReusableHeaderFooterView(withIdentifier: identifier)
	}
	
	public func reloadItems() {
		reloadData()
	}
}
