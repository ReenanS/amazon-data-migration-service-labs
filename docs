# Documentação Técnica: Modernização da Simulação de Consórcio

## Visão Geral

Este documento apresenta a arquitetura da solução de modernização da simulação de consórcio, com foco na migração de dados e na implementação da nova infraestrutura na AWS. O objetivo é fornecer uma visão clara e objetiva para que qualquer time de engenharia possa entender e contribuir para o projeto.

## Arquitetura da Solução

A arquitetura da solução envolve a migração dos dados de simulação de uma base de dados SQL Server 2017, hospedada on-premises, para um ambiente na AWS, utilizando serviços gerenciados que garantem escalabilidade, segurança e alta disponibilidade. A solução está dividida nas seguintes etapas principais:

### 1. Migração de Dados

**Objetivo:** Migrar os dados de simulação de consórcio da base de dados SQL Server 2017 on-premises para a AWS.

- **Tecnologia Utilizada:** AWS Database Migration Service (DMS)
- **Descrição:** O AWS DMS será utilizado para realizar um full-load de tabelas e views relacionadas à simulação. O resultado do full-load será armazenado em um bucket S3 na AWS.
- **Armazenamento Intermediário:** Bucket S3 (AWS)
- **ETL (Extract, Transform, Load):** AWS Glue será utilizado para acessar os dados no bucket S3. Um script Python será executado no AWS Glue Job para extrair, transformar e carregar os dados em um banco de dados AWS RDS Aurora PostgreSQL.
- **Banco de Dados de Destino:** AWS RDS Aurora PostgreSQL, que armazenará os dados de simulação de consórcio.

**Desenho Arquitetural:**
- Diagrama de arquitetura destacando o fluxo de dados desde o ambiente on-premises até o RDS Aurora PostgreSQL via S3 e AWS Glue.

### 2. Infraestrutura e Aplicações

- **Repositório de Infraestrutura:** Link para o repositório GitHub onde a infraestrutura, provisionada via Terraform, está documentada.
- **Repositório de Aplicações:** Link para o repositório GitHub das aplicações que interagem com a base de dados de simulação, incluindo o código do AWS Glue Job e a configuração do AWS DMS.
- **Desenhos Arquiteturais:** Imagens com os desenhos de arquitetura detalhados da solução estão incluídas no repositório, fornecendo uma visão clara dos componentes e suas interações.

### 3. Documentação Complementar

- **Documentação da Base de Dados AWS:** Inclui o modelo lógico e físico da base de dados RDS Aurora PostgreSQL.
- **Documentação Extra:** Links para a documentação oficial do AWS DMS, AWS Glue, e AWS RDS Aurora PostgreSQL.
- **Pontos Focais:** Lista de contatos principais do time, incluindo engenheiros de dados, arquitetos de soluções, e responsáveis pela infraestrutura.

## Etapa de Migração de Dados

A etapa de migração é crucial para garantir que os dados de simulação sejam transferidos de forma precisa e segura para o novo ambiente na AWS.

### 1. Preparação do Ambiente

- **SQL Server On-Premises:** Verificar a integridade dos dados e preparar as tabelas e views que serão migradas.
- **AWS DMS Setup:** Configurar a instância do DMS, incluindo a criação de endpoints para o SQL Server on-premises e o bucket S3 de destino.
- **S3 Bucket:** Configurar o bucket S3 que receberá os dados do full-load.

### 2. Execução do Full-Load

- **DMS Task:** Criar e executar uma task no AWS DMS para realizar o full-load dos dados. Monitorar o progresso e resolver quaisquer problemas que surgirem.
- **Verificação dos Dados:** Validar os dados carregados no bucket S3 para garantir que a migração foi bem-sucedida.

### 3. Transformação e Carga

- **AWS Glue Job:** Desenvolver um script Python no AWS Glue para transformar os dados conforme necessário.
- **Carga no Aurora PostgreSQL:** Executar o script no AWS Glue Job para carregar os dados transformados no banco de dados AWS RDS Aurora PostgreSQL.
- **Validação Pós-Carga:** Realizar testes de integridade e consistência dos dados no banco de dados Aurora PostgreSQL.

## Conclusão

A modernização da simulação de consórcio é um projeto complexo que envolve várias etapas críticas de migração de dados e configuração de infraestrutura na AWS. A documentação detalhada, os repositórios de código e as imagens de arquitetura fornecem uma base sólida para a implementação e manutenção dessa solução.

### Links Úteis
- **Repositório de Infraestrutura:** [Link para o repositório](#)
- **Repositório de Aplicações:** [Link para o repositório](#)
- **Documentação AWS DMS:** [AWS DMS](https://aws.amazon.com/dms/)
- **Documentação AWS Glue:** [AWS Glue](https://aws.amazon.com/glue/)
- **Documentação AWS RDS Aurora PostgreSQL:** [Aurora PostgreSQL](https://aws.amazon.com/rds/aurora/postgresql/)

### Pontos Focais
- **Engenheiro de Dados:** Nome, E-mail
- **Arquiteto de Soluções:** Nome, E-mail
- **Responsável pela Infraestrutura:** Nome, E-mail
