# AMOZI
### Student No: 22421746
### Name: 손시은
### E-mail: sonsee2075@gmail.com

---
### [Revision history]

| Revision date | Version # | Description |
|:-------------:|:---------:|:-----------------------------------:|
| 2026.03.27 | 1.0 | First draft |
| 2026.05.06 | 1.1 | System context diagram 용어 설명 추가, Use case list 및 Concept of operation 항목 추가 |

---

### = Contents = ### 

### 1. Business purpose

### 2. System context diagram</h3>

### 3. Use case list

### 4. Concept of operation

### 5. Problem statement

### 6. Glossary

### 7. References

-------------------------------------

### 1. Business purpose

**1) Project background**
 
우리는 일상 생활에서 옷을 입을 때 TPO뿐만 아니라 날씨, 개인의 상태 등을 고려해야 한다. 하지만 이런 요소들을 모두 반영하여 마음에 드는 옷을 고르기는 쉽지 않다. 옷을 잘못 선택하게 된다면 덥거나 춥게 느낄 수도 있고 불편함을 겪을 수도 있다. 이러한 문제의식에서 시작하여 날씨와 상황에 따라 적절한 코디를 추천해주는 앱이 있으면 좋겠다는 생각이 들어 이 프로젝트를 기획하게 되었다.
 
**2) Goals**

이 프로젝트의 목표는 사용자가 옷을 선택하는 데 소요되는 시간과 부담을 줄이고 날씨와 상황, 개인의 상태를 반영한 맞춤형 코디를 추천하는 것이다. 이를 통해 사용자는 보다 편리하고 효율적으로 일상 생활을 관리할 수 있고 자신이 원하는 스타일을 쉽게 찾을 수 있을 것이다.

**3) Target market**

코디에 어려움을 느끼는 20~30대 학생 및 직장인을 대상으로 한다. 특히 바쁜 일상 속 빠르게 옷을 골라야 하거나 옷차림에 고민이 잦은 사람을 대상으로 서비스를 제공한다.


---

### 2. System context diagram

<img width="3529" height="2829" alt="Group 2" src="https://github.com/user-attachments/assets/ec3328f4-d8af-42c5-a095-efe5fb11dd58" />

* style preference: 사용자의 옷 스타일 선호도
* situation/body condition: 사용자의 상황 및 신체 상태 정보
* outfit recommendation: 시스템이 제공하는 옷 추천 결과
* weather summary: 현재 날씨 정보를 요약한 데이터
* personalized outfit recommendation: 사용자 맞춤형 옷 추천 결과
* user data: 사용자 관련 정보
* weather data: 날씨 관련 정보
* preference: 사용자 선호도 정보
* recommendation history: 이전 추천 기록
* temperature: 현재 기온 정보
* weather Condition: 현재 날씨 정보
* humidity: 현재 습도 정보
* location data: 사용자 위치 정보

---

### 3. Use case list

1) Login / Sign Up
   
| Actor | Description |
|:------:|:----------------------------------------------|
| User | 회원가입 및 로그인을 통해 시스템에 접근할 수 있다. |

2) Manage User Profile
   
| Actor | Description |
|:------:|:----------------------------------------------|
| User | 체감 온도, 선호 스타일 등의 개인 정보를 입력하고 수정할 수 있다. |

3) Select Situation
   
| Actor | Description |
|:------:|:----------------------------------------------|
| User | 현재 상황(학교, 데이트, 운동 등)을 선택하여 코디 추천에 반영할 수 있다. |

4) Check Weather Information
   
| Actor | Description |
|:------:|:----------------------------------------------|
| User | 현재 위치를 기반으로 날씨 정보를 확인할 수 있다. |
| System | 날씨 API에 위치 정보를 전달하여 날씨 데이터를 수신한다. |

5) Request Outfit Recommendation
   
| Actor | Description |
|:------:|:----------------------------------------------|
| User | 날씨와 개인 정보를 기반으로 의상 추천을 요청할 수 있다. |
| System | 사용자 정보와 날씨 데이터, 이전 기록을 AI API에 전달하여 개인화된 추천을 요청한다. |

6) View Recommendation Result
   
| Actor | Description |
|:------:|:----------------------------------------------|
| User | 추천된 코디 결과를 확인할 수 있다. |
| System | AI API로부터 받은 추천 결과를 사용자에게 제공한다. |

7) View Recommendation History
   
| Actor | Description |
|:------:|:----------------------------------------------|
| User | 이전에 추천받은 코디 기록을 조회할 수 있다. |
| System | 데이터베이스에서 사용자 기록을 조회하여 제공한다. |

8) Manage Data Storage
   
| Actor | Description |
|:------:|:----------------------------------------------|
| System | 사용자 정보 및 추천 기록을 데이터베이스에 저장하고 관리한다. |

