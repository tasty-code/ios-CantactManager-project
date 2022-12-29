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

var isAppRunning = true


func inputNewUser() {
    print("연락처 정보를 입력해주세요 : ", terminator: "")
    let input = readLine()
    if let someInput = input, someInput.count > 0 {
        validInput = someInput
        transform(input: validInput)
    }  else {
        print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.")
    }
}


func transform(input: String) {
    let spaceRemovedInput = input.replacingOccurrences(of: " ", with: "")
    let splitedInput = spaceRemovedInput.components(separatedBy: "/")
    if splitedInput.count == 3 {
        transformedInput = splitedInput
        verifyInput(input: transformedInput)
    } else {
        print("입력이 잘못되었습니다. 메뉴를 다시 선택해주세요")
    }
}

func checkString(string: String, type: RegularExpressionChecker) -> Bool {
    let isStringChecked = string.range(of: type.rawValue,  options: .regularExpression) != nil
    return isStringChecked
}

func verifyInput(input: Array<String>) {
    if input.count == 3 {
        guard checkString(string: transformedInput[0], type: RegularExpressionChecker.nameChecker) else { return }
        checkedName = transformedInput[0]
        
        guard checkString(string: transformedInput[1], type: RegularExpressionChecker.ageChecker) else {
            print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요. ")
            return
        }
        checkedAge = Int(transformedInput[1]) ?? -1
        
        guard checkString(string: transformedInput[2], type: RegularExpressionChecker.phoneNumberChecker) else {
            print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요. ")
            return
        }
        checkedPhoneNumber = transformedInput[2]
        addNewUser()
    }
}

func addNewUser() {
    if checkedAge > 0, checkedName != "", checkedPhoneNumber != "" {
        print("입력한 정보는 \(checkedAge)세 \(checkedName)(\(checkedPhoneNumber))입니다.")
        allUsersData.append(UserInfo(name: checkedName, age: checkedAge, phoneNumbers: [checkedPhoneNumber]))
        
    }
}

func endApp() {
    print("[프로그램 종료]")
    isAppRunning = false
}

func startApp() {
    while isAppRunning {
        print("1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료\n메뉴를 선택해주세요 : ", terminator: "")
        let inputMenu = readLine() ?? ""
        
        switch inputMenu {
        case "1": inputNewUser()
        case "2": continue
        case "3": continue
        case "x": endApp()
        default:
            print("선택이 잘못되었습니다 확인 후 다시 입력해주세요.")
        }
    }
}

startApp()
