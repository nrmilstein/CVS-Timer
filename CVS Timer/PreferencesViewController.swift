//
//  PreferencesViewController.swift
//  CVS Timer
//
//  Copyright © 2016 Neal Milstein. All rights reserved.
//

import Cocoa

class PreferencesViewController: NSViewController {
  
  var timeBetweenBreaks : Int = NSUserDefaults.standardUserDefaults()
    .integerForKey("timeBetweenBreaks") {
    didSet {
      NSUserDefaults.standardUserDefaults()
        .setInteger(timeBetweenBreaks, forKey: "timeBetweenBreaks")
      (NSApp.delegate as! AppDelegate).updateTimeBetweenBreaks()
    }
  }
  
  var breakDuration : Int = NSUserDefaults.standardUserDefaults()
    .integerForKey("breakDuration") {
    didSet {
      NSUserDefaults.standardUserDefaults()
        .setInteger(breakDuration, forKey: "breakDuration")
    }
  }
  
  override func viewDidLoad() {
  }
}