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

var transformedInput: [String] = []

func transform(input: String) {
    let spaceRemovedInput = input.replacingOccurrences(of: " ", with: "")
    let splitedInput = spaceRemovedInput.components(separatedBy: "/")
    guard splitedInput.count == 3 else {return}
    
    transformedInput = splitedInput
}

var checkedName: String = ""
var checkedAge: Int = 0
var checkedPhoneNumber: String = ""

enum regularExpressionChecker: String {
    case nameChecker = "^[a-zA-Z]*$"
    case ageChecker = "^[0-9]{1,3}$"
    case phoneNumberChecker = "^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$"
}

func checkString(string: String, type: regularExpressionChecker) -> Bool {
    let isStringChecked = string.range(of: type.rawValue,  options: .regularExpression) != nil
    return isStringChecked
}

func verifyInput(input: Array<String>) {
    if checkString(string: transformedInput[0], type: regularExpressionChecker.nameChecker) {
        checkedName = transformedInput[0]
    }
    
    if checkString(string: transformedInput[1], type: regularExpressionChecker.ageChecker) {
        checkedAge = Int(transformedInput[1]) ?? -1
    } else {
        print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요. ")
        return
    }
    
    if checkString(string: transformedInput[2], type: regularExpressionChecker.phoneNumberChecker) {
        checkedPhoneNumber = transformedInput[2]
    } else {
        print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요. ")
        return
    }
}
