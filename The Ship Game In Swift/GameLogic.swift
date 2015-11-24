//
//  GameLogic.swift
//  The Ship Game In Swift
//
//  Created by Harry on 15/11/24.
//  Copyright © 2015 Harry Chen. All rights reserved.
//

class GameLogic {
    var totalFire: Int, wasted: Int, remainingShips: Int
    private let boardSizeSmall: Int
    
    //Initialize class
    init (boardSizeSmall: Int, shipNumber: Int) {
        self.boardSizeSmall = boardSizeSmall
        self.remainingShips = shipNumber
        self.totalFire = 0
        self.wasted = 0
    }
    
    //Acquire user input
    func input () -> (Int, Int) {
        
        var accepted: Bool, userInput: String
        let boardSize = boardSizeSmall
        
        repeat {
            userInput = keyboardInput()
            //this is only for fun
            funloop: if userInput.characters.count == 0 {
                accepted = false
                print("Hey, you didn't enter anything...  Give me something, please")
                print("")
                break funloop
            } else {
                //check input length
                firstloop: if userInput.characters.count != 3 {
                    accepted = false
                    print("Wrong format, please try again (example: 5,4)")
                    print("")
                    break firstloop
                } else {
                    let x = Int(String(userInput[userInput.startIndex]))
                    let y = Int(String(userInput[userInput.endIndex.predecessor()]))
                    //check if input is using right characters
                    secondloop: if x == nil || y == nil {
                        accepted = false
                        print("Invaild character, please try again")
                        print("")
                        break secondloop
                    } else {
                        //check input range
                        thirdloop: if x! < 1 || x! > boardSize || y! < 1 || y! > boardSize {
                            accepted = false
                            print("Point(\(x!),\(y!)) is not on the grid, please try again")
                            print("")
                            break thirdloop
                        } else {
                            accepted = true
                        }
                    }
                }
            }
        } while accepted == false
        
        //return vaild input
        return (Int(String(userInput[userInput.startIndex]))!, Int(String(userInput[userInput.endIndex.predecessor()]))!)
    }
    
    
    //Check if selected point has already been hitted
    func pointHitted (userInputX: Int, userInputY: Int, inout boardPoint: [String: [String: Bool]]) -> Bool {
        
        var continueFunc = false
        
        //Ammunition usage increase
        totalFire += 1
        
        print("")
        print("Aye aye, Sir! Fireing at (\(userInputX), \(userInputY)) now!")
        print("")
        
        //Selected point has already been hitted
        if boardPoint["(\(userInputX + 2), \(userInputY + 2))"]!["hitted"] == true {
            wasted += 1
            continueFunc = true
            print("You just waste a shell, you have already destoryed this area before.")
            print("Total shell used: \(totalFire)   Remaining enemy ships: \(remainingShips)")
            print("")
            print("Select a new coordinate to fire at")
            
        //Selected point isn't hitted before
        } else {
            boardPoint["(\(userInputX + 2), \(userInputY + 2))"]!["hitted"] = true
        }
        return continueFunc
    }
    
    
    //Check if shot is on target
    func shipHitted (userInputX: Int, userInputY: Int, shipNumber: Int, inout shipID: Array<Dictionary<String, String>>) {
        
        var endFunc = false
        
        forLoop: for var i = 0; i < shipNumber; ++i {
            //Missed
            ifLoop: if ((shipID[i]["(\(userInputX + 2), \(userInputY + 2))"]?.isEmpty) == nil) {
                break ifLoop
                
            //Hitted
            } else {
                shipID[i]["(\(userInputX + 2), \(userInputY + 2))"] = "destoryed"
                shipID[i]["hitCount"] = "\(Int(shipID[i]["hitCount"]!)! + 1)"
                endFunc = true
                
                //Ship been sunk
                if Int(shipID[i]["hitCount"]!)! == 3 {
                    remainingShips -= 1
                    print("Yes! On target! You destory an enemy ship!")
                    print("Total shell used: \(totalFire)   Remaining enemy ships: \(remainingShips)")
                    print("")
                    if remainingShips == 0 {
                        break forLoop
                    } else {
                        print("Select a new coordinate to fire at")
                        break forLoop
                    }
                    
                //Only hitted
                } else {
                    print("Yes! On target!")
                    print("Total shell used: \(totalFire)   Remaining enemy ships: \(remainingShips)")
                    print("")
                    print("Select a new coordinate to fire at")
                    break forLoop
                }
            }
        }
        
        //Missed message
        if endFunc == false {
            print("You missed, there isn't anything there...")
            print("Total shell used: \(totalFire)   Remaining enemy ships: \(remainingShips)")
            print("")
            print("Select a new coordinate to fire at")
        }
    }
}