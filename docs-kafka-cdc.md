# Documentação Técnica: Etapa de Atualização de Dados

## Visão Geral

Esta documentação descreve a arquitetura da etapa de atualização de dados, focada na captura e transmissão de mudanças em uma base de dados SQL Server 2017 on-premisses para a AWS. A solução utiliza o **Change Data Capture (CDC)** para monitorar as alterações em algumas tabelas específicas, que serão enviadas para um tópico Kafka. Um **worker ECS** em .NET será responsável por processar os dados recebidos no formato **Avro** e, em seguida, encaminhar as ações necessárias para uma **Step Function** correspondente ao domínio específico.

### Objetivo da Solução

O objetivo principal é garantir que as alterações realizadas nas tabelas da base de dados on-premisses sejam processadas em tempo real e direcionadas corretamente dentro do ambiente AWS, utilizando um fluxo resiliente e escalável.

## Arquitetura da Solução

### 1. Change Data Capture (CDC) no SQL Server 2017

- **O que é CDC?** 
  - O CDC é uma tecnologia usada para capturar todas as alterações (inserções, atualizações e deleções) realizadas em tabelas monitoradas no SQL Server 2017.
  
- **Tabelas Monitoradas:**
  - Serão monitoradas tabelas específicas que fazem parte do domínio de negócios relevante, como:
    - Tabela de **Clientes**: Captura de novos clientes ou atualizações.
    - Tabela de **Pedidos**: Captura de inserções, atualizações ou exclusões de pedidos.
    - Tabela de **Produtos**: Atualizações e deleções de produtos disponíveis.

- **Configuração do CDC:**
  - O CDC é configurado para capturar as operações de DML (Data Manipulation Language) nessas tabelas e enviar logs para um tópico Kafka.

### 2. Transmissão das Alterações via Kafka

- **Kafka como Middleware de Mensagens:**
  - As mudanças capturadas pelo CDC são enviadas para um tópico Kafka hospedado no AWS MSK (Managed Streaming for Apache Kafka).
  
- **Formato de Mensagem:**
  - As mensagens são codificadas no formato **Avro** para garantir a compactação e a portabilidade eficiente dos dados.

- **Tópicos Kafka:**
  - Cada tabela monitorada possui seu próprio tópico Kafka dedicado, facilitando o consumo e o processamento das mensagens com maior granularidade.
    - Tópico `clientes-alteracoes`
    - Tópico `pedidos-alteracoes`
    - Tópico `produtos-alteracoes`

### 3. Worker ECS em .NET

- **Responsabilidade do Worker:**
  - O worker ECS, escrito em .NET, é responsável por consumir as mensagens dos tópicos Kafka, processá-las, e identificar qual ação tomar com base no conteúdo da mensagem (inserção, atualização ou exclusão).

- **Processamento de Dados Avro:**
  - O worker contém um **deserializador Avro** que converte as mensagens do formato Avro em objetos utilizáveis dentro do código .NET.
  
- **Ações do Worker:**
  - Após o processamento da mensagem, o worker identifica o tipo de operação (inserção, atualização ou deleção) e a entidade afetada (clientes, pedidos, produtos).
  - O worker então invoca uma **AWS Step Function** correspondente ao domínio da entidade.

### 4. Step Functions por Domínio

- **Arquitetura de Step Functions:**
  - As Step Functions são usadas para orquestrar as ações necessárias dentro de cada domínio específico. Cada domínio possui sua própria Step Function dedicada, responsável por realizar o tratamento específico dos dados recebidos.
  
- **Domínios Ativos:**
  - **Step Function de Clientes:**
    - Processa atualizações e inserções de novos clientes, executando validações, e aplicando as alterações no banco de dados AWS Aurora PostgreSQL.
  
  - **Step Function de Pedidos:**
    - Gerencia atualizações e inserções de novos pedidos, acionando outros serviços relevantes, como notificações ou cálculos adicionais.
  
  - **Step Function de Produtos:**
    - Garante a sincronização de produtos no catálogo de consórcios, além de integrar com outros sistemas relacionados a disponibilidade e vendas.

### 5. Banco de Dados Destino: AWS Aurora PostgreSQL

- As alterações processadas pelas Step Functions são aplicadas diretamente no banco de dados AWS Aurora PostgreSQL, que é o repositório final dos dados sincronizados com a base on-premisses.

### 6. Orquestração e Resiliência

- **Retentativa de Mensagens:**
  - Em casos de falha no processamento das mensagens, o Kafka e o ECS implementam políticas de retry para garantir que nenhuma alteração seja perdida.
  
- **Monitoração e Logs:**
  - Todos os serviços, incluindo o Kafka, ECS, e Step Functions, são monitorados via **Amazon CloudWatch**, garantindo visibilidade sobre o estado do processamento e notificações em caso de erro.
  
- **Escalabilidade:**
  - O ECS é configurado para escalar automaticamente com base no volume de mensagens no Kafka, garantindo que picos de alterações sejam processados de forma eficiente.

## Fluxo de Dados

1. **CDC no SQL Server 2017:** O CDC captura as mudanças em tabelas monitoradas (inserções, atualizações e deleções).
2. **Transmissão via Kafka:** As alterações são enviadas para o tópico Kafka correspondente no formato Avro.
3. **Consumo pelo Worker ECS:** O worker ECS em .NET consome as mensagens, processa os dados e determina a ação necessária.
4. **Step Functions:** O worker invoca a Step Function correspondente ao domínio (Clientes, Pedidos ou Produtos).
5. **Atualização no AWS Aurora PostgreSQL:** A Step Function aplica as mudanças no banco de dados Aurora.
6. **Monitoração e Retentativa:** Logs e métricas são coletados via CloudWatch, e políticas de retry garantem resiliência.

## Componentes Envolvidos

- **SQL Server 2017 On-Premisses:**
  - Base de dados onde ocorre o CDC.
  
- **Kafka (AWS MSK):**
  - Tópicos de mensagens usados para transmitir as alterações.

- **Worker ECS (.NET):**
  - Responsável por processar as mensagens Avro e direcionar as ações para as Step Functions.

- **AWS Step Functions:**
  - Orquestração das ações por domínio.

- **AWS Aurora PostgreSQL:**
  - Banco de dados de destino das atualizações.

## Pontos Focais

- **Engenheiro de Dados:** Nome, E-mail
- **Desenvolvedor .NET (Worker ECS):** Nome, E-mail
- **Arquiteto de Soluções:** Nome, E-mail

## Conclusão

Esta solução de atualização de dados via CDC, Kafka, ECS e Step Functions foi projetada para garantir uma integração eficiente e resiliente entre uma base de dados on-premisses SQL Server e o ambiente AWS. A arquitetura é altamente escalável, utilizando o Kafka para o transporte de mensagens e o ECS para processamento em tempo real. As Step Functions garantem a correta orquestração das ações em cada domínio, enquanto a Aurora PostgreSQL armazena os dados atualizados.

### Links Úteis
- **Repositório Worker ECS .NET:** [Link para o repositório](#)
- **Documentação AWS MSK Kafka:** [AWS MSK](https://aws.amazon.com/msk/)
