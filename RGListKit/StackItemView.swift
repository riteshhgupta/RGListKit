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
import ReactiveSwift
import Result

struct TitleStackViewItemModel: StackViewItemModel {
	
	let title: String
	var itemType: Nibable.Type { return StackItemView.self }
	var height: CGFloat { return 64.0 }
	var width: CGFloat { return 100.0 }
}

final class StackItemView: UIView {

	var itemModel = MutableProperty<StackViewItemModel?>(nil)
	
	@IBOutlet var label: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		label.reactive.text <~ reactive.title
	}
}

extension StackItemView: ReactiveStackViewItemModelInjectable {}

extension Reactive where Base: StackItemView {
	
	var title: SignalProducer<String, NoError> {
		return base
			.itemModel
			.producer
			.skipNil()
			.map { $0 as? TitleStackViewItemModel }
			.skipNil()
			.map { $0.title }
	}
}
