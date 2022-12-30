# 📞 연락처 관리 프로그램

# 🏛️ 프로젝트 구조
## 'main.swift'

### - `struct` - Contact
    -  name, age, phoneNumber 저장 프로퍼티 및 description 연산 프로퍼티를 갖는 struct


### - `enum` - ErrorType
    - name, age, phoneNumber 입력시 생기는 에러를 담는 enum


### - `enum` - GuideText
    - 반복되는 출력문을 타입 프로퍼티로 담고 있는 enum


### - `enum` - MenuType
    - '1','2','3','x'를 옵션을 담는 enum

### - `struct` - Validation
    -  `func` -`validateInputBySlash(input:)`
        -  Slash 갯수를 통하여 입력값을 검증하는 함수
    -  `func` -`validateInputByHyphenNum(input:)`
        - Hyphen 갯수를 통하여 입력값을 검증하는 함수

### - `func` - `errorTextOutput(with type:)`
    -  각각의 에러 타입에 따라서 다른 출력문을 출력하는 함수


### - `while`문
    -  메뉴 선택시 알맞은 입력값이 들어올 때까지 반복적으로 입력값을 받는다.

## 'AddContactFunction.swift'
### - `func` - `addContact()`
    -  while문을 통하여 알맞은 연락처 정보값을 입력받을 때까지 반복적으로 입력값을 받는다. 


## 'CheckErrorFunction.swift'
### - `func` - `checkNameError(name: String) -> Bool`
    - 정규식을 통하여 입력받은 값 검증
### - `func` - `checkAgeError(age: String) -> Bool`
    - 입력 받은 나이값이 숫자인지, 1000보다 작은 지를 검증
### - `func` - `checkPhoneNumError(num: String) -> Bool`
    - 입력 받은 전화번호 값을 errorTextOutput 함수를 통하여 검증
### - `func` - `errorCheck(trimName: String, trimAge: String, trimNum: String) -> Bool`
    - 각각의 에러함수를 호출하는 함수 

## 'findContact.swift'
### - `func` - `findContact(inputName : String)`
### - 연락처에 입력받은 이름이 존재하는 검증하는 함수


# 🚫 프로젝트 제약사항

- 코드에 느낌표(!)를 사용하지 않습니다.
- Swift API Design Guidelines 의 문서대로 코드를 작성합니다.
- 코드에 주석을 남기지 않습니다.
- 외부 라이브러리를 사용하지 않습니다.
- 짝 프로그래밍을 통해 구현합니다.
- 들여쓰기는 3번을 초과하지 않습니다.
- 커밋은 짝꿍과 번갈아가며 남깁니다.

# 🍦 프로젝트 요구사항
  ## - [기본 구성]
    1) 사용자의 입력을 받는 동작 구현
    2) 출력 내용과 입력방법은 예시와 똑같이 따릅니다.
    3) 사용자에게 동작을 선택할 메뉴를 표기합니다.
    4) 1, 2, 3, x 외의 입력을 받으면 잘못된 입력을 알리고 다시 메뉴를 출력합니다.
    
  ## - [연락처 추가]
    1) 입력받은 문자열을 검증합니다
    2) 입력받은 내용을 검증하여 사용자에게 안내문을 출력합니다
    
  ## - [연락처 목록 보기]
    1) 목록은 이름순으로 출력합니다.
    
  ## - [연락처 검색]
    1) 이름을 통해 연락처 검색
    2) 검색 결과의 출력 순서는 입력받았던 순서와 무관합니다. 

# 🎡 기능 구현
  ## - [기본 구성]
    1) `while`, `switch case`문을 통해 종료하기 전까지 프로그램이 유지되도록 함
  
  ## - [연락처 추가]
    1) addContact 함수를 통해 기능 구현
    2) while문으로 정상적인 데이터가 입력될 때 까지 입력 상황 반복
    3) nil과 공백에 대한 예외사항 처리
    4) validateInputBySlash를 통해 제대로 된 형식이 입력되었는지 검증
    5) 모든 예외사항을 통과하였다면 형식을 기준으로 입력값을 1차 분리
    6) 1차 분리된 값에서 앞뒤 공백을 제거하고 각 연락처 구조체 항목에 저장
    7) errorCheck 함수를 통해 각 항목별 제약사항을 준수하는지 검증
    8) 검증에 이상이 없다면 화면에 출력 후 해당 연락처 인스턴스를 컬렉션에 저장
  
  ## - [연락처 목록 보기]
    1) 만들어진 연락처 인스턴스로 for in 사용
    2) for in 구성시 sorted(by: )를 통해 인스턴스를 이름순 정렬
    3) 각 인스턴스의 description으로 이름, 나이, 연락처 출력
  
  ## - [연락처 검색]
    1) findContact 함수 사용
    2) 입력한 이름이 연락처에 있다면 출력하고 correctCount를 +1 처리
    3) 연락처에 없다면 continue로 반복
    4) 최종적으로 correctCount가 0이라면 일치하는 것이 없으므로 오류 메시지 출력
  
# 📚 학습내용
### 1. 함수, 변수, 상수, 클래스, 구조체 네이밍 체크
- Swift API Design Guide에 맞추어 naming하는 법을 학습하였다.

### 2. 기능에 따라서 swift 파일을 만들어 나누는 법 학습
- ‘CheckErrorFunction.swift’, ‘AddContactFunction.swift’등등 기능에 따라서 swift 파일을 따로 만들어 나누는 법을 학습하였다.

### 3. struct와 enum의 활용
- struct,enum를 통하여 기능을 나누고 더 보기쉽게 기능을 구분하는 법을 학습하였다. 

### 4. guard문의 활용
- 기존의 if를 활용한 조건문을 guard를 활용하여 가독성을 높이는 법 및 early exit에대한 개념을 공부하였다.

### 5. static의 활용
- 프로젝트를 통하여 타입 메소드와 타입 프로퍼티의 활용법을 학습하였다.

### 6. Git 사용법
- git을 통해 협업함으로써 push/pull/add/commit/stash 등 기본적인 사용에 대해 조금 더 알 수 있었다.

### 7. 연산 프로퍼티 활용
- 연락처 구조체 내 description 항목을 통해 연산 프로퍼티를 사용해봄으로써 이를 활용하는 법을 학습하였다.
