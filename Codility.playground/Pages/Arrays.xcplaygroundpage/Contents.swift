//: [Previous](@previous)

import Foundation

//: ---
//: OddOccurrencesInArray

// input : 홀수개의 숫자가 주어지는데, 하나의 숫자 빼고는 모두 쌍으로 들어옴
// 짝을 이루는 수는 제거, 짝이 안맞는것수 하나만 뱉어내기
// 첫 원소부터 시작해서 끝까지 탐색하면서 짝이 안맞으면 리턴?

// 1차시도 - 시간복잡도 O(N**2)
//public func solution(_ A : inout [Int]) -> Int {
//
//    for var i in 0..<A.count {
//        let firstElement = A.first!
//        A.remove(at: A.firstIndex(of: firstElement)!)
//        if let idx = A.firstIndex(of: firstElement) {
//            A.remove(at: idx)
//            i = 0
//        } else {
//            return firstElement
//        }
//    }
//    return 0
//}

// 2차시도 - 시간복잡도 O(N) or O(N*log(N))
public func solution(_ A : inout [Int]) -> Int {
    let temp = A.sorted()
    let result = temp.enumerated().reduce(0) { ($1.0%2) != 0 ? $0+$1.1 : $0-$1.1 } // $0은 acc, $1은 current(index,element), enumerated를 통해 index를 붙일 수 있다.
    return result > 0 ? result : result * -1
}

var arr = [9,3,9,3,9,7,9]
solution(&arr)



//: ---
//: Cyclic Rotation

// 배열 오른쪽으로 이동시키기 [1,2,3,4,5] [5,1,2,3,4]
// 오른쪽 두칸 : 2 % 5 = 2
// 오른쪽 열칸 : 10 % 5 = 0
// 오른쪽 여섯칸 : 6 % 5 = 1

// N칸 이동할 때  (N % 배열의 길이) 만큼 이동시키면 됨


//func solution(_ A : inout [Int], _ K : Int)->[Int]{
//    let length = A.count
//    var result:[Int] = [Int](repeating: 0, count: length)
//
//    for i in 0..<length {
//        let num = (i+K) % length
//        result[num] = A[i]
//    }
//
//    return result
//}
//
//var arr = [1,2,3,4]
//solution(&arr, 4)


//: [Next](@next)
