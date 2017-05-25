//
//  CollectionViewController.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 01/01/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import UIKit

final class CollectionViewController: UIViewController {

	@IBOutlet weak var collectionView: UICollectionView! {
		didSet {
			listManager = ListManager(listView: collectionView, delegate: self)
		}
	}
	
	var listManager: ListManager?
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		loadCacheData()
		mockAPIData()
	}
}

extension CollectionViewController {

	func loadCacheData() {
		let cells = (0..<50).map { "\($0)" }.map { CollectionCellModel(title: $0) }
		let section = SectionModel(id: "section-one", cells: cells)
		listManager?.sections = [section]
	}

	func mockAPIData() {
		let delay = DispatchTime.now() + 3
		DispatchQueue.main.asyncAfter(deadline: delay) {
			let cells = (0..<50).filter { $0 % 2 == 0 }.map { "\($0)" }.map { CollectionCellModel(title: $0) }
			let section = SectionModel(id: "section-one", cells: cells)
			self.listManager?.sections = [section]
		}
	}
}

extension ListManager {

	public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard let vc = delegate as? CollectionViewController else { return }
		print("CollectionViewController didSelectItemAt = \(indexPath.item)")
		print(vc.view)
	}
}
