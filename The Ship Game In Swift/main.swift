//  main.swift
//  The Ship Game In Swift
//
//  Created by Harry on 15/11/19.
//  Copyright © 2015 Harry Chen. All rights reserved.
//

//The Ship Game starts here

//Setup gameboard
let Board = GameBoard()
print("")
print("The gameboard size is \(Board.boardSizeSmall)x\(Board.boardSizeSmall), and the total ship number is \(Board.shipNumber).")
print("The game begings now!")


/*Degug: show initial gameboard
for x in 1...Board.boardSizeBig {
    for y in 1...Board.boardSizeBig{
        print("(\(x),\(y)) Status")
        print(Board.boardPoint["(\(x), \(y))"]!)
        print("")
    }
}
Debug*/


//Setup ship locations
let Ships = Ship.init(shipNumber: Board.shipNumber, boardSizeSmall: Board.boardSizeSmall, boardPoint: Board.boardPoint)

//Make correction to gameboard
Board.boardPoint = Ships.boardPointOut


//Debug: show finished gameboard
print("")
print("Total points: \(Board.boardPoint.count). Points for play: \(Board.boardSizeSmall * Board.boardSizeSmall).")
print("")
for x in 1...Board.boardSizeBig {
    for y in 1...Board.boardSizeBig {
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


