---
layout: default
title: SafeScribe — Transcrição de IA com privacidade em primeiro lugar
description: A maioria dos apps de transcrição guarda suas gravações por dias. O SafeScribe não: seu áudio é processado apenas na memória (RAM) do nosso servidor, nunca gravado em disco e excluído assim que seu texto fica pronto.
lang: pt
---

<div class="hero">
  <div class="hero-icon">&#x1f512;</div>
  <h1>SafeScribe</h1>
  <p class="hero-tagline">A maioria dos apps de transcrição guarda suas gravações por dias.<br>O SafeScribe não guarda nenhuma.</p>
  <p class="hero-body-text">Seu áudio é processado apenas na memória (RAM) do nosso servidor, nunca gravado em disco e excluído assim que você recebe seu texto.</p>
  <p class="hero-footnote">Privacidade aqui não é uma política, é a forma como o sistema é construído. Mesmo sob ordem judicial, não teríamos nenhum áudio, transcrição, nome, e-mail ou IP a entregar — apenas um saldo e dados de uso vinculados a um hash unidirecional, nunca à sua identidade.</p>
  <div class="cta-group">
    <a class="cta-btn cta-btn-primary" href="#pricing">&#x1f3a4; Ver preços</a>
    <a class="cta-btn cta-btn-secondary" href="security">&#x1f6e1; Como protegemos seus dados</a>
  </div>
  <p class="hero-free-tier">Comece com 2 horas de uso grátis — sem cartão</p>
  <div class="store-badges" aria-label="App Store e Google Play — Em breve">
    <span class="store-badge" role="img" aria-label="App Store — Em breve">
      <span class="store-badge-icon">&#xf8ff;</span>
      <span class="store-badge-textcol">
        <span class="store-badge-tagline">Em breve na</span>
        <span class="store-badge-name">App Store</span>
      </span>
      <span class="store-badge-status">Em breve</span>
    </span>
    <span class="store-badge" role="img" aria-label="Google Play — Em breve">
      <span class="store-badge-icon">&#x25B6;</span>
      <span class="store-badge-textcol">
        <span class="store-badge-tagline">Em breve na</span>
        <span class="store-badge-name">Google Play</span>
      </span>
      <span class="store-badge-status">Em breve</span>
    </span>
  </div>
</div>

---

<span class="section-label">A diferença</span>
## Como o SafeScribe se compara

<div class="comparison-table" markdown="0">
<table>
  <thead>
    <tr>
      <th>Recurso</th>
      <th>SafeScribe</th>
      <th>Otter.ai</th>
      <th>Fireflies</th>
      <th>Good Tape</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Processamento somente em RAM</td>
      <td class="yes">Sim</td>
      <td class="no">Não</td>
      <td class="no">Não</td>
      <td class="no">Não</td>
    </tr>
    <tr>
      <td>Áudio excluído imediatamente</td>
      <td class="yes">Sim</td>
      <td class="no">30 dias</td>
      <td class="no">Manual</td>
      <td class="yes">Sim</td>
    </tr>
    <tr>
      <td>Transcrição excluída do servidor</td>
      <td class="yes">Sim</td>
      <td class="no">Não</td>
      <td class="no">Não</td>
      <td class="no">Não</td>
    </tr>
    <tr>
      <td>E-mail armazenado no servidor</td>
      <td class="yes">Não (somente hash)</td>
      <td class="no">Sim</td>
      <td class="no">Sim</td>
      <td class="no">Sim</td>
    </tr>
    <tr>
      <td>Otimização de áudio no dispositivo</td>
      <td class="yes">Sim</td>
      <td class="no">Não</td>
      <td class="no">Não</td>
      <td class="no">Não</td>
    </tr>
    <tr>
      <td>Pré-processamento no dispositivo</td>
      <td class="yes">Sim</td>
      <td class="no">Não</td>
      <td class="no">Não</td>
      <td class="no">Não</td>
    </tr>
    <tr>
      <td>Dados disponíveis para intimação judicial</td>
      <td class="yes">Não</td>
      <td class="no">Sim</td>
      <td class="no">Sim</td>
      <td class="partial">Parcial</td>
    </tr>
  </tbody>
