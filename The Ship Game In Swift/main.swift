//
//  main.swift
//  The Ship Game In Swift
//
//  Created by Harry on 15/11/19.
//  Copyright © 2015年 Harry Chen. All rights reserved.
//

import Foundation

//The Ship Game starts here

//Setup gameboard
let board = GameBoard()
print("")
print("The gameboard size is \(board.boardSizeX)x\(board.boardSizeY), and the total ship number is \(board.shipNumber).")
print("The game begings now!")

/*Debug begin
print("Total points are: \(board.boardPoint.count)")
print("")
for x in 1...board.boardSizeX {
    for y in 1...board.boardSizeY {
        print("(\(x),\(y)) Status")
        print(board.boardPoint["\(x)\(y)"]!)
        print("")
    }
}
Debug end*/

