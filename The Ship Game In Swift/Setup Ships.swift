//  Setup Ships.swift
//  The Ship Game In Swift
//
//  Created by Harry on 15/11/20.
//  Copyright © 2015 Harry Chen. All rights reserved.
//

import Foundation

func setupShips (boardSize boardSize: Int, shipNumber shipNumber: Int, inout boardPoint boardPoint: [String: [String: Bool]]) -> Array {
    
    var tempX: Int, tempY: Int, tempA: Int, shipLocation = [String?]()
    
    //Placing ships
    //Placing the first point for a ship
    var shipID = 0
    tempX = randomIntBetween(1, high: boardSize)
    tempY = randomIntBetween(1, high: boardSize)
    boardPoint["\(tempX)\(tempY)"]!["Occupied"] = true
    shipLocation[shipID] = "\(tempX)\(tempY)"
    
    //Placing the second and the third point for a ship
    let i = randomIntBetween(1, high: 2)
    //Fix X, change Y
    if i == 1 {
        tempA = tempY
        //upper side
        if tempA >= (boardSize - 1) {
            tempA = randomIntBetween((tempA - 2), high: (tempA - 1))
        //lower side
        } else if tempA <= 2 {
            tempA = randomIntBetween((tempA + 1), high: (tempA + 2))
        //in the middle
        } else {
            repeat {
                tempA = randomIntBetween((tempA - 2), high: (tempA + 2))
            } while tempA == tempY
        }
        //the second point
        boardPoint["\(tempX)\(tempA)"]!["Occupied"] = true
        shipLocation[shipID] = shipLocation[shipID]! + "\(tempX)\(tempA)"
        //the third point
        if tempA > tempY {
            boardPoint["\(tempX)\(tempA + 1)"]!["Occupied"] = true
            shipLocation[shipID] = shipLocation[shipID]! + "\(tempX)\(tempA + 1)"
        } else {
            boardPoint["\(tempX)\(tempA - 1)"]!["Occupied"] = true
            shipLocation[shipID] = shipLocation[shipID]! + "\(tempX)\(tempA - 1)"
        }
        
    //Fix Y, Change X
    } else if i == 2 {
        tempA = tempX
        //right side
        if tempA >= (boardSize - 1) {
            tempA = randomIntBetween((tempA - 2), high: (tempA - 1))
        //left side
        } else if tempA <= 2 {
            tempA = randomIntBetween((tempA + 1), high: (tempA + 2))
        //in the middle
        } else {
            repeat {
                tempA = randomIntBetween((tempA - 2), high: (tempA + 2))
            } while tempA == tempX
        }
        //the second point
        boardPoint["\(tempA)\(tempY)"]!["Occupied"] = true
        shipLocation[shipID] = shipLocation[shipID]! + "\(tempA)\(tempY)"
        //the third point
        if tempA > tempX {
            boardPoint["\(tempA + 1)\(tempY)"]!["Occupied"] = true
            shipLocation[shipID] = shipLocation[shipID]! + "\(tempA)\(tempY)"
        } else {
            boardPoint["\(tempA - 1)\(tempY)"]!["Occupied"] = true
            shipLocation[shipID] = shipLocation[shipID]! + "\(tempA)\(tempY)"
        }
    }
}