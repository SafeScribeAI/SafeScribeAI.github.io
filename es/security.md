---
layout: default
title: SafeScribe — Arquitectura de Seguridad
description: Cómo SafeScribe protege tus datos de audio — descripción técnica de nuestro enfoque Privacy by Design.
lang: es
---

<div class="page-content" markdown="1">

# Arquitectura de Seguridad

<div class="summary-box">
  <strong>En resumen:</strong> SafeScribe procesa tus datos de audio exclusivamente en la memoria RAM del servidor. En cuanto se entrega tu transcripción, todos los datos se eliminan de forma permanente. Sin escrituras en disco, sin copias de seguridad, sin copias — nunca. Esta página explica cómo funciona cada capa de protección.
</div>

<p class="page-meta">Última actualización: marzo de 2026</p>

---

<span class="section-label">Visión general</span>
## Seis Capas de Protección

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f510;</div>
    <h4>Capa 1 — Transporte</h4>
    <p>Cifrado TLS 1.2+ y certificate pinning en cada conexión. Ningún proxy puede interceptar los datos.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9e0;</div>
    <h4>Capa 2 — Solo RAM</h4>
    <p>El audio nunca toca el disco. Procesamiento en memoria volátil, eliminación inmediata tras la transcripción.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f464;</div>
    <h4>Capa 3 — Identidad seudónima</h4>
    <p>Tu correo y nombre nunca se almacenan. Solo se conserva un hash unidireccional de tu identificador de cuenta.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f512;</div>
    <h4>Capa 4 — Cifrado local</h4>
    <p>Almacenamiento AES-256 en el dispositivo. Claves exclusivamente en almacenamiento seguro por hardware (iOS Keychain / Android Keystore).</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>Capa 5 — Eliminación de DCP</h4>
    <p>Los informes de fallos se depuran de datos personales antes de salir de tu dispositivo.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f5d1;</div>
    <h4>Capa 6 — Eliminación en cascada</h4>
    <p>Cada paso del procesamiento elimina de inmediato los datos del paso anterior. TTL de seguridad como respaldo.</p>
  </div>
</div>

---

<span class="section-label">Principio de diseño</span>
## Procesar, Entregar, Eliminar

Los servicios de transcripción convencionales escriben el audio en disco y pueden conservarlo indefinidamente. SafeScribe recibe el audio en RAM, lo procesa y lo elimina en cuanto recibes tu transcripción — ningún byte se escribe en almacenamiento permanente. El <a href="#your-datas-journey">diagrama de flujo de datos</a> a continuación muestra el proceso completo.

La diferencia clave: incluso si el servidor fuera incautado físicamente, no habría datos de audio ni de transcripción — solo existían en memoria volátil.

---

<span class="section-label">Capa 1</span>
## Seguridad en el Transporte

| Protección | Qué previene |
|------------|--------------|
| Cifrado TLS 1.2+ | Interceptación del tráfico de red |
| Certificate pinning | Ataques man-in-the-middle, servidores fraudulentos |
| Suma de verificación SHA-256 | Alteración de la transcripción en tránsito |

La app incluye una huella criptográfica del certificado del servidor SafeScribe. Aunque una autoridad de certificación fuera comprometida, la app rechazaría cualquier conexión que no lleve al servidor real de SafeScribe.

<div class="callout callout-green">
  <strong>Verificable:</strong> Wireshark permite confirmar que todo el tráfico de SafeScribe está cifrado con TLS. Cualquier intento de interceptación mediante un proxy falla — el certificate pinning rechaza el certificado del proxy.
</div>

---

<span class="section-label">Capa 2</span>
## Procesamiento en Servidor Solo en RAM

Este es el núcleo del diseño de privacidad de SafeScribe. El servidor ejecuta los pesos del modelo Whisper de OpenAI a través del motor de inferencia auto-alojado <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> — sin llamadas a APIs de terceros. El almacenamiento de datos está configurado para operación completamente volátil, sin persistencia en disco.

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> Un reinicio del servidor elimina permanentemente todos los datos en memoria — por diseño</li>
  <li><span class="check-mark">&#x2713;</span> Ningún archivo, copia de seguridad ni registro contiene tus datos de audio</li>
  <li><span class="check-mark">&#x2713;</span> Un análisis forense del servidor no revelaría ningún contenido de audio</li>
</ul>

**Almacenamiento temporal en servidor (solo RAM):**

| Datos | Eliminados cuándo |
|-------|------------------|
| Bytes de audio | Transcripción completada |
| Texto de transcripción | Recepción confirmada |
| Metadatos del trabajo | Recepción confirmada |

**Almacenamiento permanente en servidor (en disco):**

| Datos | Finalidad | ¿Contiene DCP? |
|-------|-----------|----------------|
| Identificador seudónimo | Registro de facturación | No — hash unidireccional, no reversible |
| Duración y coste | Registro financiero | No |
| Tamaño del archivo (bytes) | Análisis del servicio | No |
| Recuento de palabras | Análisis del servicio | No |
| Marcas de tiempo | Pista de auditoría | No |

