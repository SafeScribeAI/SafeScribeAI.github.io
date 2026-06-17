---
layout: default
title: SafeScribe — Avaliação de Impacto de Proteção de Dados
description: Avaliação formal de riscos do serviço de transcrição de áudio SafeScribe sob o RGPD e a KVKK.
lang: pt
---

<div class="page-content" markdown="1">

# Avaliação de Impacto de Proteção de Dados

<div class="summary-box">
  <strong>Conclusão principal:</strong> Como o áudio é processado em memória volátil e excluído imediatamente — e nenhum dado pessoal permanece em nossos servidores após o processamento — todos os riscos identificados são reduzidos a <strong>Baixo</strong> após a aplicação das medidas de mitigação. O processamento pode prosseguir sob as bases legais e salvaguardas documentadas.
</div>

<p class="page-meta">SafeScribe Transcrição de Áudio IA · Versão 1.0 · Março de 2026 · Avaliação pré-lançamento · Revisão prevista: 6 meses após o lançamento</p>

---

<span class="section-label">Seção 1</span>
## Descrição do Processamento

### O que processamos e por quê

| Finalidade | Dados processados | Base legal (RGPD) | Base KVKK (Turquia) |
|------------|------------------|-------------------|-----------|
| Transcrição de áudio | Arquivo de áudio (apenas RAM, excluído após processamento) | Art. 6(1)(b) — Execução de contrato | Consentimento explícito |
| Conta e faturamento | Identificador pseudônimo, saldo, metadados de uso | Art. 6(1)(b) — Execução de contrato | Consentimento explícito |
| Autenticação | Identificador OIDC (com hash, original descartado) | Art. 6(1)(b) — Execução de contrato | Execução de contrato |
| Compra no app | Recibo IAP da App Store / Play Store | Art. 6(1)(b) — Execução de contrato | Execução de contrato |
| Confirmação de idade | Confirmação de idade declarada (17+) | Art. 8 RGPD / Art. 6 KVKK | Obrigação legal |
| Relatórios de falhas | Relatórios de erro anonimizados (opt-in, DCP removidas) | Art. 6(1)(a) — Consentimento | Consentimento explícito |
| Feedback e relatórios de problemas | Texto livre (DCP removidas no servidor) + hash de usuário pseudônimo; tipo de relatório e diagnósticos do app | Art. 6(1)(a) — Consentimento | Consentimento explícito |

### Inventário de dados

| Dados | Retenção no servidor |
|-------|---------------------|
| Arquivo de áudio | Apenas RAM — excluído após transcrição |
| Texto da transcrição | Até confirmação do cliente (TTL de 24 horas no servidor se nenhum ACK for recebido) |
| Identificador pseudônimo | Até exclusão da conta |
| Saldo + metadados de uso | Até exclusão da conta |
| Endereço de e-mail | Apenas trânsito — **não armazenado** |
| Endereços IP | Apenas trânsito — **não registrados** |
| Relatórios de falhas (opt-in) | Endpoint próprio de relatórios de falhas do SafeScribe — não compartilhado com terceiros |
| Feedback e relatórios de problemas (opt-in) | Apenas texto livre com as DCP removidas + hash de usuário pseudônimo — retido por até 24 meses e, em seguida, expurgado automaticamente |

<p>Para o inventário completo de dados, veja a <a href="privacy#data-we-collect">Política de Privacidade § Dados que coletamos</a>.</p>

<div class="callout callout-info">
  <strong>Metadados por trabalho</strong>: duração do áudio (segundos), tamanho do arquivo (bytes), contagem de palavras, valor cobrado (USD) e marcas de tempo do processamento. Não contêm conteúdo de áudio, texto de transcrição nem informações que identifiquem o usuário.
</div>

<div class="callout callout-info">
  <strong>Retenção de backups.</strong> Um backup diário dos registros de conta é mantido para continuidade do serviço. Cada backup sobrescreve o anterior. Os dados excluídos via exclusão de conta são removidos dos sistemas ativos imediatamente e do backup em 24 horas — nenhuma cópia persiste além desse período.
</div>

### Fluxo de processamento

<div class="flow-diagram">
1. O usuário grava ou seleciona áudio no dispositivo
2. Pré-processamento de áudio no dispositivo (filtro passa-alta 80 Hz, normalização de loudness a -16 LUFS, limitação de pico, reamostragem para 16 kHz, codificação FLAC)
3. Upload criptografado para os servidores SafeScribe (TLS 1.3)
4. Servidor processa áudio na RAM — auto-hospedado, um poderoso modelo da família Whisper via <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> / CTranslate2, sem chamadas a APIs de terceiros
5. Transcrição retornada com checksum de integridade SHA-256
6. Cliente verifica checksum e confirma recebimento
7. Servidor exclui imediatamente a transcrição e o áudio da RAM
8. Transcrição armazenada localmente no dispositivo em armazenamento criptografado AES-256
</div>

---

