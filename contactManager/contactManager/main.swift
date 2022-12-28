import Foundation

func validateInputBySlash(input: String) -> Bool {
    guard (input.filter{ $0 == "/" }.count == 2) else {
        return false
    }
    return true
}

func checkNameError(name: String) -> Bool{
    guard name.range(of: regex, options: .regularExpression) != nil else {
        print("입력한 이름정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        return false
    }
    return true
}

func checkAgeError(age: String) -> Bool{
    guard age.allSatisfy({ $0.isNumber}) else {
        print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        return false
    }
    guard let changeToInt = Int(age), changeToInt <= 1000 else {
        print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        return false
    }
    return true
}

func calculateHyphenNum(input: String) -> Bool {
    guard (input.filter { $0 == "-" }.count == 2) else {
        return false
    }
    return true
}

func checkPhoneNumError(num: String) -> Bool {
    guard calculateHyphenNum(input: num), num.components(separatedBy: ["-"]).joined().count >= 9 else {
        print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        return false
    }
        return true
}

func errorCheck(trimName: String, trimAge: String, trimNum: String) -> Bool {
    guard checkNameError(name: trimName), checkAgeError(age: trimAge), checkPhoneNumError(num: trimNum) else {
        return false
    }
    return true
}

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
