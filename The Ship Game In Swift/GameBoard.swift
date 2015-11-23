//  GameBoard.swift
//  The Ship Game In Swift
//
//  Created by Harry on 15/11/20.
//  Copyright © 2015 Harry Chen. All rights reserved.


//Setup gameboard

class GameBoard {
    
    let boardSizeSmall: Int
    let boardSizeBig: Int
    let shipNumber: Int
    var boardPoint: [String: [String: Bool]]
    
    //Initialize new class with size and total ship number
    init() {
        //Welcom message
        print("Welcome, please select a gameboard size by enter a/b/c")
        print("a:5x5(3 Ships)  b:7x7(5 Ships)  c:9x9(6 Ships)")
        
        //acquire userinput
        var userInput = String()
        userInput = input()
        while userInput != "a" && userInput != "b" && userInput != "c" {
            print("")
            print("Invaild input, please enter a/b/c only")
            print("a:5x5(3 Ships)  b:7x7(5 Ships)  c:9x9(6 Ships)")
            userInput = input()
        }
        
        //Select a correct size according to userinput
        var temp1 = Int(), temp2 = Int()
        switch userInput {
        //5x5
        case "a" :
            temp1 = 9
            temp2 = 3
        //7x7
        case "b" :
            temp1 = 11
            temp2 = 5
        //9x9
        case "c" :
            temp1 = 13
            temp2 = 6
        default :
            break
        }
        
        //Return gameboard size and ship number
        self.boardSizeSmall = temp1 - 4
        self.boardSizeBig = temp1
        self.shipNumber = temp2
        
        //Setup boardPoint
        var tempDic = [String: [String: Bool]]()
        for x in 1...temp1 {
            for y in 1...temp1 {
                tempDic["(\(x), \(y))"] = ["Occupied": true, "hitted": false]
            }
        }
        for x in 3...(temp1 - 2) {
            for y in 3...(temp1 - 2) {
                tempDic["(\(x), \(y))"] = ["Occupied": false, "hitted": false]
            }
        }
        
        //Return boardPoint
        self.boardPoint = tempDic
    }
}
