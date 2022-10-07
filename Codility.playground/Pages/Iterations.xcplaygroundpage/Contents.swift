//: [Previous](@previous)
import Foundation
//: ---
//: Binary Gap

func solution(_ N: Int) -> Int {

    let bin = String(N,radix:2)
    var isOneAppeared = false
    var binaryGap:[Int] = [0]
    var zeroCount = 0

    for char in bin {
        if isOneAppeared == true {
            if char == "0" { zeroCount += 1 }
            else { // char == "1"
                binaryGap.append(zeroCount)
                zeroCount = 0
            }
        } else {
            if char == "1" { isOneAppeared = true }
        }
    }


    if binaryGap.max() != 0 {
        return binaryGap.max()!
    } else {
      return 0
    }

}

solution(32)

//: [Next](@next)
