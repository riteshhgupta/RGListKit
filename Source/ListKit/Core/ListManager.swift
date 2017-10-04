//
//  SectionManager.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 02/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

/*
		-- `ListManager` is the only public class which one needs to use to manage 
				table/collection-views
		
		-- `listView` could be a table/collection-view
		
		-- `shouldPerformBatchUpdate` controls whether to do a complete reload or 
				just update the changes
		
		-- `sections` is the only public variable one needs to set to update 
				table/collection-view
*/

public typealias Closure<P, Q> = ((P) -> Q)

open class ListManager: NSObject {
	
	let listView: ListableView
	let diffCalculator: ListableDiffCalculator

	public weak var delegate: AnyObject?
	public var shouldPerformBatchUpdate: Bool

	// datasource
	public var sections: [SectionModel] = [] {
		didSet {
			if shouldPerformBatchUpdate {
				diffCalculator.batchReload(sections)
			} else {
				listView.reload()
			}
		}
	}

	public init(listView: ListableView, shouldPerformBatchUpdate: Bool = true, delegate: AnyObject? = nil) {
		self.listView = listView
		self.delegate = delegate
		self.diffCalculator = listView.diffCalculator
		self.shouldPerformBatchUpdate = shouldPerformBatchUpdate

		super.init()
		self.listView._delegate = self
		self.listView._dataSource = self
	}
}

extension ListManager: ListableViewDelegate {}

extension ListManager: ListableViewDataSource {}
