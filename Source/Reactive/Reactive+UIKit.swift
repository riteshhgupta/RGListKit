//
//  Reactive+UIKit.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 26/11/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

extension ReactiveListManager {
	
	open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return r_listableView(tableView, itemAt: indexPath)
	}
	
	open override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let indexPath = IndexPath(row: 0, section: section)
		return r_viewForHeaderFooter(at: indexPath, for: tableView, of: UICollectionElementKindSectionHeader)
	}
	
	open override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		let indexPath = IndexPath(row: 0, section: section)
		return r_viewForHeaderFooter(at: indexPath, for: tableView, of: UICollectionElementKindSectionFooter)
	}
}

extension ReactiveListManager {
	
	open override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return r_listableView(collectionView, itemAt: indexPath)
	}
	
	open override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		return r_viewForHeaderFooter(at: indexPath, for: collectionView, of: kind) as! UICollectionReusableView
	}
}
