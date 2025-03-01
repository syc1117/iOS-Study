//: [Previous](@previous)
import Foundation
/*:
 ---
 # Defer
 ---
 */

print("\n---------- [ deferOrder 1 ] ----------\n")
/* 함수내에 return이 여러개(조건문)일때 일일이 같은 종료문구를 입력해주지 않기 위해 사용함*/
func throwError() throws {
  throw NSError(domain: "Domain", code: 1, userInfo: nil)
}
func deferExample() {
  /***************************************************
   문자열 출력 순서는??
   1) do 문에서 오류가 발생했을 때
   2) do 문에서 오류가 발생하지 않았을 때
   ***************************************************/
  defer { print("1) First defer") }
  
  do {
    print("2) Do")
    try throwError()
  } catch {
    return print("3) Error :", error)
  }
  defer { print("4) Second defer") }
  print("5) Last Print")
}
deferExample()



print("\n---------- [ deferOrder 2 ] ----------\n")

func deferOrder() {
  print("start")
  defer { print("defer1") }
  print("center")
  defer { print("defer2") }
  defer { print("defer3") }
  print("end")
}
deferOrder()



print("\n---------- [ defer within while loop ] ----------\n")

func sumOddNumbersFromOneToHundred() {
  var sum = 0
  var i = 1
  while i <= 100 {
    defer { i += 1 }
    if i % 2 == 0 { continue }
    sum += i
  }
  print(sum)
}
sumOddNumbersFromOneToHundred()



//: [Next](@next)
