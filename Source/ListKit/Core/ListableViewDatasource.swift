//
//  ListableViewDatasource.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 06/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation

/*
		-- `ListableViewDataSource` contains list of section-models (`SectionModel`) 
				which contain respective cell-models (`ItemModel`)
*/

public protocol ListableViewDataSource: NSObjectProtocol {
	
	var sections: [SectionModel] { get set }
}
