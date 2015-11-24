//
//  main.swift
//  The Ship Game In Swift
//
//  Created by Harry on 15/11/19.
//  Copyright © 2015 Harry Chen. All rights reserved.
//

//The Ship Game starts here

//Setup gameboard
let Board = GameBoard()


//------------------------------------------ Debug ------------------------------------------v
/*Degug: show initial gameboard
for x in 1...(Board.boardSizeSmall + 4) {
    for y in 1...(Board.boardSizeSmall + 4){
        print("(\(x),\(y)) Status")
        print(Board.boardPoint["(\(x), \(y))"]!)
        print("")
    }
}
//Debug*/
//------------------------------------------ Debug ------------------------------------------^


//Setup ship locations
let Ships = Ship.init(shipNumber: Board.shipNumber, boardSizeSmall: Board.boardSizeSmall, boardPoint: Board.boardPoint)

//Make correction to gameboard
Board.boardPoint = Ships.boardPointOut


//------------------------------------------ Debug ------------------------------------------v
/*Debug: show finished gameboard
print("")
print("Total points: \(Board.boardPoint.count). Points for play: \(Board.boardSizeSmall * Board.boardSizeSmall).")
print("")
for x in 1...(Board.boardSizeSmall + 4) {
    for y in 1...(Board.boardSizeSmall + 4) {
        print("(\(x),\(y)) Status")
        print(Board.boardPoint["(\(x), \(y))"]!)
        print("")
    }
}
for i in 0...(Board.shipNumber - 1) {
    print("Ship \(i + 1):")
    print(Ships.shipID[i])
    print("")
}
//Debug*/
//------------------------------------------ Debug ------------------------------------------^


//Game logic starts
let Game = GameLogic.init(boardSizeSmall: Board.boardSizeSmall, shipNumber: Board.shipNumber)

print("")
print("Please enter a coordinate(within a \(Board.boardSizeSmall)x\(Board.boardSizeSmall) grid, example: 5,4) to fire at")
var userInputX: Int, userInputY: Int, continueFunc: Bool

repeat {
    repeat {
        //Acquire user input
        (userInputX, userInputY) = Game.input()
        
        
        //------------------------------------------ Debug ------------------------------------------v
        /*Debug: show the coordinate entered by user
        print("Selected point: (\(userInputX), \(userInputY))")
        //Debug*/
        
        /*Debug: show boardPoint hitted check
        print("")
        print("Original status of (\(userInputX), \(userInputY)):")
        print(Board.boardPoint["(\(userInputX + 2), \(userInputY + 2))"]!)
        print("Original game Status: Total shell used: \(Game.totalFire)    Remaining enemy ships: \(Game.remainingShips)")
        //Debug*/
        //------------------------------------------ Debug ------------------------------------------^
        
        
        //Check if selected point has already been hitted
        continueFunc = Game.pointHitted(userInputX, userInputY: userInputY, boardPoint: &Board.boardPoint)
        
        
        //------------------------------------------ Debug ------------------------------------------v
        /*Debug: show boardPoint hitted check
        print("")
        print("Current status of (\(userInputX), \(userInputY)):")
        print(Board.boardPoint["(\(userInputX + 2), \(userInputY + 2))"]!)
        //Debug*/
        //------------------------------------------ Debug ------------------------------------------^
        
        
    } while continueFunc == true

    //Check if shot is on target
    Game.shipHitted(userInputX, userInputY: userInputY, shipNumber: Board.shipNumber, shipID: &Ships.shipID)
} while Game.remainingShips != 0


//Show result
print("Congratulations!! You've destroyed all enemy ships!!")
print("You fired \(Game.totalFire) shots, and \(Game.wasted) of them are wasted")
print("")