<div class="callout callout-green">
  <strong>Por diseño:</strong> No existe función de "volver a descargar". Una vez confirmada la recepción, los datos han desaparecido — no hay nada que recuperar.
</div>

---

<span class="section-label">Capa 3</span>
## Identidad Seudónima

SafeScribe usa Google Sign-In y Sign in with Apple. Tus datos personales nunca se almacenan:

| Lo que el proveedor de autenticación nos envía | Lo que almacenamos |
|------------------------------------------------|--------------------|
| Dirección de correo electrónico | **No almacenado** |
| Nombre visible | **No almacenado** |
| Identificador de cuenta | Solo hash criptográfico unidireccional |

El hash unidireccional de tu identificador:

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> No puede revertirse para revelar tu identidad</li>
  <li><span class="check-mark">&#x2713;</span> Es único para ti — usado exclusivamente para facturación</li>
  <li><span class="check-mark">&#x2713;</span> No contiene ninguna información personal</li>
</ul>

<div class="callout callout-green">
  <strong>Verificable:</strong> Inspecciona el tráfico de red de la app. Tras la autenticación, ninguna solicitud contiene tu correo ni nombre — solo un token Bearer que el servidor valida internamente.
</div>

---

<span class="section-label">Capa 4</span>
## Cifrado Local

Las transcripciones almacenadas en tu dispositivo están protegidas por:

| Protección | Tecnología |
|------------|------------|
| Cifrado | AES-256 |
| Almacenamiento de claves | iOS Keychain / Android Keystore |
| Base de datos | Contenedores cifrados |

Incluso con acceso directo al sistema de archivos, los datos de transcripción aparecen como binario ilegible. La clave reside en almacenamiento seguro por hardware, fuera de los archivos de la app. Desinstalar la app destruye la clave de forma permanente.

---

<span class="section-label">Capa 5</span>
## Eliminación de DCP en Diagnósticos

Si la app encuentra un error, puede enviarse opcionalmente un informe de fallos. Antes de salir de tu dispositivo, se eliminan automáticamente:

<div class="callout callout-info">
  <strong>Eliminado antes del envío:</strong> Direcciones de correo · Números de teléfono · Direcciones IP · Rutas de archivos · Tokens de autenticación · Identificadores de trabajos
</div>

<div class="callout callout-green">
  <strong>Contenido del informe:</strong> Tipo de error y stack trace · Modelo de dispositivo · Versión del sistema operativo · Versión de la app
</div>

Puedes desactivar completamente los informes de fallos en la configuración de privacidad de la app.

---

<span class="section-label">Capa 6</span>
## Eliminación en Cascada

Cada paso del procesamiento elimina de inmediato los datos del paso anterior: el audio se elimina tras la transcripción, la transcripción se elimina tras la confirmación. El <a href="#your-datas-journey">diagrama de flujo de datos</a> muestra el proceso completo con todos los puntos de eliminación.

No es un proceso de limpieza en segundo plano. La eliminación ocurre de inmediato como parte del pipeline de procesamiento.

<div class="callout callout-info">
  <strong>Seguridad de respaldo:</strong> Incluso si el proceso de eliminación normal falla (error de red, fallo de la app), cada elemento de datos en la RAM del servidor tiene una expiración automática. Los datos se autodestruyen — pase lo que pase.
</div>

---

<span class="section-label">Recorrido completo</span>
## Recorrido de tus Datos
{: #your-datas-journey}

<div class="flow-diagram">
Tu Dispositivo               Servidor SafeScribe           Tu Dispositivo
--------------               -------------------           --------------

Grabar/seleccionar audio
    |
Preprocesar localmente
    |
Cifrar+subir --------TLS---> Recibir en RAM
                                   |
                               Transcripción IA
                               (solo RAM)
                                   |
                               Audio ELIMINADO
                                   |
Recibir transcripción  <-TLS- Enviar transcripción
    |                              |
Verificar integridad           Esperar confirmación
    |                              |
Almacenar cifrado  Confirmar-> Transcripción ELIMINADA
localmente (AES-256)          Metadatos ELIMINADOS
    |                              |
Listo                          CERO datos restantes
</div>

---

<span class="section-label">Transparencia</span>
## Verificación Independiente

Animamos a investigadores de seguridad y defensores de la privacidad a verificar nuestras afirmaciones:

<ul class="verify-steps">
  <li><span><strong>Análisis de red</strong> Wireshark o Charles Proxy permiten confirmar que todo el tráfico de SafeScribe está cifrado con TLS; cualquier intento de interceptación queda bloqueado por el certificate pinning.</span></li>
  <li><span><strong>Evaluaciones publicadas</strong> Nuestra <a href="dpia">Evaluación de Impacto de Protección de Datos</a> contiene el análisis completo de riesgos y el registro de decisiones.</span></li>
  <li><span><strong>Divulgación responsable</strong> ¿Has descubierto una vulnerabilidad? Contacta con <a href="mailto:security@safescribe.dev">security@safescribe.dev</a>.</span></li>
</ul>

</div>