</table>
</div>

---

<span class="section-label">Como funciona</span>
## Três passos simples

<div class="steps">
  <div class="step">
    <div class="step-number">1</div>
    <div class="step-icon">&#x1f3a4;</div>
    <h3>Grave ou escolha um arquivo</h3>
    <p>Grave diretamente no app ou escolha um arquivo de áudio/vídeo do seu dispositivo. Compatível com MP3, WAV, M4A, MP4 e mais.</p>
  </div>
  <div class="step">
    <div class="step-number">2</div>
    <div class="step-icon">&#x1f9e0;</div>
    <h3>A IA transcreve na memória</h3>
    <p>Seu áudio é processado por uma IA de reconhecimento de voz de última geração em nossos servidores — inteiramente em RAM. Nada é gravado em disco.</p>
  </div>
  <div class="step">
    <div class="step-number">3</div>
    <div class="step-icon">&#x1f4c4;</div>
    <h3>Receba seu texto, dados excluídos</h3>
    <p>A transcrição é entregue ao seu dispositivo com verificação de integridade. Todos os dados do servidor são apagados de forma imediata e permanente.</p>
  </div>
</div>

---

<span class="section-label">Nossos compromissos</span>
## 14 promessas de privacidade
{: #privacy-promises}

Cada afirmação abaixo é imposta por código — não apenas por política. Cada uma tem um link para a evidência técnica.

<span class="section-label">Arquitetura central</span>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Processamento somente em RAM</strong><span class="item-desc">Seu áudio existe apenas na memória volátil durante a transcrição — nunca gravado em disco. <a href="security#layer-2">saiba mais →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Exclusão em cascata + failsafe</strong><span class="item-desc">Cada etapa apaga os dados da etapa anterior. Se nosso código falhar, os dados se autodestroem via TTL. <a href="security#layer-6">saiba mais →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>IA própria</strong><span class="item-desc">Seu áudio nunca chega à OpenAI, ao Google ou a qualquer serviço de terceiros. Operamos nossa própria infraestrutura. <a href="security#layer-2">saiba mais →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Verificação de integridade</strong><span class="item-desc">Cada transcrição carrega um checksum SHA-256 para confirmar que chegou sem alterações. <a href="security#layer-1">saiba mais →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Sem re-download</strong><span class="item-desc">Depois que você recebe sua transcrição, nada permanece em nossos servidores. Não existe "baixar novamente". <a href="security#layer-6">saiba mais →</a></span></span></li>
</ul>

<span class="section-label">O que não coletamos</span>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Seu e-mail ou nome — nunca armazenados</strong><span class="item-desc">Guardamos apenas um hash unidirecional do seu ID de conta. Não pode ser revertido para revelar quem você é. <a href="privacy#sign-in">saiba mais →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Seu endereço IP — nunca registrado</strong><span class="item-desc">Usado brevemente para limitação de taxa (como hash) e descartado. Nunca aparece em nenhum log. <a href="privacy#zero-disk">saiba mais →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Suas gravações — nunca usadas para treinamento</strong><span class="item-desc">Seu áudio é excluído imediatamente após a transcrição. Sem cópia, sem arquivo, sem conjunto de dados de treinamento. <a href="privacy#zero-disk">saiba mais →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Sem perfilamento ou decisões automatizadas</strong><span class="item-desc">Nunca pontuamos, classificamos ou tomamos decisões automatizadas sobre você. <a href="privacy#your-rights">saiba mais →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Sem rastreamento de comportamento</strong><span class="item-desc">Usamos zero SDKs de análise. Sem Mixpanel, sem Firebase Analytics, sem rastreadores de nenhum tipo. <a href="privacy#third-parties">saiba mais →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Sem contatos, localização ou biometria</strong><span class="item-desc">Pedimos apenas acesso ao microfone — nada mais do seu dispositivo. <a href="privacy#no-collect">saiba mais →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Dados de pagamento — nunca os vemos</strong><span class="item-desc">Pagamentos processados inteiramente pela Apple ou pelo Google. Recebemos apenas um recibo de compra. <a href="privacy#billing">saiba mais →</a></span></span></li>
</ul>

<span class="section-label">Como protegemos o que precisa transitar</span>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>AES-256 + chaves respaldadas por hardware</strong><span class="item-desc">Transcrições no seu dispositivo são criptografadas. Chaves armazenadas no iOS Keychain ou Android Keystore. <a href="security#layer-4">saiba mais →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Relatórios de falha: desativados por padrão</strong><span class="item-desc">Opcional. Se ativado, dados pessoais são removidos automaticamente antes de sair do seu dispositivo. <a href="security#layer-5">saiba mais →</a></span></span></li>
</ul>

---

<span class="section-label">Para quem é</span>
## Criado para usos em que a privacidade é essencial

<div class="segment-cards">
  <div class="segment-card">
    <div class="segment-icon">&#x1f4f0;</div>
    <h4>Jornalistas</h4>
    <p>Suas fontes permanecem seguras — não porque prometemos, mas porque não temos acesso a elas. Como nada é retido no servidor, não há nada a divulgar, mesmo se for exigido.</p>
  </div>
  <div class="segment-card">
    <div class="segment-icon">&#x2696;&#xfe0f;</div>
    <h4>Advogados</h4>
    <p>Transcrição compatível com o sigilo advogado-cliente. Nossos servidores não contêm dados que possam ser intimados ou violados.</p>
  </div>
  <div class="segment-card">
    <div class="segment-icon">&#x270a;</div>
    <h4>Ativistas</h4>
    <p>Transcrição que resiste à vigilância. Não são mantidos registros, perfis ou rastros; sua voz vira texto e o restante é excluído.</p>
  </div>
  <div class="segment-card">
    <div class="segment-icon">&#x1f4bc;</div>
    <h4>Profissionais</h4>
    <p>Transcrição rápida e precisa para anotações de reuniões, entrevistas e ditados — sem que nenhum dado permaneça no servidor depois de concluído.</p>
  </div>
</div>

---

<span class="section-label">Precisão em que você pode confiar</span>
## Preciso, mesmo com ruído

Cada arquivo de áudio passa por um pipeline otimizado — no seu dispositivo e em nossos servidores — para garantir a maior precisão possível.

<div class="pipeline-steps">
  <div class="pipeline-step">
    <div class="pipeline-icon">&#x1f4f1;</div>
    <h4>Otimização no dispositivo</h4>
    <p>Filtragem passa-alta, normalização de loudness LUFS (-16 LUFS, otimizado para ASR), limitação de pico e reamostrado a 16 kHz — codificado como FLAC sem perdas antes do envio.</p>
  </div>
  <div class="pipeline-step">
    <div class="pipeline-icon">&#x1f6e1;</div>
    <h4>Detecção de atividade de voz</h4>
    <p><a href="https://github.com/snakers4/silero-vad">Silero VAD</a> identifica segmentos de fala e elimina alucinações da IA em trechos silenciosos ao restringir a transcrição apenas às regiões de fala detectadas.</p>
  </div>
</div>

<div class="callout callout-green">
  <strong>Baseado em padrões estabelecidos.</strong> Nosso pipeline é construído sobre normas consagradas de engenharia de áudio e pesquisa revisada por pares — não em padrões arbitrários. O resultado: precisão de transcrição em que você pode confiar, mesmo em ambientes desafiadores.
</div>

---

<span class="section-label">Preços</span>
## Simples, pague conforme o uso
{: #pricing}

<div class="pricing-free-wrapper"><span class="pricing-free-badge">2 horas de uso grátis para começar</span></div>

Sem assinaturas. Sem taxas ocultas. Compre créditos e use quando quiser. Ao contrário dos serviços de assinatura, você nunca paga pelo tempo que não usa. Toda conta nova começa com 2 horas grátis de transcrição — sem cartão.

<div class="pricing-grid">
  <div class="pricing-card" data-hours="{{ site.data.facts.packages[0].hours }}">
    <div class="pricing-amount">${{ site.data.facts.packages[0].price_usd }}</div>
    <div class="pricing-minutes">1 hora</div>
  </div>
  <div class="pricing-card recommended" data-hours="{{ site.data.facts.packages[1].hours }}">
    <div class="pricing-recommended-badge">Recomendado</div>
    <div class="pricing-amount">${{ site.data.facts.packages[1].price_usd }}</div>
    <div class="pricing-minutes">8 horas</div>
  </div>
  <div class="pricing-card" data-hours="{{ site.data.facts.packages[2].hours }}">
    <div class="pricing-amount">${{ site.data.facts.packages[2].price_usd }}</div>
    <div class="pricing-minutes">16 horas</div>
  </div>
  <div class="pricing-card" data-hours="{{ site.data.facts.packages[3].hours }}">
    <div class="pricing-amount">${{ site.data.facts.packages[3].price_usd }}</div>
    <div class="pricing-minutes">32 horas</div>
  </div>
  <div class="pricing-card" data-hours="{{ site.data.facts.packages[4].hours }}">
    <div class="pricing-amount">${{ site.data.facts.packages[4].price_usd }}</div>
    <div class="pricing-minutes">64 horas</div>
  </div>
  <div class="pricing-card" data-hours="{{ site.data.facts.packages[5].hours }}">
    <div class="pricing-amount">${{ site.data.facts.packages[5].price_usd }}</div>
    <div class="pricing-minutes">128 horas</div>
  </div>
</div>


<div class="callout callout-info">
  <strong>Se uma transcrição falhar por um erro técnico do nosso lado, você nunca será cobrado.</strong> Você paga apenas quando uma transcrição é concluída com sucesso em nosso servidor. Os pagamentos são processados inteiramente pela Apple App Store ou Google Play — nunca vemos seus dados de pagamento.
</div>

---

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {"@type": "Question", "name": "O que acontece com meu áudio após a transcrição?", "acceptedAnswer": {"@type": "Answer", "text": "Ele desaparece — permanentemente. Seu áudio é processado inteiramente na RAM do servidor (memória volátil) e excluído no instante em que sua transcrição é entregue. Não há cópia em disco, nenhum backup e nenhuma forma de recuperá-lo. Mesmo uma apreensão física do servidor não resultaria em nenhum dado de áudio."}},
    {"@type": "Question", "name": "Vocês usam minhas gravações para treinar IA?", "acceptedAnswer": {"@type": "Answer", "text": "De jeito nenhum. Seu áudio é usado para um único propósito: gerar sua transcrição. Ele nunca é armazenado, analisado ou usado para treinamento ou melhoria de modelos. Operamos nossa própria infraestrutura de IA — seus dados não vão para nenhum serviço de IA de terceiros."}},
    {"@type": "Question", "name": "Vocês veem meus dados de pagamento ou cartão?", "acceptedAnswer": {"@type": "Answer", "text": "Não. Todos os pagamentos são processados inteiramente pela Apple App Store ou Google Play. Recebemos apenas um recibo de compra para verificação de saldo — nunca vemos, recebemos ou armazenamos seu número de cartão ou quaisquer dados de pagamento."}},
    {"@type": "Question", "name": "Quais idiomas são suportados?", "acceptedAnswer": {"@type": "Answer", "text": "O modelo de reconhecimento de voz Whisper de código aberto suporta 99 idiomas com detecção automática de idioma. Você também pode selecionar o idioma manualmente antes da transcrição para melhorar a precisão."}},
    {"@type": "Question", "name": "Quais formatos de arquivo posso usar?", "acceptedAnswer": {"@type": "Answer", "text": "São suportados 40 formatos — 22 formatos de áudio (MP3, WAV, FLAC, M4A, OGG, Opus, AAC, AIFF, AMR e mais) e 18 formatos de vídeo (MP4, MOV, MKV, AVI, WEBM, 3GP e mais — o áudio é extraído no seu dispositivo antes do envio). Arquivos de até 96 MB e até 6 horas de duração."}},
    {"@type": "Question", "name": "Como meus dados são criptografados?", "acceptedAnswer": {"@type": "Answer", "text": "Em trânsito: a criptografia TLS 1.3 protege seus dados entre o dispositivo e os servidores do SafeScribe. No seu dispositivo: as transcrições são armazenadas em contêineres criptografados com AES-256 com chaves protegidas pelo hardware seguro do seu telefone (iOS Keychain / Android Keystore)."}},
    {"@type": "Question", "name": "Posso excluir todos os meus dados?", "acceptedAnswer": {"@type": "Answer", "text": "Sim. Você pode excluir transcrições individuais ou sua conta inteira pelo app. A exclusão da conta remove permanentemente sua identidade de login, todos os dados locais e o saldo de créditos restante. Como o servidor não retém dados pessoais após o processamento, não há nada a excluir no lado do servidor."}},
    {"@type": "Question", "name": "Vocês registram meu endereço IP?", "acceptedAnswer": {"@type": "Answer", "text": "Não. Endereços IP nunca são armazenados ou registrados. Nossa arquitetura garante isso no nível do código — o sistema de log está configurado explicitamente para descartar IPs antes que cheguem a qualquer saída de log. Usamos um identificador pseudônimo (um hash SHA-256 unidirecional da sua identidade de login) para todas as operações internas. Esse hash não pode ser revertido para revelar sua identidade."}},
    {"@type": "Question", "name": "Como posso verificar suas afirmações de privacidade?", "acceptedAnswer": {"@type": "Answer", "text": "Publicamos nossa Arquitetura de segurança completa e a Avaliação de Impacto na Proteção de Dados para transparência técnica. Você também pode usar uma ferramenta de análise de rede (ex.: Wireshark) para confirmar que todo o tráfego está criptografado com TLS — nenhum e-mail, nome ou identificador pessoal aparece em nenhuma requisição."}},
    {"@type": "Question", "name": "Como o pré-processamento no dispositivo melhora a precisão?", "acceptedAnswer": {"@type": "Answer", "text": "Antes do envio, o SafeScribe aplica uma cadeia de filtros de áudio no dispositivo: filtragem passa-alta a 80 Hz remove ruídos e zumbidos de fundo, a normalização de loudness LUFS (-16 LUFS) otimiza os níveis de áudio para o Whisper, e a limitação de pico evita clipping. Combinado com a Detecção de atividade de voz no servidor, isso garante texto limpo e preciso mesmo de gravações desafiadoras."}}
  ]
}
</script>

