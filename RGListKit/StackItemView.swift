//
//  StackItemView.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 09/12/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import UIKit
import ProtoKit

struct Model: StackViewItemModel {
	
	let title: String
	var itemType: StackViewItem.Type { return StackItemView.self }
	var height: CGFloat { return 64.0 }
	var width: CGFloat { return 100.0 }
}

class StackItemView: UIView {

	@IBOutlet var label: UILabel!
}

extension StackItemView: StackViewItemProvider {
	
	func configure(with model: StackViewItemModel) {
		guard let model = model as? Model else { return }
		label.text = model.title
	}
}
