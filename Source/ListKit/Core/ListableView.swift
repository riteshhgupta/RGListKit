//
//  ListableView.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 06/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation

/*
		-- `ListableView` protocol captures the common attributes/behaviours of 
				`UITableView` & `UICollectionView`

		-- `diffCalculator` is used to call for batch updates

		-- `reload()` gets called when batch-update (`shouldPerformBatchUpdate` 
				in ListManager) is set to False
*/

public protocol ListableView: class {
	
	var _delegate: ListableViewDelegate? { get set }

	var _dataSource: ListableViewDataSource? { get set }

	var diffCalculator: ListableDiffCalculator { get }

	func reload()
}
