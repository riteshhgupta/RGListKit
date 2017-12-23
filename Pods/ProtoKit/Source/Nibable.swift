//
//  Nibable.swift
//  GenericTable
//
//  Created by Ritesh Gupta on 03/12/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

public protocol Nibable: class {
	
	var nib: UINib { get }
	static var nib: UINib { get }
	static func instance() -> UIView
}

public extension Nibable where Self: Describable {
	
	static var nib: UINib {
		return UINib(nibName: typeName, bundle: nil)
	}
	
	var nib: UINib {
		return UINib(nibName: typeName, bundle: nil)
	}
	
	static func instance() -> UIView {
		return nib.instantiate(withOwner: self, options: nil).first as! UIView
	}
}
