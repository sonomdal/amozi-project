<h1>AMOZI</h1>
<h3>
Student No: 22421746<br>
Name: 손시은<br>
E-mail: sonsee2075@gmail.com
</h3>

---
<h3>[Revision history]</h3>

| Revision date | Version # | Description |
|:-------------:|:---------:|:-----------------------------------:|
| 2026.03.27 | 0.1 | First draft |

---

<h3>= Contents =</h3> 

<h3>1. Business purpose</h3>

<h3>2. System context diagram</h3>

<h3>3. Use case list</h3>

<h3>4. Concept of operation</h3>

<h3>5. Problem statement</h3>

<h3>6. Glossary</h3>

<h3>7. References</h3>

-------------------------------------
</div>
<h4>1. Business purpose</h4>

<span style="font-size:16px">
1) Project background
 
우리는 일상 생활에서 옷을 입을 때 TPO(Time, Place, Occasion)뿐만 아니라 날씨, 상황, 개인의 상태 등을 고려해야 한다. 하지만 이러한 요소를 모두 반영하여 마음에 드는 옷을 고르기는 쉽지 않다. 옷을 잘못 선택하게 된다면 덥거나 춥게 느낄 수도 있고 불편함을 겪을 수도 있다. 이러한 문제의식에서 시작하여 날씨와 상황에 따라 적절한 코디를 추천해주는 앱이 있으면 좋겠다는 생각이 들었고, 이 프로젝트를 기획하게 되었다.
 
2) Goals

이 프로젝트의 목표는 사용자가 옷을 선택하는 데 소요되는 시간과 부담을 줄이고, 날씨와 상황, 개인의 상태를 반영한 맞춤형 코디를 추천하는 것이다. 이를 통해 사용자는 보다 편리하고 효율적으로 일상 생활을 관리할 수 있고 자신이 원하는 스타일을 쉽게 찾을 수 있을 것이다.

3) Target market

10대부터 40대까지의 학생 및 직장인을 포함한 폭넓은 층을 대상으로 한다. 특히 바쁜 일상 속 빠르게 옷을 골라야 하거나 옷차림에 고민이 잦은 사람을 대상으로 서비스를 제공한다.
</span>

---

<h4>2. System context diagram</h4>

<img width="3163" height="2484" alt="Group 1" src="https://github.com/user-attachments/assets/1801d0ec-069d-47c1-b1f3-1e636f797853" />

---

<h4>3. Use case list</h4>

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
| System | 사용자 정보와 날씨 데이터를 AI API에 전달하여 추천을 요청한다. |

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

---

##4. Concept of operation

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
| 사용자에게 적절한 코디를 추천한다. | AI API를 활용한 추천 시스템을 구현한다. | 사용자 정보와 날씨 데이터를 AI에 전달하여 추천 결과를 생성한다. | 사용자 만족도를 높이고 의사결정 시간을 줄인다. |

6) View Recommendation Result
   
| Purpose | Approach | Dynamics | Goals |
|:--------|:---------|:---------|:------|
| 추천 결과를 사용자에게 제공한다. | UI를 통해 코디 결과를 시각적으로 표현한다. | 시스템이 추천 결과를 사용자 화면에 출력한다. | 사용자가 쉽게 이해하고 선택할 수 있도록 한다. |

7) View Recommendation History
   
| Purpose | Approach | Dynamics | Goals |
|:--------|:---------|:---------|:------|
| 이전 추천 정보를 확인할 수 있도록 한다. | 추천 기록 조회 기능을 제공한다. | 시스템이 데이터베이스에서 기록을 조회하여 사용자에게 제공한다. | 지속적인 사용자 경험 개선과 편의성 향상 |

8) Manage Data Storage
   
| Purpose | Approach | Dynamics | Goals |
|:--------|:---------|:---------|:------|
| 데이터를 안정적으로 관리한다. | 데이터베이스를 활용한다. | 사용자 정보 및 추천 결과를 저장하고 필요 시 조회한다. | 서비스의 지속성과 데이터 활용성 확보 |

---

<h4>5. Problem statement</h4>

Overview

