//
//  ListViewHolder+UICollectionViewDataSource.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 06/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

/*
		-- `ListViewHolder` conforms to `UICollectionViewDataSource` to provide
				data-source support for `UICollectionView`
*/

extension ListViewHolder: UICollectionViewDataSource {
	
	open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return listableView(collectionView, itemForItemAt: indexPath)
	}
	
	open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listableView(collectionView, numberOfItemsInSection: section)
	}

	open func numberOfSections(in collectionView: UICollectionView) -> Int {
		return numberOfSectionsIn(listableView: collectionView)
	}

	open func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let view: UICollectionReusableView? = listableView(collectionView, viewForHeaderFooterAt: indexPath, of: kind)
		return view!
	}
}
