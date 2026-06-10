---
layout: default
title: SafeScribe — Evaluación de Impacto de Protección de Datos
description: Evaluación formal de riesgos del servicio de transcripción de audio SafeScribe bajo el RGPD y la KVKK.
lang: es
---

<div class="page-content" markdown="1">

# Evaluación de Impacto de Protección de Datos

<div class="summary-box">
  <strong>Conclusión principal:</strong> Dado que el audio se procesa en memoria volátil y se elimina de inmediato — y no quedan datos personales en nuestros servidores tras el procesamiento — todos los riesgos identificados se reducen a <strong>Bajo</strong> tras aplicar las medidas de mitigación. El tratamiento puede realizarse bajo las bases legales y salvaguardas documentadas.
</div>

<p class="page-meta">SafeScribe Transcripción de Audio IA · Versión 1.0 · Marzo de 2026 · Evaluación previa al lanzamiento · Revisión prevista: 6 meses tras el lanzamiento</p>

---

<span class="section-label">Sección 1</span>
## Descripción del Tratamiento

### Qué tratamos y por qué

| Finalidad | Datos tratados | Base legal (RGPD) | Base KVKK (Turquía) |
|-----------|---------------|-------------------|-----------|
| Transcripción de audio | Archivo de audio (solo RAM, eliminado tras el procesamiento) | Art. 6(1)(b) — Ejecución de contrato | Consentimiento explícito |
| Cuenta y facturación | Identificador seudónimo, saldo, metadatos de uso | Art. 6(1)(b) — Ejecución de contrato | Consentimiento explícito |
| Autenticación | Identificador OIDC (hasheado, original descartado) | Art. 6(1)(b) — Ejecución de contrato | Ejecución de contrato |
| Compra integrada | Recibo IAP del App Store / Play Store | Art. 6(1)(b) — Ejecución de contrato | Ejecución de contrato |
| Confirmación de edad | Confirmación de edad declarada (17+) | Art. 8 RGPD / Art. 6 KVKK | Obligación legal |
| Informes de fallos | Informes de error anonimizados (opt-in, DCP eliminadas) | Art. 6(1)(a) — Consentimiento | Consentimiento explícito |

### Inventario de datos

| Datos | Retención en servidor |
|-------|----------------------|
| Archivo de audio | Solo RAM — eliminado tras la transcripción |
| Texto de transcripción | Hasta confirmación del cliente (TTL de 24 horas en el servidor si no se recibe ACK) |
| Identificador seudónimo | Hasta eliminación de la cuenta |
| Saldo + metadatos de uso | Hasta eliminación de la cuenta |
| Dirección de correo electrónico | Solo tránsito — **no almacenada** |
| Direcciones IP | Solo tránsito — **no registradas** |
| Informes de fallos (opt-in) | Endpoint propio de informes de fallos de SafeScribe — no compartido con terceros |

<p>Para el inventario completo de datos, consulta la <a href="privacy#data-we-collect">Política de Privacidad § Datos que recopilamos</a>.</p>

<div class="callout callout-info">
  <strong>Metadatos por trabajo</strong>: duración del audio (segundos), tamaño del archivo (bytes), recuento de palabras, importe cobrado (USD) y marcas de tiempo de procesamiento. No contienen contenido de audio, texto de transcripción ni información que identifique al usuario.
</div>

<div class="callout callout-info">
  <strong>Retención de copias de seguridad.</strong> Se conserva una copia de seguridad diaria de los registros de cuenta para la continuidad del servicio. Cada copia sobrescribe la anterior. Los datos eliminados al suprimir la cuenta se retiran de los sistemas activos de inmediato y de la copia de seguridad en 24 horas — ninguna copia persiste más allá de ese período.
</div>

### Flujo de procesamiento

<div class="flow-diagram">
1. El usuario graba o selecciona audio en su dispositivo
2. Preprocesamiento de audio en el dispositivo (filtro paso alto 80 Hz, recorte de silencio inicial, normalización de loudness a -16 LUFS, limitación de pico, remuestreo a 16 kHz, codificación FLAC)
3. Subida cifrada a los servidores SafeScribe (TLS 1.3)
4. El servidor procesa el audio en RAM — auto-alojado, un potente modelo de la familia Whisper mediante <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> / CTranslate2, sin llamadas a APIs de terceros
5. La transcripción se devuelve con suma de verificación de integridad SHA-256
6. El cliente verifica la suma de verificación y confirma la recepción
7. El servidor elimina de inmediato la transcripción y el audio de la RAM
8. La transcripción se almacena localmente en el dispositivo en almacenamiento cifrado AES-256
</div>

---

<span class="section-label">Sección 2</span>
## Necesidad y Proporcionalidad

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>La subida de audio es necesaria</strong><span class="item-desc">el procesamiento IA en servidor ofrece mayor precisión que las alternativas actuales en dispositivo, al nivel de calidad que SafeScribe requiere</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>La autenticación es necesaria</strong><span class="item-desc">requerida para la facturación por usuario y el aislamiento de trabajos</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Los informes de fallos son proporcionales</strong><span class="item-desc">las DCP se eliminan antes de la transmisión; solo opt-in</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Minimización de datos</strong><span class="item-desc">el audio se procesa solo en RAM, nunca se escribe en disco</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Retención mínima</strong><span class="item-desc">las transcripciones se eliminan inmediatamente al confirmar; TTL de 24 horas en el servidor si el cliente no confirma nunca</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Sin uso secundario</strong><span class="item-desc">el audio nunca se usa para entrenamiento de modelos ni análisis</span></span></li>
</ul>

