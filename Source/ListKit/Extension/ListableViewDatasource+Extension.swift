//
//  ListableViewDatasource+Extension.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 13/05/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation

/*
		-- helper methods which one can use with both UITable/UICollectionView 
*/

public extension DiffableListViewHolder {

	/* returns a section from the list of sections based on a closure that returns a bool */

	public func section(_ handler: Closure<SectionModel, Bool>) -> SectionModel? {
		return sections.filter(handler).first
	}

	/*
	- replaces a section with a new section
	- `sectionHandler` closure contains the required section that needs to be replaced
	- return the new section inside `sectionHandler` closure
	*/
	public func replace(
		section filterHandler: Closure<SectionModel, Bool>,
		with sectionHandler: Closure<SectionModel, SectionModel>)
	{
		guard let oldSection = section(filterHandler) else { return }
		let newSection = sectionHandler(oldSection)
		guard let idx = sections.index(where: { $0.id == oldSection.id }) else { return }
		sections[idx] = newSection
	}

	/*
	- collapses the required section (removes all the items in the required section)
	- returns the items in the section which has been collapsed
	*/
	public func collapseSection<T: ListViewItemModel>(_ handler: Closure<SectionModel, Bool>) -> [T] {
		var items = [T]()
		replace(section: handler) { (section) -> SectionModel in
			var newSection = section
			items = newSection.cells as! [T]
			newSection.cells = []
			return newSection
		}
		return items
	}

	/*
	- expands the required section (inserts all the items in the required section)
	- new items need to be injected to the function (collapseSection(:) returns the collapsed items)
	*/
	public func expandSection(_ handler: Closure<SectionModel, Bool>, withItems items: [ListViewItemModel]) {
		replace(section: handler) { (section) -> SectionModel in
			var newSection = section
			newSection.cells = items
			return newSection
		}
	}
}

extension SectionModel {

	public func item(_ handler: Closure<ListViewItemModel, Bool>) -> ListViewItemModel? {
		return cells.filter(handler).first
	}
}
