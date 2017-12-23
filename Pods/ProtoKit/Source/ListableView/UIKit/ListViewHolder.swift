//
//  ListViewHolder.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 07/12/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import UIKit

open class ListViewHolder: NSObject {
	
	public let listView: ListableView
	
	public init(listView: ListableView) {
		self.listView = listView
		super.init()
		self.listView.listDelegate = self
		self.listView.listDatasource = self
	}
	
	open func numberOfSectionsIn(listableView: ListableView) -> Int {
		// override
		return 0
	}
	
	open func listableView(_ listableView: ListableView, numberOfItemsInSection section: Int) -> Int {
		// override
		return 0
	}
	
	open func listableView<Item: ReusableView>(_ listableView: ListableView, itemForItemAt indexPath: IndexPath) -> Item {
		// override
		return listView.reusableItem(withIdentifier: "", for: indexPath)
	}
	
	open func listableView<Item: ReusableView>(_ listableView: ListableView, viewForHeaderFooterAt indexPath: IndexPath, of kind: String) -> Item? {
		// override
		return listView.reusableHeaderFooterItem(withIdentifier: "", for: indexPath, of: kind)
	}
	
	open func listableView(_ listableView: ListableView, sizeForItemAt indexPath: IndexPath) -> CGSize {
		// override
		return .zero
	}
	
	open func listableView(_ listableView: ListableView, estimatedHeightForItemAt indexPath: IndexPath) -> CGFloat {
		// override
		return 0.0
	}
	
	open func listableView(_ listableView: ListableView, heightForHeaderInSection section: Int) -> CGFloat {
		// override
		return 0.0
	}
	
	open func listableView(_ listableView: ListableView, heightForFooterInSection section: Int) -> CGFloat {
		// override
		return 0.0
	}
	
	open func listableView(_ listableView: ListableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
		// override
		return 0.0
	}
	
	open func listableView(_ listableView: ListableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
		// override
		return 0.0
	}
}

extension ListViewHolder: ListableViewDelegate {}

extension ListViewHolder: ListableViewDatasource {}

extension ListViewHolder: ListableViewLayout {}
