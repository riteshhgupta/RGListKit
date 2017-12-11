//
//  StackViewController.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 09/12/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import UIKit

class StackViewController: UIViewController {
	
	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var collectionViewWidthConstraint: NSLayoutConstraint!
	
	var horizontalStackView: StackViewHolder! {
		didSet {
			horizontalStackView.items = [
				Model(title: "14"),
				Model(title: "15"),
				Model(title: "16")
			]
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		horizontalStackView = StackViewHolder(
			listView: collectionView,
			dynamicConstraint: collectionViewWidthConstraint,
			isVertical: false
		)
	}
}
