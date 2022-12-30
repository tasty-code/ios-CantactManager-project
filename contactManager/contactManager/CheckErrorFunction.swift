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

func checkPhoneNumError(num: String) -> Bool {
    guard validateInputByHyphenNum(input: num), num.components(separatedBy: ["-"]).joined().count >= 9 else {
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
