//
//  BarGraphView.swift
//  LevatasGraphing
//
//  Created by Anthony Dreessen on 2/16/15.
//  Copyright (c) 2015 Levatas. All rights reserved.
//

import UIKit

class BarGraphView: UIView {
    
    internal let defaultBGColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
    internal let defaultBarColor = UIColor(red: 0.8, green: 0.2, blue: 0.2, alpha: 1.0)
    
    internal var bars:[UIView] = []
    internal var series: [Int] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.hidden = true
        self.backgroundColor = self.defaultBGColor
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    internal func draw() {
        if (self.series.count > 0) {
            let barSpacing = self.frame.width / CGFloat(self.series.count)
            for (index, element) in enumerate(self.series) {
                let barX = CGFloat(index) * barSpacing
                var frameRect = CGRect(x: barX, y: 0.0, width: barSpacing/2, height: CGFloat(element))
                var subv = UIView(frame: frameRect)
                subv.backgroundColor = self.defaultBarColor
                self.addSubview(subv)
                self.bars.append(subv)
            }
            self.hidden = false
        }
    }

}
