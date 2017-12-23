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

public protocol StackViewItemModelInjectable: Nibable {

	var itemModel: ((StackViewItemModel) -> Void)? { get set }
}