### Derechos de los interesados

Todos los derechos de los interesados bajo el RGPD y la KVKK (acceso, rectificación, supresión, limitación, portabilidad, oposición y retirada del consentimiento) pueden ejercerse en la app o contactando con privacy@safescribe.dev. Los derechos y su implementación se detallan en nuestra <a href="privacy#what-you-can-do">Política de Privacidad § Lo que puedes hacer</a>.

---

<span class="section-label">Sección 3</span>
## Evaluación de Riesgos

### Riesgos identificados y medidas de mitigación

| Riesgo | Inherente | Medidas de mitigación | Residual |
|--------|-----------|----------------------|---------|
| El audio contiene datos personales sensibles (salud, legal, financiero) | **Alto** | Procesamiento solo en RAM; eliminación inmediata; sin almacenamiento persistente; sin acceso de terceros | **Bajo** |
| Acceso no autorizado a la transcripción en tránsito | Medio | TLS 1.3; suma de verificación SHA-256 | **Bajo** |
| Brecha en servidor que exponga audio o transcripciones | Medio | Sin almacenamiento persistente de audio; API autenticada; aislamiento por trabajo; TTL de seguridad | **Bajo** |
| Acceso no autorizado al almacenamiento local cifrado | Bajo | Contenedores cifrados AES-256; clave en iOS Keychain / Android Keystore | **Bajo** |
| Filtración de DCP a través de informes de fallos | Bajo | Depuración por patrones de correos, teléfonos, IPs y tokens antes de enviar al endpoint propio de informes de fallos de SafeScribe | **Bajo** |
| Transferencia de datos transfronteriza | Medio | Turquía (KVKK — Ley turca de protección de datos personales) consentimiento explícito en el primer inicio; consentimiento explícito e informado en el primer inicio conforme al art. 49(1)(a) del RGPD | **Bajo** |
| IA genera transcripción imprecisa de contenido sensible | Bajo | La transcripción es solo informativa; el usuario revisa todos los resultados; sin decisiones automatizadas | **Bajo** |

<div class="callout callout-green">
  <strong>Todos los riesgos residuales son Bajos.</strong> El principal factor de riesgo — el contenido de audio sensible — se aborda a nivel arquitectónico: el audio nunca se escribe en disco, nunca se retiene más allá del procesamiento y nunca se comparte con terceros.
</div>

---

<span class="section-label">Sección 4</span>
## Consentimiento y Transparencia

Antes del primer uso, se presenta a los usuarios una pantalla de consentimiento granular con cuatro tarjetas independientes:

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f3a4;</div>
    <h4>Procesamiento de Audio <em class="u-label-light">(obligatorio)</em></h4>
    <p>Explica el procesamiento solo en RAM, la eliminación inmediata y que el audio nunca se escribe en disco ni se comparte con terceros.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f4ca;</div>
    <h4>Datos Almacenados <em class="u-label-light">(obligatorio)</em></h4>
    <p>Explica qué datos persistentes se conservan: identificador seudónimo, saldo de créditos y metadatos de uso anónimos.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9d2;</div>
    <h4>Confirmación de Edad <em class="u-label-light">(obligatorio)</em></h4>
    <p>Confirma que el usuario tiene 17 años o más. Las tarjetas obligatorias deben aceptarse para continuar.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>Informes de Fallos <em class="u-label-light">(opcional)</em></h4>
    <p>Permite el opt-in a informes de fallos anónimos. Desactivado por defecto. Puede cambiarse en cualquier momento desde Configuración de Privacidad.</p>
  </div>
</div>

- Los botones Aceptar y Rechazar tienen igual prominencia visual (conforme a las <a href="https://www.edpb.europa.eu/our-work-tools/our-documents/guidelines/guidelines-052020-consent-under-regulation-2016679_en">directrices EDPB</a> sobre dark patterns)
- Los usuarios pueden retirar el consentimiento y eliminar su cuenta en cualquier momento desde Configuración de Privacidad
- Esta EIPD se revisa anualmente o ante cambios significativos en el tratamiento
- Publicada en esta URL por transparencia pública

---

<span class="section-label">Sección 5</span>
## Decisión

<div class="callout callout-green">
  Basándose en la evaluación anterior, todos los riesgos residuales son <strong>Bajos</strong>. El tratamiento puede realizarse bajo las bases legales identificadas con las salvaguardas documentadas. No se requiere consulta previa con una autoridad de control.
</div>

---

<span class="section-label">Registro de revisiones</span>
## Historial de Versiones

| Fecha | Versión | Cambios |
|-------|---------|---------|
| Marzo de 2026 | 1.0 | EIPD inicial previa al lanzamiento que abarca el pipeline de transcripción de audio, el diseño de la pantalla de consentimiento, la evaluación de riesgos y la documentación de bases legales |

---

</div>
