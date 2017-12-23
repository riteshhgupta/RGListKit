//
//  ListViewItemModelInjectable.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 04/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation

/*
		-- conform custom UITableViewCell or UICollectionViewCell to `ItemUI` 
			 protocol to make sure that RGListKit calls `configure(withModel:)` method

		-- RGListKit internally calls `configure(withModel:)` inside
			`cellForRowAt(:)` (for table) & `cellForItemAt(:)` (for collection-view)
*/

public protocol ListViewItemModelInjectable {
	
	var itemModel: ((ListViewItemModel) -> Void)? { get set }
}
