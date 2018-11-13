//
//  ListViewItemModel.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 04/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

/*
		-- `ListViewItemModel` is used to define a cell, header or footer
		
		-- conform UITableViewCell/UICollectionView or UITableViewHeaderFooterView models to `ListViewItemModel` protocol.
		
		-- `id` is used to distingiush any 2 cell-model so it should be unique.
		
		-- return `UITableViewAutomaticDimension` for automatic height calculation or some constant as height.
*/

public protocol ListViewItemModel {
	
	var id: String { get }
	var width: CGFloat { get }
	var height: CGFloat { get }
	var estimatedHeight: CGFloat { get }
	var reuseIdentifier: String { get }
}

public extension ListViewItemModel {

    var height: CGFloat { return UITableView.automaticDimension }
	var width: CGFloat { return 0.0 }
	var estimatedHeight: CGFloat { return 100.0 }
	
	var size: CGSize { return CGSize(width: width, height: height) }
}


/*
		-- Internal logic
*/

extension ListViewItemModel {

	var model: EquatableListViewItemModel {
		return EquatableListViewItemModel(
			id: id,
			reuseIdentifier: reuseIdentifier,
			height: height,
			width: width
		)
	}
}
