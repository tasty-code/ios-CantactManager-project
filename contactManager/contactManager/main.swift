import Foundation

func calculateSlashNum(input: String) -> Bool {
    if (input.filter{ $0 == "/" }.count != 2) {
        return false
    }
    return true
}

func checkNameError(name: String) -> Bool{
    if name.range(of: regex, options: .regularExpression) == nil {
        print("이름이 잘못되었습니다.")
        print(name)
        return false
    }else {
        return true
    }
}

func checkAgeError(age: String) -> Bool{
    if !age.allSatisfy({ $0.isNumber}){
        print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        return false
    } else if let changeToInt = Int(age) {
        if changeToInt >= 1000 {
            print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
            print("숫자는 세자리수 이하로 입력해주세요.")
            return false
        }
    }
    return true
}

var isError: Bool = true
let regex = "^[A-Za-z\\s]+$"

print("")
print("연락처 정보를 입력해주세요: ")

if let input = readLine() {
    if !(calculateSlashNum(input: input)) {
        print("입력된 정보가 [이름]/[나이]/[전화번호] 형식인지 확인해주세요")
    }
    
    let add = input.components(separatedBy:"/")

    let trimName = add[0].trimmingCharacters(in: [" "])
    let trimAge = add[1].trimmingCharacters(in: [" "])
    let trimNum = add[2].trimmingCharacters(in: [" "])
    
    let zeroBlankName = trimName.components(separatedBy: [" "]).joined()

}
