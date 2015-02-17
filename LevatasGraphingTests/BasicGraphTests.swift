//
//  BarGraphTests.swift
//  LevatasGraphing
//
//  Created by Anthony Dreessen on 2/16/15.
//  Copyright (c) 2015 Levatas. All rights reserved.
//

import UIKit
import XCTest
import LevatasGraphing

let defaultFrame = CGRect(x: 0, y: 0, width: 200, height: 200)

class BasicGraphTests: XCTestCase {
    
    var globalBarGraph: BarGraphView = {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewControllerWithIdentifier("MainVC") as UIViewController
//            let dummy = vc.view // force loading subviews and setting outlets
//            
//            vc.viewDidLoad()
//            for v:AnyObject in dummy.subviews {
//                println("Found subview with tag ",v.tag)
//                if (v.tag == 100) {
//                    let uiv: UIView = v as UIView
//                    let bgv: BarGraphView = uiv as BarGraphView
//                    return bgv
//                }
//            }
            return BarGraphView(frame: defaultFrame)

    }()

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testBarGraphCreation() {
        XCTAssert(globalBarGraph.series.count == 0)
    }
    
    func testAddItemToSeries()  {
        let item = 4
        let localBarGraph = globalBarGraph
        localBarGraph.series.append(item)
        
        XCTAssertFalse(localBarGraph.series.isEmpty)
        XCTAssertEqual(localBarGraph.series.count, 1)
        XCTAssertEqual(localBarGraph.series[0], item)
    }
    


    func testDraw() {
        let localBarGraph = globalBarGraph
        XCTAssertTrue(localBarGraph.hidden)
        XCTAssertTrue(localBarGraph.subviews.isEmpty)
        
        localBarGraph.draw()
        
        XCTAssertTrue(localBarGraph.hidden)
        XCTAssertTrue(localBarGraph.subviews.isEmpty)
        
        localBarGraph.series.append(4)
        localBarGraph.draw()
        
        XCTAssertFalse(localBarGraph.subviews.isEmpty)
    }
    
    func testDefaultBackgroundColor() {
        let localBarGraph = globalBarGraph
        if (localBarGraph.backgroundColor != nil) {
            XCTAssertEqual(localBarGraph.backgroundColor!, localBarGraph.defaultBGColor)
        }
    }
    
    func testSetBackgroundColor() {
        let localBarGraph = globalBarGraph
        let randFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let testColor = UIColor(red: randFloat, green: randFloat, blue: randFloat, alpha: randFloat)
        localBarGraph.backgroundColor = testColor
        XCTAssertEqual(localBarGraph.backgroundColor!, testColor)
    }
    

}










































