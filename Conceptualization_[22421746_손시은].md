<div align="center">
<h1>AMOZI</h1>
<h3>
Student No: 22421746<br>
Name: 손시은<br>
E-mail: sonsee2075@gmail.com
</h3>

---------------------------------------------------------------
<h3>[Revision history]</h3>
</div>
<center>
| Revision date | Version # | Description |
|:-------------:|:---------:|:-----------------------------------:|
| 2026.03.27 | 0.01 | |
</center>
<div align="center">
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
 
 우리는 일상 생활에서 옷을 입을 때 TPO(Time, Place, Occasion)뿐만 아니라 날씨, 상황, 개인의 상태 등을 고려해야 한다. 하지만 이러한 요소를 모두 반영하여 마음에 드는 옷을 고르기는 쉽지 않다. 옷을 잘못 선택하게 된다면 덥거나 춥게 느낄 수도 있고 불편함을 겪을 수도 있다.
 
 이러한 문제의식에서 시작하여 날씨와 상황에 따라 적절한 코디를 추천해주는 앱이 있으면 좋겠다는 생각이 들었고, 이 프로젝트를 기획하게 되었다.

2) Gols
 이 프로젝트의 목표는 사용자가 옷을 선택하는 데 소요되는 시간과 부담을 줄이고, 날씨와 상황, 개인의 상태를 반영한 맞춤형 코디를 추천하는 것이다. 이를 통해 사용자는 보다 편리하고 효율적으로 일상 생활을 관리할 수 있고 자신이 원하는 스타일을 쉽게 찾을 수 있을 것이다.

3) Target market
 10대부터 40대까지의 학생 및 직장인을 포함한 폭넓은 층을 대상으로 한다. 특히 바쁜 일상 속 빠르게 옷을 골라야 하거나 옷차림에 고민이 잦은 사람을 대상으로 서비스를 제공한다.
</span>

-----------------------------------
<h4>2. System context diagram</h4>
<img width="3163" height="2484" alt="Group 1" src="https://github.com/user-attachments/assets/1801d0ec-069d-47c1-b1f3-1e636f797853" />
---------------------------------
<h4>3. Use case list</h4>

1) Login / Sign Up
| Actor | Description |
|:------:|:----------------------------------------------|
| User | 회원가입 및 로그인을 통해 시스템에 접근할 수 있다. |

2) Manage User Profile
| Actor | Description |
|:------:|:----------------------------------------------|
| User | 체감 온도, 선호 스타일 등의 개인 정보를 입력하고 수정할 수 있다. |

3) Select Situation (TPO)
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
-------------------------------
<h4>4. Concept of operation</h4>

----------------------------------
<h4>5. Problem statement</h4>

------------------------------------
<h4>6. Glossary</h4>

---------------------------
<h4>7. References</h4>

</div>
