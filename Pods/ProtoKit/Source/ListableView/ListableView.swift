//
//  ListableView.swift
//  GenericTable
//
//  Created by Ritesh Gupta on 03/12/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

public typealias ReusableView = ReusableListViewItem & UIView

public protocol ListableView: class {
	
	var listDelegate: ListableViewDelegate? { get set }
	var listDatasource: ListableViewDatasource? { get set }
	
	func registerItem(with nib: UINib, for identifier: String)
	func registerHeaderFooterItem(with nib: UINib, for identifier: String, of kind: String)
	func reusableItem<Item: ReusableView>(withIdentifier identifier: String, for indexPath: IndexPath) -> Item
	func reusableHeaderFooterItem<Item: ReusableView>(withIdentifier identifier: String, for indexPath: IndexPath, of kind: String) -> Item?
	func reloadItems()
}
