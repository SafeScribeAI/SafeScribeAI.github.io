---
layout: default
title: SafeScribe — 개인정보 처리방침
description: SafeScribe가 수집하는 데이터, 처리 방법 및 귀하의 권리.
lang: ko
---

<div class="page-content" markdown="1">

# 개인정보 처리방침

<div class="summary-box">
  <strong>간단히 설명하면:</strong> 서버 메모리에서 오디오를 처리해 전사 텍스트를 만든 후 즉시 삭제합니다. 오디오를 디스크에 저장하거나, AI 훈련에 사용하거나, 누구와도 공유하지 않습니다. 전사 결과는 기기에서 암호화되어 저장되며 귀하가 관리합니다. 가명 청구 기록만 보관합니다.
</div>

<p class="page-meta">최종 업데이트: March 2026</p>

---

<span class="section-label">절대 하지 않는 것</span>
## 수집하거나 저장하지 않는 데이터
{: #no-collect}

<ul class="dont-list">
  <li><span class="x-mark">&#x2717;</span> 오디오를 디스크에 저장하는 것 — 절대로</li>
  <li><span class="x-mark">&#x2717;</span> 이메일 주소나 이름을 저장하는 것</li>
  <li><span class="x-mark">&#x2717;</span> IP 주소를 기록하거나 저장하는 것</li>
  <li><span class="x-mark">&#x2717;</span> 녹음을 AI 모델 훈련에 사용하는 것</li>
  <li><span class="x-mark">&#x2717;</span> 광고주나 데이터 브로커와 데이터를 공유하는 것</li>
  <li><span class="x-mark">&#x2717;</span> 앱이나 세션 간 행동을 추적하는 것</li>
  <li><span class="x-mark">&#x2717;</span> 연락처, 위치 또는 생체 데이터를 수집하는 것</li>
  <li><span class="x-mark">&#x2717;</span> 계정 삭제 후에도 데이터를 보유하는 것</li>
</ul>

---

<span class="section-label">저장하는 것</span>
## 수집하는 데이터

### 서버 측 (계정 삭제까지 영구 보존)

| 데이터 | 목적 |
|------|---------|
| 가명 사용자 ID (계정 ID의 SHA-256 해시) | 계정 식별 — 역산 불가 |
| 가명 기기 식별자 (기기 속성의 SHA-256 해시) | 남용 방지 — 역산 불가 |
| 계정 잔액 (USD) | 크레딧 관리 |
| 남은 무료 전사 분 | 환영 보너스 추적 |
| 계정 생성 및 최종 업데이트 타임스탬프 | 계정 관리 |

**작업별 기록** (완료된 각 전사에 저장):

| 데이터 | 목적 |
|------|---------|
| 오디오 시간 (초) | 서비스 분석 |
| 파일 크기 (바이트) | 서비스 분석 |
| 단어 수 | 서비스 분석 |
| 청구 금액 (USD) | 청구 기록 |
| 처리 타임스탬프 | 서비스 분석 |

<div class="callout callout-info">
  <strong>작업별 기록에는 오디오 내용이나 전사 텍스트가 포함되지 않습니다.</strong> 이 기록들은 메타데이터(숫자와 타임스탬프)만 포함합니다 — 귀하가 말한 내용은 절대 포함되지 않습니다.
</div>

### 서버 측 (임시 — 처리 후 삭제)

| 데이터 | 삭제 시점 |
|------|-------------|
| 오디오 파일 | 전사 완료 즉시 |
| 전사 텍스트 | 수신 확인(승인) 후 |

### 기기 내 (암호화)

| 데이터 | 보존 기간 |
|------|-----------|
| 전사 결과 (텍스트, 세그먼트, 메타데이터) | 삭제할 때까지 |
| 오프라인 업로드 대기열 | 업로드 성공 후 제거 |
| 앱 설정 및 동의 기록 | 로그아웃 또는 계정 삭제까지 |
| 암호화 키 | iOS Keychain / Android Keystore — 앱 삭제 시 제거 |

### 선택 사항 (수락 시에만)

| 데이터 | 목적 |
|------|---------|
| 충돌 보고서 | SafeScribe 자체 충돌 보고 엔드포인트를 통한 앱 안정성 — 전송 전 모든 개인 정보 제거 |
| 피드백 및 문제 보고 | 제품 개선 — 귀하가 선택하여 보내는 평점, 버그 보고, 불만 또는 제안. 자유 입력 텍스트는 저장 전 서버 측에서 개인 식별 정보(PII)가 제거되며, 이름·이메일·IP 없이 가명 사용자 해시 값과 함께만 보관됩니다. 최대 24개월간 보존된 후 자동 삭제됩니다. |

<div class="callout callout-green">
  <strong>서버는 귀하의 이름, 이메일 주소, IP 주소, 오디오 내용 또는 전사 텍스트를 절대 저장하지 않습니다.</strong> 귀하의 계정과 연결된 유일한 영구 기록은 역산 불가능한 사용자 해시 값, 가명 기기 식별자, 크레딧 잔액, 사용 통계(숫자만 — 내용 없음, 신원 없음), 그리고 귀하가 선택하여 보내는 피드백(개인 식별 정보 제거됨)입니다. 보고에 답변하는 경우, 답변은 귀하의 사용자 해시 값과 매칭된 일회성 앱 내 메시지로만 전달됩니다 — 저희는 귀하가 누구인지 절대 알 수 없습니다.
</div>

---

<span class="section-label">완전한 삭제</span>
## 앱 삭제 vs. 계정 삭제

이는 서로 다른 결과를 가져오는 두 가지 별개의 작업입니다:

| 작업 | 결과 | 잔액 |
|--------|-------------|-------------|
| **앱 삭제** | 로컬 전사 결과 및 암호화 키가 기기에서 제거됨 | 서버에 보존 — 동일 계정으로 재설치 및 로그인 시 완전히 복원 |
| **계정 삭제** | 모든 서버 측 기록이 영구 삭제 — 취소 불가 | 사라짐 |

<div class="callout callout-info">
  <strong>언제든지 재설치 가능.</strong> 계정을 삭제하지 않고 앱을 삭제한 경우, 재설치 후 동일한 Google 또는 Apple 계정으로 로그인하면 전체 잔액과 접근 권한이 복원됩니다 — 추가 작업 불필요.
</div>

### 계정 삭제 — 본인을 식별할 수 있는 것은 아무것도 남지 않습니다

개인정보 보호 설정에서 계정을 삭제하면 본인의 신원과 연결된 모든 서버 측 기록이 영구적으로 제거됩니다:

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>가명 사용자 ID</strong><span class="item-desc">영구 삭제</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>크레딧 잔액</strong><span class="item-desc">영구 삭제</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>남은 무료 시간</strong><span class="item-desc">영구 삭제</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>작업별 통계</strong><span class="item-desc">즉시 익명화 — 공용 DELETED_USER 표식으로 변경되며 2년 후 자동 삭제</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>가명 기기 식별자</strong><span class="item-desc">솔트 처리된 단방향 해시로 축소되어 최대 2년 보관 — 환영 크레딧 반복 악용을 차단하며, 역산하거나 본인과 연결할 수 없습니다</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>일일 백업</strong><span class="item-desc">매일 덮어쓰이는 사본은 다음 백업 주기 이후(24시간 이내)에는 본인을 식별할 수 있는 데이터를 포함하지 않습니다. 삭제 시점에 생성되는 별도의 특정 시점 복구(point-in-time) 스냅샷은 재해 복구 목적으로 보관되며 즉시 삭제되지 않습니다</span></span></li>
</ul>

삭제 시점에 본인 신원과의 모든 연결이 파기됩니다. <em>신원과 전혀 연결되지 않은</em> 두 가지 제한된 범주만 한시적으로 보관됩니다: 금융 기록(구매·사용 금액)은 DELETED_USER 표식으로 익명화되어 하자 있는 서비스에 대한 소멸시효(터키 소비자보호법 제15-16조)에 따라 2년간 보관되고, 솔트 처리된 단방향 기기 해시는 무료 크레딧 반복 지급을 막기 위해 최대 2년간 보관됩니다(GDPR 제6조 1항 (f), 정당한 이익). 둘 다 기간이 만료되면 운영 시스템에서 자동으로 삭제됩니다. 매일 덮어쓰이는 백업에는 24시간 이내에 삭제된 계정이 더 이상 반영되지 않습니다. 다만 삭제 전에 생성된 특정 시점 복구 스냅샷은 재해 복구 목적으로 보관되며 즉시 삭제되지 않습니다.

앱 내 삭제 작업은 GDPR 제17조 및 KVKK 제11조(e)에 따른 삭제권의 공식적인 행사입니다. 계정에 접근할 수 없는 경우 **privacy@safescribe.dev**로 연락하여 이메일로 삭제 요청을 제출하세요.

---

<span class="section-label">오디오 처리</span>
## 제로 디스크 정책
{: #zero-disk}

<div class="flow-diagram">
오디오:  업로드 --> RAM --> AI 전사 --> 전달 --> 삭제
                                              (즉각적)

디스크:  잔액 기록만 — 오디오 없음, 전사 텍스트 없음, 이메일 없음
</div>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>RAM만 사용</strong><span class="item-desc">오디오는 휘발성 메모리에서만 처리</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>디스크에 기록 안 함</strong><span class="item-desc">임시로도 마찬가지</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>AI 훈련 없음</strong><span class="item-desc">오디오는 절대 모델 개선에 사용되지 않음</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>자체 호스팅 AI</strong><span class="item-desc">제3자 AI 서비스가 오디오를 받지 않음</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>TTL 안전장치</strong><span class="item-desc">삭제 코드가 실패해도 데이터 자동 소멸</span></span></li>
</ul>

---

<span class="section-label">인증</span>
## Google 또는 Apple로 로그인
{: #sign-in}

Google Sign-In 및 Sign in with Apple을 통해 OpenID Connect (OIDC)를 사용합니다.

| 제공업체가 전송하는 정보 | 저희의 처리 방식 |
|---------------------------|-------------------|
| 계정 ID | 해시 처리 (SHA-256 + 솔트) — 원본 값 폐기 |
| 이메일 주소 | 인증에만 사용 — **저장하지 않음** |
| 표시 이름 | **저장하지 않음** |

연락처, 캘린더 또는 기타 계정 데이터에 접근하지 않습니다.

---

<span class="section-label">결제</span>
## 앱 스토어를 통한 청구
{: #billing}

결제는 Apple App Store 또는 Google Play Store에서 전적으로 처리합니다. SafeScribe는 신용카드 번호나 결제 정보를 **수신, 저장 또는 처리하지 않습니다**. 잔액 확인을 위한 구매 영수증만 수신합니다.

<div class="callout callout-info">
  <strong>Apple 또는 Google이 보유하는 결제 기록</strong>은 SafeScribe의 통제 범위 밖이며 SafeScribe의 계정 삭제 프로세스에 포함되지 않습니다. 해당 기록을 관리하려면 <a href="https://support.apple.com">Apple 지원</a> 또는 <a href="https://support.google.com/googleplay">Google Play 지원</a>에 직접 문의하세요.
</div>

---

<span class="section-label">오류 추적</span>
## 충돌 보고서 (선택 사항)

선택적 충돌 보고서는 SafeScribe 자체 충돌 보고 엔드포인트로 전송됩니다. **기본적으로 비활성화**되어 있으며 개인정보 보호 설정에서 언제든지 변경할 수 있습니다.

보고서 전송 전 다음 항목이 자동으로 제거됩니다:

**제거됨:** 이메일 주소 · 전화번호 · IP 주소 · 파일 경로 · 인증 토큰

**보존됨:** 오류 유형 및 스택 추적 · 기기 모델 · OS 버전 · 앱 버전

---

<span class="section-label">제3자</span>
## 제3자 서비스
{: #third-parties}

다음 서비스를 사용합니다. 명시된 내용 외의 오디오, 전사 내용 또는 개인 정보는 제3자와 공유되지 않습니다.

| 서비스 | 목적 | 공유 데이터 | 개인정보 처리방침 |
|---------|---------|------------|---------------|
| Google Sign-In | 인증 | OIDC 토큰만 | [policies.google.com/privacy](https://policies.google.com/privacy) |
| Apple Sign-In | 인증 | OIDC 토큰만 | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Apple App Store | 인앱 구매 | 구매 영수증만 | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Google Play Store | 인앱 구매 | 구매 영수증만 | [policies.google.com/privacy](https://policies.google.com/privacy) |
| SafeScribe 충돌 보고 엔드포인트 | 충돌 보고 (옵트인) | 익명 오류 보고서 — 개인 정보 제거됨 | SafeScribe 자체 운영, 제3자 없음 |

---

<span class="section-label">법적 근거</span>
## 처리의 법적 근거

| 처리 활동 | GDPR 근거 | KVKK 근거 (터키) | 필수 여부 |
|--------------------|-----------|-----------|---------|
| 오디오 전사 | 제6(1)(b)조 — 계약 | 명시적 동의 | 서비스 이용에 필수 |
| 계정 및 청구 | 제6(1)(b)조 — 계약 | 계약 이행 | 서비스 이용에 필수 |
| 인증 (OIDC) | 제6(1)(b)조 — 계약 | 계약 이행 | 서비스 이용에 필수 |
| 인앱 구매 | 제6(1)(b)조 — 계약 | 계약 이행 | 구매에 필수 |
| 충돌 보고 | 제6(1)(a)조 — 동의 | 명시적 동의 | 선택 사항 |

전사, 인증, 청구를 위한 데이터 제공은 SafeScribe 이용에 **필수**입니다. 충돌 보고는 **선택 사항** — 서비스는 이 없이도 완전히 작동합니다.

---

<span class="section-label">귀하의 권리</span>
## 할 수 있는 것
{: #your-rights}

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>접근</strong><span class="item-desc">언제든지 앱에서 모든 전사 결과 확인</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>삭제</strong><span class="item-desc">개인정보 보호 설정에서 개별 전사 결과 또는 전체 계정 삭제; 계정 삭제는 어떤 데이터베이스에도 행을 남기지 않습니다</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>내보내기</strong><span class="item-desc">전사 결과 공유 또는 내보내기, 혹은 개인정보 보호 설정에서 전체 데이터 내보내기 요청</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>진단 거부</strong><span class="item-desc">개인정보 보호 설정에서 충돌 보고 비활성화</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>동의 철회</strong><span class="item-desc">언제든지 로그아웃하고 계정 삭제</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>CCPA 옵트아웃</strong><span class="item-desc">개인정보 보호 설정에서 "판매 또는 공유 안 함" 전환</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>자동화된 결정 없음</strong><span class="item-desc">법적 또는 유사한 중요한 영향을 미치는 프로파일링을 포함하여 귀하에 관한 자동화된 결정을 내리지 않습니다 (GDPR 제22조)</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>민원 제기</strong><span class="item-desc">EU/EEA 거주자는 해당 국가 감독 기관에 연락할 수 있습니다 (<a href="https://www.edpb.europa.eu/about-edpb/about-edpb/members_en">edpb.europa.eu</a>); 터키 거주자는 KVKK에 연락할 수 있습니다 (<a href="https://www.kvkk.gov.tr">kvkk.gov.tr</a>)</span></span></li>
</ul>

앱에서 완료할 수 없는 요청은 **privacy@safescribe.dev**로 연락해 주세요.

---

<span class="section-label">법적 사항</span>
## 추가 정보

**데이터 컨트롤러.** SafeScribe는 터키에 거주하는 독립 개발자가 운영합니다. 연락처: privacy@safescribe.dev. 데이터 보호 책임자(DPO)는 임명되지 않았습니다 — 처리가 대규모로 수행되지 않으며 특수 범주 데이터가 체계적으로 보유되지 않습니다(오디오는 RAM에서만 일시적으로 처리되며 디스크에 저장되지 않음).

**백업.** 서비스 연속성을 위해 계정 기록(가명 ID, 잔액, 사용 통계)의 단일 일일 백업이 유지됩니다. 각 백업은 이전 백업을 덮어씁니다. 계정 삭제로 삭제된 데이터는 즉시 실시간 시스템에서 제거되고 24시간 이내에 백업에서도 제거됩니다.

**국제 전송.** EU/EEA에서 SafeScribe를 이용하는 경우, 귀하의 오디오와 계정 데이터는 터키의 서버에서 처리됩니다. 터키는 현재 <a href="https://commission.europa.eu/law/law-topic/data-protection/international-dimension-data-protection/adequacy-decisions_en">EU 적절성 결정</a>을 보유하고 있지 않습니다. 전송은 첫 실행 시 귀하의 명시적이고 충분한 정보에 근거한 동의로 커버됩니다 (GDPR 제49(1)(a)조). 터키(KVKK — 터키 개인정보보호법) 사용자의 경우, 국경 간 전송은 KVKK 제9조에 따른 첫 실행 시 명시적 동의로 승인됩니다.

**아동.** SafeScribe는 App Store 및 Google Play에서 17세 이상으로 등급이 매겨져 있으며 17세 미만 아동을 대상으로 하지 않습니다. 미성년자로부터 의도적으로 데이터를 수집하지 않습니다. 법적 완전한 권리 능력 연령이 18세인 법역(터키 포함)에서는 17세 사용자가 앱을 사용하기 전에 부모 또는 보호자의 동의가 필요합니다.

**정책 변경.** 당사 관행이 변경될 때 이 페이지를 업데이트합니다. 위의 "최종 업데이트" 날짜가 최신 개정 사항을 반영합니다.

---

<span class="section-label">문의</span>
## 연락처

| 주제 | 연락처 |
|-------|---------|
| 개인정보 요청, 데이터 삭제, 권리 | privacy@safescribe.dev |
| 보안 취약점 | security@safescribe.dev |
| 일반 지원 | support@safescribe.dev |

---


</div>
