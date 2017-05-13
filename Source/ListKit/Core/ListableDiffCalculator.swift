//
//  ListableDiffCalculator.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 03/05/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation

/*
		-- `ListableDiffCalculator` is an internal protocol which bridge the gap 
				between Table/Collection-DiffCalculator

		-- `batchReload(:)` is called to perform batch updates on Table/Collection-View
*/

public protocol ListableDiffCalculator {

	func batchReload(_ sections: [SectionModel])
}
