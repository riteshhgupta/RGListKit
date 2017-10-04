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
	
	open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return listableView(tableView, itemAt: indexPath) as! UITableViewCell
	}

	open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sections[section].cells.count
	}

	open func numberOfSections(in tableView: UITableView) -> Int {
		return sections.count
	}
}
