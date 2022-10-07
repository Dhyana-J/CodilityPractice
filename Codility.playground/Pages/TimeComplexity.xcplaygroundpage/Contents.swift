//: [Previous](@previous)

import Foundation

//:---
//:FrogJmp
//Frog는 X에 위치, 점프 할 때마다 D씩 이동하는데 그렇게 Y에 도달하거나 Y를 제칠 때 까지 몇 번의 점프가 이루어지는지

// 1차 시도
// Time Complexity : O(1)
//func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
//    let QUOTIENT = (Y - X) / D
//    return (Y - X) % D == 0 ? QUOTIENT : QUOTIENT + 1
//}
//
//solution(10, 85, 30)


//:---
//:PermMissingElem
// one element is missing.


// N개의 다른 정수가 배열로 주어지고, 배열의 원소 범위는 [1...(N+1)]이다. ex) N이 4이면 1...4+1 사이의 범위의 정수 4개로 구성된 배열임
// input range : [0..100,000]
// Time Complexity : O(N) or O(N*log(N))

// 3차 시도
//func solution(_ A : inout [Int]) -> Int {
//    let compare = Array(1...(A.count+1))
//    var result = 0
//    if A.count == 0 {
//        return 1
//    }
//    if A.count == 1 {
//        return A.first! == 1 ? 2 : 1
//    }
//
//    for (i,e) in A.sorted().enumerated() {
//        if compare[i] != e {
//            result = compare[i]
//            break
//        }
//    }
//
//    return result == 0 ? compare.last! : result
//
//}
//var input = [1]
//
//solution(&input)


//:---
//: TapeEquilibrium
// N개의 Integer로 이루어진 배열이 주어진다. 배열을 2개로 나누고, 나눠진 각각의 배열들의 원소의 합을 구한다.
// 구해진 두 합의 차가 가장 작은 것을 찾아라.


// 4차 시도, 정확도 100% 시간복잡도 O(N) 이얏호!
func solution(_ A : inout [Int])->Int{
    let total = A.reduce(0){$0+$1}
    var diff = Int.max
    var first = 0
    var second = 0
    
    for i in 0..<A.count-1 { // index 0부터 배열의 마지막인덱스 이전까지
        first += A[i]
        second = total - first
        var temp = abs(first - second)
        diff = diff > temp ? temp : diff
    }
    
    return diff
}

var arr = [3,1,2,4,3]
solution(&arr)



// 3차 시도, 정확도 100%, O(N*N)
// spliter - 1 까지가 첫 째 파트고, spliter부터 마지막까지가 둘 째 파트임
// spliter - 1 까지는 더하고, spliter 부터 끝까지는 빼보자
// spliter는 시작+1 부터 끝-1 까지다

//func solution(_ A : inout [Int])->Int {
//    var difference = Int.max
//    var temp = 0
//
//    for spliter in 1..<A.count { // O(N)
//        for i in 0..<A.count { // O(N)
//            temp += i < spliter ? A[i] : -A[i]
//            if i == A.count-1 { // 인덱스 마지막까지 온 경우
//                temp = abs(temp)
//                difference = difference > temp ? temp : difference
//            }
//        }
//        temp = 0
//    }
//
//    return abs(difference)
//}
//var arr = [3,1,2,4,3]
//solution(&arr)




// 2차 시도
// O(N*N) Correctness 100% / O(N*N)
//public func solution(_ A : inout [Int]) -> Int {
//    var first = 0
//    var second = 0
//    var minDiff = Int.max
//
//    if A.count == 2 { return abs(A.first! - A.last!)}
//
//    for spliter in 0...A.count-2 { // 배열의 두번째 index부터 마지막-1 index까지가 splitter
//        first = 0
//        second = 0
//        for i in 0...spliter { // 잘려진 두 배열중 첫번째 배열
//            first += A[i]
//        }
//        for j in spliter+1...A.count-1 { // 잘려진 두 배열 중 두번째 배열
//            second += A[j]
//        }
//        let diff = abs(first-second)
//        if minDiff > diff {
//            minDiff = diff
//        }
//    }
//
//    return minDiff
//}


// 1차 시도 : Time Complexity O(N * N), Timeout Error, Correctness 71% 개망
//public func solution(_ A : inout [Int]) -> Int {
//    // index가 separator 역할을 하자.
//    var firstPartSum = 0
//    var secondPartSum = 0
//    var minDiff = Int.max
//    let backUp = A
//
//    for i in 1..<A.count-1 { // 마지막 요소 이전까지 i는 spliter 역할
//        A = backUp
//        A.removeSubrange(0...i-1)
//        firstPartSum = A.reduce(0){$0+$1}
//        A = backUp
//        A.removeSubrange(i...A.count-1)
//        secondPartSum = A.reduce(0){$0+$1}
//        let diff = abs(firstPartSum-secondPartSum)
//        if diff < minDiff { minDiff = diff }
//        firstPartSum = 0
//        secondPartSum = 0
//    }
//
//    return minDiff
//}


//: [Next](@next)
