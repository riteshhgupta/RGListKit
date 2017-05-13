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

public extension ListableViewDataSource {

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
	- updates a section with a new items
	- `itemsHandler` closure contains the current items in the required section
	- return the new items inside `itemsHandler` closure
	*/
	public func update(
		section filterHandler: Closure<SectionModel, Bool>,
		with itemsHandler: Closure<[ItemModel], [ItemModel]>)
	{
		guard let oldSection = section(filterHandler) else { return }
		var newSection = oldSection
		let newCells = itemsHandler(oldSection.cells)
		newSection.cells = newCells
		guard let idx = sections.index(where: { $0.id == oldSection.id }) else { return }
		if newSection.cells.isEmpty { sections.remove(at: idx) }
		else { sections[idx] = newSection }
	}
	public func updateSection(
		atIndex index: Int = 0,
		with itemsHandler: Closure<[ItemModel], [ItemModel]>)
	{
		var section = sections[index]
		section.cells = itemsHandler(section.cells)
		if section.cells.isEmpty { sections.remove(at: index) }
		else { sections[index] = section }
	}
	public func update(
		item itemFilterHandler: Closure<ItemModel, Bool>,
		with itemHandler: Closure<ItemModel, ItemModel>,
		inSection sectionFilterHandler: Closure<SectionModel, Bool>)
	{
		guard let oldSection = section(sectionFilterHandler) else { return }
		var newSection = oldSection
		guard let oldItem = newSection.item(itemFilterHandler) else { return }
		let newItem = itemHandler(oldItem)
		guard let itemIdx = newSection.cells.index(where: { $0.id == oldItem.id }) else { return }
		newSection.cells[itemIdx] = newItem
		guard let idx = sections.index(where: { $0.id == oldSection.id }) else { return }
		if newSection.cells.isEmpty { sections.remove(at: idx) }
		else { sections[idx] = newSection }
	}
	public func updateItem(
		inSectionAtIndex sectionIndex: Int = 0,
		item itemFilterHandler: Closure<ItemModel, Bool>,
		with itemHandler: Closure<ItemModel, ItemModel>)
	{
		var newSection = sections[sectionIndex]
		guard let oldItem = newSection.item(itemFilterHandler) else { return }
		let newItem = itemHandler(oldItem)
		guard let itemIdx = newSection.cells.index(where: { $0.id == oldItem.id }) else { return }
		newSection.cells[itemIdx] = newItem
		if newSection.cells.isEmpty { sections.remove(at: sectionIndex) }
		else { sections[sectionIndex] = newSection }
	}

	/*
	- collapses the required section (removes all the items in the required section)
	- returns the items in the section which has been collapsed
	*/
	public func collapseSection<T: ItemModel>(_ handler: Closure<SectionModel, Bool>) -> [T] {
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
	public func expandSection(_ handler: Closure<SectionModel, Bool>, withItems items: [ItemModel]) {
		replace(section: handler) { (section) -> SectionModel in
			var newSection = section
			newSection.cells = items
			return newSection
		}
	}
}

extension SectionModel {

	public func item(_ handler: Closure<ItemModel, Bool>) -> ItemModel? {
		return cells.filter(handler).first
	}
}