<span class="section-label">FAQ</span>
## Perguntas frequentes

<details class="faq-item">
  <summary>O que acontece com meu áudio após a transcrição?</summary>
  <div class="faq-answer">Ele desaparece — permanentemente. Seu áudio é processado inteiramente na RAM do servidor (memória volátil) e excluído no instante em que sua transcrição é entregue. Não há cópia em disco, nenhum backup e nenhuma forma de recuperá-lo. Mesmo uma apreensão física do servidor não resultaria em nenhum dado de áudio.</div>
</details>

<details class="faq-item">
  <summary>Vocês usam minhas gravações para treinar IA?</summary>
  <div class="faq-answer">De jeito nenhum. Seu áudio é usado para um único propósito: gerar sua transcrição. Ele nunca é armazenado, analisado ou usado para treinamento ou melhoria de modelos. Operamos nossa própria infraestrutura de IA — seus dados não vão para nenhum serviço de IA de terceiros.</div>
</details>

<details class="faq-item">
  <summary>Vocês veem meus dados de pagamento ou cartão?</summary>
  <div class="faq-answer">Não. Todos os pagamentos são processados inteiramente pela Apple App Store ou Google Play. Recebemos apenas um recibo de compra para verificação de saldo — nunca vemos, recebemos ou armazenamos seu número de cartão ou quaisquer dados de pagamento.</div>
