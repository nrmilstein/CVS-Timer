//
//  PauseOverlay.swift
//  CVS Timer
//
//  Copyright © 2016 Neal Milstein. All rights reserved.
//

import Cocoa

class PauseOverlayWindow : NSWindow {
  override init(contentRect: NSRect,
    styleMask windowStyle: Int,
    backing bufferingType: NSBackingStoreType,
    `defer` deferCreation: Bool) {
      super.init(contentRect: contentRect, styleMask: windowStyle, backing: bufferingType, `defer`: deferCreation)
      
      opaque = false
      backgroundColor = NSColor.clearColor()
      alphaValue = 0.85
      level = Int(CGWindowLevelForKey(.FloatingWindowLevelKey))
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override var canBecomeMainWindow: Bool {
    get {
      return true
    }
  }
  
  override var canBecomeKeyWindow: Bool {
    get {
      return true
    }
  }
}
