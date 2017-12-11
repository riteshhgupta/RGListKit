//
//  UIView+Extension.swift
//  RGListKit
//
//  Created by Ritesh Gupta on 01/12/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
	
	public func attach(subview view: UIView) {
		view.translatesAutoresizingMaskIntoConstraints = false
		view.frame = bounds
		addSubview(view)		
		let views = ["view": view]
		addConstraints("H".constraints(for: views))
		addConstraints("V".constraints(for: views))
	}
}

fileprivate extension String {
	
	// because you can 🙃
	func constraints(`for` views: [String: Any]) -> [NSLayoutConstraint] {
		return NSLayoutConstraint.constraints(withVisualFormat: "\(self):|[view]|", options: [], metrics: nil, views: views)
	}
}
