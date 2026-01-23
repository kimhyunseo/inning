# 🏟️ INNING (인닝)
> **"경기장 안의 우리들, 현장 관람객 전용 실시간 소통 광장"**

**인닝**은 GPS 기술을 활용하여 같은 경기장(위치)에 있는 사람들끼리만 소통할 수 있는 **현장 밀착형 실시간 채팅 서비스**입니다. 정보 비대칭을 해소하고 현장의 열기를 공유하며, 오직 '지금 여기'에 있는 사람들만의 특별한 커뮤니티를 제공합니다.

---

## 🛠 INNING Stack & Libraries

### **Environment**
- **Framework**: `Flutter 3.3.8 (Stable)`
- **Language**: `Dart 3.10.7`
- **DevTools**: `2.51.1`
- **Backend**: `Firebase Firestore`, `Firebase Storage`

### **Libraries**
- **State Management**: `Riverpod` (MVVM Pattern)
- **Location**: `geolocator` (GPS 좌표 추출)
- **Network**: `dio` (VWORLD API 연동)
- **Database**: `cloud_firestore` (실시간 채팅 데이터)
- **Storage**: `firebase_storage` (프로필 이미지 업로드)
- **Media**: `image_picker` (이미지 선택)

---

## 🚀 Key Features

프로젝트 요구사항을 충실히 구현하였으며, MVVM 아키텍처를 기반으로 안정적인 실시간 서비스를 구축했습니다.

### 1. GPS 기반 위치 인증 (Location Services)
- **정밀 좌표 추출**: `geolocator`를 사용하여 사용자의 위도/경도 값을 실시간으로 획득합니다.
- **VWORLD API 연동**: 획득한 좌표를 행정구역(읍면동) 단위의 주소로 변환하여 사용자에게 직관적인 위치 정보를 제공합니다.
- **권한 관리**: OS별 위치 정보 접근 권한 검증 및 예외 처리를 구현했습니다.

### 2. 실시간 채팅 (Real-time Chatting)
- **지역 필터링**: Firestore의 `where` 쿼리를 활용하여 동일한 '동네(address)'에 위치한 사용자들 간의 채팅 목록만 동기화합니다.
- **실시간 스트리밍**: `snapshots()` 메서드를 통해 별도의 새로고침 없이 메시지를 즉각적으로 수신합니다.
- **데이터 정렬**: `orderBy` 기능을 통해 메시지를 최신순으로 정렬하여 자연스러운 대화 흐름을 제공합니다.

### 3. 유저 프로필 및 이미지 시스템 (User Profile)
- **고유 식별자**: `DateTime` 기반의 유니크한 ID 생성으로 익명성을 유지하면서도 사용자를 구분합니다.
- **이미지 업로드**: `Firebase Storage`와 연동하여 커스텀 프로필 사진을 설정하고, 채팅창 내에 상대방의 프로필 이미지를 렌더링합니다.

### 4. MVVM 아키텍처 설계
- **ViewModel (Riverpod)**: 비즈니스 로직과 UI를 완벽히 분리하여 상태 변화를 효율적으로 관리합니다.
- **Repository 패턴**: 데이터 소스(Firestore, API)에 대한 접근 로직을 캡슐화하여 유지보수성을 극대화했습니다.

---

## 📂 Project Structure

```text
lib/
├── core/
│   ├── constants/         # API 키 및 앱 내 상수 관리
│   ├── theme/             # 앱 전역 테마 및 스타일 설정
│   └── utils/             # GPS 권한 체크 등 유틸리티 함수
├── models/
│   ├── chat.dart          # 채팅 메시지 데이터 모델
│   └── user_state.dart    # 사용자 정보 데이터 모델
├── repositories/
│   └── chat_repository.dart # Firestore CRUD 및 실시간 스트림 로직
├── view_models/
│   ├── chat_view_model.dart # 채팅 메시지 송수신 및 상태 비즈니스 로직
│   └── user_global_view_model.dart # 사용자 위치 및 프로필 전역 상태 관리
├── views/
│   ├── chat/              # 채팅 화면 및 관련 컴포넌트
│   │   ├── chat_page.dart
│   │   └── widgets/       # 메시지 버블, 입력창 등 UI 부품
│   └── welcome/           # 초기 진입, 닉네임 설정 및 위치 인증 화면
│       ├── welcome_page.dart
│       └── widgets/       # 위치 인증 버튼 등 UI 부품
└── main.dart              # 앱 진입점 및 Firebase/Riverpod 초기화
```

## 👥 팀원 및 역할 (Contributors & Roles)

| 이름       |       역할        | 주요 구현 내용                                                                                                                                                                                                                  |
| :--------- | :---------------: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **김현서** | **Leader / Core** | - **실시간채팅**: Firestore snapshots() 기반 실시간 메시지 스트리밍 및 ChatRepository 설계<br>- **비즈니스 로직**: Riverpod AsyncNotifier를 활용한 채팅 전송/로딩 상태 처리                                                 |
| **김동준** |  **UI/UX / Dev**  | - **미디어 시스템**: image_picker와 Firebase Storage를 연동한 프로필 사진 비동기 업로드 및 관리 기능 구현<br>- **UI 구현**: 사용자 친화적인 프로필 등록 UI 디자인<br>
| **주혜림** | **Feature / Dev** | - **반응형 UI**: ChatPage 레이아웃 및 디바이스 크기별 대응 가능한 반응형 메시지 버블 위젯 구현<br>- **위치 인증**: geolocator 기반 실시간 좌표 획득 및 VWORLD API 연동을 통한 주소 변환(Reverse Geocoding) 구현<br> |

---

## 🛠️ 개발 기간 (Timeline)

- **2026.01.16 ~ 2026.01.23**
- **기획**: 아이디어 브레인스토밍 및 UI/UX 와이어프레임 설계
- **개발**: 필수 기능(Lv.1,2,3) 및 도전 기능(Lv.4,5,6) 단계별 구현

---

## 설치 및 실행 방법 (Installation & Run)

### ⚙️ Installation & Run

#### 1. 저장소를 클론합니다.

```bash
git clone [https://github.com/](https://github.com/)[유저이름]/inning_app.git
```

#### 3. 패키지를 설치합니다.

```bash
cd inning_app
flutter pub get
```


#### 4. 앱을 실행합니다.

```bash
flutter run
```