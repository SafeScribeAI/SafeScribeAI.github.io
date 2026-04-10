---
layout: default
title: SafeScribe — Arquitetura de Segurança
description: Como o SafeScribe protege seus dados de áudio — visão técnica da nossa abordagem Privacy by Design.
lang: pt
---

<div class="page-content" markdown="1">

# Arquitetura de Segurança

<div class="summary-box">
  <strong>Resumo:</strong> O SafeScribe processa seus dados de áudio exclusivamente na memória RAM do servidor. Assim que sua transcrição é entregue, todos os dados são apagados permanentemente. Sem gravações em disco, sem backups, sem cópias — nunca. Esta página explica como cada camada de proteção funciona.
</div>

<p class="page-meta">Última atualização: março de 2026</p>

---

<span class="section-label">Visão geral</span>
## Seis Camadas de Proteção

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f510;</div>
    <h4>Camada 1 — Transporte</h4>
    <p>Criptografia TLS 1.2+ em cada conexão. O tráfego é criptografado de ponta a ponta, sem exceções.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9e0;</div>
    <h4>Camada 2 — Apenas RAM</h4>
    <p>O áudio nunca toca o disco. Processamento em memória volátil, exclusão imediata após a transcrição.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f464;</div>
    <h4>Camada 3 — Identidade pseudônima</h4>
    <p>Seu e-mail e nome nunca são armazenados. Apenas um hash unidirecional do seu identificador de conta é mantido.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f512;</div>
    <h4>Camada 4 — Criptografia local</h4>
    <p>Armazenamento AES-256 no dispositivo. Chaves exclusivamente em armazenamento seguro por hardware (iOS Keychain / Android Keystore).</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>Camada 5 — Remoção de DCP</h4>
    <p>Os relatórios de falhas são limpos de dados pessoais antes de sair do seu dispositivo.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f5d1;</div>
    <h4>Camada 6 — Exclusão em cascata</h4>
    <p>Cada etapa do processamento exclui imediatamente os dados da etapa anterior. TTL de segurança como failsafe.</p>
  </div>
</div>

---

<span class="section-label">Princípio de design</span>
## Processar, Entregar, Excluir

Serviços de transcrição convencionais gravam o áudio em disco e podem retê-lo indefinidamente. O SafeScribe recebe o áudio na RAM, processa-o e o exclui assim que você recebe sua transcrição — nenhum byte é gravado em armazenamento permanente. O <a href="#your-datas-journey">diagrama de fluxo de dados</a> abaixo ilustra o processo completo.

A diferença fundamental: mesmo em caso de apreensão física do servidor, não haveria dados de áudio ou transcrição — eles existiam apenas em memória volátil.

---

<span class="section-label">Camada 1</span>
## Segurança no Transporte

| Proteção | O que previne |
|----------|--------------|
| Criptografia TLS 1.2+ | Interceptação do tráfego de rede |
| Checksum SHA-256 | Adulteração da transcrição em trânsito |

<div class="callout callout-green">
  <strong>Verificável:</strong> O Wireshark permite confirmar que todo o tráfego do SafeScribe é criptografado com TLS.
</div>

---

<span class="section-label">Camada 2</span>
## Processamento no Servidor Apenas em RAM

Este é o núcleo do design de privacidade do SafeScribe. O servidor executa os pesos do modelo Whisper da OpenAI através do motor de inferência auto-hospedado <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> — sem chamadas a APIs de terceiros. O armazenamento de dados está configurado para operação completamente volátil, sem persistência em disco.

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> Uma reinicialização do servidor apaga permanentemente todos os dados em memória — por design</li>
  <li><span class="check-mark">&#x2713;</span> Nenhum arquivo, backup ou log contém seus dados de áudio</li>
  <li><span class="check-mark">&#x2713;</span> Uma análise forense do servidor não revelaria nenhum conteúdo de áudio</li>
</ul>

**Armazenamento temporário no servidor (apenas RAM):**

| Dados | Excluídos quando |
|-------|-----------------|
| Bytes de áudio | Transcrição concluída |
| Texto da transcrição | Recebimento confirmado |
| Metadados do trabalho | Recebimento confirmado |

**Armazenamento permanente no servidor (em disco):**

| Dados | Finalidade | Contém DCP? |
|-------|------------|-------------|
| Identificador pseudônimo | Registro de faturamento | Não — hash unidirecional, não reversível |
| Duração e custo | Registro financeiro | Não |
| Tamanho do arquivo (bytes) | Análise do serviço | Não |
| Contagem de palavras | Análise do serviço | Não |
| Marcas de tempo | Trilha de auditoria | Não |

<div class="callout callout-green">
  <strong>Por design:</strong> Não existe função de "baixar novamente". Uma vez confirmado o recebimento, os dados desapareceram — não há nada a recuperar.
