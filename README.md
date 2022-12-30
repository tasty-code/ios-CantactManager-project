- [ios-cantact-manager](#ios-cantact-manager)
  - [객체 설명](#객체-설명)
  - [순서도](#순서도)
    - [전체](#전체)
    - [연락처 추가](#연락처-추가)
    - [연락처 목록 조회](#연락처-목록-조회)
    - [연락처 검색](#연락처-검색)
  - [Step 1](#step-1)
    - [issue](#issue)
    - [실행 동작](#실행-동작)
  - [Step 2](#step-2)
  - [Step 3](#step-3)

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


### 실행 동작

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
  - 변수 사용을 줄인다.
    → 반복문보다 재귀함수를 사용했을 때, 변수의 수를 줄일 수 있다. 변수의 수를 줄이면 프로그램은 변경 가능한 상태(mutable state)를 제거하고 오류가 발생할 확률을 줄일 수 있다.


## Step 3

[Step3 순서도](#연락처-검색)
