//
//  ViewController.swift
//  testTest
//
//  Created by 2lup on 28.11.2022.
//

import UIKit

// модель линии
struct LineModel {
	var start: CGPoint
	var end: CGPoint
	var color: UIColor
	
	init(start: CGPoint, end: CGPoint, color: UIColor) {
		self.start = start
		self.end = end
		self.color = color
	}
}
