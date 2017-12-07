//
//  Describable.swift
//  GenericTable
//
//  Created by Ritesh Gupta on 03/12/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation

public protocol Describable {
	
	var typeName: String { get }
	static var typeName: String { get }
}

public extension Describable {
	
	var typeName: String {
		return String(describing: self)
	}
	
	static var typeName: String {
		return String(describing: self)
	}
}

public extension Describable where Self: NSObjectProtocol {
	
	var typeName: String {
		let _type = type(of: self)
		return String(describing: _type)
	}
}
