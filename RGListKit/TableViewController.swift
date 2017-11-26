//
//  TableViewController.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 16/12/16.
//  Copyright © 2016 Ritesh Gupta. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class TableViewController: UIViewController {
	
	@IBOutlet public var tableView: UITableView! {
		didSet {
			listManager = ReactiveListManager(listView: tableView)
		}
	}

	let items = MutableProperty<[SectionModel]?>(nil)

	var listManager: ReactiveListManager!

	override func viewDidLoad() {
		super.viewDidLoad()
		listManager.reactive.sections <~ items.producer.skipNil()
		loadCacheData()
		mockAPIData()
	}
}

extension TableViewController {

	func loadCacheData() {
		let cells = (0..<10).map { "\($0)" }.map { TableCellModel(title: $0) }
		let section = SectionModel(id: "one", cells: cells)
		items.value = [section]
	}

	func mockAPIData() {
		let delay = DispatchTime.now() + 3
		DispatchQueue.main.asyncAfter(deadline: delay) {
			let cells = (0..<10).filter { $0 % 2 == 0 }.map { "\($0)" }.map { TableCellModel(title: $0) }
			let section = SectionModel(id: "one", cells: cells)
			self.items.value = [section]
		}
	}
}
