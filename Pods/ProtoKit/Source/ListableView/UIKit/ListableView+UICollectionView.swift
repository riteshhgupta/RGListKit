//
//  ListableView+UICollectionView.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 07/12/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView: ListableView {
	
	public var listDelegate: ListableViewDelegate? {
		get { return delegate as? ListableViewDelegate }
		set { delegate = newValue as? UICollectionViewDelegateFlowLayout }
	}
	
	public var listDatasource: ListableViewDatasource? {
		get { return dataSource as? ListableViewDatasource }
		set { dataSource = newValue as? UICollectionViewDataSource }
	}
	
	public func registerItem(with nib: UINib, for identifier: String) {
		register(nib, forCellWithReuseIdentifier: identifier)
	}
	
	public func registerHeaderFooterItem(with nib: UINib, for identifier: String, of kind: String) {
		register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
	}
	
	public func reusableItem<Item: ReusableView>(withIdentifier identifier: String, for indexPath: IndexPath) -> Item {
		return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! Item
	}
	
	public func reusableHeaderFooterItem<Item: ReusableView>(withIdentifier identifier: String, for indexPath: IndexPath, of kind: String) -> Item? {
		return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath) as? Item
	}
	
	public func reloadItems() {
		reloadData()
	}
}
