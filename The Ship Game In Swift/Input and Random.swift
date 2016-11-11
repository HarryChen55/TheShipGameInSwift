//
//  userInput.swift
//  The Ship Game In Swift
//
//  Created by Harry on 15/11/19.
//  Copyright © 2015 Harry Chen. All rights reserved.
//

import Foundation

func keyboardInput() -> String {
  let keyboard = FileHandle.withStandardInput
  let inputData = keyboard.availableData
  let rawString = NSString(data: inputData, encoding: String.Encoding.utf8)
  if let string = rawString {
    return string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
  } else {
    return "Invalid input"
  }
}

func randomIntBetween(_ low:Int, high:Int) -> Int {
  let range = high - (low - 1)
  return (Int(arc4random()) % range) + low
}
