---
layout: default
title: SafeScribe — Política de privacidade
description: Quais dados o SafeScribe coleta, como os processamos e seus direitos.
lang: pt
---

<div class="page-content" markdown="1">

# Política de privacidade

<div class="summary-box">
  <strong>Em termos simples:</strong> Processamos seu áudio na memória do servidor para criar uma transcrição e, em seguida, o excluímos imediatamente. Não armazenamos áudio em disco, não o usamos para treinar IA e não o compartilhamos com ninguém. Suas transcrições são criptografadas no seu dispositivo e estão sob seu controle. Mantemos apenas registros de cobrança pseudônimos.
</div>

<p class="page-meta">Última atualização: March 2026</p>

---

<span class="section-label">O que nunca fazemos</span>
## Dados que não coletamos nem armazenamos
{: #data-we-dont-collect-or-store}

<ul class="dont-list">
  <li><span class="x-mark">&#x2717;</span> Armazenar áudio em disco — jamais</li>
  <li><span class="x-mark">&#x2717;</span> Armazenar seu endereço de e-mail ou nome</li>
  <li><span class="x-mark">&#x2717;</span> Registrar ou armazenar endereços IP</li>
  <li><span class="x-mark">&#x2717;</span> Usar gravações para treinar modelos de IA</li>
  <li><span class="x-mark">&#x2717;</span> Compartilhar dados com anunciantes ou corretores de dados</li>
  <li><span class="x-mark">&#x2717;</span> Rastrear comportamento entre apps ou sessões</li>
  <li><span class="x-mark">&#x2717;</span> Coletar contatos, localização ou dados biométricos</li>
  <li><span class="x-mark">&#x2717;</span> Reter dados após a exclusão da conta</li>
</ul>

---

<span class="section-label">O que armazenamos</span>
## Dados coletados

### No servidor (permanente até a exclusão da conta)

| Dados | Finalidade |
|-------|------------|
| ID de usuário pseudônimo (hash SHA-256 do seu ID de conta) | Identidade da conta — não reversível |
| Identificador de dispositivo pseudônimo (hash SHA-256 das propriedades do dispositivo) | Prevenção de abusos — não reversível |
| Saldo da conta (USD) | Gerenciamento de crédito |
| Minutos de transcrição gratuitos restantes | Rastreamento do bônus de boas-vindas |
| Carimbos de data/hora de criação e última atualização da conta | Gerenciamento da conta |

**Registros por trabalho** (armazenados para cada transcrição concluída):

| Dados | Finalidade |
|-------|------------|
| Duração do áudio (segundos) | Análise do serviço |
| Tamanho do arquivo (bytes) | Análise do serviço |
| Contagem de palavras | Análise do serviço |
| Valor cobrado (USD) | Registro de cobrança |
| Carimbos de data/hora de processamento | Análise do serviço |

<div class="callout callout-info">
  <strong>Os registros por trabalho nunca contêm conteúdo de áudio ou texto de transcrição.</strong> Esses registros contêm apenas metadados (números e carimbos de data/hora) — nunca o que você disse.
</div>

### No servidor (temporário — excluído após o processamento)

| Dados | Quando excluídos |
|-------|-----------------|
| Arquivo de áudio | Imediatamente após a conclusão da transcrição |
| Texto de transcrição | Após confirmar o recebimento (confirmação) |

### No seu dispositivo (criptografado)

| Dados | Período de retenção |
|-------|---------------------|
| Transcrições (texto, segmentos, metadados) | Até você excluí-las |
| Fila de upload offline | Removida após upload bem-sucedido |
| Configurações do app e registros de consentimento | Até o logout ou exclusão da conta |
| Chave de criptografia | No iOS Keychain / Android Keystore — excluída com o app |

### Opcional (somente com aceitação)

| Dados | Finalidade |
|-------|------------|
| Relatórios de falhas | Estabilidade do app via Sentry — todos os dados pessoais removidos antes da transmissão |

<div class="callout callout-green">
  <strong>O servidor nunca armazena seu nome, endereço de e-mail, endereço IP, conteúdo de áudio ou texto de transcrição.</strong> Os únicos registros persistentes vinculados à sua conta são um hash de usuário não reversível, um identificador de dispositivo pseudônimo, um saldo de crédito e estatísticas de uso (apenas números — sem conteúdo, sem identidade).
</div>

---

<span class="section-label">Exclusão completa</span>
## Excluir o app vs. excluir a conta

Estas são duas ações distintas com resultados diferentes:

| Ação | O que acontece | Seu saldo |
|------|---------------|----------|
| **Excluir o app** | Transcrições locais e chave de criptografia removidas do seu dispositivo | Preservado no servidor — reinstalar e entrar com a mesma conta restaura completamente |
| **Excluir a conta** | Cada registro do servidor é excluído permanentemente — não pode ser desfeito | Perdido |

<div class="callout callout-info">
  <strong>Reinstale quando quiser.</strong> Se você excluir o app sem excluir sua conta, reinstalar e entrar com a mesma conta Google ou Apple restaura seu saldo completo e acesso — sem nenhuma ação necessária.
</div>

### Exclusão de conta — Zero dados restantes

Excluir sua conta nas Configurações de privacidade remove permanentemente cada registro do servidor:

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>ID de usuário pseudônimo</strong><span class="item-desc">excluído permanentemente</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Identificador de dispositivo pseudônimo</strong><span class="item-desc">excluído permanentemente</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Saldo de crédito</strong><span class="item-desc">excluído permanentemente</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Minutos gratuitos restantes</strong><span class="item-desc">excluídos permanentemente</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Todas as estatísticas por trabalho</strong><span class="item-desc">excluídas permanentemente</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Backup diário substituído em 24 horas</strong><span class="item-desc"><strong>nenhuma cópia permanece em lugar algum</strong></span></span></li>
</ul>

Isso não é anonimização. Seus registros não persistem em forma agregada ou modificada — eles são excluídos. O backup diário único é substituído dentro de 24 horas após a exclusão, após o qual nenhuma cópia dos seus dados existe em qualquer sistema.

O uso da exclusão no app constitui o exercício formal do seu direito de apagamento sob o GDPR Art. 17 e o KVKK Art. 11(e). Se não puder acessar sua conta, entre em contato com **privacy@safescribe.dev** para enviar uma solicitação de exclusão por e-mail.

---

<span class="section-label">Processamento de áudio</span>
## Política de disco zero

<div class="flow-diagram">
Seu áudio:  Upload --> RAM --> Transcrição IA --> Entrega --> EXCLUSÃO
                                                              (imediata)

Nosso disco:  Apenas registros de saldo — sem áudio, sem transcrição, sem e-mail
</div>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Somente RAM</strong><span class="item-desc">o áudio é processado exclusivamente em memória volátil</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Nunca escrito em disco</strong><span class="item-desc">nem mesmo temporariamente</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Sem treinamento de IA</strong><span class="item-desc">seu áudio nunca é usado para melhorar modelos</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>IA própria</strong><span class="item-desc">nenhum serviço de IA de terceiros recebe seu áudio</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Proteção TTL</strong><span class="item-desc">os dados se autodestroem mesmo se o código de exclusão falhar</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Bloqueio de memória</strong><span class="item-desc">bloqueio em nível de sistema operacional impede que o áudio seja transferido para o disco</span></span></li>
</ul>

---

<span class="section-label">Autenticação</span>
## Login com Google ou Apple

Usamos OpenID Connect (OIDC) via Google Sign-In e Sign in with Apple.

| O que o provedor nos envia | O que fazemos com isso |
|---------------------------|------------------------|
| ID da conta | Hasheado (SHA-256 + sal) — o original é descartado |
| Endereço de e-mail | Usado apenas para autenticação — **não armazenado** |
| Nome de exibição | **Não armazenado** |

Não acessamos seus contatos, calendário ou outros dados da conta.

---

<span class="section-label">Pagamentos</span>
## Cobrança via App Stores

Os pagamentos são processados inteiramente pela Apple App Store ou Google Play Store. O SafeScribe **nunca recebe, armazena ou processa** números de cartão de crédito ou detalhes de pagamento. Recebemos apenas um recibo de compra para verificação de saldo.

<div class="callout callout-info">
  <strong>Os registros de pagamento mantidos pela Apple ou Google</strong> estão fora do controle do SafeScribe e não são cobertos pelo processo de exclusão de conta do SafeScribe. Para gerenciar esses registros, entre em contato diretamente com o <a href="https://support.apple.com">Suporte Apple</a> ou o <a href="https://support.google.com/googleplay">Suporte Google Play</a>.
</div>

---

<span class="section-label">Rastreamento de erros</span>
## Relatórios de falhas (Opcional)

Usamos o Sentry para relatórios de falhas opcionais. Está **desativado por padrão** e pode ser alterado a qualquer momento nas Configurações de privacidade.

Antes de qualquer relatório ser transmitido, os seguintes dados são removidos automaticamente:

**Removidos:** endereços de e-mail · números de telefone · endereços IP · caminhos de arquivo · tokens de autenticação · identificadores de trabalho

**Mantidos:** tipo de erro e rastreamento de pilha · modelo do dispositivo · versão do sistema operacional · versão do app

---

<span class="section-label">Terceiros</span>
## Serviços de terceiros

Usamos os seguintes serviços. Nenhum áudio, conteúdo de transcrição ou informação pessoal além do indicado é compartilhado com terceiros.

| Serviço | Finalidade | Dados compartilhados | Política de privacidade |
|---------|-----------|---------------------|------------------------|
| Google Sign-In | Autenticação | Apenas token OIDC | [policies.google.com/privacy](https://policies.google.com/privacy) |
| Apple Sign-In | Autenticação | Apenas token OIDC | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Apple App Store | Compras no app | Apenas recibo de compra | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Google Play Store | Compras no app | Apenas recibo de compra | [policies.google.com/privacy](https://policies.google.com/privacy) |
| Sentry | Relatórios de falhas (opt-in) | Relatório de erro anônimo — dados pessoais removidos | [sentry.io/privacy](https://sentry.io/privacy/) |

---

<span class="section-label">Base legal</span>
## Base legal do tratamento

| Atividade de tratamento | Base GDPR | Base KVKK | Obrigatório? |
|------------------------|----------|----------|-------------|
| Transcrição de áudio | Art. 6(1)(b) — Contrato | Consentimento explícito | Obrigatório para usar o serviço |
| Conta e cobrança | Art. 6(1)(b) — Contrato | Execução do contrato | Obrigatório para usar o serviço |
| Autenticação (OIDC) | Art. 6(1)(b) — Contrato | Execução do contrato | Obrigatório para usar o serviço |
| Compras no app | Art. 6(1)(b) — Contrato | Execução do contrato | Obrigatório para compras |
| Relatórios de falhas | Art. 6(1)(a) — Consentimento | Consentimento explícito | Opcional |

Fornecer dados para transcrição, autenticação e cobrança é **obrigatório** para usar o SafeScribe. Os relatórios de falhas são **opcionais** — o serviço funciona completamente sem eles.

---

<span class="section-label">Seus direitos</span>
## O que você pode fazer

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Acessar</strong><span class="item-desc">visualizar todas as suas transcrições no app a qualquer momento</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Excluir</strong><span class="item-desc">remover transcrições individuais ou sua conta inteira nas Configurações de privacidade; a exclusão da conta não deixa nenhum registro em nenhum banco de dados</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Exportar</strong><span class="item-desc">compartilhar ou exportar transcrições, ou solicitar uma exportação completa de dados nas Configurações de privacidade</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Recusar diagnósticos</strong><span class="item-desc">desativar relatórios de falhas nas Configurações de privacidade</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Retirar o consentimento</strong><span class="item-desc">fazer logout e excluir sua conta a qualquer momento</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Exclusão CCPA</strong><span class="item-desc">ative "Não vender ou compartilhar" nas Configurações de privacidade</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Sem decisões automatizadas</strong><span class="item-desc">nunca tomamos decisões automatizadas sobre você, incluindo criação de perfis com efeitos legais ou similares (GDPR Art. 22)</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Apresentar reclamação</strong><span class="item-desc">residentes da UE/AEE podem contactar a sua autoridade de controlo nacional (<a href="https://www.edpb.europa.eu/about-edpb/about-edpb/members_en">edpb.europa.eu</a>); residentes na Turquia podem contactar o KVKK (<a href="https://www.kvkk.gov.tr">kvkk.gov.tr</a>)</span></span></li>
</ul>

Para qualquer solicitação que não possa concluir no app, entre em contato com **privacy@safescribe.dev**.

---

<span class="section-label">Legal</span>
## Informações adicionais

**Responsável pelo tratamento.** O SafeScribe é operado por um desenvolvedor independente sediado na Turquia. Contato: privacy@safescribe.dev. Nenhum Encarregado de Proteção de Dados (DPO) foi nomeado — o tratamento não é realizado em grande escala e nenhum dado de categoria especial é sistematicamente retido (o áudio é processado de forma efêmera apenas em RAM, nunca persistido em disco).

**Backups.** Um único backup diário dos registros de conta (ID pseudônimo, saldo, estatísticas de uso) é mantido para continuidade do serviço. Cada backup substitui o anterior. Os dados excluídos pela exclusão da conta são removidos imediatamente dos sistemas ativos e do backup em 24 horas.

**Transferências internacionais.** Se você usa o SafeScribe da UE/AEE, seu áudio e os dados da sua conta são processados em servidores na Turquia. A Turquia não possui atualmente uma <a href="https://commission.europa.eu/law/law-topic/data-protection/international-dimension-data-protection/adequacy-decisions_en">decisão de adequação da UE</a>; as transferências são cobertas pelo seu consentimento explícito e informado no primeiro acesso (GDPR Art. 49(1)(a)). Para usuários da Turquia (KVKK), a transferência transfronteiriça é autorizada por consentimento explícito no primeiro acesso sob o KVKK Art. 9.

**Crianças.** O SafeScribe tem classificação 17+ na App Store e no Google Play e não se destina a usuários menores de 17 anos. Não coletamos dados de menores de 17 anos conscientemente. Em jurisdições onde 18 é a idade de plena capacidade legal (incluindo a Turquia), usuários de 17 anos requerem o consentimento de um pai ou responsável antes de usar o app.

**Alterações de política.** Atualizaremos esta página quando nossas práticas mudarem. A data de "Última atualização" acima reflete a revisão mais recente.

---

<span class="section-label">Contato</span>
## Entre em contato

| Assunto | Contato |
|---------|---------|
| Solicitações de privacidade, exclusão de dados, direitos | privacy@safescribe.dev |
| Vulnerabilidades de segurança | security@safescribe.dev |
| Suporte geral | support@safescribe.dev |

---


</div>