9) Provide Feedback
| Actor | Description |
|:------:|:----------------------------------------------|
| User | 추천 결과에 대해 만족도 평가를 제공할 수 있다. |
| System | 사용자 피드백을 반영하여 추천 성능을 개선한다. |

10) Personalized Recommendation Learning
| System | 사용자 정보 및 추천 기록을 데이터베이스에 저장하고 관리한다. |
| Actor | Description |
|:------:|:----------------------------------------------|
| System | 사용자 선호도와 이전 기록을 분석하여 개인화된 추천을 생성한다. |

11) Save Outfit
| Actor | Description |
|:------:|:----------------------------------------------|
| User | 마음에 드는 코디를 저장할 수 있다. |
| System | 선택된 코디를 데이터베이스에 저장한다. |

---

### 4. Concept of operation

1) Login / Sign Up
   
| Purpose | Approach | Dynamics | Goals |
|:--------|:---------|:---------|:------|
| 사용자가 시스템에 접근할 수 있도록 한다. | 회원가입 및 로그인 기능을 제공한다. | 사용자가 계정을 생성하거나 로그인 정보를 입력하면 시스템이 인증을 수행한다. | 사용자 인증을 통해 개인화된 서비스 제공 기반을 마련한다. |

2) Manage User Profile
   
| Purpose | Approach | Dynamics | Goals |
|:--------|:---------|:---------|:------|
| 사용자 맞춤 추천을 위한 정보를 수집한다. | 체감 온도, 선호 스타일 입력 기능을 제공한다. | 사용자가 정보를 입력하면 시스템이 이를 저장하고 이후 추천에 반영한다. | 개인화된 코디 추천 정확도를 향상시킨다. |

3) Select Situation
   
| Purpose | Approach | Dynamics | Goals |
|:--------|:---------|:---------|:------|
| 상황에 맞는 코디 추천을 제공한다. | TPO 선택 기능을 제공한다. | 사용자가 상황을 선택하면 해당 정보가 추천 알고리즘에 반영된다. | 상황에 적합한 코디 추천을 가능하게 한다. |

4) Check Weather Information
   
| Purpose | Approach | Dynamics | Goals |
|:--------|:---------|:---------|:------|
| 날씨 기반 추천을 위한 데이터를 확보한다. | 날씨 API를 연동한다. | 시스템이 사용자 위치를 기반으로 날씨 데이터를 요청하고 수신한다. | 정확한 환경 정보를 반영한 추천을 제공한다. |

5) Request Outfit Recommendation
   
| Purpose | Approach | Dynamics | Goals |
|:--------|:---------|:---------|:------|
| 사용자에게 적절한 코디를 추천한다. | AI API를 활용한 추천 시스템을 구현한다. | 사용자 정보, 날씨 데이터, 이전 추천 기록을 AI에 전달하여 개인화된 추천 결과를 생성한다. | 사용자 만족도를 높이고 의사결정 시간을 줄이며 개인화된 추천 정확도를 향상시킨다. |

6) View Recommendation Result
   
| Purpose | Approach | Dynamics | Goals |
|:--------|:---------|:---------|:------|
| 추천 결과를 사용자에게 제공한다. | UI를 통해 코디 결과를 시각적으로 표현한다. | 시스템이 추천 결과를 사용자 화면에 출력한다. | 사용자가 쉽게 이해하고 선택할 수 있도록 한다. |

7) View Recommendation History
   
| Purpose | Approach | Dynamics | Goals |
|:--------|:---------|:---------|:------|
| 이전 추천 정보를 확인할 수 있도록 한다. | 추천 기록 조회 기능을 제공한다. | 시스템이 데이터베이스에서 기록을 조회하여 사용자에게 제공한다. | 사용자 경험 개선 및 개인화 추천 정확도 향상 |

8) Manage Data Storage
   
| Purpose | Approach | Dynamics | Goals |
|:--------|:---------|:---------|:------|
| 데이터를 안정적으로 관리한다. | 데이터베이스를 활용한다. | 사용자 정보 및 추천 결과를 저장하고 필요 시 조회한다. | 데이터의 안정적인 관리와 효율적인 활용을 보장한다. |

9) Provide Feedback
   
| Purpose | Approach | Dynamics | Goals |
|:--------|:---------|:---------|:------|
| 추천 결과에 대한 사용자 반응을 수집한다. | 평가 및 피드백 입력 기능을 제공한다. | 사용자가 추천 결과에 대한 평가를 입력하면 시스템이 이를 저장하고 이후 추천에 반영한다. | 추천 시스템의 성능을 지속적으로 개선한다. |

10) Personalized Recommendation Learning
   
| Purpose | Approach | Dynamics | Goals |
|:--------|:---------|:---------|:------|
| 사용자 맞춤 추천을 지속적으로 향상시킨다. | 사용자 데이터 분석 및 학습 기반 추천 로직을 적용한다. | 시스템이 사용자 선호도, 피드백, 추천 기록을 분석하여 추천 모델을 개선한다. | 시간이 지날수록 더 정확한 개인화 추천을 제공한다. |

