//
//  AppDelegate.swift
//  CVS Timer
//
//  Copyright © 2016 Neal Milstein. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  @IBOutlet weak var statusMenu: NSMenu!
  var statusItem: NSStatusItem!
  
  var pauseWindowController: NSWindowController!
  let standardUserDefaults = NSUserDefaults.standardUserDefaults()
  
  var pauseTimer : NSTimer?
  var pauseTimerSetTime: NSDate = NSDate()
  
  func applicationWillFinishLaunching(notification: NSNotification) {
    let appDefaults = NSDictionary(
      objects: [NSNumber(int: 20), NSNumber(int: 20)],
      forKeys: ["timeBetweenBreaks", "breakDuration"])
    standardUserDefaults.registerDefaults(appDefaults as! [String : AnyObject])
  }
  
  func applicationDidFinishLaunching(aNotification: NSNotification) {
    let storyBoard = NSStoryboard(name: "Main", bundle: nil)
    pauseWindowController =
      storyBoard.instantiateControllerWithIdentifier("pauseWindowController") as!
      NSWindowController
    
    launchStatusItem()
    updateTimeBetweenBreaks()
  }
  
  func launchStatusItem() {
    statusItem = NSStatusBar.systemStatusBar()
      .statusItemWithLength(NSVariableStatusItemLength);
    statusItem.title = "C";
    statusItem.menu = statusMenu;
    statusItem.highlightMode = true;
  }
  
  func updateTimeBetweenBreaks() {
    let newTimeBetweenBreaks = getTimeBetweenBreaks()
    if let pauseTimer = pauseTimer {
      if (pauseTimer.valid) {
        pauseTimer.fireDate = pauseTimerSetTime
          .dateByAddingTimeInterval(Double(newTimeBetweenBreaks))
      }
    } else {
      pauseTimer = NSTimer.scheduledTimerWithTimeInterval(
        Double(newTimeBetweenBreaks), target: self, selector: Selector("showPauseWindow"),
        userInfo: nil, repeats: false)
    }
  }
  
  func showPauseWindow() {
    pauseWindowController.showWindow(self)
    NSTimer.scheduledTimerWithTimeInterval(
      Double(standardUserDefaults.integerForKey("breakDuration")),
      target: self, selector: Selector("hidePauseWindow"), userInfo: nil, repeats: false)
  }
  
  func hidePauseWindow() {
    pauseWindowController.close()
    pauseTimer?.invalidate()
    
    pauseTimerSetTime = NSDate()
    pauseTimer = NSTimer.scheduledTimerWithTimeInterval(
      Double(getTimeBetweenBreaks()), target: self,
      selector: Selector("showPauseWindow"), userInfo: nil, repeats: false)
  }
  
  private func getTimeBetweenBreaks() -> Int {
    return standardUserDefaults.integerForKey("timeBetweenBreaks") * 60
  }
  
  func applicationWillTerminate(aNotification: NSNotification) {
    
  }

  @IBAction func showPreferences(sender: NSMenuItem) {
    
  }
}

