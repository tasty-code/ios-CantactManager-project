# TeamAL Contact Manager `incomplete`

## 최종구현 요구사항

## ⚠️ 제약사항

- 코드에 느낌표(!)를 사용하지 않습니다.
- Swift API Design Guidelines 의 문서대로 코드를 작성합니다.
- 코드에 주석을 남기지 않습니다.
- 외부 라이브러리를 사용하지 않습니다.
- 들여쓰기는 3번을 초과하지 않습니다.

## 프로그램 ERD
![ContactManager_ERD](https://user-images.githubusercontent.com/29590768/210161074-d154f732-fb49-4ea9-82f4-62690769ccba.png)


## 순서도
![ContactManager_flowChart](https://user-images.githubusercontent.com/29590768/210161087-a2c13c81-476f-4e56-a918-17938476ce47.png)


# 단계별 구현 과 개선시도

### 도전 포인트

- OOP적 설계를 최대한 준수하여 코드를 개선하자
- 커밋 단위를 최대한 세세하게 나눠보자
- 리뷰해준 코드는 가능한 확실히 반영해보자

# 구현사항

`Validator`, `InputEditor`, `OutputEditor`, `DataManager` 가 각각의 역할을 수행

- ProgramManager → 프로그램의 전반적인 진행 및 Do-Catch를 이용한 오류검출
- while 를 이용한 프로그램 구동
- terminateProgram() → shouldRun 값을 변경하여 프로그램 종료

```swift
final class ProgramManager {
    
    let inputEditor = InputEditor()
    let outputEditor = OutputEditor()
    
    private var shouldRun: Bool = true
    
    func runProgram() {
        while shouldRun {
            outputEditor.printMenu()
            do {
                shouldRun = try inputEditor.selectMenu()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func terminateProgram() {
        shouldRun = false
    }
}
```

`InputEditor` 에서 유저의 입력을 받고 → 입력값 겁증후 알맞은 작업을 수행

- switch문을 이용한 분기

```swift
func selectMenu() throws -> Bool {
        let userInput = try getUserInput()
        let menu = Menu(rawValue: userInput)
        
        switch menu {
        case .add:
            addProgram()
            return true
        case .showList:
            showListProgram()
            return true
        case .search:
            searchProgram()
            return true
        case .exit:
            outputEditor.printTerminateProgram()
            return false
        default:
            throw Errors.invalidSelect
        }
    }
```

- `LocalizedError` 를 채택하고 `errorDescription` 을 switch로 정의해서 검출된 오류별로 출력이 다르도록 구현

```swift
enum Errors: LocalizedError {
    case wrongAge
    case wrongPhoneNumber
    case noUserInput
    case invalidSelect
    case defaultError
    case readFail
    
    var errorDescription: String? {
        switch self {
        case .wrongAge:
            return "입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.\n"
        case .wrongPhoneNumber:
            return "입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.\n"
        case .noUserInput:
            return "아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.\n"
        case .invalidSelect:
            return "선택이 잘못었습니다 확인 후 다시 입력해주세요.\n"
        case .defaultError:
            return "Default Error."
        case .readFail:
            return "Read Fail"
        }
    }
}
```

- `CaseIterable`을 채택하여 `enum`을 배열화 한다음 메뉴를 출력하는 `greeting` 의 재사용성을 높임

```swift
enum Menu: String, CaseIterable {
    case add = "1"
    case showList = "2"
    case search = "3"
    case exit = "x"
        
    var description: String {
        switch self {
        case .add:
            return "연락처 추가"
        case .showList:
            return "연락처 목록보기"
        case .search:
            return "연락처 검색"
        case .exit:
            return "종료"
        }
    }
    
    static var greeting: String {
        return Menu.allCases.map { "\($0.rawValue)) \($0.description) " }.joined()
    }
}
```
