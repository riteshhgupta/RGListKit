//
//  TableViewController.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 16/12/16.
//  Copyright © 2016 Ritesh Gupta. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
	
	@IBOutlet public var tableView: UITableView! {
		didSet {
			listManager = ListManager(listView: tableView)
		}
	}
	
	var listManager: ListManager?	

	override func viewDidLoad() {
		super.viewDidLoad()
		loadCacheData()
		mockAPIData()
	}
}

extension TableViewController {

	func loadCacheData() {
		let cells = (0..<10).map { "\($0)" }.map { TableCellModel(title: $0) }
		let section = SectionModel(id: "one", cells: cells)
		listManager?.sections = [section]
	}

	func mockAPIData() {
		let delay = DispatchTime.now() + 3
		DispatchQueue.main.asyncAfter(deadline: delay) {
			let cells = (0..<10).filter { $0 % 2 == 0 }.map { "\($0)" }.map { TableCellModel(title: $0) }
			let section = SectionModel(id: "one", cells: cells)
			self.listManager?.sections = [section]
		}
	}
}
