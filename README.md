# README

## 프로젝트 소개

### **swift로 CLI 환경에서 연락처 관리 프로그램 구현**

- **프로젝트 공통 제약사항**
    - 코드에 느낌표(!)를 사용하지 않습니다.(Not 연산자 제외)
    - Swift API Design Guidelines 의 문서대로 코드를 작성합니다.
    - 코드에 주석을 남기지 않습니다.
    - 외부 라이브러리를 사용하지 않습니다.
    - 페어 프로그래밍을 통해 구현합니다.
    - 들여쓰기는 3번을 초과하지 않습니다.
    - 커밋은 짝꿍과 번갈아가며 남깁니다.

## 팀원소개

**Toughie**: 어려운 문제에도 굴하지 않는 강한 iOS개발자가 되고 싶습니다.

**iyeah**: 완만하더라도 꾸준히 우상향하는 iOS개발자가 되고 싶습니다.

## Key Experience

## 순서도(기획 프로토타입)
<p align="center">
<img src ="https://user-images.githubusercontent.com/99641242/210038680-932a05c5-321e-41d5-a9db-693b1512766b.png" width="528" height="264"/>
</p>


## [ Step 1 ]

### 요구사항

**사용자 입력 수신 및 검증**

- 입력받은 내용을 검증하여 사용자에게 안내문을 출력합니다.
- 사용자의 입력을 받는 동작을 구현합니다.
- 한글 자소분리 현상은 과제 수행 중 해결해야 하는 문제가 아닙니다.
- 사용자 이름 입력은 한글이 아닌, 영어로만 진행해주세요.
- 올바른 사용자 입력 형태 : [이름] / [나이] / [연락처] / [이름]/[나이]/[연락처]
- 이름: 사용자가 중간에 띄어쓰기를 하더라도 띄어쓰기를 제거합니다.
- 나이: 숫자로만 입력해야하며, 세 자리수 이하여야 합니다.
- 연락처: 중간에 - 로 구분하며, - 는 두 개 존재해야합니다. - 를 제외하고 숫자는 9자리 이상이어야 합니다.

**올바른 사용자 입력 예시**

- james / 30 / 05-343-2334
- ja mes / 30 / 013-3343-2343
- james/30/013-3432-3433

**올바르지 않은 사용자 입력 예시**

- james / 서른 / 05-343-2334
- ja mes / 30 / 01333432343
- james/30세/013 3432 3433
- james/013-3423-4432/30

### 구현과정

- 사용자 입력 받기 (readLine, if let 바인딩)
- 사용자 입력 검증 (정규표현식 enum 활용)
- 실패 시: 에러 메세지 출력(if 조건문 활용)
- 성공 시: 사용자 입력 정보 출력
- 입력받은 데이터를 Array에 저장

### 코드리뷰 및 수정

- **type PascalCase 적용**
- **런타임에러 발생 위험 발견 후 수정**
    - 배열의 요소 개수를 보장하여 인덱스값을 안전하게 조회(if문 활용)

### 구현결과
<p align="center">
<img src ="https://user-images.githubusercontent.com/99641242/210038956-d2aad542-e541-4de8-a8fa-41dac3e26520.png" width="528" height="264"/>
</p>


### Step 1 Keyword

- [Swift API Design Guidelines] Naming
- guard 문 사용을 통한 Early-Exit
- struct, enum의 활용
- 정규표현식 검증, 조건문(if)활용

## [ Step 2 ]

### 요구사항

**사용자 메뉴 표기 구현**

- 사용자에게 동작을 선택할 메뉴 표기
- 1, 2, 3, x 외의 입력을 받으면 잘못된 입력을 알리고 다시 메뉴 출력
- 연락처 추가 기능 구현
- 종료 기능 구현

### 구현과정

- **앱이 실행중인지 확인하는 변수 isAppRunning 선언**
    - Bool 타입으로 초기값 true를 할당
- **앱이 실행되는 동안 반복되는 while문이 포함된 startApp 함수 생성(메뉴 입력)**
    - while문 조건에 isAppRunning을 넣어 실행되는 동안 반복되도록 구현
- **연락처 추가하는 함수 addContact 생성(메뉴: 1)**
    - STEP 1에서 구현했던 함수들을 addContact로 묶음
- **앱을 종료하는 함수 endApp 생성(메뉴: x)**
    - isAppRunnig에 false를 할당하여 while문을 중단하고 프로그램을 종료함
- **콘솔창에서 입력 값이 줄바꿈되지 않도록 수정**
    - print 함수에 terminator: "" 추가

