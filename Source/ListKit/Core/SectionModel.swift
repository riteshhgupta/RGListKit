//
//  SectionModel.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 04/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation

/*
		-- use `SectionModel` to define a model for a reusable section-view (table or collection)

		-- `id` is used to distinguish any 2 section-model so it should be unique.

		-- cell, header & footer --> all follow the same `ListViewItemModel` protocol since 
			 all are reusable and need the same info while configuring them.
*/

public struct SectionModel: Equatable {
	
	public var id: String
	public var cells: [ListViewItemModel]
	public var header: ListViewItemModel?
	public var footer: ListViewItemModel?
	
	public init(id: String, cells: [ListViewItemModel], header: ListViewItemModel? = nil, footer: ListViewItemModel? = nil) {
		self.id = id
		self.header = header
		self.footer = footer
		self.cells = cells
	}

	public static func ==(lhs: SectionModel, rhs: SectionModel) -> Bool {
		return lhs.id == rhs.id
	}
}
