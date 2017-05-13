//
//  ListManager+UICollectionViewDataSource.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 06/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

/*
		-- `ListManager` conforms to `UICollectionViewDataSource` to provide 
				data-source support for `UICollectionView`
*/

extension ListManager: UICollectionViewDataSource {
	
	open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let item = sections[indexPath.section].cells[indexPath.row]
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.reuseIdentifier, for: indexPath)
		cell.as(ItemUI.self).flatMap { $0.configure(withModel: item) }
		return cell
	}

	open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return sections[section].cells.count
	}

	open func numberOfSections(in collectionView: UICollectionView) -> Int {
		return sections.count
	}

	open func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		guard let item = headerFooterModel(forKind: kind, indexPath: indexPath) else { return UICollectionReusableView() }
		let cell = collectionView.dequeueReusableSupplementaryView(
			ofKind: kind,
			withReuseIdentifier: item.reuseIdentifier,
			for: indexPath
		)
		cell.as(ItemUI.self).flatMap { $0.configure(withModel: item) }
		return cell
	}
}

fileprivate extension ListManager {
	
	func headerFooterModel(forKind kind: String, indexPath: IndexPath) -> ItemModel? {
		let section = sections[indexPath.section]
		switch kind {
		case UICollectionElementKindSectionHeader:
			return section.header
		case UICollectionElementKindSectionFooter:
			return section.footer
		default:
			return nil
		}
	}
}