<span class="section-label">Seção 2</span>
## Necessidade e Proporcionalidade

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>O upload de áudio é necessário</strong><span class="item-desc">o processamento de IA no servidor oferece maior precisão do que as alternativas atuais no dispositivo, no nível de qualidade que o SafeScribe requer</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>A autenticação é necessária</strong><span class="item-desc">necessária para faturamento por usuário e isolamento de trabalhos</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Os relatórios de falhas são proporcionais</strong><span class="item-desc">as DCP são removidas antes da transmissão; apenas opt-in</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Minimização de dados</strong><span class="item-desc">o áudio é processado apenas na RAM, nunca gravado em disco</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Retenção mínima</strong><span class="item-desc">as transcrições são excluídas imediatamente na confirmação; TTL de 24 horas no servidor se o cliente nunca confirmar</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Sem uso secundário</strong><span class="item-desc">o áudio nunca é usado para treinamento de modelos ou análises</span></span></li>
</ul>

### Direitos dos titulares de dados

Todos os direitos dos titulares de dados sob o RGPD e a KVKK (acesso, retificação, apagamento, limitação, portabilidade, oposição e retirada do consentimento) podem ser exercidos no app ou contatando privacy@safescribe.dev. Os direitos e sua implementação estão detalhados na nossa <a href="privacy#what-you-can-do">Política de Privacidade § O que você pode fazer</a>.

---

<span class="section-label">Seção 3</span>
## Avaliação de Riscos

### Riscos identificados e medidas de mitigação

| Risco | Inerente | Medidas de mitigação | Residual |
|-------|----------|---------------------|---------|
| Áudio contém dados pessoais sensíveis (saúde, jurídico, financeiro) | **Alto** | Processamento apenas em RAM; exclusão imediata; sem armazenamento persistente; sem acesso de terceiros | **Baixo** |
| Acesso não autorizado à transcrição em trânsito | Médio | TLS 1.3; checksum SHA-256 | **Baixo** |
| Violação no servidor expondo áudio ou transcrições | Médio | Sem armazenamento persistente de áudio; API autenticada; isolamento por trabalho; TTL failsafe | **Baixo** |
| Acesso não autorizado ao armazenamento local criptografado | Baixo | Contêineres criptografados AES-256; chave no iOS Keychain / Android Keystore | **Baixo** |
| Vazamento de DCP por relatórios de falhas | Baixo | Remoção por padrão de e-mails, telefones, IPs e tokens antes de enviar ao endpoint próprio de relatórios de falhas do SafeScribe | **Baixo** |
| Transferência de dados transfronteiriça | Médio | Turquia (KVKK — Lei turca de proteção de dados pessoais) consentimento explícito no primeiro acesso; consentimento explícito e informado no primeiro acesso nos termos do art. 49(1)(a) do RGPD | **Baixo** |
| IA gera transcrição imprecisa de conteúdo sensível | Baixo | A transcrição é apenas informativa; o usuário revisa todos os resultados; sem decisões automatizadas | **Baixo** |

<div class="callout callout-green">
  <strong>Todos os riscos residuais são Baixos.</strong> O principal fator de risco — conteúdo de áudio sensível — é tratado no nível arquitetônico: o áudio nunca é gravado em disco, nunca é retido além do processamento e nunca é compartilhado com terceiros.
</div>

---

<span class="section-label">Seção 4</span>
## Consentimento e Transparência

Antes do primeiro uso, os usuários recebem uma tela de consentimento granular com quatro cartões independentes:

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f3a4;</div>
    <h4>Processamento de Áudio <em class="u-label-light">(obrigatório)</em></h4>
    <p>Explica o processamento apenas em RAM, a exclusão imediata e que o áudio nunca é gravado em disco nem compartilhado com terceiros.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f4ca;</div>
    <h4>Dados Armazenados <em class="u-label-light">(obrigatório)</em></h4>
    <p>Explica quais dados persistentes são mantidos: identificador pseudônimo, saldo de créditos e metadados de uso anônimos.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9d2;</div>
    <h4>Confirmação de Idade <em class="u-label-light">(obrigatório)</em></h4>
    <p>Confirma que o usuário tem 17 anos ou mais. Os cartões obrigatórios devem ser aceitos para continuar.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>Relatórios de Falhas <em class="u-label-light">(opcional)</em></h4>
    <p>Permite opt-in para relatórios de falhas anônimos. Desativado por padrão. Pode ser alterado a qualquer momento nas Configurações de Privacidade.</p>
  </div>
</div>

- Os botões Aceitar e Rejeitar têm igual destaque visual (conforme as <a href="https://www.edpb.europa.eu/our-work-tools/our-documents/guidelines/guidelines-052020-consent-under-regulation-2016679_en">diretrizes EDPB</a> sobre dark patterns)
- Os usuários podem retirar o consentimento e excluir sua conta a qualquer momento nas Configurações de Privacidade
- Esta AIPD é revisada anualmente ou quando houver alterações significativas no processamento
- Publicada nesta URL para transparência pública

---

<span class="section-label">Seção 5</span>
## Decisão

<div class="callout callout-green">
  Com base na avaliação acima, todos os riscos residuais são <strong>Baixos</strong>. O processamento pode prosseguir sob as bases legais identificadas com as salvaguardas documentadas. Não é necessária consulta prévia a uma autoridade supervisora.
</div>

---

<span class="section-label">Registro de revisões</span>
## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|-----------|
| Março de 2026 | 1.0 | AIPD inicial pré-lançamento cobrindo o pipeline de transcrição de áudio, design da tela de consentimento, avaliação de riscos e documentação de bases legais |

---

</div>