</details>

<details class="faq-item">
  <summary>Quais idiomas são suportados?</summary>
  <div class="faq-answer">O <a href="https://github.com/openai/whisper#available-models-and-languages">modelo de reconhecimento de voz Whisper</a> de código aberto suporta 99 idiomas com detecção automática de idioma. Você também pode selecionar o idioma manualmente antes da transcrição para melhorar a precisão.</div>
</details>

<details class="faq-item">
  <summary>Quais formatos de arquivo posso usar?</summary>
  <div class="faq-answer">São suportados <strong>40 formatos</strong> — 22 formatos de áudio (MP3, WAV, FLAC, M4A, OGG, Opus, AAC, AIFF, AMR e mais) e 18 formatos de vídeo (MP4, MOV, MKV, AVI, WEBM, 3GP e mais — o áudio é extraído no seu dispositivo antes do envio). Arquivos de até 96 MB e até 6 horas de duração.</div>
</details>

<details class="faq-item">
  <summary>Como meus dados são criptografados?</summary>
  <div class="faq-answer">Em trânsito: a criptografia TLS 1.3 protege seus dados entre o dispositivo e os servidores do SafeScribe. No seu dispositivo: as transcrições são armazenadas em contêineres criptografados com AES-256 com chaves protegidas pelo hardware seguro do seu telefone (iOS Keychain / Android Keystore).</div>
