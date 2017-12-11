//
//  StackViewCollectionViewCell.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 01/12/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

final class StackViewCollectionViewCell: UICollectionViewCell {
	
	var item: StackViewItem?
}

extension StackViewCollectionViewCell: StackViewItemHolder {}
