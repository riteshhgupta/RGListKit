//
//  SectionManager.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 02/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit
import ProtoKit

/*
		-- `ListManager` is the only public class which one needs to use to manage 
				table/collection-views
		
		-- `listView` could be a table/collection-view
		
		-- `shouldPerformBatchUpdate` controls whether to do a complete reload or 
				just update the changes
		
		-- `sections` is the only public variable one needs to set to update 
				table/collection-view
*/

public typealias Closure<P, Q> = ((P) -> (Q))

open class DiffableListViewHolder: ListViewHolder {
	
	let diffCalculator: ListableDiffCalculator

	public weak var delegate: AnyObject?
	public var shouldPerformBatchUpdate: Bool

	// datasource
	public var sections: [SectionModel] = [] {
		didSet {
			if shouldPerformBatchUpdate { diffCalculator.batchReload(sections) }
			else { listView.reloadItems() }
		}
	}

	public init(listView: DiffableListView, shouldPerformBatchUpdate: Bool = true, delegate: AnyObject? = nil) {
		self.delegate = delegate
		self.diffCalculator = listView.diffCalculator
		self.shouldPerformBatchUpdate = shouldPerformBatchUpdate

		super.init(listView: listView)
	}
	
	override open func numberOfSectionsIn(listableView: ListableView) -> Int {
		return sections.count
	}
	
	override open func listableView(_ listableView: ListableView, numberOfItemsInSection section: Int) -> Int {
		return sections[section].cells.count
	}
	
	override open func listableView<Item: ReusableView>(_ listableView: ListableView, itemForItemAt indexPath: IndexPath) -> Item {
		let data: (Item, ListViewItemModel) = itemData(at: indexPath)
		let (item, model) = data
		guard let cell = item as? ListViewItemModelInjectable, let injector = cell.itemModel else { return item }
		injector(model)
		return item
	}
	
	override open func listableView<Item: ReusableView>(_ listableView: ListableView, viewForHeaderFooterAt indexPath: IndexPath, of kind: String) -> Item? {
		let data: (Item, ListViewItemModel)? = headerFooterItemData(at: indexPath, of: kind)
		guard let (item, model) = data else { return nil }
		guard let view = item as? ListViewItemModelInjectable, let injector = view.itemModel else { return item }
		injector(model)
		return item
	}
	
	override open func listableView(_ listableView: ListableView, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return sections[indexPath.section].cells[indexPath.row].size
	}
	
	override open func listableView(_ listableView: ListableView, estimatedHeightForItemAt indexPath: IndexPath) -> CGFloat {
		return sections[indexPath.section].cells[indexPath.row].estimatedHeight
	}
	
	override open func listableView(_ listableView: ListableView, heightForHeaderInSection section: Int) -> CGFloat {
		return sections[section].header?.height ?? 0.0
	}
	
	override open func listableView(_ listableView: ListableView, heightForFooterInSection section: Int) -> CGFloat {
		return sections[section].footer?.height ?? 0.0
	}
	
	override open func listableView(_ listableView: ListableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
		return sections[section].header?.estimatedHeight ?? 0.0
	}
	
	override open func listableView(_ listableView: ListableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
		return sections[section].footer?.estimatedHeight ?? 0.0
	}
}