</details>

<details class="faq-item">
  <summary>Posso excluir todos os meus dados?</summary>
  <div class="faq-answer">Sim. Você pode excluir transcrições individuais ou sua conta inteira pelo app. A exclusão da conta remove permanentemente sua identidade de login, todos os dados locais e o saldo de créditos restante. Como o servidor não retém dados pessoais após o processamento, não há nada a excluir no lado do servidor.</div>
</details>

<details class="faq-item">
  <summary>Vocês registram meu endereço IP?</summary>
  <div class="faq-answer">Não. Endereços IP nunca são armazenados ou registrados. Nossa arquitetura garante isso no nível do código — o sistema de log está configurado explicitamente para descartar IPs antes que cheguem a qualquer saída de log. Usamos um identificador pseudônimo (um hash SHA-256 unidirecional da sua identidade de login) para todas as operações internas. Esse hash não pode ser revertido para revelar sua identidade.</div>
</details>

<details class="faq-item">
  <summary>Como posso verificar suas afirmações de privacidade?</summary>
  <div class="faq-answer">Publicamos nossa <a href="security">Arquitetura de segurança</a> completa e a <a href="dpia">Avaliação de Impacto na Proteção de Dados</a> para transparência técnica. Você também pode usar uma ferramenta de análise de rede (ex.: Wireshark) para confirmar que todo o tráfego está criptografado com TLS — nenhum e-mail, nome ou identificador pessoal aparece em nenhuma requisição.</div>
