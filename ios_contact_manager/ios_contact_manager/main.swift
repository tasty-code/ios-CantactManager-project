import Foundation

struct UserInfo {
    var name: String
    var age: Int
    var phoneNumbers: [String]
}

enum RegularExpressionChecker: String {
    case nameChecker = "^[a-zA-Z]*$"
    case ageChecker = "^[0-9]{1,3}$"
    case phoneNumberChecker = "^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$"
}

var allUsersData: [UserInfo] = []

var validInput:String = ""

var transformedInput: [String] = []

var checkedName: String = ""

var checkedAge: Int = 0

var checkedPhoneNumber: String = ""


func inputNewUser() {
    print("연락처 정보를 입력해주세요 : ")
    let input = readLine()
    if let someInput = input, someInput.count > 0 {
        validInput = someInput
    }  else {
        print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.")
        return }
}

func transform(input: String) {
    let spaceRemovedInput = input.replacingOccurrences(of: " ", with: "")
    let splitedInput = spaceRemovedInput.components(separatedBy: "/")
    guard splitedInput.count == 3 else {return}
    
    transformedInput = splitedInput
}

func checkString(string: String, type: RegularExpressionChecker) -> Bool {
    let isStringChecked = string.range(of: type.rawValue,  options: .regularExpression) != nil
    return isStringChecked
}

func verifyInput(input: Array<String>) {
    if checkString(string: transformedInput[0], type: RegularExpressionChecker.nameChecker) {
        checkedName = transformedInput[0]
    }
    
    if checkString(string: transformedInput[1], type: RegularExpressionChecker.ageChecker) {
        checkedAge = Int(transformedInput[1]) ?? -1
    } else {
        print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요. ")
        return
    }
    
    if checkString(string: transformedInput[2], type: RegularExpressionChecker.phoneNumberChecker) {
        checkedPhoneNumber = transformedInput[2]
    } else {
        print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요. ")
        return
    }
}

func addNewUser() {
    if checkedAge > 0, checkedName != "", checkedPhoneNumber != "" {
        print("입력한 정보는 \(checkedAge)세 \(checkedName)(\(checkedPhoneNumber))입니다.")
        allUsersData.append(UserInfo(name: checkedName, age: checkedAge, phoneNumbers: [checkedPhoneNumber]))
    }
}

inputNewUser()
transform(input: validInput)
verifyInput(input: transformedInput)
addNewUser()