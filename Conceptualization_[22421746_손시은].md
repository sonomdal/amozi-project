# AMOZI

### Student No: 22421746

### Name: 손시은

### E-mail: [sonsee2075@gmail.com](mailto:sonsee2075@gmail.com)

---

### [Revision history]

| Revision date | Version # | Description |
| :-----------: | :-------: | :---------: |
|   2026.03.27  |    0.1    | First draft |

---

### = Contents =

<div align="center">

### 1. Business Purpose

### 2. System Context Diagram

### 3. Use Case List

### 4. Concept of Operation

### 5. Problem Statement

### 6. Glossary

### 7. References

</div>

---

## 1. Business Purpose

<div align="center">

### 1) Project Background

</div>

우리는 일상 생활에서 옷을 입을 때 TPO(Time, Place, Occasion)뿐만 아니라 날씨, 상황, 개인의 상태 등을 고려해야 한다. 하지만 이러한 요소를 모두 반영하여 마음에 드는 옷을 고르기는 쉽지 않다. 옷을 잘못 선택하게 된다면 덥거나 춥게 느낄 수도 있고 불편함을 겪을 수도 있다. 이러한 문제의식에서 시작하여 날씨와 상황에 따라 적절한 코디를 추천해주는 앱이 있으면 좋겠다는 생각이 들었고, 이 프로젝트를 기획하게 되었다.

<div align="center">

### 2) Goals

</div>

이 프로젝트의 목표는 사용자가 옷을 선택하는 데 소요되는 시간과 부담을 줄이고, 날씨와 상황, 개인의 상태를 반영한 맞춤형 코디를 추천하는 것이다. 이를 통해 사용자는 보다 편리하고 효율적으로 일상 생활을 관리할 수 있고 자신이 원하는 스타일을 쉽게 찾을 수 있을 것이다.

<div align="center">

### 3) Target Market

</div>

10대부터 40대까지의 학생 및 직장인을 포함한 폭넓은 층을 대상으로 한다. 특히 바쁜 일상 속 빠르게 옷을 골라야 하거나 옷차림에 고민이 잦은 사람을 대상으로 서비스를 제공한다.

---

## 2. System Context Diagram

![System Context Diagram](https://github.com/user-attachments/assets/b0bd7ade-fcee-47a2-94e0-986a6fea8999)

### Description

* **User**: 시스템을 사용하는 사용자로, 개인 정보 입력 및 코디 추천을 요청한다.
* **System (AMOZI)**: 사용자 정보를 기반으로 데이터를 처리하고 코디 추천을 제공하는 핵심 시스템이다.
* **Weather API**: 사용자 위치 기반의 날씨 데이터를 시스템에 제공한다.
* **AI API**: 사용자 정보와 날씨 데이터를 기반으로 코디 추천 결과를 생성한다.
* **Database**: 사용자 정보 및 추천 기록을 저장하고 관리한다.

### Data Flow

* style preference, situation/body condition: 스타일 선호도, 상황/신체 상태의 정 
* outfit recommendation, weather summary: 위치 정보 전달 및 날씨 요청
* location data: 날씨 데이터 반환
* temperature, weather condition, humidity: 온도, 날씨 상태, 습도 등의 데이터 반환
* user data + weather data: 사용자 정보 + 날씨 데이터 전달
* personalized outfit recommendation: 사용자에게 적합한 코디 추천 결과 반환
* user data, preference, recommendation history: 사용자 정보, 선호도, 추천 기록을 필요할 때 조회하여 서비스에 활용

---

## 3. Use Case List
