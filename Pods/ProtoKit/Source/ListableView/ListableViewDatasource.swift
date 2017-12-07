//
//  ListableViewDatasource.swift
//  ListableView
//
//  Created by Ritesh Gupta on 05/12/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

public protocol ListableViewDatasource: NSObjectProtocol {
	
	func numberOfSectionsIn(listableView: ListableView) -> Int
	func listableView(_ listableView: ListableView, numberOfItemsInSection section: Int) -> Int
	func listableView<Item: ReusableItem>(_ listableView: ListableView, itemForItemAt indexPath: IndexPath) -> Item
	func listableView(_ listableView: ListableView, viewForHeaderFooterAt indexPath: IndexPath, of kind: String) -> UIView?
}
