# 연락처 관리 시스템
## 시스템 구조
![image](https://user-images.githubusercontent.com/67406889/210035501-9682f624-2506-477d-b861-1f8e6afd18c1.png)
　
 
## Step1. 사용자 연락처 추가
### 구현한 것
- throws, do-catch를 활용한 에러처리
- 정규식과 NSPredicate를 활용한 입력값 검증
- 입력값 공백 제거 (`components`, `map`, `replacingOccurrences`)
```Swift
let splitInput = input.components(separatedBy: "/").map { $0.replacingOccurrences(of: " ", with: "") }
```
### 개선한 점
- index out of range 사전 검증 절차 추가 (입력값이 3어절인지 guard문으로 검증)
- 매직넘버 (`splitInputCount`, `hyphenCount`) 추가를 통해 가독성 증진

　
 　

## Step2. 사용자 메뉴 표기 및 분기처리
### 구현한 것
- 조건반복문(bool타입 프로퍼티)을 활용하여 사용자의 특정 입력(`x`) 전까지 반복되도록 설정
- 메뉴 분기처리 (입력한 메뉴값에 따라 `Menu`열거형과 switch-case문을 활용하여 분기처리)
- 원시값을 갖는 열거형
```Swift
// 메뉴 정의
enum Menu: String {
    case addProfile = "1"
    case listUpProfile = "2"
    case searchProfile = "3"
    case stop = "x"
}

// 메뉴 분기처리
mutating func pipeInMenu(_ input: String) {
    guard let input = Menu(rawValue: input) else {
        OutputManager.print(text: .invalidMenu)
        return
    }
    switch input {
    case .addProfile:
        addProfile()
    case .listUpProfile:
        listUpProfile()
    case .searchProfile:
        searchProfile()
    case .stop:
        stop()
    }
}
```
- OutputManager 분리 구현 (InputManager와 OutputManager를 ContactManageSystem의 하위객체로 지정하여 입력과 출력 분리)

### 개선한 점
- OutputManager
   - as-is) 문구를 저장하는 private프로퍼티와 이들 각각을 출력하기 위한 메서드로 구성
   - to-be) `customStringConvertible` 채택으로, 타입 메서드 하나로 각 문구(case별 원시값)를 상황에 맞게 변환하여 출력할 수 있도록 함
- 열거형의 실패가능생성자
   - as-is) pipeInMenu에서 enum Menu를 분기처리하는 과정에서, rawValue를 통한 열거형 생성자는 실패 가능이므로 nil일 경우를 위해 default구문을 추가하였으며, 
   - to-be) 피드백 이후 옵셔널바인딩을 통해 nil발생 가능성을 제거
```Swift
// 아래 input은 `Menu?`타입
let input = Menu(rawValue: "input")

// 아래 input은 `Menu`
guard let input = Menu(rawValue: input) else {
    OutputManager.print(text: .invalidMenu)
    return
}
```
　
 　

## Step3. 연락처 목록보기, 연락처 검색기능 추가
### 구현한 것
- Set(ProfileData)에 sorted함수를 통해 값을 정렬하고, forEach함수를 통해 데이터별 출력문구 생성
```Swift
static func print(profiles: Set<Profile>) {
    profiles.sorted(by: { $0.name < $1.name }).forEach {
        Swift.print("- \($0.name) / \($0.age) / \($0.tel)")
    }
}
```
- Set(profiles) 요소 중 사용자 입력값과 name이 동일한 Profile인스턴스 찾기
```Swift
private func searchProfile() {
    do {
        OutputManager.print(text: .inputProfileName)
        let targetName = try inputManager.targetInput()
        let filteredProfileData = profiles.filter { $0.name == targetName }
        guard !filteredProfileData.isEmpty else {
            OutputManager.printNoMatchingData(name: targetName)
            return
        }
        OutputManager.print(profiles: filteredProfileData)
    } catch {
        OutputManager.print(text: .invalidInput)
    }
}
```

### 개선한 점
- OutputManager를 열거형 → nested enum을 가진 구조체로 변경
- print 함수 오버로딩
```Swift
static func print(profile: Profile) {
    Swift.print("입력한 정보는 \(profile.age)세 \(profile.name)(\(profile.tel))입니다.")
}
```


