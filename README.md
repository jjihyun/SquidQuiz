# SquidQuiz

#### 팀원 : 강혜정, 노일기, 오현종, 최지현, 황지영

## 수행기간
2021년 10월 11일 ~ 2021년 11월 23일

## Contetns

1. [개요](#개요)
2. [설계의 주안점](#설계의-주안점)
3. [사용기술 및 개발환경](#사용기술-및-개발환경)
4. [프로젝트 기능 구현 및 역할](#프로젝트-기능-구현-및-역할)
5. [주요기능](#주요-기능)
6. [참고](#참고)
------------
## 개요
기부라는것이 평소 어렵게 느껴지는 모든분들에 퀴즈라는 게임을 통해 재미를 얻고 기부도 할 수있는 사이트를 구현하고자 하였습니다.


## 설계의 주안점
1. 총 20문제의 퀴즈를 제공
2. 역대 오징어라라는 카테고리에서 매 회차 우승자 정보와 기부금액을  확인가능
3. 여러 단체의 기부를 한눈에 모아 볼수있는 게시판 형태의 커뮤니티(기부 협회 홈페이지 연결 및 정보 제공)
4. 포인트 기능, 기부시에 포인트 사용 가능
5. 포인트 충전시 카카오 API 를 사용해서 충전 가능
6. 환전이 가능하고~
7. 이메일을 통해 회원정보를 찾는 기능


## 사용기술 및 개발환경

Category | Detail
---- | ----
FrontEnd | HTML5, JS, CSS3, JQuery
BackEnd | JAVA(JDK 1.8), Servlet, Mybatis, Spring(4.3.13)
OS | Windows10, MacOS
Library & API |  kakao, google, GSON, ckeditor, webSocket, sessionStorage
IDE | Eclipse, Visual Studio Code
Server | Tomcat(v8.5)
Document | Google Drive, draw.io, ERDCloud
CI | Github, Sourcetree
DataBase | Oracle

## 프로젝트 기능 구현 및 역할
+ 강혜정 
  + 로그인 및 회원가입(카카오API 사용)
    + 로그인
    * 회원가입 - 유효성 검사, 회원별 다른 회원가입탭 출력 및 한페이지 내 모든 ajax 충돌수정 
    * 아이디 찾기/ 비밀번호 찾기
    * 이메일 인증
    * 회원정보 수정
    * 회원탈퇴
  + 마이페이지
    + 포인트조회
    + 내가 쓴 게시물 확인
    + 활동내역을 통해서 기부금액과 조회를 통해서 후원단체 확인가능 
  + 포인트 관리
    + 포인트 충전과 환전이 가능
    + 포인트로 게임 및 기부 모두 참여 가능
  + 문서정리
    + 구글 문서 정리 
    + 오라클(DB) 정리 

+ 노일기(팀장)
  + 문의/공지사항
    + 문의와 공지를 통해 이용자들에게 편리함을 제공
    + 수정 삭제 및 답변이 가능
  + 포인트(환전)
    + 퀴즈를 통한 상금 및 잔여 포인트를 환전 제공
    + 
  + 관리자페이지
    + 회원관리를 통해 탈퇴 및 정보변경 확인
    + 퀴즈 진행이 가능하게 제공
  + 신고
    + 게시물 신고 들어오면 확인후 삭제 하는 기능
    + 댓글 신고가 들어오면 확인후 삭제 하는 기능
  + 소개
    + 게임의 진행 방식과 페이지의 목적을 한곳에 담아둔 기능 
  + 문서정리
    + 구글 문서 정리 
    + 오라클(DB) 정리
 
+ 오현종 
  + 자유게시판
    + 이용자들이 자유롭게 게시글을 작성가능 
    + 신고를 통해서 보다 나은 서비스 유지 가능  
  + 문서정리
    + 구글 문서 정리 
    + 오라클(DB) 정리 
   
+ 최지현
  + 퀴즈관리
    + 여러개의 퀴즈를 통해 게임 할 수있는 퀴즈 기능
  + 역대오징어
    + 퀴즈를 통해서 최고의 우승자 확인
    + 회차마다의 기부금액도 확인 가능 
  + Github 관리
    + 전체 Git 관리(with Sourcetree)
  + 문서정리
    + 구글 문서 정리 
    + 오라클(DB) 정리   
 
+ 황지영 
  + 기부 
    + 세부내역을 통해 어떤 기부가 있는지 및 여러 종류의 기부확인 가능 
    + 퀴즈를 통한 기부 및 목표금액이 얼마인지 제공
    + 이번주 기부금액과 퀴즈전체 기부금액을 확인
  + 캠페인관리 
    + 각 캠페인마다의 홈페이지를 제공  
  + 문서정리
    + 구글 문서 정리 
    + 오라클(DB) 정리   
  

## 주요 기능
### 1.회원가입

![KakaoTalk_20211123_162723240](https://user-images.githubusercontent.com/90734078/142985014-5462d012-05b2-41d4-8995-64d7591abd06.png)


### 2.로그인

![KakaoTalk_20211123_161846518](https://user-images.githubusercontent.com/90734078/142984833-14fada75-0e6a-4de0-835c-2ceb273cade0.png)



### 3.아이디찾기

![KakaoTalk_20211123_161913132](https://user-images.githubusercontent.com/90734078/142984847-8ddc99a7-e1af-43c7-bb1e-948520a3595e.png)



### 4.비밀번호찾기

![KakaoTalk_20211123_161925083](https://user-images.githubusercontent.com/90734078/142984851-7d298d49-846e-43e9-80f6-ec39f219bd0d.png)



### 5.메인 및 퀴즈
![KakaoTalk_20211123_160015644](https://user-images.githubusercontent.com/90734078/142983417-1e15ca3e-1c4a-44a8-8422-3471addc0906.png)



### 6.퀴즈

![KakaoTalk_20211123_160039840](https://user-images.githubusercontent.com/90734078/142987075-be1eda4f-3849-4681-9132-67fe0cc730b4.png)


### 7.소개

![KakaoTalk_20211123_161655213](https://user-images.githubusercontent.com/90734078/142984741-96ff7b93-02d6-4b57-9c32-8898ba0f0f07.png)

![KakaoTalk_20211123_161712788](https://user-images.githubusercontent.com/90734078/142984750-f7d5c837-c13f-419f-b8a8-0c19b96a87b6.png)

![KakaoTalk_20211123_161748393](https://user-images.githubusercontent.com/90734078/142984761-aa6b75c9-76a6-4c12-b8d7-92834d4ecf14.png)

### 8.역대 오징어

![KakaoTalk_20211123_164642326](https://user-images.githubusercontent.com/90734078/142986988-727a73e5-22df-46e2-a2fe-943fdf04d5d5.png)

### 9.게시판(작성및조회)

![KakaoTalk_20211123_172559148](https://user-images.githubusercontent.com/90734078/142991093-27722949-5a92-4de5-adfb-c26f163dd236.png)

### 10.기부(조회)

![KakaoTalk_20211123_154212185](https://user-images.githubusercontent.com/90734078/142981081-69b55cd3-f628-4a4d-83e7-6d0c9e514506.png)

### 11.게시판 및 공지/문의사항(조회)

![KakaoTalk_20211123_155907699](https://user-images.githubusercontent.com/90734078/142983193-4eed1429-239e-414c-aa2e-5f75348d1bc9.png)

### 12.마이페이지(회원탈퇴)

![KakaoTalk_20211123_160200239](https://user-images.githubusercontent.com/90734078/142983285-b484efda-888f-4410-a6da-9d5e6e9a19fa.png)


### 13.마이페이지(회원정보수정)

![KakaoTalk_20211123_160139332](https://user-images.githubusercontent.com/90734078/142983474-68c2552d-c845-474c-b934-9a9d0aebd077.png)


### 14.관리자페이지

![KakaoTalk_20211123_160306906](https://user-images.githubusercontent.com/90734078/142983215-db9cbd7b-3257-4c1e-90f8-2d20b6b45581.png)

![KakaoTalk_20211123_160336700](https://user-images.githubusercontent.com/90734078/142983217-7bddf2b1-20f6-4e64-bb77-750424801126.png)

![KakaoTalk_20211123_160356144](https://user-images.githubusercontent.com/90734078/142983222-239d1a5f-bc80-4c3c-988d-dbade58ca757.png)




## 참고
### 1. ERD

![KakaoTalk_20211123_160510357](https://user-images.githubusercontent.com/90734078/142983240-9de31f3b-382f-42ab-9a40-b271f9c7d128.png)

### 2. Sourcetree
