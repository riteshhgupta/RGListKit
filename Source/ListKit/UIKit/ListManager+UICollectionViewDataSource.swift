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
		return listableView(collectionView, itemAt: indexPath) as! UICollectionViewCell
	}

	open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return sections[section].cells.count
	}

	open func numberOfSections(in collectionView: UICollectionView) -> Int {
		return sections.count
	}

	open func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		return viewForHeaderFooter(at: indexPath, for: collectionView, of: kind) as! UICollectionReusableView
	}
}
