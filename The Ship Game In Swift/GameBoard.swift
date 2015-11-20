//
//  GameBoard.swift
//  The Ship Game In Swift
//
//  Created by Harry on 15/11/20.
//  Copyright © 2015年 Harry Chen. All rights reserved.


//Setup gameboard

import Foundation

class GameBoard {
    
    let gameBoardX: Int
    let gameBoardY: Int
    let shipNumber: Int
    
    
    //Initialize new class
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
        case "a" :
            temp1 = 5
            temp2 = 3
        case "b" :
            temp1 = 7
            temp2 = 5
        case "c" :
            temp1 = 9
            temp2 = 6
        default :
            break
        }
        
        //Return gameboard size and ship number
        self.gameBoardX = temp1
        self.gameBoardY = temp1
        self.shipNumber = temp2
    }
}
