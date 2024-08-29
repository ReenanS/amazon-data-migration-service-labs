# Documentação Técnica: Arquitetura de Atualização de Dados com CDC

## Visão Geral

Esta documentação descreve a arquitetura da solução para a etapa de atualização de dados, que envolve a ativação do Change Data Capture (CDC) em tabelas específicas da base de dados SQL Server 2017 on-premises. As alterações capturadas serão transmitidas para a AWS através de um tópico Kafka e processadas por uma função AWS Lambda, que recepciona os dados no formato Avro.

## Arquitetura da Solução

### 1. Ativação do CDC no SQL Server 2017

**Objetivo:** Capturar e monitorar as alterações (inserções, atualizações e exclusões) nas tabelas críticas da base de dados de simulação.

- **Tecnologia Utilizada:** SQL Server 2017 (on-premises) com CDC ativado.
- **Descrição:** O CDC será ativado em tabelas específicas da base de dados SQL Server para capturar mudanças em tempo real. Essas mudanças incluem operações de inserção, atualização e exclusão que ocorrerem nas tabelas monitoradas.

### 2. Transmissão de Alterações via Kafka

**Objetivo:** Transmitir as alterações capturadas no SQL Server para a AWS em tempo real.

- **Tecnologia Utilizada:** Apache Kafka.
- **Descrição:** Um conector Kafka será configurado no ambiente on-premises para transmitir os eventos de mudança capturados pelo CDC para um tópico Kafka. Cada mensagem no tópico representará uma alteração ocorrida no SQL Server.

### 3. Processamento das Alterações com AWS Lambda

**Objetivo:** Receber, processar e aplicar as alterações em um banco de dados na AWS.

- **Tecnologia Utilizada:** AWS Lambda e AWS RDS Aurora PostgreSQL.
- **Descrição:**
  - **Recepção dos Dados:** A função AWS Lambda será configurada para ser disparada a cada nova mensagem publicada no tópico Kafka. A Lambda será responsável por receber os dados no formato Avro.
  - **Deserialização do Avro:** A Lambda deserializará as mensagens Avro para um formato processável.
  - **Aplicação das Alterações:** A Lambda aplicará as mudanças no banco de dados AWS RDS Aurora PostgreSQL, garantindo que as alterações realizadas na base de dados on-premises sejam refletidas no ambiente AWS.

### 4. Monitoramento e Logs

**Objetivo:** Garantir que todo o processo de atualização seja monitorado e qualquer falha possa ser rapidamente identificada e corrigida.

- **Logs da Lambda:** A função Lambda irá registrar todas as operações em logs detalhados, que poderão ser consultados no Amazon CloudWatch.
- **Monitoramento de Kafka:** Configurar métricas e alertas para monitorar o tráfego no tópico Kafka e garantir que as mensagens estejam sendo transmitidas e processadas corretamente.

## Fluxo de Dados

1. **Captura de Alterações no SQL Server:** O CDC no SQL Server 2017 captura todas as alterações nas tabelas monitoradas.
2. **Envio para Kafka:** As alterações capturadas são enviadas para um tópico Kafka, com cada evento representando uma mudança.
3. **Recepção pela Lambda:** A função Lambda é disparada para processar as mensagens recebidas no tópico Kafka.
4. **Deserialização e Aplicação:** A Lambda deserializa os dados Avro e aplica as alterações no banco de dados AWS RDS Aurora PostgreSQL.

## Desenho Arquitetural

- **Diagrama de Arquitetura:** Inclui componentes como SQL Server com CDC, Kafka, AWS Lambda, e AWS RDS Aurora PostgreSQL, mostrando o fluxo de dados desde a captura de mudanças até a aplicação das mesmas no banco de dados na AWS.

## Documentação Complementar

- **Repositório de Infraestrutura:** Link para o repositório GitHub que contém a infraestrutura de suporte, como configuração de Kafka e AWS Lambda.
- **Repositório de Aplicações:** Link para o repositório GitHub que contém o código da função Lambda responsável pelo processamento dos dados Avro.
- **Documentação de CDC no SQL Server:** Inclui links para a documentação oficial do SQL Server sobre configuração e gerenciamento de CDC.
- **Documentação de Kafka:** Links para a documentação oficial do Apache Kafka sobre configuração de conectores e tópicos.
- **Documentação AWS Lambda:** Links para a documentação oficial da AWS Lambda, incluindo exemplos de integração com Kafka e processamento de Avro.

## Pontos Focais

- **Engenheiro de Dados:** Nome, E-mail
- **Arquiteto de Soluções:** Nome, E-mail
- **Responsável pela Infraestrutura:** Nome, E-mail

## Conclusão

A solução de atualização de dados utilizando CDC e Kafka garante que todas as alterações realizadas nas tabelas críticas do SQL Server on-premises sejam replicadas em tempo real no ambiente AWS, proporcionando uma arquitetura robusta e escalável para manter a integridade e consistência dos dados. 

### Links Úteis
- **Repositório de Infraestrutura:** [Link para o repositório](#)
- **Repositório de Aplicações:** [Link para o repositório](#)
- **Documentação SQL Server CDC:** [SQL Server CDC](https://docs.microsoft.com/en-us/sql/relational-databases/sql-server-change-data-capture-cdc)
- **Documentação Apache Kafka:** [Apache Kafka](https://kafka.apache.org/documentation/)
- **Documentação AWS Lambda:** [AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
