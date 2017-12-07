//
//  ListableView.swift
//  GenericTable
//
//  Created by Ritesh Gupta on 03/12/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

public protocol ListableView: class {
	
	var listDelegate: ListableViewDelegate? { get set }
	var listDatasource: ListableViewDatasource? { get set }
	
	func register(nib: UINib, for identifier: String)
	func reusableItem<Item: ReusableItem>(withIdentifier identifier: String, for indexPath: IndexPath) -> Item
	func reusableHeaderFooterItem(withIdentifier identifier: String, for indexPath: IndexPath, of kind: String) -> UIView?
	func reloadItems()
}
