---
layout: default
title: SafeScribe — Política de Privacidade
---

[English](../en/privacy) · [Türkçe](../tr/privacy) · [Deutsch](../de/privacy) · [Français](../fr/privacy) · [Español](../es/privacy) · **Português** · [العربية](../ar/privacy) · [中文](../zh/privacy) · [日本語](../ja/privacy) · [한국어](../ko/privacy)

# Política de Privacidade

**Última atualização:** Março 2026

## 1. Introdução

SafeScribe é um aplicativo de transcrição com IA focado em privacidade. Esta política descreve quais dados coletamos, como os processamos e seus direitos em relação às suas informações pessoais.

## 2. Dados coletados

| Categoria | Dados | Finalidade |
|-----------|-------|------------|
| Autenticação | ID de conta Google/Apple, e-mail | Identidade da conta, acesso à API |
| Áudio | Arquivos de áudio enviados | Processamento de transcrição |
| Transcrições | Texto gerado, segmentos | Entrega ao usuário |
| Uso | Duração, custo, carimbos de data/hora | Faturamento e rastreamento |
| Diagnósticos | Relatórios de falhas, logs de erros | Estabilidade do aplicativo |

**Não** coletamos: contatos, localização, histórico de navegação, identificadores de dispositivo para publicidade ou dados biométricos.

## 3. Processamento de áudio — Política de disco zero

- O áudio é processado **exclusivamente na RAM** (memória temporária) em nossos servidores.
- O áudio **nunca é gravado em disco** em nenhuma etapa do processamento.
- Todos os dados de áudio são **imediatamente apagados da memória** quando a transcrição é concluída ou falha.
- Nenhuma cópia, backup ou log do conteúdo de áudio é criado.

## 4. Armazenamento local

Todos os dados locais são armazenados em contêineres **criptografados com AES-256**. A chave de criptografia é protegida pelo armazenamento seguro nativo da plataforma (Android Keystore / iOS Keychain).

**Dados armazenados no seu dispositivo (criptografados):**

| Dados | Detalhes | Retenção |
|-------|----------|----------|
| Transcrições | Conteúdo de texto, segmentos com marca de tempo, nome do arquivo, duração, custo, idioma detectado, hash do arquivo | Até que você os exclua ou limpeza automática após o período de retenção configurado |
| Fila offline | Caminho do arquivo de áudio, duração, idioma | Temporário — removido após envio bem-sucedido |
| Configurações do app | Idioma de transcrição, idioma da interface, estado de integração, consentimento GDPR/Sentry com carimbo de data/hora | Até que você saia ou exclua sua conta |
| Índice de detecção de duplicatas | Hash do arquivo → ID da transcrição | Gerenciado automaticamente com as transcrições |
| Estado de trabalho incompleto | Dados de recuperação de transcrição em andamento | Limpo quando o trabalho é concluído ou cancelado |

**Dados no armazenamento seguro da plataforma (Keychain / Keystore):**

| Dados | Finalidade |
|-------|------------|
| Chave de criptografia Hive | Criptografa todos os contêineres de banco de dados locais |
| Tokens de autenticação | Tokens OIDC do Google/Apple Sign-In |

- **Nenhum perfil de usuário** é armazenado localmente (sem nome, foto, número de telefone ou endereço).
- Gravações de áudio são excluídas do dispositivo após o envio.
- Todos os dados locais são permanentemente apagados quando você exclui sua conta.

## 5. Autenticação

- Usamos OpenID Connect (OIDC) via Google Sign-In e Sign in with Apple.
- Recebemos apenas as informações necessárias para autenticação (ID do usuário, e-mail, nome de exibição).
- Não acessamos seus contatos, calendários ou outros dados da conta.

## 6. Dados de pagamento

- Compras no aplicativo são processadas inteiramente pela Apple App Store ou Google Play Store.
- SafeScribe **não recebe, armazena ou processa** números de cartão de crédito ou detalhes de métodos de pagamento.
- Recebemos apenas recibos de compra para verificação de saldo.

## 7. Processamento do lado do servidor

- Arquivos de áudio são enviados via conexões criptografadas TLS com certificate pinning.
- O áudio é processado apenas na RAM e **nunca toca o disco**.
- Transcrições são mantidas temporariamente para download e **excluídas após confirmação**.
- O processamento do lado do servidor usa um modelo de IA de codigo aberto auto-hospedado para reconhecimento de fala.

## 8. Rastreamento de erros

- Usamos Sentry para relatórios de falhas e monitoramento de erros.
- Todos os logs são limpos de informações de identificação pessoal (PII) antes da transmissão.
- Os seguintes tipos de dados são ocultados: endereços de e-mail, números de telefone, endereços IP, caminhos de arquivo, tokens de autenticação e IDs de trabalho.

## 9. Compartilhamento de dados

**Não vendemos, alugamos ou compartilhamos** seus dados pessoais com terceiros para fins de marketing.

Dados são compartilhados apenas com:
- **Servidores de transcrição** (nossa infraestrutura) — para processamento de áudio
- **Sentry** — para relatórios de falhas (PII removida)
- **Apple/Google** — para autenticação e processamento de pagamentos

## 10. Direitos do usuário

Você tem o direito de:
- **Acessar** suas transcrições armazenadas localmente a qualquer momento
- **Excluir** transcrições individuais ou todos os dados do aplicativo
- **Exportar** transcrições via funcionalidade de compartilhar/copiar
- **Sair** e revogar o acesso à API a qualquer momento
- **Solicitar exclusão da conta** — sua identidade de login, todos os dados armazenados localmente e o saldo de crédito restante serão permanentemente removidos

## 11. Contato

Para consultas de privacidade ou solicitações de exclusão de dados:

**E-mail:** privacy@safescribe.dev

---

*Última atualização: Março 2026*
