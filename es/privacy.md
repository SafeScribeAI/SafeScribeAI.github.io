---
layout: default
title: SafeScribe — Política de privacidad
description: Qué datos recopila SafeScribe, cómo los procesamos y sus derechos.
lang: es
---

<div class="page-content" markdown="1">

# Política de privacidad

<div class="summary-box">
  <strong>En términos simples:</strong> Procesamos su audio en la memoria del servidor para crear una transcripción y luego lo eliminamos de inmediato. No almacenamos audio en disco, no lo usamos para entrenar IA y no lo compartimos con nadie. Sus transcripciones se cifran en su dispositivo y están bajo su control. Solo conservamos registros de facturación pseudónimos.
</div>

<p class="page-meta">Última actualización: March 2026</p>

---

<span class="section-label">Lo que nunca hacemos</span>
## Datos que no recopilamos ni almacenamos
{: #data-we-dont-collect-or-store}

<ul class="dont-list">
  <li><span class="x-mark">&#x2717;</span> Almacenar audio en disco — jamás</li>
  <li><span class="x-mark">&#x2717;</span> Almacenar su dirección de correo electrónico o nombre</li>
  <li><span class="x-mark">&#x2717;</span> Registrar o almacenar direcciones IP</li>
  <li><span class="x-mark">&#x2717;</span> Usar grabaciones para entrenar modelos de IA</li>
  <li><span class="x-mark">&#x2717;</span> Compartir datos con anunciantes o intermediarios de datos</li>
  <li><span class="x-mark">&#x2717;</span> Rastrear el comportamiento entre apps o sesiones</li>
  <li><span class="x-mark">&#x2717;</span> Recopilar contactos, ubicación o datos biométricos</li>
  <li><span class="x-mark">&#x2717;</span> Conservar datos tras la eliminación de la cuenta</li>
</ul>

---

<span class="section-label">Lo que almacenamos</span>
## Datos recopilados

### En el servidor (permanente hasta la eliminación de la cuenta)

| Datos | Finalidad |
|-------|-----------|
| ID de usuario pseudónimo (hash SHA-256 de su ID de cuenta) | Identidad de la cuenta — no reversible |
| Identificador de dispositivo pseudónimo (hash SHA-256 de las propiedades del dispositivo) | Prevención de abusos — no reversible |
| Saldo de la cuenta (USD) | Gestión de crédito |
| Minutos de transcripción gratuitos restantes | Seguimiento del bono de bienvenida |
| Marcas de tiempo de creación y última actualización de la cuenta | Gestión de la cuenta |

**Registros por trabajo** (almacenados por cada transcripción completada):

| Datos | Finalidad |
|-------|-----------|
| Duración del audio (segundos) | Análisis del servicio |
| Tamaño del archivo (bytes) | Análisis del servicio |
| Recuento de palabras | Análisis del servicio |
| Importe cobrado (USD) | Registro de facturación |
| Marcas de tiempo de procesamiento | Análisis del servicio |

<div class="callout callout-info">
  <strong>Los registros por trabajo nunca contienen contenido de audio ni texto de transcripción.</strong> Estos registros contienen únicamente metadatos (números y marcas de tiempo) — nunca lo que usted dijo.
</div>

### En el servidor (temporal — eliminado tras el procesamiento)

| Datos | Cuándo se eliminan |
|-------|-------------------|
| Archivo de audio | Inmediatamente después de completarse la transcripción |
| Texto de transcripción | Tras confirmar la recepción (acuse de recibo) |

### En su dispositivo (cifrado)

| Datos | Período de retención |
|-------|---------------------|
| Transcripciones (texto, segmentos, metadatos) | Hasta que las elimine |
| Cola de carga sin conexión | Eliminada tras una carga exitosa |
| Configuración de la app y registros de consentimiento | Hasta el cierre de sesión o eliminación de la cuenta |
| Clave de cifrado | En iOS Keychain / Android Keystore — eliminada con la app |

### Opcional (solo con aceptación)

| Datos | Finalidad |
|-------|-----------|
| Informes de fallos | Estabilidad de la app mediante el punto de conexión propio de SafeScribe para informes de fallos — todos los datos personales eliminados antes de la transmisión |
| Comentarios e informes de problemas | Mejora del producto — una valoración, informe de error, queja o sugerencia que usted decide enviar. El texto libre se depura de datos personales (DCP) en el servidor antes de almacenarse; se conserva únicamente con su hash de usuario pseudónimo (sin nombre, correo electrónico ni IP). Retenido hasta 24 meses, luego purgado automáticamente. |

<div class="callout callout-green">
  <strong>El servidor nunca almacena su nombre, dirección de correo electrónico, dirección IP, contenido de audio ni texto de transcripción.</strong> Los únicos registros persistentes vinculados a su cuenta son un hash de usuario no reversible, un identificador de dispositivo pseudónimo, un saldo de crédito, estadísticas de uso (solo números — sin contenido, sin identidad) y cualquier comentario que usted decida enviar (con DCP eliminadas). Si respondemos a un informe, la respuesta le llega únicamente como un mensaje en la app de una sola vez, asociado a su hash de usuario — nunca llegamos a saber quién es usted.
</div>

---

<span class="section-label">Eliminación completa</span>
## Eliminar la app frente a eliminar la cuenta

Estas son dos acciones distintas con resultados diferentes:

| Acción | Qué sucede | Su saldo |
|--------|-----------|---------|
| **Eliminar la app** | Las transcripciones locales y la clave de cifrado se eliminan de su dispositivo | Conservado en el servidor — reinstalar e iniciar sesión con la misma cuenta lo restaura completamente |
| **Eliminar la cuenta** | Cada registro del servidor se elimina permanentemente — no se puede deshacer | Perdido |

<div class="callout callout-info">
  <strong>Reinstale cuando quiera.</strong> Si elimina la app sin eliminar su cuenta, reinstalar e iniciar sesión con la misma cuenta de Google o Apple restaura su saldo completo y acceso — sin ninguna acción requerida.
</div>

### Eliminación de cuenta — No queda nada que le identifique

Eliminar su cuenta desde la Configuración de privacidad elimina permanentemente cada registro del servidor vinculado a su identidad:

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>ID de usuario seudónimo</strong><span class="item-desc">eliminado permanentemente</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Saldo de créditos</strong><span class="item-desc">eliminado permanentemente</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Minutos gratuitos restantes</strong><span class="item-desc">eliminados permanentemente</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Estadísticas por tarea</strong><span class="item-desc">anonimizadas de inmediato — reasignadas al marcador común DELETED_USER, purgadas automáticamente tras 2 años</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Identificador de dispositivo seudónimo</strong><span class="item-desc">reducido a un hash salado de un solo sentido conservado hasta 2 años — bloquea el abuso reiterado del crédito de bienvenida, irreversible y sin vínculo con usted</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Copia de seguridad diaria</strong><span class="item-desc">sobrescrita en 24 horas — no queda ninguna copia identificable en ningún lugar</span></span></li>
</ul>

Todo vínculo con su identidad se destruye en el momento de la eliminación. Dos categorías limitadas persisten temporalmente <em>sin ningún vínculo de identidad</em>: los registros financieros (importes de compra y uso) se anonimizan al marcador DELETED_USER y se conservan 2 años conforme a la prescripción de disputas de consumo (TBK art. 146); y un hash salado de dispositivo se conserva hasta 2 años para impedir la concesión repetida de créditos gratuitos (art. 6(1)(f) RGPD, interés legítimo). Ambos se purgan automáticamente al vencer el plazo. La única copia de seguridad diaria se sobrescribe en las 24 horas posteriores a la eliminación.

El uso de la eliminación en la app constituye el ejercicio formal de su derecho de supresión bajo el GDPR Art. 17 y el KVKK Art. 11(e). Si no puede acceder a su cuenta, contacte con **privacy@safescribe.dev** para enviar una solicitud de eliminación por correo electrónico.

---

<span class="section-label">Procesamiento de audio</span>
## Política de cero disco

<div class="flow-diagram">
Su audio:  Carga --> RAM --> Transcripción IA --> Entrega --> ELIMINACIÓN
                                                              (inmediata)

Nuestro disco:  Solo registros de saldo — sin audio, sin transcripción, sin correo
</div>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Solo RAM</strong><span class="item-desc">el audio se procesa exclusivamente en memoria volátil</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Nunca escrito en disco</strong><span class="item-desc">ni siquiera temporalmente</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Sin entrenamiento de IA</strong><span class="item-desc">su audio nunca se usa para mejorar modelos</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>IA propia</strong><span class="item-desc">ningún servicio de IA de terceros recibe su audio</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Protección TTL</strong><span class="item-desc">los datos se autodestruyen aunque el código de eliminación falle</span></span></li>
</ul>

---

<span class="section-label">Autenticación</span>
## Inicio de sesión con Google o Apple

Usamos OpenID Connect (OIDC) a través de Google Sign-In y Sign in with Apple.

| Lo que el proveedor nos envía | Lo que hacemos con ello |
|-------------------------------|------------------------|
| ID de cuenta | Hasheado (SHA-256 + sal) — el original se descarta |
| Dirección de correo electrónico | Usada solo para autenticación — **no almacenada** |
| Nombre de visualización | **No almacenado** |

No accedemos a sus contactos, calendario ni a ningún otro dato de la cuenta.

---

<span class="section-label">Pagos</span>
## Facturación mediante App Stores

Los pagos son procesados íntegramente por Apple App Store o Google Play Store. SafeScribe **nunca recibe, almacena ni procesa** números de tarjeta de crédito ni detalles de pago. Solo recibimos un recibo de compra para verificar el saldo.

<div class="callout callout-info">
  <strong>Los registros de pago conservados por Apple o Google</strong> están fuera del control de SafeScribe y no están cubiertos por el proceso de eliminación de cuenta de SafeScribe. Para gestionar esos registros, contacte directamente con el <a href="https://support.apple.com">Soporte de Apple</a> o el <a href="https://support.google.com/googleplay">Soporte de Google Play</a>.
</div>

---

<span class="section-label">Seguimiento de errores</span>
## Informes de fallos (Opcional)

Enviamos los informes de fallos opcionales al punto de conexión propio de SafeScribe para informes de fallos. Está **desactivado por defecto** y puede cambiarse en cualquier momento desde la Configuración de privacidad.

Antes de transmitir cualquier informe, se eliminan automáticamente los siguientes datos:

**Eliminados:** direcciones de correo electrónico · números de teléfono · direcciones IP · rutas de archivo · tokens de autenticación

**Conservados:** tipo de error y seguimiento de pila · modelo de dispositivo · versión del sistema operativo · versión de la app

---

<span class="section-label">Terceros</span>
## Servicios de terceros

Utilizamos los siguientes servicios. No se comparte audio, contenido de transcripción ni información personal más allá de lo indicado con ningún tercero.

| Servicio | Finalidad | Datos compartidos | Política de privacidad |
|---------|----------|-----------------|----------------------|
| Google Sign-In | Autenticación | Solo token OIDC | [policies.google.com/privacy](https://policies.google.com/privacy) |
| Apple Sign-In | Autenticación | Solo token OIDC | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Apple App Store | Compras en la app | Solo recibo de compra | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Google Play Store | Compras en la app | Solo recibo de compra | [policies.google.com/privacy](https://policies.google.com/privacy) |
| Punto de conexión propio de SafeScribe | Informes de fallos (opt-in) | Informe de error anónimo — datos personales eliminados | Operado por SafeScribe, sin terceros |

---

<span class="section-label">Base legal</span>
## Base legal del tratamiento

| Actividad de tratamiento | Base GDPR | Base KVKK (Turquía) | ¿Obligatorio? |
|------------------------|----------|----------|--------------|
| Transcripción de audio | Art. 6(1)(b) — Contrato | Consentimiento explícito | Obligatorio para usar el servicio |
| Cuenta y facturación | Art. 6(1)(b) — Contrato | Ejecución del contrato | Obligatorio para usar el servicio |
| Autenticación (OIDC) | Art. 6(1)(b) — Contrato | Ejecución del contrato | Obligatorio para usar el servicio |
| Compras en la app | Art. 6(1)(b) — Contrato | Ejecución del contrato | Obligatorio para compras |
| Informes de fallos | Art. 6(1)(a) — Consentimiento | Consentimiento explícito | Opcional |

Proporcionar datos para la transcripción, la autenticación y la facturación es **obligatorio** para usar SafeScribe. Los informes de fallos son **opcionales** — el servicio funciona completamente sin ellos.

---

<span class="section-label">Sus derechos</span>
## Lo que puede hacer

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Acceder</strong><span class="item-desc">ver todas sus transcripciones en la app en cualquier momento</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Eliminar</strong><span class="item-desc">borrar transcripciones individuales o su cuenta completa desde la Configuración de privacidad; la eliminación de la cuenta no deja ningún registro en ninguna base de datos</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Exportar</strong><span class="item-desc">compartir o exportar transcripciones, o solicitar una exportación completa de datos desde la Configuración de privacidad</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Rechazar diagnósticos</strong><span class="item-desc">desactivar los informes de fallos en la Configuración de privacidad</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Retirar el consentimiento</strong><span class="item-desc">cerrar sesión y eliminar su cuenta en cualquier momento</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Exclusión CCPA</strong><span class="item-desc">active "No vender ni compartir" en la Configuración de privacidad</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Sin decisiones automatizadas</strong><span class="item-desc">nunca tomamos decisiones automatizadas sobre usted, incluida la elaboración de perfiles con efectos legales o similares (GDPR Art. 22)</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Presentar una reclamación</strong><span class="item-desc">los residentes de la UE/EEE pueden contactar con su autoridad de control nacional (<a href="https://www.edpb.europa.eu/about-edpb/about-edpb/members_en">edpb.europa.eu</a>); los residentes en Turquía pueden contactar con el KVKK (<a href="https://www.kvkk.gov.tr">kvkk.gov.tr</a>)</span></span></li>
</ul>

Para cualquier solicitud que no pueda completar en la app, contacte con **privacy@safescribe.dev**.

---

<span class="section-label">Legal</span>
## Información adicional

**Responsable del tratamiento.** SafeScribe es operado por un desarrollador independiente con sede en Turquía. Contacto: privacy@safescribe.dev. No se ha designado ningún Delegado de Protección de Datos (DPD) — el tratamiento no se realiza a gran escala y no se conservan sistemáticamente datos de categorías especiales (el audio se procesa de forma efímera solo en RAM, nunca en disco).

**Copias de seguridad.** Se mantiene una única copia de seguridad diaria de los registros de cuenta (ID pseudónimo, saldo, estadísticas de uso) para la continuidad del servicio. Cada copia de seguridad sobrescribe la anterior. Los datos eliminados mediante la eliminación de cuenta se retiran inmediatamente de los sistemas activos y de la copia de seguridad en 24 horas.

**Transferencias internacionales.** Si usa SafeScribe desde la UE/EEE, su audio y los datos de su cuenta se procesan en servidores en Turquía. Turquía no dispone actualmente de una <a href="https://commission.europa.eu/law/law-topic/data-protection/international-dimension-data-protection/adequacy-decisions_en">decisión de adecuación de la UE</a>; las transferencias están cubiertas por su consentimiento explícito e informado al primer inicio (GDPR Art. 49(1)(a)). Para los usuarios de Turquía (KVKK — Ley turca de protección de datos personales), la transferencia transfronteriza está autorizada por consentimiento explícito al primer inicio bajo el KVKK Art. 9.

**Menores.** SafeScribe está clasificado para mayores de 17 años en App Store y Google Play y no está destinado a usuarios menores de 17 años. No recopilamos datos de menores de 17 años de manera consciente. En jurisdicciones donde 18 es la edad de plena capacidad legal (incluida Turquía), los usuarios de 17 años requieren el consentimiento de un padre o tutor antes de usar la app.

**Cambios de política.** Actualizaremos esta página cuando cambien nuestras prácticas. La fecha de "Última actualización" anterior refleja la revisión más reciente.

---

<span class="section-label">Contacto</span>
## Contáctenos

| Tema | Contacto |
|------|---------|
| Solicitudes de privacidad, eliminación de datos, derechos | privacy@safescribe.dev |
| Vulnerabilidades de seguridad | security@safescribe.dev |
| Soporte general | support@safescribe.dev |

---


</div>
