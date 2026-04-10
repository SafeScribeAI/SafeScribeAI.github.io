---
layout: default
title: SafeScribe — 데이터 보호 영향 평가
description: GDPR 및 KVKK에 따른 SafeScribe 오디오 전사 서비스의 공식 위험 평가.
lang: ko
---

<div class="page-content" markdown="1">

# 데이터 보호 영향 평가

<div class="summary-box">
  <strong>주요 결론:</strong> 오디오가 휘발성 메모리에서 처리된 후 즉시 삭제되고 — 처리 후 서버에 개인 데이터가 남지 않으므로 — 완화 조치 적용 후 식별된 모든 위험이 <strong>낮음</strong>으로 감소합니다. 문서화된 법적 근거 및 보호 조치에 따라 처리를 진행할 수 있습니다.
</div>

<p class="page-meta">SafeScribe AI 오디오 전사 · 버전 1.0 · 2026년 3월 · 출시 전 평가 · 검토 예정: 출시 후 6개월</p>

---

<span class="section-label">제 1 절</span>
## 처리 설명

### 처리 내용 및 이유

| 목적 | 처리 데이터 | 법적 근거(GDPR) | KVKK 근거 |
|----|----------|--------------|---------|
| 오디오 전사 | 오디오 파일(RAM만, 처리 후 삭제) | 제6조(1)(b) — 계약 이행 | 명시적 동의 |
| 계정 및 청구 | 가명 사용자 ID, 잔액, 이용 메타데이터 | 제6조(1)(b) — 계약 이행 | 명시적 동의 |
| 인증 | OIDC 계정 ID(해시됨, 원본 폐기) | 제6조(1)(b) — 계약 이행 | 계약 이행 |
| 앱 내 구매 | App Store / Play Store IAP 영수증 | 제6조(1)(b) — 계약 이행 | 계약 이행 |
| 연령 확인 | 자기 신고 연령 확인(17세 이상) | GDPR 제8조 / KVKK 제6조 | 법적 의무 |
| 충돌 보고서 | 익명화된 오류 보고서(선택 가입, 개인정보 제거됨) | 제6조(1)(a) — 동의 | 명시적 동의 |

### 데이터 목록

| 데이터 | 서버 보존 |
|------|---------|
| 오디오 파일 | RAM만 — 전사 후 삭제 |
| 전사 텍스트 | 클라이언트 확인까지(약 수초) |
| 가명 사용자 ID | 계정 삭제까지 |
| 계정 잔액 + 이용 메타데이터 | 계정 삭제까지 |
| 이메일 주소 | 통과만 — **저장 안 함** |
| IP 주소 | 통과만 — **기록 안 함** |
| 충돌 보고서(선택 가입) | SafeScribe 자체 충돌 보고 엔드포인트 — 제3자와 공유하지 않음 |

<p>전체 데이터 목록은 <a href="privacy#data-we-collect">개인정보 처리방침 § 수집하는 데이터</a>를 참조하세요.</p>

<div class="callout callout-info">
  <strong>작업별 메타데이터</strong>에는 오디오 시간(초), 파일 크기(바이트), 단어 수, 청구 금액(USD), 처리 타임스탬프가 포함됩니다. 오디오 콘텐츠, 전사 텍스트 또는 사용자 식별 정보는 포함되지 않습니다.
</div>

<div class="callout callout-info">
  <strong>백업 보존.</strong> 서비스 연속성을 위해 계정 기록의 일일 백업 1개를 유지합니다. 각 백업은 이전 백업을 덮어씁니다. 계정 삭제로 삭제된 데이터는 라이브 시스템에서 즉시, 백업에서는 24시간 이내에 제거됩니다 — 이후에는 복사본이 남지 않습니다.
</div>

### 처리 흐름

<div class="flow-diagram">
1. 사용자가 기기에서 오디오를 녹음하거나 선택
2. 기기에서 오디오 전처리(200Hz 고역 통과 필터, 앞 묵음 트리밍, -16 LUFS 라우드니스 정규화, 피크 리미팅, 16kHz 리샘플링, FLAC 인코딩)
3. SafeScribe 서버에 암호화 업로드(TLS 1.2+)
4. 서버가 RAM에서 오디오 처리 — <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> / CTranslate2를 통한 자체 호스팅 Whisper 모델 가중치, 제3자 API 호출 없음
5. SHA-256 무결성 체크섬과 함께 전사본 반환
6. 클라이언트가 체크섬 검증 후 수신 확인
7. 서버가 RAM에서 전사본과 오디오를 즉시 삭제
8. 기기의 AES-256 암호화 저장소에 전사본 로컬 저장
</div>

---

<span class="section-label">제 2 절</span>
## 필요성 및 비례성

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>오디오 업로드는 필요합니다</strong><span class="item-desc">서버 측 AI 처리는 SafeScribe가 요구하는 품질 수준에서 현재 온디바이스 대안보다 높은 정확도를 제공합니다</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>인증은 필요합니다</strong><span class="item-desc">사용자별 청구 및 작업 격리에 필요합니다</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>충돌 보고서는 적절합니다</strong><span class="item-desc">전송 전 개인정보 제거; 선택 가입만</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>데이터 최소화</strong><span class="item-desc">오디오는 RAM에서만 처리되며 디스크에 기록되지 않습니다</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>최소 보존 기간</strong><span class="item-desc">전사본은 확인 후 수초 내에 삭제됩니다</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>이차 사용 없음</strong><span class="item-desc">오디오는 모델 훈련이나 분석에 절대 사용되지 않습니다</span></span></li>
</ul>

