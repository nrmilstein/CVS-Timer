//
//  ViewController.swift
//  CVS Timer
//
//  Copyright © 2016 Neal Milstein. All rights reserved.
//

import Cocoa

class PauseViewController: NSViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
//    NSLog("viewDidLoad")
    // Do any additional setup after loading the view.
  }
  
//  override func viewWillAppear() {
//    NSLog("viewWillAppear")
//  }
//
  override func viewDidAppear() {
    (view as! PauseOverlayView).animateProgressIndicator()
  }
//
//  override func updateViewConstraints() {
//    NSLog("updateViewConstraints")
//    super.updateViewConstraints()
//  }
//  
//  override func viewWillLayout() {
//    NSLog("viewWillLayout")
//  }
//  
//  override func viewDidLayout() {
//    NSLog("viewDidLayout")
//  }

  override func viewWillDisappear() {
    (view as! PauseOverlayView).stopProgressIndicatorAnimation()
  }
//
//  override func viewDidDisappear() {
//    NSLog("viewDidDisappear")
//  }

//  override var representedObject: AnyObject? {
//    didSet {
//    // Update the view, if already loaded.
//    }
//  }
}

