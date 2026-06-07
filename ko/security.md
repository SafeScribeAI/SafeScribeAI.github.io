---
layout: default
title: SafeScribe — 보안 아키텍처
description: SafeScribe가 오디오 데이터를 보호하는 방법 — 개인정보 보호 설계(Privacy by Design) 방식에 대한 기술적 개요.
lang: ko
---

<div class="page-content" markdown="1">

# 보안 아키텍처

<div class="summary-box">
  <strong>요약:</strong> SafeScribe는 오디오 데이터를 서버의 RAM(랜덤 액세스 메모리)에서만 처리합니다. 전사본이 전달되는 즉시 모든 데이터가 영구 삭제됩니다. 디스크 저장 없음, 백업 없음, 복사본 없음 — 절대로. 이 페이지에서는 각 보호 레이어의 작동 방식을 설명합니다.
</div>

<p class="page-meta">최종 업데이트: 2026년 3월</p>

---

<span class="section-label">개요</span>
## 6가지 보호 레이어

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f510;</div>
    <h4>레이어 1 — 전송</h4>
    <p>모든 연결에 TLS 1.3 암호화 적용. 트래픽은 예외 없이 종단간 암호화됩니다.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9e0;</div>
    <h4>레이어 2 — RAM 전용</h4>
    <p>오디오는 절대 디스크에 접촉하지 않습니다. 휘발성 메모리에서 처리 후 전사 완료 즉시 삭제합니다.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f464;</div>
    <h4>레이어 3 — 가명 신원</h4>
    <p>이메일과 이름은 절대 저장되지 않습니다. 계정 ID의 단방향 해시만 보관됩니다.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f512;</div>
    <h4>레이어 4 — 로컬 암호화</h4>
    <p>기기의 AES-256 암호화 저장소. 키는 하드웨어 보안 저장소(iOS Keychain / Android Keystore)에만 보관됩니다.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>레이어 5 — 개인정보 제거</h4>
    <p>충돌 보고서는 기기를 떠나기 전 개인 데이터가 자동으로 삭제됩니다.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f5d1;</div>
    <h4>레이어 6 — 연쇄 삭제</h4>
    <p>각 처리 단계가 이전 단계의 데이터를 즉시 삭제합니다. TTL이 안전 장치로 작동합니다.</p>
  </div>
</div>

---

<span class="section-label">설계 원칙</span>
## 처리, 전달, 삭제

기존 전사 서비스는 오디오를 디스크에 기록하고 무기한 보관할 수 있습니다. SafeScribe는 RAM에서 오디오를 수신, 처리하고 전사본을 전달하는 즉시 삭제합니다 — 영구 저장소에는 어떤 바이트도 기록되지 않습니다. 전체 흐름은 아래 <a href="#your-datas-journey">데이터 흐름 다이어그램</a>을 참조하세요.

핵심 차이점: 서버가 물리적으로 압수되더라도 오디오나 전사본 데이터는 존재하지 않습니다 — 그것들은 휘발성 메모리에만 존재했기 때문입니다.

---

<span class="section-label">레이어 1</span>
## 전송 보안

| 보호 수단 | 방지 대상 |
|---------|---------|
| TLS 1.3 암호화 | 네트워크 트래픽 도청 |
| SHA-256 무결성 체크섬 | 전송 중 전사본 변조 |

<div class="callout callout-green">
  <strong>검증 가능:</strong> Wireshark를 사용해 모든 SafeScribe 트래픽이 TLS 암호화되어 있음을 확인할 수 있습니다.
</div>

---

<span class="section-label">레이어 2</span>
## 서버 RAM 전용 처리

이것이 SafeScribe 개인정보 보호 설계의 핵심입니다. 서버는 자체 호스팅 추론 엔진 <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a>를 통해 OpenAI Whisper 모델 가중치를 실행합니다 — 제3자 API 호출 없음. 데이터 저장소는 디스크 영속성 없이 완전 휘발성 동작으로 구성되어 있습니다.

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> 서버 재시작 시 모든 메모리 내 데이터가 영구 삭제됩니다 — 설계상 의도</li>
  <li><span class="check-mark">&#x2713;</span> 어떤 파일, 백업, 로그에도 오디오 데이터가 포함되지 않습니다</li>
  <li><span class="check-mark">&#x2713;</span> 서버 포렌식 분석에서 오디오 콘텐츠가 발견되지 않습니다</li>
</ul>

**서버 임시 저장(RAM만):**

| 데이터 | 삭제 시점 |
|------|---------|
| 오디오 바이트 | 전사 완료 후 |
| 전사 텍스트 | 수신 확인 후 |
| 작업 메타데이터 | 수신 확인 후 |

**서버 영구 저장(디스크):**

| 데이터 | 목적 | 개인정보 포함 여부 |
|------|-----|---------------|
| 가명 사용자 ID | 청구 기록 | 아니오 — 단방향 해시, 역산 불가 |
| 처리 시간 및 비용 | 재무 기록 | 아니오 |
| 파일 크기(바이트) | 서비스 분석 | 아니오 |
| 단어 수 | 서비스 분석 | 아니오 |
| 타임스탬프 | 감사 추적 | 아니오 |