</details>

<details class="faq-item">
  <summary>Como o pré-processamento no dispositivo melhora a precisão?</summary>
  <div class="faq-answer">Antes do envio, o SafeScribe aplica uma cadeia de filtros de áudio no dispositivo: filtragem passa-alta a 80 Hz remove ruídos e zumbidos de fundo, a normalização de loudness LUFS (-16 LUFS) otimiza os níveis de áudio para o Whisper, e a limitação de pico evita clipping. Combinado com a Detecção de atividade de voz no servidor, isso garante texto limpo e preciso mesmo de gravações desafiadoras.</div>
</details>

---

<div class="callout callout-info u-mt-15">
  <p class="u-m0-b05"><strong>Rótulos de privacidade App Store</strong> — Nossos rótulos de privacidade no App Store e Google Play refletem exatamente o que está documentado aqui.</p>
  <p class="u-m0"><strong>Divulgação responsável</strong> — Encontrou uma vulnerabilidade? Fale conosco em <a href="mailto:security@safescribe.dev">security@safescribe.dev</a>.</p>
</div>

<p class="attribution-note">O SafeScribe usa os pesos do modelo <a href="https://github.com/openai/whisper">Whisper</a> da OpenAI por meio da biblioteca de código aberto <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> (SYSTRAN, licença MIT). O SafeScribe não é afiliado, endossado ou patrocinado pela OpenAI.</p>

---

