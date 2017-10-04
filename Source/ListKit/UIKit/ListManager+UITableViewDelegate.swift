//
//  ListManager+UITableViewDelegate.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 06/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

/*
		-- `ListManager` conforms to `UITableViewDelegate` to provide delegate 
				support for `UITableView`
*/

extension ListManager: UITableViewDelegate {
	
	open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let indexPath = IndexPath(row: 0, section: section)
		return viewForHeaderFooter(at: indexPath, for: tableView, of: UICollectionElementKindSectionHeader)
	}

	open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		let indexPath = IndexPath(row: 0, section: section)
		return viewForHeaderFooter(at: indexPath, for: tableView, of: UICollectionElementKindSectionFooter)
	}

	open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return sections[indexPath.section].cells[indexPath.row].height
	}

	open func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return sections[indexPath.section].cells[indexPath.row].estimatedHeight
	}

	open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return sections[section].header?.height ?? UITableViewAutomaticDimension
	}

	open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return sections[section].footer?.height ?? UITableViewAutomaticDimension
	}

	open func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
		return sections[section].header?.estimatedHeight ?? UITableViewAutomaticDimension
	}

	open func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
		return sections[section].footer?.estimatedHeight ?? UITableViewAutomaticDimension
	}
}

