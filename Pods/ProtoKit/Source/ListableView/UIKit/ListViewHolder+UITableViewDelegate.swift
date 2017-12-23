//
//  ListViewHolder+UITableViewDelegate.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 06/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

/*
		-- `ListViewHolder` conforms to `UITableViewDelegate` to provide delegate
				support for `UITableView`
*/

extension ListViewHolder: UITableViewDelegate {
	
	open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let indexPath = IndexPath(row: 0, section: section)
		let view: UITableViewHeaderFooterView? = listableView(tableView, viewForHeaderFooterAt: indexPath, of: UICollectionElementKindSectionHeader)
		return view
	}

	open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		let indexPath = IndexPath(row: 0, section: section)
		let view: UITableViewHeaderFooterView? = listableView(tableView, viewForHeaderFooterAt: indexPath, of: UICollectionElementKindSectionHeader)
		return view
	}

	open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return listableView(tableView, sizeForItemAt: indexPath).height
	}

	open func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return listableView(tableView, estimatedHeightForItemAt: indexPath)
	}

	open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return listableView(tableView, heightForHeaderInSection: section)
	}

	open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return listableView(tableView, heightForFooterInSection: section)
	}

	open func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
		return listableView(tableView, estimatedHeightForHeaderInSection: section)
	}

	open func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
		return listableView(tableView, estimatedHeightForFooterInSection: section)
	}
}

