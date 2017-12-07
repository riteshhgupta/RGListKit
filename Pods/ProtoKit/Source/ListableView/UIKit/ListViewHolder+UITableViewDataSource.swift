//
//  ListViewHolder+UITableViewDataSource.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 06/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

/*
		-- `ListViewHolder` conforms to `UITableViewDataSource` to provide data-source
				support for `UITableView`
*/

extension ListViewHolder: UITableViewDataSource {
	
	open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return listableView(tableView, itemForItemAt: indexPath)
	}

	open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return listableView(tableView, numberOfItemsInSection: section)
	}

	open func numberOfSections(in tableView: UITableView) -> Int {
		return numberOfSectionsIn(listableView: tableView)
	}
}
