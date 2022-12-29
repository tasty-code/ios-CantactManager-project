import Foundation

struct Contact : Hashable {
    let name : String
    let age : String
    let phoneNumber : String
}

var ContactSet : Set<Contact> = []

var isMenuInputError: Bool = false
let regex = "^[A-Za-z\\s]+$"

while !isMenuInputError {
    print("1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료")
    print("메뉴를 선택해주세요 : ",terminator: "")
    guard let input = readLine(), input != "" else{
        continue
    }
    switch input{
    case "1":
        addContact()
    case "2":
        continue
    case "3":
        continue
    case "x":
        isMenuInputError = true
    default:
        print("선택이 잘못되었습니다. 확인 후 다시 입력해주세요.\n")
        continue
    }
}
