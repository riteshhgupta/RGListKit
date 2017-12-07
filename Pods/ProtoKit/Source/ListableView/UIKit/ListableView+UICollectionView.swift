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
	
	public func register(nib: UINib, for identifier: String) {
		register(nib, forCellWithReuseIdentifier: identifier)
	}
	
	public func reusableItem<Item: ReusableItem>(withIdentifier identifier: String, for indexPath: IndexPath) -> Item {
		return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! Item
	}
	
	public func reusableHeaderFooterItem(withIdentifier identifier: String, for indexPath: IndexPath, of kind: String) -> UIView? {
		return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath)
	}
	
	public func reloadItems() {
		reloadData()
	}
}
