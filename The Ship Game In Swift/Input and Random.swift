//
//  userInput.swift
//  The Ship Game In Swift
//
//  Created by Harry on 15/11/19.
//  Copyright © 2015 Harry Chen. All rights reserved.
//

import Foundation

func input() -> String {
  let keyboard = NSFileHandle.fileHandleWithStandardInput()
  let inputData = keyboard.availableData
  let rawString = NSString(data: inputData, encoding: NSUTF8StringEncoding)
  if let string = rawString {
    return string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
  } else {
    return "Invalid input"
  }
}

func randomIntBetween(low:Int, high:Int) -> Int {
  let range = high - (low - 1)
  return (Int(arc4random()) % range) + low
}