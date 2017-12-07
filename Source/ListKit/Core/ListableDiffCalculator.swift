//
//  ListableDiffCalculator.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 03/05/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import UIKit
import ProtoKit

/*
		-- `ListableDiffCalculator` is an internal protocol which bridge the gap 
				between Table/Collection-DiffCalculator

		-- `batchReload(:)` is called to perform batch updates on Table/Collection-View
*/

public protocol ListableDiffCalculator {

	func batchReload(_ sections: [SectionModel])
}

public protocol DiffableListView: ListableView {
	
	var diffCalculator: ListableDiffCalculator { get }
}

extension UICollectionView: DiffableListView {
	
	public var diffCalculator: ListableDiffCalculator { return RGCollectionViewDiffCalculator(collectionView: self) }
}

extension UITableView: DiffableListView {
	
	public var diffCalculator: ListableDiffCalculator { return RGTableViewDiffCalculator(tableView: self) }
}
