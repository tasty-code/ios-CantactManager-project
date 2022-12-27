import Foundation

func validateSlashInput(input: String) -> Bool {
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

var repeatLoop: Bool = true
let regex = "^[A-Za-z\\s]+$"

while repeatLoop {
    print("")
    print("연락처 정보를 입력해주세요: ", terminator: "")
    
    guard let input = readLine(), input != "" else {
        print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.")
        continue
    }

    guard validateSlashInput(input: input) else {
        print("입력된 정보가 [이름]/[나이]/[전화번호] 형식인지 확인해주세요")
        continue
    }
    
    let seperatedInput = input.components(separatedBy:"/")
    
    let trimName = seperatedInput[0].trimmingCharacters(in: [" "])
    let trimAge = seperatedInput[1].trimmingCharacters(in: [" "])
    let trimNum = seperatedInput[2].trimmingCharacters(in: [" "])
    
    let zeroBlankName = trimName.components(separatedBy: [" "]).joined()
    
    guard errorCheck(trimName: trimName, trimAge: trimAge, trimNum: trimNum) else {
        continue
    }
    repeatLoop = false
    print("입력한 정보는 \(trimAge)세 \(zeroBlankName)(\(trimNum))입니다.")

}
