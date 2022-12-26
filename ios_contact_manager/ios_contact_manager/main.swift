import Foundation

struct UserInfo {
    var name: String
    var age: Int
    var phoneNumbers: [String]
}

var allUsersData: [UserInfo] = []

var validInput:String = ""

func inputNewUser() {
    print("연락처 정보를 입력해주세요 : ")
    let input = readLine()
    if let someInput = input, someInput.count > 0 {
        validInput = someInput
    }  else {
        print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.")
        return }
}
