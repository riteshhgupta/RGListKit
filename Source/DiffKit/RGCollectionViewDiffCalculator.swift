//
//  RGCollectionViewDiffCalculator.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 13/05/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation

/*
		-- `RGCollectionViewDiffCalculator` is an internal class for UICollectionView 
			  which makes RGListKit's design work with Dwiftt's design

		-- its implements `ListableDiffCalculator` protocol which is later used to 
			 perform batch updates
*/

final class RGCollectionViewDiffCalculator: CollectionViewDiffCalculator<SectionModel, EquatableListViewItemModel> {}

extension RGCollectionViewDiffCalculator: ListableDiffCalculator {

	public func batchReload(_ sections: [SectionModel]) {
		self.sectionedValues = SectionedValues(
			sections.map({ ($0, $0.cells.map({ $0.model })) })
		)
	}
}