### 정보 주체의 권리

GDPR 및 KVKK에 따른 모든 정보 주체의 권리(열람, 정정, 삭제, 제한, 이동성, 이의 제기, 동의 철회)는 앱 내에서 또는 privacy@safescribe.dev에 연락하여 행사할 수 있습니다. 자세한 내용은 <a href="privacy#what-you-can-do">개인정보 처리방침 § 할 수 있는 것</a>을 참조하세요.

---

<span class="section-label">제 3 절</span>
## 위험 평가

### 식별된 위험 및 완화 조치

| 위험 | 고유 위험 | 완화 조치 | 잔여 위험 |
|----|---------|---------|---------|
| 오디오에 민감한 개인 데이터 포함(건강, 법률, 재무) | **높음** | RAM 전용 처리; 즉시 삭제; 영구 저장소 없음; 제3자 접근 없음 | **낮음** |
| 전송 중 전사본에 대한 무단 접근 | 중간 | TLS 1.2+; SHA-256 무결성 체크섬 | **낮음** |
| 서버 침해로 오디오 또는 전사본 노출 | 중간 | 영구 오디오 저장소 없음; 인증된 API; 작업 격리; TTL 안전 장치 | **낮음** |
| 로컬 암호화 저장소에 대한 무단 접근 | 낮음 | AES-256 암호화 컨테이너; iOS Keychain / Android Keystore의 키 | **낮음** |
| 충돌 보고서를 통한 개인정보 유출 | 낮음 | SafeScribe 자체 충돌 보고 엔드포인트 전송 전 이메일, 전화, IP, 토큰 패턴 기반 삭제 | **낮음** |
| 국경 간 데이터 전송 | 중간 | 최초 실행 시 KVKK 명시적 동의; 하위 처리자와 GDPR SCC | **낮음** |
| AI가 민감한 콘텐츠를 부정확하게 전사 | 낮음 | 전사는 정보 제공 목적만; 모든 출력을 사용자가 검토; 자동화된 의사결정 없음 | **낮음** |

<div class="callout callout-green">
  <strong>모든 잔여 위험은 낮음입니다.</strong> 주요 위험 요인인 민감한 오디오 콘텐츠는 아키텍처 수준에서 해결됩니다: 오디오는 디스크에 기록되지 않고, 처리 후 보존되지 않으며, 제3자와 공유되지 않습니다.
</div>

---

<span class="section-label">제 4 절</span>
## 동의 및 투명성

최초 사용 전 4개의 독립 카드로 구성된 세분화된 동의 화면이 표시됩니다:

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f3a4;</div>
    <h4>오디오 처리 <em style="font-weight:400;font-size:0.8rem;">（필수）</em></h4>
    <p>RAM 전용 처리, 즉시 삭제, 오디오가 디스크에 기록되지 않고 제3자와 공유되지 않음을 설명합니다.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f4ca;</div>
    <h4>저장 데이터 <em style="font-weight:400;font-size:0.8rem;">（필수）</em></h4>
    <p>보존되는 영구 데이터를 설명합니다: 가명 계정 ID, 크레딧 잔액, 익명 이용 메타데이터.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9d2;</div>
    <h4>연령 확인 <em style="font-weight:400;font-size:0.8rem;">（필수）</em></h4>
    <p>사용자가 만 17세 이상임을 확인합니다. 계속하려면 필수 카드에 동의해야 합니다.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>충돌 보고서 <em style="font-weight:400;font-size:0.8rem;">（선택）</em></h4>
    <p>익명 충돌 보고서 선택 가입을 허용합니다. 기본값 해제. 개인정보 설정에서 언제든지 변경 가능합니다.</p>
  </div>
</div>

- 동의 및 거부 버튼은 동일한 시각적 중요성을 가집니다(다크 패턴에 관한 <a href="https://www.edpb.europa.eu/our-work-tools/our-documents/guidelines/guidelines-052020-consent-under-regulation-2016679_en">EDPB 지침</a> 준수)
- 언제든지 개인정보 설정에서 동의를 철회하고 계정을 삭제할 수 있습니다
- 본 평가는 연 1회 또는 중요한 처리 변경 시 검토됩니다
- 공개 투명성을 위해 이 URL에 게시됩니다

---

<span class="section-label">제 5 절</span>
## 결정

<div class="callout callout-green">
  위의 평가를 바탕으로 모든 잔여 위험은 <strong>낮음</strong>입니다. 처리는 문서화된 보호 조치와 함께 식별된 법적 근거에 따라 진행될 수 있습니다. 감독 기관과의 사전 협의는 필요하지 않습니다.
</div>

---

<span class="section-label">검토 로그</span>
## 버전 이력

| 날짜 | 버전 | 변경 사항 |
|----|-----|---------|
| 2026년 3월 | 1.0 | 오디오 전사 파이프라인, 동의 화면 설계, 위험 평가, 법적 근거 문서화를 포함한 출시 전 초기 평가 |

---

</div>
