//
//  EquatableListViewItemModel.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 01/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

/*
		-- `EquatableListViewItemModel` is an internal struct that gets injected into 
				dwifft calculator
*/

struct EquatableListViewItemModel: ListViewItemModel, Equatable {
	
	var id: String
	var reuseIdentifier: String
	var height: CGFloat
	var width: CGFloat
	
	init(id: String, reuseIdentifier: String, height: CGFloat, width: CGFloat = 0.0) {
		self.id = id
		self.reuseIdentifier = reuseIdentifier
		self.height = height
		self.width = width
	}

	public static func ==(lhs: EquatableListViewItemModel, rhs: EquatableListViewItemModel) -> Bool {
		return lhs.id == rhs.id
	}
}
