//
//  StackViewCollectionViewCell.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 01/12/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit
import ProtoKit

final class StackViewCollectionViewCell: UICollectionViewCell {
	
	var item: Nibable?
}

extension StackViewCollectionViewCell: StackViewItemHolder {}