<div class="callout callout-green">
  <strong>설계상 특성:</strong> '다시 다운로드' 기능이 없습니다. 수신 확인 후 데이터는 사라집니다 — 되찾을 수 있는 것이 없습니다.
</div>

---

<span class="section-label">레이어 3</span>
## 가명 신원

SafeScribe는 Google 로그인과 Sign in with Apple을 사용합니다. 개인 데이터는 절대 저장되지 않습니다:

| 인증 제공자가 전달하는 내용 | 저장하는 내용 |
|----------------------|-----------|
| 이메일 주소 | **저장 안 함** |
| 표시 이름 | **저장 안 함** |
| 계정 ID | 단방향 암호화 해시만 |

계정 ID의 단방향 해시는:

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> 역산하여 신원을 밝히는 것이 불가능합니다</li>
  <li><span class="check-mark">&#x2713;</span> 고객님에게만 고유합니다 — 청구 목적으로만 사용</li>
  <li><span class="check-mark">&#x2713;</span> 어떠한 개인 정보도 포함하지 않습니다</li>
</ul>

<div class="callout callout-green">
  <strong>검증 가능:</strong> 앱의 네트워크 트래픽을 검사해 보세요. 인증 후 어떤 요청에도 이메일이나 이름이 포함되지 않습니다 — 서버가 내부적으로 검증하는 Bearer 토큰만 있습니다.
</div>

---

<span class="section-label">레이어 4</span>
## 로컬 암호화

기기에 저장된 전사본은 다음으로 보호됩니다:

| 보호 | 기술 |
|----|-----|
| 암호화 | AES-256 |
| 키 저장소 | iOS Keychain / Android Keystore |
| 데이터베이스 | 암호화 컨테이너 |

파일 시스템에 직접 접근하더라도 전사본 데이터는 읽을 수 없는 바이너리로 나타납니다. 키는 앱 파일 외부의 하드웨어 보안 저장소에 있습니다. 앱 삭제 시 키가 영구적으로 파괴됩니다.

---

<span class="section-label">레이어 5</span>
## 진단 데이터에서 개인정보 제거

앱에 오류가 발생하면 선택적으로 충돌 보고서를 전송할 수 있습니다. 기기를 떠나기 전 다음 항목이 자동으로 제거됩니다:

<div class="callout callout-info">
  <strong>전송 전 제거:</strong> 이메일 주소 · 전화번호 · IP 주소 · 파일 경로 · 인증 토큰
</div>

<div class="callout callout-green">
  <strong>보고서 포함 내용:</strong> 오류 유형 및 스택 트레이스 · 기기 모델 · OS 버전 · 앱 버전
</div>

앱 개인정보 설정에서 충돌 보고서를 완전히 비활성화할 수 있습니다.

---

<span class="section-label">레이어 6</span>
## 연쇄 삭제

각 처리 단계가 이전 단계의 데이터를 즉시 삭제합니다: 오디오는 전사 후 삭제되고, 전사본은 확인 후 삭제됩니다. <a href="#your-datas-journey">데이터 흐름 다이어그램</a>에서 모든 삭제 지점이 포함된 전체 흐름을 확인할 수 있습니다.

이는 백그라운드 정리 작업이 아닙니다. 삭제는 처리 파이프라인의 일부로 즉시 이루어집니다.

<div class="callout callout-info">
  <strong>안전 장치:</strong> 정상적인 삭제 프로세스가 실패하더라도(네트워크 오류, 앱 충돌) 서버 RAM의 각 데이터 항목에는 자동 만료 시간이 있습니다. 데이터는 어떤 상황에서도 자동으로 삭제됩니다.
</div>

---

<span class="section-label">전체 흐름</span>
## 데이터 여정
{: #your-datas-journey}

<div class="flow-diagram">
사용자 기기                  SafeScribe 서버               사용자 기기
--------                    ---------------               --------

오디오 녹음/선택
    |
기기에서 전처리
    |
암호화+업로드 ---TLS---------> RAM으로 수신
                                   |
                               AI 전사
                               （RAM 전용）
                                   |
                               오디오 삭제됨
                                   |
전사본 수신      <---TLS------  전사본 전송
    |                              |
무결성 확인                    확인 대기
    |                              |
암호화하여   확인 ------------>  전사본 삭제됨
로컬 저장                      작업 메타데이터 삭제됨
（AES-256）                        |
    |                         데이터 없음
완료
</div>

---

<span class="section-label">투명성</span>
## 독립적 검증

보안 연구자와 개인정보 옹호자들이 저희의 주장을 검증해 주시기 바랍니다:

<ul class="verify-steps">
  <li><span><strong>네트워크 분석</strong> Wireshark 또는 Charles Proxy를 통해 모든 SafeScribe 트래픽이 TLS 암호화되어 있음을 확인할 수 있습니다.</span></li>
  <li><span><strong>공개된 평가서</strong> 저희의 <a href="dpia">데이터 보호 영향 평가</a>에는 완전한 위험 분석과 결정 기록이 포함되어 있습니다.</span></li>
  <li><span><strong>책임감 있는 공개</strong> 취약점을 발견하셨나요? <a href="mailto:security@safescribe.dev">security@safescribe.dev</a>로 연락해 주세요.</span></li>
</ul>

</div>
