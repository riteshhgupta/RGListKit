//
//  ListManager+UITableViewDataSource.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 06/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

/*
		-- `ListManager` conforms to `UITableViewDataSource` to provide data-source 
				support for `UITableView`
*/

extension ListManager: UITableViewDataSource {
	
	open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sections[section].cells.count
	}

	open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let item = sections[indexPath.section].cells[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: item.reuseIdentifier, for: indexPath)
		cell.as(ItemUI.self).flatMap { $0.configure(withModel: item) }
		return cell
	}

	open func numberOfSections(in tableView: UITableView) -> Int {
		return sections.count
	}
}
