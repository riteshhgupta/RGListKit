//
//  StackViewController.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 09/12/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift

class StackViewController: UIViewController {
	
	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var collectionViewWidthConstraint: NSLayoutConstraint!
	
	var horizontalStackView: ReactiveStackViewHolder! {
		didSet {
			horizontalStackView.reactive.itemModels <~ MutableProperty([
				TitleStackViewItemModel(title: "14"),
				TitleStackViewItemModel(title: "15"),
				TitleStackViewItemModel(title: "16")
				])
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		horizontalStackView = ReactiveStackViewHolder(
			listView: collectionView,
			dynamicConstraint: collectionViewWidthConstraint,
			isVertical: false
		)
	}
}
