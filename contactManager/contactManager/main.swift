import Foundation

struct Contact : Hashable {
    let name : String
    let age : String
    let phoneNumber : String
}

enum ErrorType{
    case name
    case age
    case phoneNumber
}

enum GuideText {
   static let menu = "1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료"
   static let selectMenu = "메뉴를 선택해주세요 : "
}

func errorTextOutput(with type: ErrorType){
    let errorText: String
    switch type {
    case .name: errorText = "이름"
    case .age: errorText = "나이"
    case .phoneNumber: errorText = "연락처"
    }
    print("입력한 \(errorText)정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
}

var contacts : Set<Contact> = []

var isMenuInputError: Bool = false
let regex = "^[A-Za-z\\s]+$"

while !isMenuInputError {
    print(GuideText.menu)
    print(GuideText.selectMenu,terminator: "")
    guard let input = readLine(), input != "" else{
        continue
    }
    switch input{
    case "1":
        addContact()
    case "2":
        for contact in contacts.sorted(by: {$0.name < $1.name}) {
            print("- \(contact.name) / \(contact.age) / \(contact.phoneNumber)")
        }
        print("")
        continue
    case "3":
        print("연락처에서 찾을 이름을 입력해주세요 : ", terminator: "")
        guard let inputValue = readLine() else {
            continue
        }
        findContact(inputName: inputValue)
        continue
    case "x":
        isMenuInputError = true
        print("\n[프로그램 종료]")
    default:
        print("선택이 잘못되었습니다. 확인 후 다시 입력해주세요.\n")
        continue
    }
}
