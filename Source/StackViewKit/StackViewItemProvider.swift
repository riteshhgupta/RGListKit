//
//  StackViewItemProvider.swift
//  GenericTable
//
//  Created by Ritesh Gupta on 03/12/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit
import ProtoKit

public typealias StackViewItem = StackViewItemProvider & UIView

public protocol StackViewItemProvider {
	
	static func instance() -> StackViewItem
	func configure(with model: StackViewItemModel)
}

public extension StackViewItemProvider where Self: Describable & Nibable {
	
	public static func instance() -> StackViewItem {
		return nib.instantiate(withOwner: self, options: nil).first as! StackViewItem
	}
}
