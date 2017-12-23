//
//  StackViewItemModel.swift
//  GenericTable
//
//  Created by Ritesh Gupta on 03/12/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit
import ProtoKit

public protocol StackViewItemModel: ListViewItemModel {
	
	var itemType: Nibable.Type { get }
}

public extension StackViewItemModel {
	
	public var id: String { return UUID().uuidString }
	public var reuseIdentifier: String { return "" }
}
