//
//  ListViewHolder+UICollectionViewDelegateFlowLayout.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 06/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

/*
		-- `ListViewHolder` conforms to `UICollectionViewDelegateFlowLayout` to provide 
				delegate support for `UICollectionView`
*/

extension ListViewHolder: UICollectionViewDelegateFlowLayout {
	
	open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return listableView(collectionView, sizeForItemAt: indexPath)
	}
}
