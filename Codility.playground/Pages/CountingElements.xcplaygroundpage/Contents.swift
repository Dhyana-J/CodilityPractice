//: [Previous](@previous)


import Foundation

//:---
//:FrogRiverOne

// 3차시도, (이전까지 문제 잘못해석해서 삽질...)
// O(N), 정확도 100%

// 개구리가 강 건너편으로 건너가고싶은데, 떨어지는 나뭇잎을 밝고 가야함
// 개구리가 있는 곳은 0, 개구리가 도착하고픈 곳은 X+1임
// A배열에 초(index)별로 나뭇잎이 어디 위치에(element) 떨어지는지 주어지고,
// 개구리는 X+1 까지 가면 강을 건너는것

//public func solution(_ X : Int, _ A : inout [Int]) -> Int {
//    // write your code in Swift 4.2.1 (Linux)
//    // 나뭇잎이 1부터 X까지 다 덮을때 까지 세야함
//    var leavesArr = [Int](repeating: 0, count: X+1) // index는 잎의 위치를 의미하고, 1~X까지 필요하므로 0은 비워둬야
//
//    for i in 0..<A.count {
//        leavesArr[A[i]] += 1
//        if leavesArr.lastIndex(of: 0) == 0 { // 모든 나뭇잎이 채워졌다면, leavesArr의 첫 번째 배열만 0이다.
//            return i
//        }
//    }
//
//    return -1
//
//}
//
//var arr = [1,2,3,4,4,4,4,4,5]
//solution(5, &arr)


//:---
//: PermCheck

// 1차시도, 100%, O(N) or O(N*log(N))
//func solution(_ A : inout [Int]) -> Int {
//    let arr = A.sorted()
//    for i in 0..<arr.count {
//        if arr[i] != i+1 {
//            return 0
//        }
//    }
//    return 1
//}
//
//var arr = [1,2,3,4,5]
//solution(&arr)


//:---
//: MaxCounter
// 정수 N과 배열을 받고, N크기만큼의 카운터를 만든다.
// 배열의 요소 X가 1<=X<=N 이면 1 증가시키고, N+1<=X이면 전체 카운터를 현재 카운터에서 가장 큰 애로 세팅한다.


// 1차시도 score 66%
// O(N*M) 정확도 100%
//func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
//    var counter = [Int](repeating: 0, count: N)
//    var counterMax = 0
//
//    for e in A {
//        if 1<=e && e<=N {
//            counter[e-1] += 1
//            counterMax = counter[e-1] > counterMax ? counter[e-1] : counterMax
//        }
//        if e == N+1 {
//            counter = counter.map{_ in counterMax}
//        }
//    }
//    return counter
//}
//
//var arr = [3,4,4,6,1,4,4]
//solution(5, &arr)


// 2차시도
// 정확도 50%
// 스코어 33%
//func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
//    var counter = [Int](repeating: 0, count: N) // 계산과정 진행할 카운터 배열
//    var arrBeforeMaxCounter = [Int](repeating: 0, count: N) // X == N+1 직전의 카운터 배열 저장할 변수
//    var maxForDiff = 0 // x == N+1 직전의 최대값 저장할 변수
//    var currentMax = 0 // 계산과정중 카운터 최대값 저장할 변수
//
//
//    for i in 0..<A.count {
//        if 1 <= A[i] && A[i] <= N {
//            counter[A[i]-1] += 1 // 카운터의 N-1번째 index가 N을 의미한다
//            currentMax = counter[A[i]-1] > currentMax ? counter[A[i]-1] : currentMax // 현재 카운터 최대값 저장
//
//            if i != A.count-1 && A[i+1] == N+1{
//                // 다음 N이 N+1이면 maxCounter인데, 현재 최대값 저장하고, 카운터도 저장한 다음
//                // 현재 카운터에서 현재 최대값 빼준값을 마지막 최종계산된 카운터에서 또 빼주면 결과값이 나온다. 왜그런지는 나도 모름, 계산해보니 그런 원리가 있다.
//                maxForDiff = currentMax
//                arrBeforeMaxCounter = counter
//            }
//
//        }
//    }
//
//    arrBeforeMaxCounter = arrBeforeMaxCounter.map {$0-maxForDiff}
//
//    for i in 0..<counter.count {
//        counter[i] -= arrBeforeMaxCounter[i]
//    }
//
//    return counter
//}
//
//var arr = [3,4,4,6,1,4,4]
//solution(3, &arr)

// 3차시도 (풀이 참고)
// 100% O(N+M)
//func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
//    var counter = [Int](repeating: 0, count: N)
//    var tempMax = 0
//    var totalMax = 0
//
//    for e in A {
//        if e == N+1 {
//            totalMax = tempMax
//        } else {
//            counter[e-1] = counter[e-1] > totalMax ? counter[e-1]+1 : totalMax+1
//            tempMax = counter[e-1] > tempMax ? counter[e-1] : tempMax
//        }
//    }
//
//    for i in 0..<N {
//        counter[i] = counter[i] > totalMax ? counter[i] : totalMax
//    }
//
//    return counter
//}
//
//var arr = [3,4,4,6,1,4,4]
//solution(5, &arr)


//:---
//: Missing Integer
// 배열 A에 없는 가장 작은 자연수를 찾자

// 1차 시도 33%
//func solution(_ A : inout [Int]) -> Int {
//    let arr = Array(Set(A)).sorted() // Set으로 한번 바꾸고 다시 배열로 바꿔서 중복 제거 후 오름차순 정렬
//    var min = 1
//    if arr.last! <= 0 { // A에서 가장 큰 수가 0과 같거나 작으면 1 리턴
//        return 1
//    }
//    for i in 0..<arr.count {
//        let temp = arr[i]+1
//        if i != arr.count-1 && arr[i+1] == temp {
//            continue
//        } else {
//            min = temp
//            break
//        }
//    }
//    return min
//}
//
//var input = [-1,-3]
//solution(&input)


// 2차 시도 100%
// O(N) or O(N*log(N))
func solution(_ A : inout [Int]) -> Int {
    let arr = Array(Set(A)).sorted()
    var min = 1
    if arr.last! <= 0 {
        return 1
    }
    for e in arr {
        if e == min {
            min = e+1
        }
    }
    return min
}

var input = [1,2,3]
solution(&input)


//: [Next](@next)
