---
layout: default
title: SafeScribe — Política de privacidad
---

[English](../en/privacy) · [Türkçe](../tr/privacy) · [Deutsch](../de/privacy) · [Français](../fr/privacy) · **Español** · [Português](../pt/privacy) · [العربية](../ar/privacy) · [中文](../zh/privacy) · [日本語](../ja/privacy) · [한국어](../ko/privacy)

# Política de privacidad

**Última actualización:** Marzo 2026

## 1. Introducción

SafeScribe es una aplicación de transcripción con IA orientada a la privacidad. Esta política describe qué datos recopilamos, cómo los procesamos y sus derechos con respecto a su información personal.

## 2. Datos recopilados

| Categoría | Datos | Propósito |
|-----------|-------|-----------|
| Autenticación | ID de cuenta Google/Apple, correo electrónico | Identidad de cuenta, acceso API |
| Audio | Archivos de audio subidos | Procesamiento de transcripción |
| Transcripciones | Texto generado, segmentos | Entrega al usuario |
| Uso | Duración, costo, marcas de tiempo | Facturación y seguimiento |
| Diagnósticos | Informes de fallos, registros de errores | Estabilidad de la aplicación |

**No** recopilamos: contactos, ubicación, historial de navegación, identificadores de dispositivo para publicidad ni datos biométricos.

## 3. Procesamiento de audio — Política de cero disco

- El audio se procesa **exclusivamente en RAM** (memoria temporal) en nuestros servidores.
- El audio **nunca se escribe en disco** en ninguna etapa del procesamiento.
- Todos los datos de audio se **borran inmediatamente de la memoria** cuando la transcripción se completa o falla.
- No se crean copias, respaldos ni registros del contenido de audio.

## 4. Almacenamiento local

Todos los datos locales se almacenan en contenedores **cifrados con AES-256**. La clave de cifrado está protegida por el almacenamiento seguro nativo de la plataforma (Android Keystore / iOS Keychain).

**Datos almacenados en su dispositivo (cifrados):**

| Datos | Detalles | Retención |
|-------|----------|-----------|
| Transcripciones | Contenido de texto, segmentos con marca de tiempo, nombre de archivo, duración, costo, idioma detectado, hash del archivo | Hasta que los elimine o limpieza automática tras el período de retención configurado |
| Cola sin conexión | Ruta del archivo de audio, duración, idioma | Temporal — eliminado tras una subida exitosa |
| Configuración de la app | Idioma de transcripción, idioma de interfaz, estado de incorporación, consentimiento GDPR/Sentry con marca de tiempo | Hasta que cierre sesión o elimine su cuenta |
| Índice de detección de duplicados | Hash del archivo → ID de transcripción | Gestionado automáticamente junto con las transcripciones |
| Estado de trabajo incompleto | Datos de recuperación de transcripción en curso | Eliminado cuando el trabajo se completa o cancela |

**Datos en el almacenamiento seguro de la plataforma (Keychain / Keystore):**

| Datos | Propósito |
|-------|-----------|
| Clave de cifrado Hive | Cifra todos los contenedores de base de datos locales |
| Tokens de autenticación | Tokens OIDC de Google/Apple Sign-In |

- **No se almacena ningún perfil de usuario** localmente (sin nombre, foto, número de teléfono ni dirección).
- Las grabaciones de audio se eliminan del dispositivo después de la subida.
- Todos los datos locales se borran permanentemente al eliminar su cuenta.

## 5. Autenticación

- Usamos OpenID Connect (OIDC) a través de Google Sign-In y Sign in with Apple.
- Solo recibimos la información necesaria para la autenticación (ID de usuario, correo electrónico, nombre visible).
- No accedemos a sus contactos, calendarios u otros datos de cuenta.

## 6. Datos de pago

- Las compras dentro de la app son procesadas enteramente por Apple App Store o Google Play Store.
- SafeScribe **no recibe, almacena ni procesa** números de tarjeta de crédito ni detalles de métodos de pago.
- Solo recibimos recibos de compra para verificación de saldo.

## 7. Procesamiento del lado del servidor

- Los archivos de audio se suben mediante conexiones cifradas TLS con certificate pinning.
- El audio se procesa solo en RAM y **nunca toca el disco**.
- Las transcripciones se mantienen temporalmente para descarga y se **eliminan tras confirmación**.
- El procesamiento del lado del servidor usa un modelo de IA de codigo abierto autoalojado para reconocimiento de voz.

## 8. Seguimiento de errores

- Usamos Sentry para informes de fallos y monitoreo de errores.
- Todos los registros se limpian de información de identificación personal (PII) antes de la transmisión.
- Los siguientes tipos de datos se ocultan: direcciones de correo, números de teléfono, direcciones IP, rutas de archivos, tokens de autenticación e IDs de trabajo.

## 9. Compartir datos

**No vendemos, alquilamos ni compartimos** sus datos personales con terceros para fines de marketing.

Los datos se comparten solo con:
- **Servidores de transcripción** (nuestra infraestructura) — para procesamiento de audio
- **Sentry** — para informes de fallos (PII eliminada)
- **Apple/Google** — para autenticación y procesamiento de pagos

## 10. Derechos del usuario

Tiene derecho a:
- **Acceder** a sus transcripciones almacenadas localmente en cualquier momento
- **Eliminar** transcripciones individuales o todos los datos de la aplicación
- **Exportar** transcripciones mediante la funcionalidad de compartir/copiar
- **Cerrar sesión** y revocar el acceso API en cualquier momento
- **Solicitar la eliminación de la cuenta** — su identidad de inicio de sesión, todos los datos almacenados localmente y el saldo de crédito restante se eliminarán permanentemente

## 11. Contacto

Para consultas de privacidad o solicitudes de eliminación de datos:

**Correo electrónico:** privacy@safescribe.dev

---

*Última actualización: Marzo 2026*