</div>

---

<span class="section-label">Camada 3</span>
## Identidade Pseudônima

O SafeScribe usa Google Sign-In e Sign in with Apple. Seus dados pessoais nunca são armazenados:

| O que o provedor de autenticação nos envia | O que armazenamos |
|--------------------------------------------|-------------------|
| Endereço de e-mail | **Não armazenado** |
| Nome de exibição | **Não armazenado** |
| Identificador de conta | Apenas hash criptográfico unidirecional |

O hash unidirecional do seu identificador:

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> Não pode ser revertido para revelar sua identidade</li>
  <li><span class="check-mark">&#x2713;</span> É único para você — usado exclusivamente para faturamento</li>
  <li><span class="check-mark">&#x2713;</span> Não contém nenhuma informação pessoal</li>
</ul>

<div class="callout callout-green">
  <strong>Verificável:</strong> Inspecione o tráfego de rede do app. Após a autenticação, nenhuma requisição contém seu e-mail ou nome — apenas um token Bearer que o servidor valida internamente.
</div>

---

<span class="section-label">Camada 4</span>
## Criptografia Local

As transcrições armazenadas no seu dispositivo são protegidas por:

| Proteção | Tecnologia |
|----------|------------|
| Criptografia | AES-256 |
| Armazenamento de chaves | iOS Keychain / Android Keystore |
| Banco de dados | Contêineres criptografados |

Mesmo com acesso direto ao sistema de arquivos, os dados de transcrição aparecem como binário ilegível. A chave fica em armazenamento seguro por hardware, fora dos arquivos do app. Desinstalar o app destrói a chave permanentemente.

---

<span class="section-label">Camada 5</span>
## Remoção de DCP em Diagnósticos

Se o app encontrar um erro, um relatório de falha pode ser enviado opcionalmente. Antes de sair do seu dispositivo, os itens a seguir são removidos automaticamente:

<div class="callout callout-info">
  <strong>Removido antes do envio:</strong> Endereços de e-mail · Números de telefone · Endereços IP · Caminhos de arquivo · Tokens de autenticação · Identificadores de trabalhos
</div>

<div class="callout callout-green">
  <strong>Conteúdo do relatório:</strong> Tipo de erro e stack trace · Modelo do dispositivo · Versão do sistema operacional · Versão do app
</div>

Você pode desativar completamente os relatórios de falhas nas configurações de privacidade do app.

---

<span class="section-label">Camada 6</span>
## Exclusão em Cascata

Cada etapa do processamento exclui imediatamente os dados da etapa anterior: o áudio é excluído após a transcrição, a transcrição é excluída após a confirmação. O <a href="#your-datas-journey">diagrama de fluxo de dados</a> mostra o processo completo com todos os pontos de exclusão.

Não é um processo de limpeza em segundo plano. A exclusão ocorre imediatamente como parte do pipeline de processamento.

<div class="callout callout-info">
  <strong>Failsafe:</strong> Mesmo que o processo de exclusão normal falhe (erro de rede, falha do app), cada item de dados na RAM do servidor tem uma expiração automática. Os dados se autodestroem — independentemente do que aconteça.
</div>

---

<span class="section-label">Percurso completo</span>
## Percurso dos seus Dados
{: #your-datas-journey}

<div class="flow-diagram">
Seu Dispositivo              Servidor SafeScribe           Seu Dispositivo
---------------              -------------------           ---------------

Gravar/selecionar áudio
    |
Pré-processar localmente
    |
Criptografar+enviar --TLS--> Receber na RAM
                                   |
                               Transcrição IA
                               (apenas RAM)
                                   |
                               Áudio DELETADO
                                   |
Receber transcrição   <-TLS- Enviar transcrição
    |                              |
Verificar integridade          Aguardar confirmação
    |                              |
Armazenar cifrado  Confirmar-> Transcrição DELETADA
localmente (AES-256)          Metadados DELETADOS
    |                              |
Concluído                      ZERO dados restam
</div>

---

<span class="section-label">Transparência</span>
## Verificação Independente

Encorajamos pesquisadores de segurança e defensores da privacidade a verificar nossas afirmações:

<ul class="verify-steps">
  <li><span><strong>Análise de rede</strong> O Wireshark ou Charles Proxy permite confirmar que todo o tráfego do SafeScribe é criptografado com TLS.</span></li>
  <li><span><strong>Avaliações publicadas</strong> Nossa <a href="dpia">Avaliação de Impacto de Proteção de Dados</a> contém a análise completa de riscos e o registro de decisões.</span></li>
  <li><span><strong>Divulgação responsável</strong> Encontrou uma vulnerabilidade? Entre em contato com <a href="mailto:security@safescribe.dev">security@safescribe.dev</a>.</span></li>
</ul>

</div>
