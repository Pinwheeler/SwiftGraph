//
//  BarGraphUITests.swift
//  LevatasGraphing
//
//  Created by Anthony Dreessen on 2/17/15.
//  Copyright (c) 2015 Levatas. All rights reserved.
//

import UIKit
import XCTest

class BarGraphUITests: XCTestCase {

    internal var globalBarGraph = BarGraphView(frame: defaultFrame)
    
    override func setUp() {
        super.setUp()
        globalBarGraph.series = [4,6,10,2]
        globalBarGraph.draw()
    }
    

    func testSetSeries() {
        XCTAssertEqual(globalBarGraph.series, [4,6,10,2])
    }
    
    func testBarHeight() {
        //We want the scale of the graph based on the highest bar
        //and for the height of all of the graphs to be proportional
        let bar0 = globalBarGraph.bars[0]
        let bar2 = globalBarGraph.bars[2]
        XCTAssertEqual(bar0.frame.height, bar2.frame.height * 0.4)
    }
    
    func testBarSpacingAndWidth() {
        //We want the bars to be evenly spaced across the UIView
        let bar0 = globalBarGraph.bars[0]
        let bar1 = globalBarGraph.bars[1]
        let barcount:CGFloat = CGFloat(globalBarGraph.bars.count)
        let barSpacing = globalBarGraph.frame.width / barcount
        XCTAssertEqual(bar1.frame.origin.x, bar0.frame.origin.x + (barSpacing))
        
        //We also want the bars to have a reasonable width
        //probably half of the spacing width
        XCTAssertEqual(bar1.frame.width, barSpacing/2)
        XCTAssertEqual(bar0.frame.width, bar1.frame.width)
    }
    
    
    func testBarColors() {
        //We want the bars to be visible, AKA NOT the background color
        //We also want the bars and the background to have some color
        let bar0 = globalBarGraph.bars[0]
        let bgColor = globalBarGraph.backgroundColor
        let barBgColor = bar0.backgroundColor
        if (bgColor != nil && barBgColor != nil) {
            let bgHash = bgColor!.hashValue
            let barHash = barBgColor!.hashValue
            XCTAssertNotEqual(bgHash, barHash)
        }
        else {
            XCTFail("background colors and bar colors should be non-nil")
        }
    }

}