### 코드리뷰 및 수정

- **스타일, 컨벤션 수정, 개행 통일화 → for 코드 가독성 증가**
    - 변수는 변수끼리, 함수는 함수끼리 위치하도록 수정
- **불필요한 코드 삭제**
    - if else 구문에서 print()뒤 return 삭제
- **switch - case 구문에서 enum타입을 활용하는 방법 고민**
    - switch - case 구문은 default 값이 필수
    - 케이스가 많아졌을 때 코드만 보고 바로 이해가 어려울 수 있음 (가독성 문제)
    - BUT, 현 프로젝트에서는 default값이 필요하고 케이스가 적어 가독성 문제도 없다고 판단하여 적용하지는 않았음.

### 구현결과
<p align="center">
<img src ="https://user-images.githubusercontent.com/99641242/210038727-bb9fc191-5c9a-45ba-b70a-74e4ba4478be.png" width="528" height="264"/>
</p>
<!-- 
![image](https://user-images.githubusercontent.com/99641242/210038727-bb9fc191-5c9a-45ba-b70a-74e4ba4478be.png) -->

### Step 2 Keyword

- function
- while
- Bool
- switch - case
- if - else
- Code Convention

## [ Step 3 ]

### 요구사항

**목록/검색 기능 구현**

- 목록은 이름순으로 출력합니다.
- 검색 결과의 출력 순서는 입력받았던 순서와 무관합니다.

### 구현과정

- **2번 메뉴인 연락처 목록보기를 위한 함수 구현**
    - sorted 메소드를 활용해 Array 정렬
    - forEach 고차함수를 활용
- **3번 메뉴인 연락처 검색을 위한 함수 구현**
    - 입력값(찾을 이름)을 받은 후 guard let 바인딩, 빈문자열 체크
    - filter 고차함수를 활용해 입력값과 동일한 이름이 있는지 확인
    - 동일한 이름이 있으면 이름을 오름차순으로 정렬 후 정보 출력
    - 동일한 이름이 없다면 에러메세지 출력

### 코드리뷰 및 수정

- **정렬 과정에서 ( .sorted(by: { } )를 활용했는데 이름을 오름차순으로 정렬 후 이름이 같다면, 나이를 오름차순으로 정렬하는 기능을 구현하고 싶었으나, 해결하지 못함**
<p align="center">
<img src ="https://user-images.githubusercontent.com/99641242/210039147-fcb8ba01-4992-4a1f-81f1-5d87dc1a6814.png" width="726" height="198"/>
</p>

위 코드같은 경우는 이름으로 정렬하고 다시 나이로 정렬해서 이름 정렬이 훼손되는 문제 있음.

nameFilterd.sorted(by: { $[0.name](http://0.name/) < $[1.name](http://1.name/) }, { $0.age < $1.age } 등으로 시도했으나 에러 발생.

동시에 2가지 이상의 조건으로 정렬하는 코드는?

- **코드 테스트 중 문제점 발견**

```swift
1. 연락처 추가 iyeah / 30 / 010-1111-1111 (올바른 입력)
1. 연락처 추가 tougie / 20 / 010-2222-22222 (올바르지 않은 입력)
-> 오류메세지만 출력돼야 하지만,
오류 메세지 출력 후
입력한 정보는 20세 Tougie(010-1111-1111)로 추가 출력되는 문제점 파악됨. 
```

이는 기존에 구현해 두었던 함수들을 나열식으로 실행한 것에서 기인한 문제라고 생각되어

(1 ~ 3번 함수가 있다면 1 ~ 3번 모두 유기적으로 연결되어 있는데 2번에서 문제가 생겨도 3번이 그대로 실행됨)

이를 해결하기 위해 각 함수의 내부에서(1번함수) 다음 함수(2번함수)를 실행하는 형태로 변경함.

함수 안에서 다른 함수를 실행하는(꼬리에 꼬리를 무는) 형태가 바람직 한 것인지, 문제점 등은 없는지?

### 구현결과
<p align="center">
<img src ="https://user-images.githubusercontent.com/99641242/210039210-37eb4e2b-dc82-4a90-bf2b-6c98e3a0a873.png" width="528" height="277"/>
</p>


### Step 3 Keyword

- higherorder-Funcion
    - foreach
    - filter
- sorted method

## 최종 작동 결과
<p align="center">
<img src ="https://user-images.githubusercontent.com/99641242/210039283-9e2a7728-a6c6-49f3-9f18-c5ba26b3d630.png" width="535" height="565"/>
</p>
