import Foundation

func calculateSlashNum(input: String) -> Bool {
    if (input.filter{ $0 == "/" }.count != 2) {
        return false
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
}
