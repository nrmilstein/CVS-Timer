//
//  PauseOverlayView.swift
//  CVS Timer
//
//  Copyright © 2016 Neal Milstein. All rights reserved.
//

import Cocoa

class PauseOverlayView : NSView {
  @IBOutlet weak var pauseProgress: NSProgressIndicator!
  var progressTimerOptional: NSTimer?
  
  let progressUpdateInterval: Double = 0.03
  var breakDuration = 10
  
  override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setNeedsDisplayInRect(NSRect(x: 0, y: 0, width: 100, height: 100))
  }
  
  override func drawRect(dirtyRect: NSRect) {
    self.layer!.backgroundColor = CGColorCreateGenericRGB(0, 0, 0, 1)
    self.layer!.cornerRadius = 15
  }
  
  func animateProgressIndicator() {
    breakDuration = NSUserDefaults.standardUserDefaults().integerForKey("breakDuration")
    if let progressTimer = progressTimerOptional {
      progressTimer.invalidate()
    }
    progressTimerOptional =  NSTimer.scheduledTimerWithTimeInterval(progressUpdateInterval,
      target: self, selector: Selector("incrementProgressIndicator"), userInfo: nil, repeats: true)
  }
  
  func stopProgressIndicatorAnimation() {
    if let progressTimer = progressTimerOptional {
      progressTimer.invalidate()
    }
    pauseProgress.doubleValue = 0
  }
  
  func incrementProgressIndicator() {
    let incrementVal = Double(pauseProgress.maxValue - pauseProgress.minValue) / Double(breakDuration)
      * progressUpdateInterval
    pauseProgress.incrementBy(incrementVal
      )
  }
}
