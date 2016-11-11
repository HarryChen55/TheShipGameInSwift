//
//  Setup Ships.swift
//  The Ship Game In Swift
//
//  Created by Harry on 15/11/20.
//  Copyright © 2015 Harry Chen. All rights reserved.
//

class Ship {
    
    var boardPointOut: [String: [String: Bool]]  //use to output board status after ships are placed
    var shipID: Array<Dictionary<String, String>>  //use to store ship locations and status
    
    fileprivate let shipNumber: Int
    fileprivate let boardSizeSmall: Int
    
    // Initialize class
    init (shipNumber: Int, boardSizeSmall: Int, boardPoint: [String: [String: Bool]]) {
        let tempID = [Dictionary<String, String>](repeating: ["hitCount": "0"], count: shipNumber)
        
        self.shipNumber = shipNumber
        self.boardSizeSmall = boardSizeSmall
        self.shipID = tempID
        self.boardPointOut = boardPoint

        setupShip(shipNumber, boardSizeSmall: boardSizeSmall, shipID: &shipID, boardPoint: &boardPointOut)
    }
    
    fileprivate func setupShip (_ shipNumber: Int, boardSizeSmall: Int, shipID: inout Array<Dictionary<String, String>>, boardPoint: inout [String: [String: Bool]]) {
        
        var tempX: Int, tempY: Int, availability = false, direction: Int, i = 0
        
        //Place all ships
        while i < shipNumber {
            //Chose the first point for a ship
            repeat {
                tempX = randomIntBetween(3, high: (boardSizeSmall + 2))
                tempY = randomIntBetween(3, high: (boardSizeSmall + 2))
            } while boardPoint["(\(tempX), \(tempY))"]!["Occupied"]! == true
            
            //Chose ship direction
            repeat {
                direction = randomIntBetween(1, high: 4)
                switch direction {
                case 1 :   //Check if left side is available
                    if boardPoint["(\(tempX - 2), \(tempY))"]!["Occupied"]! == true || boardPoint["(\(tempX - 1), \(tempY))"]!["Occupied"]! == true {
                        availability = false
                    } else {
                        availability = true
                    }
                case 2 :   //Check if upper side is available
                    if boardPoint["(\(tempX), \(tempY + 2))"]!["Occupied"]! == true || boardPoint["(\(tempX), \(tempY + 1))"]!["Occupied"]! == true {
                        availability = false
                    } else {
                        availability = true
                    }
                case 3 :   //Check if right side is available
                    if boardPoint["(\(tempX + 2), \(tempY))"]!["Occupied"]! == true || boardPoint["(\(tempX + 1), \(tempY))"]!["Occupied"]! == true {
                        availability = false
                    } else {
                        availability = true
                    }
                case 4 :    //Check if lower side is available
                    if boardPoint["(\(tempX), \(tempY - 2))"]!["Occupied"]! == true || boardPoint["(\(tempX), \(tempY - 1))"]!["Occupied"]! == true {
                        availability = false
                    } else {
                        availability = true
                    }
                default :
                    print("Direction Error")
                }
            } while availability == false
            
            //Place a ship
            switch direction {
            case 1 :   //left
                //first point
                boardPoint["(\(tempX), \(tempY))"] = ["Occupied": true, "hitted": false]
                shipID[i]["(\(tempX), \(tempY))"] = "notHit"
                //second point
                boardPoint["(\(tempX - 1), \(tempY))"] = ["Occupied": true, "hitted": false]
                shipID[i]["(\(tempX - 1), \(tempY))"] = "notHit"
                //third point
                boardPoint["(\(tempX - 2), \(tempY))"] = ["Occupied": true, "hitted": false]
                shipID[i]["(\(tempX - 2), \(tempY))"] = "notHit"
            case 2 :   //upper
                //first point
                boardPoint["(\(tempX), \(tempY))"] = ["Occupied": true, "hitted": false]
                shipID[i]["(\(tempX), \(tempY))"] = "notHit"
                //second point
                boardPoint["(\(tempX), \(tempY + 1))"] = ["Occupied": true, "hitted": false]
                shipID[i]["(\(tempX), \(tempY + 1))"] = "notHit"
                //third point
                boardPoint["(\(tempX), \(tempY + 2))"] = ["Occupied": true, "hitted": false]
                shipID[i]["(\(tempX), \(tempY + 2))"] = "notHit"
            case 3 :   //right
                //first point
                boardPoint["(\(tempX), \(tempY))"] = ["Occupied": true, "hitted": false]
                shipID[i]["(\(tempX), \(tempY))"] = "notHit"
                //second point
                boardPoint["(\(tempX + 1), \(tempY))"] = ["Occupied": true, "hitted": false]
                shipID[i]["(\(tempX + 1), \(tempY))"] = "notHit"
                //third point
                boardPoint["(\(tempX + 2), \(tempY))"] = ["Occupied": true, "hitted": false]
                shipID[i]["(\(tempX + 2), \(tempY))"] = "notHit"
            case 4 :   //lower
                //first point
                boardPoint["(\(tempX), \(tempY))"] = ["Occupied": true, "hitted": false]
                shipID[i]["(\(tempX), \(tempY))"] = "notHit"
                //second point
                boardPoint["(\(tempX), \(tempY - 1))"] = ["Occupied": true, "hitted": false]
                shipID[i]["(\(tempX), \(tempY - 1))"] = "notHit"
                //third point
                boardPoint["(\(tempX), \(tempY - 2))"] = ["Occupied": true, "hitted": false]
                shipID[i]["(\(tempX), \(tempY - 2))"] = "notHit"
            default :
                print("Ship Placing Error")
            }
            i += 1
        }
    }
}
