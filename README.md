- [ios-cantact-manager](#ios-cantact-manager)
  - [객체 설명](#객체-설명)
  - [순서도](#순서도)
    - [전체](#전체)
    - [연락처 추가](#연락처-추가)
    - [연락처 목록 조회](#연락처-목록-조회)
    - [연락처 검색](#연락처-검색)
  - [Step 1](#step-1)
    - [issue](#issue)
    - [Step1 실행 화면](#step1-실행-화면)
  - [Step 2](#step-2)
    - [Step2 실행 화면](#step2-실행-화면)
  - [Step 3](#step-3)
    - [핵심 구현 요구 사항](#핵심-구현-요구-사항)
    - [고민한 부분: 연락처 데이터 저장 방식 / 데이터 구조](#고민한-부분-연락처-데이터-저장-방식--데이터-구조)
    - [Dictionary Default Parameter](#dictionary-default-parameter)
    - [연락처 중복 추가 방지를 위해 `Set<UserInfo>`로 변경](#연락처-중복-추가-방지를-위해-setuserinfo로-변경)
    - [Step3 실행 화면](#step3-실행-화면)

# ios-cantact-manager

## 객체 설명

| Type        | 이름                 | 역할                                                                                                                                                                                              | 비고                       |
| ----------- | -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------- |
| enum        | StringLiteral        | 프로그램 내 상수 문자열들                                                                                                                                                                         | 나중에 .strings로 바꿔보자 |
| enum        | IOManager, PrintType | 프로그램 내 입력, 출력 담당                                                                                                                                                                       |                            |
| enum        | IOError              | 프로그램 입출력 Error 정리                                                                                                                                                                        |                            |
| final class | ContactManager       | 사용자에게 받은 입력을 1차 검증함<br>- 주어진 메뉴만 입력했는지<br>- 연락처 정보 중 '/' 형식 지켰는지<br>- 검색하려는 이름 형식 지켰는지<br>Phonebook, userInfo와 소통해 연락처 정보를 관리, 검색 |                            |
| final class | Phonebook            | 연락처를 관리하는 전화번호부<br>CM의 요청에 따라 연락처 추가, 설명 반환                                                                                                                           |                            |
| struct      | UserInfo             | 유저 정보를 담은 구조체<br>init시 입력 받은 연락처 정보의 이름, 나이, 연락처를 검증함                                                                                                             |                            |

## 순서도

### 전체

<img src="https://user-images.githubusercontent.com/107124308/209934044-63ca5042-a1e3-47b1-bfad-c9039f5bc942.png" width="700" height="700">

### 연락처 추가

<img src="https://user-images.githubusercontent.com/107124308/210035292-4bb6031c-3cd4-4103-9029-81fe8184e172.jpeg" width="600" height="600">

### 연락처 목록 조회

![연락처_목록_조회](https://user-images.githubusercontent.com/107124308/210035277-99322972-308f-46f8-a926-5e335748cdf8.jpeg)

### 연락처 검색

![연락처_검색](https://user-images.githubusercontent.com/107124308/210035299-3280cf8e-d062-4e66-8539-351441c11f13.jpeg)

## Step 1

[Step1 순서도](#연락처-추가)

### issue

- `/` 입력 검증 방법<br>
  : ContactManager.swift 의 parse() 를 통해 ‘/‘을 검증하였습니다. 저희는 기존 기준을 더 명확히 하기 위해 추가적인 제한을 더 추가했습니다.

  - “이름 / 나이 / 전화번호” : / 기준으로 앞,뒤 space
  - “이름/나이/전화번호” : / 기준으로 앞,뒤 모두 space X
  - 이 두가지의 경우에만 ‘/‘ 검증을 통과하도록 했습니다.
  - 예를들어 “이름/ 나이/ 전화번호” 이런 경우, 통과하지 못하도록 구현했습니다.

- `/` 검증 정규식

```swift
    let inputPattern = #"^.+\b(?<sep>( \/ )|(\/))(\b[^\s]+\b)\k<sep>(\b[^\s]+)$"#
```

### Step1 실행 화면

- 올바른 입력
  <img src="https://user-images.githubusercontent.com/107124308/209295250-ecb4c07f-7aed-41b9-86d6-461656394ace.png" width="" height="">
- 올바르지 않은 입력
  - 아무것도 입력되지 않은 경우
    <img src="https://user-images.githubusercontent.com/107124308/209295239-3624c327-9b5b-452a-84c1-d99e97bd85da.png" width="" height="">
  - 입력 형식이 잘못된 경우
    <img src="https://user-images.githubusercontent.com/107124308/209295259-4c84f6f2-952d-44b9-a6fa-f9d43f64093f.png" width="" height="">
  - 이름, 나이, 연락처가 잘못 입력된 경우
    <img src="https://user-images.githubusercontent.com/107124308/209295187-6748019b-feb1-4c32-9433-aa4a4acff71e.png" width="" height="">
    <img src="https://user-images.githubusercontent.com/107124308/209295196-7485b4f1-9219-4e51-8da0-1a34835f980d.png" width="" height="">
    <img src="https://user-images.githubusercontent.com/107124308/209295217-a5a1c2a6-1039-48b0-8bc7-0319f0196822.png" width="" height="">

## Step 2

[Step2 순서도](#연락처-목록-조회)

- 무한루프를 반복문(while true)에 비해 재귀함수로 구현하는 것의 이점?

1. 재귀함수
   - 함수 안에 자기 자신을 호출하는 함수와 종료를 위한 조건이 존재한다.
   - 조건에 수렴하지 않으면 무한한 함수 호출을 일으키기 때문에 스택 오버플로우를 일으킬 수 있다.
   - 반복문보다 실행 속도가 느리다.

2. 반복문
   - 특정 조건에 도달하기 전까지 일련의 명령을 반복적으로 실행한다.
   - 반복문은 무한 루프에 빠질 경우, 스택 메모리가 아닌 CPU 사이클을 반복적으로 사용한다.
   - 재귀함수보다 실행 속도가 빠르다.

3. 그럼에도 불구하고 재귀함수를 쓰는 이유는?
   - 알고리즘 자체가 재귀함수에 더 자연스러운 경우
   - 가독성이 더 좋아진다.
   - 변수 사용을 줄인다.<br>
     → 반복문보다 재귀함수를 사용했을 때, 변수의 수를 줄일 수 있다. 변수의 수를 줄이면 프로그램은 변경 가능한 상태(mutable state)를 제거하고 오류가 발생할 확률을 줄일 수 있다.

### Step2 실행 화면

1. 메뉴 - 올바른 메뉴 선택
   <img src="https://user-images.githubusercontent.com/107124308/210037642-425059a7-6090-48fd-8fa9-a17c7b283cf7.png" width="" height="">
   <img src="https://user-images.githubusercontent.com/107124308/210037642-425059a7-6090-48fd-8fa9-a17c7b283cf7.png" width="" height=""> - 바르지 못한 메뉴 선택
   <img src="https://user-images.githubusercontent.com/107124308/210037643-af33b30b-27aa-4c68-a645-23bb2b2a969f.png" width="" height=""> - 종료  
   <img src="https://user-images.githubusercontent.com/107124308/210037645-82cd0dd6-bb08-4c2c-a624-e1c883fcd302.png" width="" height="">
1. 연락처 추가
   - Step 1에서 보여드린 연락처 추가와 동일한 코드이기 때문에 연락처 검증 test case 별 동작 사진은 따로 첨부하지 않겠습니다.
   - 중복 되지 않는 연락처 추가
     <img src="https://user-images.githubusercontent.com/107124308/210038101-3bce8b3f-0bc8-43da-98e3-4ba76d70d591.png" width="" height="">
     <img src="https://user-images.githubusercontent.com/107124308/210038107-d8eeca47-792f-4281-baad-52f13b12195f.png" width="" height="">
   - 중복된 연락처 추가
     <img src="https://user-images.githubusercontent.com/107124308/210038375-a0542af1-1d91-408c-9f31-bec226bcf437.png" width="" height="">

## Step 3

[Step3 순서도](#연락처-검색)

### 핵심 구현 요구 사항

- 연락처 전체 조회
  - 출력은 이름순으로
- 연락처 검색
  - 이름으로 검색

### 고민한 부분: 연락처 데이터 저장 방식 / 데이터 구조

**Phonebook Class 생성**

```swift
// Phonebook.swift
final class Phonebook {
    private var contacts: [String:Set<UserInfo>]

    init(contacts: [String:Set<UserInfo>]) {
        self.contacts = contacts
    }

    func add(contact: UserInfo) -> Bool {
        let (inserted, _) = contacts[contact.name, default: Set<UserInfo>()].insert(contact)
        return inserted
    }
}
```

Phonebook: **class** vs struct

- Phonebook의 contacts 속성의 타입 때문에 이를 class로 구현했다. contacts는 Key/Value로 String과 Set을 사용한다. String과 Set은 struct지만, 가변 길이 데이터이기 때문에 Heap에 저장되게 된다. [Understanding Swift Performance](https://developer.apple.com/videos/play/wwdc2016/416/)를 참고한 결과,
  - Struct containing many reference가 Class에 비해 reference counting 더 높고
  - 비록 Phonebook의 property는 contacts 1개지만,
  - contacts가 dictionary이고, key, value가 String, Set으로 모두 Heap에 저장되기 때문에
  - reference counting이 Struct로 만들었을 때 더 높을 것이라고 판단했다
  - 따라서 Phonebook은 struct보다 class에 저장하는 것이 더 맞다고 생각했다!
  - 개념적으로 배운 것을 실제 코드에 적용하기에 아직 확신이 부족하여,
  - ❓우리가 잘 이해한게 맞고, 실제로 그렇게 동작하는 것인지 더 공부해서 알아봐야겠다😊

**Dictionary를 선택한 이유**

유저가 추가한 연락처를 ContactManager 객체가 어떻게 저장할지, 연락처 관리를 위한 데이터 구조를 고민했다.

- Key값을 `userInfo.name: String`, Value값이 `Set<UserInfo>`인 contacts Dictionary를 생성했다

```swift
/// key: userInfo.name
// 중복 고려 전
let contacts: [String: Array<UserInfo>]
// 중복 고려 후
let contacts: [String: Set<UserInfo>]
```

처음에는 유저의 이름이 key이고 value가 UserInfo의 Collections Type인 Dictionary를 생각했다
Collections Type 중 Dictionary를 선택한 이유는, 프로그램의 기능 중 검색 기능이 **이름으로 검색**하기 때문

- 평균 시간 복잡도
  |Collection Type| 검색 by 이름 | 추가 | 조회 |
  |--|--|--|--|
  |Dictionary_Array|O(1)|O(1)|O(NlogN)|
  |Dictionary_Set|O(1)|O(1)|O(NlogN)|

처음에는 중복을 고려하지 못해서 Dictionary_Array로 가닥을 잡고 구현했다<br>
그런데 이름, 나이, 연락처가 같은 중복 연락처인 경우에도 여과없이 Array에 추가되는 점이 바람직하지 않다고 생각했고 이를 해결하기 위해 Dictionary_Set으로 데이터 구조를 수정했다

### Dictionary Default Parameter

Dictionary 구현하며 새로 배운 Swift 문법은 subscript의 default parameter 이다<br>
key의 존재 여부를 따로 체크하지 않아도 괜찮아서 편리했다! 그런데 위험하지는 않은지, 실제 디바이스의 메모리단에서 어떻게 동작하는지는 등 아직 Dictionary, Array의 실제 구현과 컴퓨터 구조에 익숙하지 않아서 설명할 수 없는 점이 아쉬웠다. 조금 더 공부하고 고민해봐야겠다🙃

```swift
var d = ["a": []]
d["a"]?.append("haha")
print(d) // ["a": ["haha"]]

d["b"]?.append("haha") // ["a": ["haha"]]

d["b", default: []].append("bb")
print(d) // ["a": ["haha"], "b": ["bb"]]

d["b", default: []].append("bbc")
print(d) // ["a": ["haha"], "b": ["bb", "bbc"]]
```

### 연락처 중복 추가 방지를 위해 `Set<UserInfo>`로 변경

1. Set의 특성을 이용해 Value값에 연락처가 중복 저장되지 않도록 구현
   - 연락처 중 이름이 동일한 연락처는 존재할 수 있지만, 이름-나이-번호 가 모두 동일한 연락처는 중복으로 생각하고
   - `"동일한 연락처가 존재합니다. 다른 연락처를 입력해주세요."`를 출력
2. Array에서 Set으로 구현을 변경하면서,
   1. UserInfo를 Hashable 프로토콜을 채택했다
      - `static let ==` 연산과
      - `hash(into:)` 함수를 구현하고 hasher.combine()에 name, age, phone을 넣었다
   2. UserInfo를 `phonebook.contacts`에 추가할 때,
      - append() 대신 `insert()` method를 사용했다
      - `subscript(_:default:)`는 Set에서도 구현되어 있었다👍
   3. `phonebook.add(contact:)`가 반환하는 Bool을 이용해서 ContactManager는 연락처가 성공적으로 추가되었는지 체크한다

### Step3 실행 화면

- 연락처 전체 조회
  <img src="https://user-images.githubusercontent.com/107124308/210038896-e735b220-1659-407a-89e4-8b899b4a281e.png" width="" height=""> - 연락처가 저장되지 않은 경우
  <img src="https://user-images.githubusercontent.com/107124308/210049318-f9669738-7d7f-46ff-94a1-1e964ec10279.png" width="" height="">
- 연락처 검색
  <img src="https://user-images.githubusercontent.com/107124308/210038884-16f78ccc-781b-48e8-8923-3c9aacd91903.png" width="" height="">
  - 연락처에 찾는 이름이 없을떄
    <img src="https://user-images.githubusercontent.com/107124308/210049336-6973dfa4-0f0e-44b6-9aca-7ecb899b5e92.png" width="" height="">
