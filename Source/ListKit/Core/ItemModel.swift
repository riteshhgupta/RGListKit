//
//  ItemModel.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 04/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

/*
		-- `ItemModel` is used to define a cell, header or footer
		
		-- conform UITableViewCell/UICollectionView or UITableViewHeaderFooterView models to `ItemModel` protocol.
		
		-- `id` is used to distingiush any 2 cell-model so it should be unique.
		
		-- return `UITableViewAutomaticDimension` for automatic height calculation or some constant as height.
*/

public protocol ItemModel {
	
	var id: String { get }
	var width: CGFloat { get }
	var height: CGFloat { get }
	var estimatedHeight: CGFloat { get }
	var reuseIdentifier: String { get }
}

public extension ItemModel {

	var height: CGFloat { return UITableViewAutomaticDimension }
	var width: CGFloat { return 0.0 }
	var estimatedHeight: CGFloat { return 100.0 }
	
	var size: CGSize {
		return CGSize(width: width, height: height)
	}
}


/*
		-- Internal logic
*/

extension ItemModel {

	var model: EquatableItemModel {
		return EquatableItemModel(
			id: id,
			reuseIdentifier: reuseIdentifier,
			height: height,
			width: width
		)
	}
}