11) Save Outfit
   
| Purpose | Approach | Dynamics | Goals |
|:--------|:---------|:---------|:------|
| 사용자가 원하는 코디를 저장할 수 있도록 한다. | 저장 기능을 제공한다. | 사용자가 코디를 선택하면 시스템이 이를 데이터베이스에 저장한다. | 사용자 편의성을 향상시키고 재사용성을 높인다. |

---

### 5. Problem statement

**Overview**

사용자들은 매일 옷을 고를 때 날씨, 상황, 개인의 상태 등을 함께 고려해야 한다. 하지만 이러한 요소들을 모두 반영하여 적절한 옷을 선택하는 것은 쉽지 않으며, 이로 인해 불편함을 겪는 경우가 많다. 또한 매일 반복되는 의상 선택 과정은 시간과 노력이 필요하다. 기존의 추천 서비스는 개인의 선호도나 체감 온도를 충분히 반영하지 못하는 경우가 많아 사용자 만족도가 낮을 수 있다. 
AMOZI는 외부 API를 활용하기 때문에 기술적인 어려움이 존재한다. 아래에서는 이러한 문제들을 구체적으로 설명한다.

**Problem #1: Outfit Selection Difficulty**

사용자들은 날씨와 상황을 고려하여 옷을 선택하는 데 어려움을 겪는다. 이로 인해 실제 환경에 맞지 않는 옷차림을 선택하게 되는 경우가 발생할 수 있다.

**Problem #2: Time Consumption**

매일 옷을 고르는 과정이 반복되면 많은 시간과 노력이 든다. 특히 바쁜 사용자에게는 이러한 과정이 부담이 될 수 있다.

**Problem #3: Lack of Personalization**

기존 의상 추천 서비스는 사용자 개인의 스타일이나 체감 온도를 충분히 반영하지 못해 추천 결과의 만족도가 낮을 수 있다.

**Problem #4: Data Integration**

날씨, 사용자 정보, 상황 데이터를 함께 처리해야 하기 때문에 시스템 설계 및 구현 과정이 복잡해질 수 있다.

**Problem #5: API Dependency**

외부 API 사용으로 인해 응답 지연이나 오류가 발생할 수 있고 시스템 안정성에 영향을 줄 수 있다. 특히 무료 AI API를 사용할 경우, 사용량 제한이나 응답 품질의 불안정성 등의 문제가 발생할 수 있어 서비스의 안정성과 일관성을 유지하는 데 어려움이 있다.

**NFRs**

**1) Performance (성능)**
 
코디 추천 결과는 3초 이내에 제공되어야하고, 외부 API 호출로 인해 지연이 발생하더라도 전체 응답 시간은 5초를 넘지 않도록 해야한다.

**2) Usability (사용성)**

사용자는 복잡한 과정 없이 최소한의 입력만으로 추천 결과를 받을 수 있어야 한다. 주요 기능은 3번 이하의 클릭으로 접근 가능하도록 설계한다.

**3) Reliability (신뢰성)**
 
오류가 발생하더라도 시스템의 핵심 기능은 안정적으로 동작해야 한다. 오류 발생 시 사용자에게 적절한 안내 메시지를 제공해야 한다.

**4) Scalability (확장성)**
 
사용자 수가 증가하더라도 성능 저하 없이 안정적으로 서비스를 제공할 수 있어야 한다.

**5) Security (보안성)**
 
사용자 정보는 안전하게 보호되어야 한다. 로그인 기능을 통해 인증된 사용자만 접근할 수 있어야 한다.

---

### 6. Glossary

* TPO: Time(시간), Place(장소), Occasion(상황)의 약자로, 말하는 때와 장소, 경우에 맞는 복장을 뜻한다.
  
* 코디: 패션에서 의상, 신발, 액세서리 등을 조화롭게 맞춰 입는 코디네이션(Coordination)의 줄임말이다. 전체적인 스타일링과 매치를 의미한다.

* 날씨 API (Weather API): 외부 서비스로부터 실시간 날씨 정보를 제공받기 위한 인터페이스이다.

* AI API: 인공지능 기반 추천 기능을 제공하는 외부 서비스로 사용자 정보와 날씨 데이터를 기반으로 코디를 추천한다.

* 체감 온도: 실제 기온이 아닌 사용자가 느끼는 온도의 정도를 의미한다.

* 개인화 추천 (Personalized Recommendation): 사용자의 선호도와 상황, 과거 데이터를 반영하여 맞춤형 결과를 제공하는 기능이다.

* 데이터베이스 (Database): 사용자 정보 및 추천 기록 등을 저장하고 관리하는 시스템이다.

---

### 7. References

* OpenWeather API Documentation, https://openweathermap.org/api
* Google Cloud Weather Data Overview, https://cloud.google.com/
* OpenAI API Documentation, https://platform.openai.com/docs
