//
//  ListableViewLayout.swift
//  ListableView
//
//  Created by Ritesh Gupta on 05/12/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

public protocol ListableViewLayout: NSObjectProtocol {
	
	func listableView(_ listableView: ListableView, estimatedHeightForItemAt indexPath: IndexPath) -> CGFloat	
	func listableView(_ listableView: ListableView, sizeForItemAt indexPath: IndexPath) -> CGSize
	func listableView(_ listableView: ListableView, heightForHeaderInSection section: Int) -> CGFloat
	func listableView(_ listableView: ListableView, heightForFooterInSection section: Int) -> CGFloat
	func listableView(_ listableView: ListableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat
	func listableView(_ listableView: ListableView, estimatedHeightForFooterInSection section: Int) -> CGFloat
}
