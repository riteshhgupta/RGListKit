//
//  ListableViewItem.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 30/03/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import UIKit

/*
		-- `ListableViewItem` is an item for a `ListableView` which is a cell to
				a table/collection-view
*/

public protocol ListableViewItem {}

extension UITableViewCell: ListableViewItem {}

extension UICollectionViewCell: ListableViewItem {}
