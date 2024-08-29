# Documentação Técnica: Base de Dados AWS RDS Aurora

## Visão Geral

Esta documentação detalha a base de dados AWS RDS Aurora, focando em sua arquitetura, modelos lógico e físico, e a infraestrutura subjacente utilizando o padrão CQRS (Command Query Responsibility Segregation). A base de dados é projetada para suportar operações de leitura e escrita de maneira escalável, garantindo alta disponibilidade e desempenho.

## Arquitetura da Solução

### 1. Padrão CQRS (Command Query Responsibility Segregation)

**Objetivo:** Separar as operações de leitura e escrita para otimizar o desempenho e a escalabilidade do sistema.

- **CQRS na AWS RDS Aurora:**
  - **Comandos (Command):** As operações de escrita, como inserções, atualizações e exclusões de dados, são tratadas de forma isolada, permitindo otimizações específicas para a performance de gravação.
  - **Consultas (Query):** As operações de leitura, como consultas complexas e agregações, são separadas das operações de escrita, possibilitando a escalabilidade horizontal dos leitores de banco de dados.

### 2. Infraestrutura de Banco de Dados

**Objetivo:** Prover uma infraestrutura robusta e escalável para suportar a aplicação, utilizando o Amazon Aurora como motor de banco de dados.

- **Amazon Aurora:**
  - **Motor de Banco de Dados:** Aurora PostgreSQL, escolhido por sua compatibilidade com PostgreSQL e recursos avançados de desempenho e escalabilidade.
  - **Clusters de Leitura e Escrita:**
    - **Cluster de Escrita:** Um nó primário dedicado à execução de operações de comando.
    - **Clusters de Leitura:** Múltiplos nós de leitura são configurados para suportar consultas, permitindo a distribuição de carga e a rápida recuperação em caso de falha.

- **Alta Disponibilidade:**
  - **Replicações e Failover:** Aurora suporta réplicas automáticas e failover, garantindo a disponibilidade contínua da base de dados com mínima interrupção.

- **Backup e Recuperação:**
  - **Backups Automáticos:** Backups automáticos diários são configurados para garantir a recuperação de dados.
  - **Snapshots Manuais:** São realizados snapshots manuais em momentos críticos para garantir a consistência dos dados.

## Modelos de Dados

### 1. Modelo Lógico

**Objetivo:** Representar a estrutura dos dados de forma abstrata, independentemente de como serão implementados fisicamente no banco de dados.

- **Entidades Principais:**
  - **Simulações:** Contém as informações sobre as simulações realizadas, como ID da simulação, data da simulação, parâmetros de entrada e resultados.
  - **Grupos:** Inclui os dados sobre os grupos de consórcio, como ID do grupo, produto associado, e situação do grupo.
  - **Clientes:** Dados dos clientes que realizam as simulações, incluindo ID do cliente, nome, CPF, e informações de contato.
  - **Produtos:** Informações sobre os produtos disponíveis para consórcio, incluindo ID do produto, nome, e descrição.

- **Relacionamentos:**
  - **Simulações - Clientes:** Um cliente pode ter várias simulações, mas uma simulação está associada a um único cliente.
  - **Grupos - Produtos:** Um produto pode estar associado a vários grupos de consórcio.

### 2. Modelo Físico

**Objetivo:** Detalhar a implementação física do modelo lógico no banco de dados AWS RDS Aurora.

- **Estrutura das Tabelas:**
  - **Tabela `Simulacoes`:**
    - **Colunas:** `ID_Simulacao` (PK), `ID_Cliente` (FK), `Data_Simulacao`, `Parametros_Entrada`, `Resultado`
    - **Índices:** Índices em `ID_Cliente` para otimizar buscas de simulações por cliente.
  
  - **Tabela `Grupos`:**
    - **Colunas:** `ID_Grupo` (PK), `ID_Produto` (FK), `Situacao`, `Data_Criacao`
    - **Índices:** Índices em `ID_Produto` para otimizar consultas relacionadas a produtos.

  - **Tabela `Clientes`:**
    - **Colunas:** `ID_Cliente` (PK), `Nome`, `CPF`, `Email`, `Telefone`
    - **Índices:** Índice único em `CPF` para garantir a unicidade do cliente.

  - **Tabela `Produtos`:**
    - **Colunas:** `ID_Produto` (PK), `Nome`, `Descricao`
    - **Índices:** Índices em `Nome` para facilitar a busca por produtos.

- **Particionamento de Tabelas:**
  - Algumas tabelas, como `Simulacoes`, são particionadas por data para melhorar a performance de consultas e a manutenção da base de dados.

- **Réplica de Leitura:**
  - Utilizadas para distribuir a carga de leitura entre várias réplicas, garantindo alta performance em consultas.

## Desenho Arquitetural

- **Diagrama de Arquitetura:** 
  - O diagrama inclui componentes como Amazon Aurora (clusters de leitura e escrita), AWS Glue Jobs para ETL, AWS S3 para armazenamento SOR, e AWS Athena para consultas. O fluxo de dados entre esses componentes também é ilustrado.

## Documentação Complementar

- **Repositório de Infraestrutura:** Link para o repositório GitHub contendo a configuração do banco de dados Aurora e scripts de provisionamento.
- **Documentação AWS Aurora:** Inclui links para a documentação oficial do AWS Aurora, detalhando a configuração de clusters, réplicas, backups e failover.

## Pontos Focais

- **Engenheiro de Dados:** Nome, E-mail
- **Arquiteto de Soluções:** Nome, E-mail
- **Responsável pela Infraestrutura:** Nome, E-mail

## Conclusão

A arquitetura da base de dados AWS RDS Aurora, utilizando o padrão CQRS, permite uma separação eficiente das operações de leitura e escrita, garantindo alta performance, escalabilidade e disponibilidade. A implementação física do modelo lógico foi planejada para suportar grandes volumes de dados e garantir a integridade e consistência, ao mesmo tempo em que possibilita consultas eficientes através de réplicas de leitura e uso otimizado de índices.

### Links Úteis
- **Repositório de Infraestrutura:** [Link para o repositório](#)
- **Documentação AWS Aurora:** [AWS Aurora](https://aws.amazon.com/rds/aurora/)