사용자들은 매일 옷을 고를 때 날씨, 상황, 개인의 상태 등을 함께 고려해야 한다. 하지만 이러한 요소들을 모두 반영하여 적절한 옷을 선택하는 것은 쉽지 않으며, 이로 인해 불편함을 겪는 경우가 많다. 또한 매일 반복되는 의상 선택 과정은 시간과 노력이 든다.

기존의 추천 서비스는 개인의 선호도나 체감 온도를 충분히 반영하지 못하는 경우가 많다. AMOZI 또한 외부 API를 활용하기 때문에 기술적인 어려움이 존재한다. 아래에서는 이러한 문제들을 구체적으로 설명한다.

Problem #1: Outfit Selection Difficulty

사용자들은 날씨와 상황을 고려해 옷을 선택하는 데 어려움을 겪는다. 이로 인해 덥거나 추운 옷을 입게 되는 경우가 발생할 수 있다.

Problem #2: Time Consumption

매일 옷을 고르는 과정이 반복되면 많은 시간을 소모하게 된다. 특히 바쁜 사용자에게는 부담이 될 수 있다.

Problem #3: Lack of Personalization

기존 의상 추천 서비스는 사용자 개인의 스타일이나 체감 온도를 충분히 반영하지 못해 만족도가 낮을 수 있다.

Problem #4: Data Integration

날씨, 사용자 정보, 상황 데이터를 함께 처리해야 하기 때문에 시스템 구현이 복잡해질 수 있다.

Problem #5: API Dependency

외부 API 사용으로 인해 응답 지연이나 오류가 발생할 수 있고 시스템 안정성에 영향을 줄 수 있다. 특히 무료 AI API를 사용할 경우, 사용량 제한이나 응답 품질의 불안정성 등의 문제가 발생할 수 있어 서비스의 안정성과 일관성을 유지하는 데 어려움이 있다.

NFRs

1. Performance (성능)
 
코디 추천 결과는 3초 이내에 제공되어야하고, 외부 API 호출로 인해 지연이 발생하더라도 전체 응답 시간은 5초를 넘지 않도록 해한다.

2. Usability (사용성)

사용자는 복잡한 과정 없이 최소한의 입력만으로 추천 결과를 받을 수 있어야 한다. 주요 기능은 3번 이하의 클릭으로 접근 가능하도록 설계한다.

3. Reliability (신뢰성)
 
오류가 발생하더라도 시스템이 기본적인 기능은 안정적으로 동작해야 한다. 오류 발생 시 사용자에게 안내 메시지를 제공해야 한다.

4. Scalability (확장성)
 
사용자가 많아져도 문제없이 동작할 수 있어야 한다.

5. Security (보안성)
 
사용자 정보는 안전하게 보호되어야 한다. 로그인 기능을 통해 인증된 사용자만 접근할 수 있어야 한다.

---

<h4>6. Glossary</h4>

* TPO: Time(시간), Place(장소), Occasion(상황)의 약자로, 말하는 때와 장소, 경우에 맞는 복장을 뜻한다.
  
* 코디: 패션에서 의상, 신발, 액세서리 등을 조화롭게 맞춰 입는 코디네이션(Coordination)의 줄임말이다. 전체적인 스타일링과 매치를 의미한다.

* 날씨 API (Weather API): 외부 서비스로부터 실시간 날씨 정보를 제공받기 위한 인터페이스이다.

* AI API: 인공지능 기반 추천 기능을 제공하는 외부 서비스로 사용자 정보와 날씨 데이터를 기반으로 코디를 추천한다.

* 체감 온도 (Perceived Temperature): 실제 기온이 아닌 사용자가 느끼는 온도의 정도를 의미한다.

* 개인화 추천 (Personalized Recommendation): 사용자의 선호도와 상황을 반영하여 맞춤형 결과를 제공하는 기능이다.

* 데이터베이스 (Database): 사용자 정보 및 추천 기록 등을 저장하고 관리하는 시스템이다.

---

<h4>7. References</h4>

* OpenWeather API Documentation, https://openweathermap.org/api
* Google Cloud Weather Data Overview, https://cloud.google.com/
  
</div>
