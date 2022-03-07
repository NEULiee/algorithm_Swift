//
//  main.swift
//  algorithm
//
//  Created by 하늘이 on 2022/02/17.
//

import Foundation

// 1, 2, 3, 4, 5 -> Int 배열로 변환하기
 
let intArr = readLine()!.split(separator: " ").map { Int($0)! }
print(intArr[0])



// 1, 2, 3, 4, 5 -> String 배열로 변환하기

let stringArr = readLine()!.split(separator: " ")
print(stringArr)
 
 // closure 방식의 split
let stringArr2 = readLine()!.split { $0 == " " }
 



// 12345 -> Int 배열로 반환하기, Array(readLine())이 배열에 반환하는 값은 Character 이다.
//          따라서 String으로 변환 후 Int로 바꿔주기
//          주의!! Character은 Int로 바로 변환할 수 없다.
 
let intArr2 = Array(readLine()!).map { Int(String($0))! }
print(intArr2)



/* Swift의 자료구조 3대장?
    
 Array, Set, Dictionary
 Heap, Stack, Queue를 지원하지않음...
*/


/* 고차함수 연습
 
 reversed(), sort(), sorted(), enumerated(), reduce(into:), map(), compactMap(),
 split(separator:), components(separatedBy:)
*/

// 크기가 정해진 배열

var threeDoubles = [Int](repeating: 0, count: 3)        // [0, 0, 0]
var threeDoubles2 = Array(repeating: 0, count: 3)       // [0, 0, 0]
var threeDoubles4 = [String](repeating: "A", count: 3)  // ["A", "A", "A"]
 


// 배열에 값 추가
 
var a: [Int] = [1, 2, 3, 4]
a.append(5)
a += [6, 7, 8]
a.append(contentsOf: stride(from: 5, to: 10, by: 1))        // 5~9
a.append(contentsOf: stride(from: 5, through: 10, by: 1))   // 5~10



// 크기가 정해진 이차원 배열

// var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: 5), count: 3)
var arr2 = [[Int]](repeating: Array(repeating: 0, count: 5), count: 3)
var arr3 = [[String]](repeating: Array(repeating: "A", count: 5), count: 3)



// 배열 특정 범위 꺼내기
 
var array: [Int] = [1, 5, 2, 6, 3, 7, 4]
print(array[0...2])


// 배열 indices 로 접근

let s = "hello!"
for index in s.indices {
    print("\(s[index])", terminator: "")
}



/* firstIndex 활용
 
let greeting = "Hello, world!"
let index = greeting.firstIndex(of: ",")!
let beginning = greeting[..<index]
// beginning is "Hello"
print(beginning)

// Convert the result to a String for long-term storage.
let newString = String(beginning)
print(newString)
*/


/* 배열 명령어 */

var arr = [1,2,3,4,5]
 
arr = [] //[]
// arr is now an empty array, but is still of type [Int]
 
arr = [1,2,3,4,5] // [1,2,3,4,5]
 
arr.append(6) // [1,2,3,4,5,6]
// arr now contains 1 value of type Int
 
// 인덱스로 원소 확인
print(arr[2]) // 3
 
// 원소로 인덱스 확인 (옵셔널, 값이 없으면 오류)
arr.firstIndex(of: 3)! // 2
 
// 인덱스로 원소 지우기
arr.remove(at: 2) // [1,2,4,5,6]
 
// 맨 뒤 원소를 지우고 return (옵셔널이 아님, 배열이 비어있으면 에러)
arr.removeLast() // [1,2,4,5]
 
// 특정 인덱스에 원소 넣기
arr.insert(3, at: 2) // [1,2,3,4,5]
 
// 특정 원소 있는지 체크 bool type
arr.contains(3) // true
 
// 순서 반전
arr.reverse() // [5,4,3,2,1]
 
// 첫 원소를 지우고 return (옵셔널이 아님, 배열이 비어있으면 에러)
arr.removeFirst() // [4,3,2,1]
 
// 첫 원소 return (옵셔널, 값이 없으면 오류)
arr.first! // 4
 
// 마지막 원소 지우고 return (옵셔널, 배열이 비어있으면 return nil)
arr.popLast()!
 
// 마지막 원소 return (옵셔널)
arr.last!
 
// 원소의 최대값, 최소값 (옵셔널)
var min = arr.min()! // 1
var max = arr.max()! // 5
 
// 모든 원소 지우기
arr.removeAll()
 
// 조건을 만족하는 모든 원소 지우기
arr.removeAll(where: {$0 % 2 == 0})
//arr.removeAll{$0 % 2 == 0} // 위 코드 함축
 
// 원소 스왑
arr.swapAt(1, 2)


/* 문자열 연결 */
//let str = ["str", "ing", "!"]
//var string = str.joined() // "string!"
//string = str.joined(separator: " ") // str ing !
//string = str.joined(separator: ", ") // str, ing, !
//string = str.joined(separator: "a") // strainga!
 
/* 알파벳 소문자 대문자간 변환 */
//var str = "string"
//str = str.capitalized  // 첫번째만 대문자로 변경 "Abcdef" import Foundation 필수
//str = str.uppercased() // 전체 대문자로 변경 "ABCDEF"
//str = str.lowercased() // 전체 소문자로 변경 "abcdef

/* 문자열 치환 */
//var str = "asap"
//var str2 = str.replacingOccurrences(of: "a", with: "b")
//print(str)  // 원본에 영향 없음
//print(str2) // bbcdef

/* 문자열 인덱스 명령어 정리 */
//// 문자열 원소 접근
//var str = "as soon as posible"
////str[0] // 직접 접근 불가능, String 인덱스로 접근가능
//str[str.startIndex] // "a" 시작 원소
//let secondIndex = str.index(after: str.startIndex) // 2번째 원소
//let second = str[secondIndex]
//let endIndex = str.index(before: str.endIndex) // 마지막 원소
//
//// n번째 문자 가져오기 n == 3
//var index = str.index(str.startIndex, offsetBy: 3 - 1)
//str[index] // "c"
//
//// 일정 범위의 문자열만 가져오기
//let sub = str[str.startIndex...index] // "abc"
//
//// 특정 character replace
//str.replacingOccurrences(of:" ", with:"+") // import Foundation 필수
//
//// 특정 원소 값으로 인덱스 찾기 (옵셔널 값) 해당하는 원소값이 없으면 에러
//str.firstIndex(of: "n")!
//
//// subString 구하는 법 특정 원소 첫 return 까지
//let substring = str[str.startIndex...str.firstIndex(of: "n")!]

/* 딕셔너리 */
var dic: [Int:String] = [:]
//var dic = [Int:String]()
//var dic = [1:"a", 2:"b", 3:"c"]
 
var aDic: [String: Int] = ["Alex": 31, "Paul": 39]
//var aDic: Dictionary<String, Int> = ["Alex": 31, "Paul": 39] // 같은 표현
 
dic.updateValue("d", forKey: 4) // key가 없으면 nil
dic[4] = "e"                    // key가 없으면 추가
print(dic)
 
aDic["Paul"] = 50     // 값. 변경
aDic["Chan"] = 20     // 값 추가
 
for (key, value) in dic {
      print(key)            // 1,2,3
      print(value)          // a,b,c
} // Dictionary는 순서가 없음
 
dic.removeValue(forKey: 4) // 해당 키값 삭제
dic.removeAll() // 모든 키값 삭제
// Key를 바꿔야하는 경우 삭제 후 추가 해줘야 한다.
 
var sort = dic.sorted(by: { $0.key < $1.key })
//var sort = dic.sorted(by: { $0.value < $1.value })
