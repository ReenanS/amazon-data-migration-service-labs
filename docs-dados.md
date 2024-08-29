# Documentação Técnica: Arquitetura da Etapa de Ingestão de Dados

## Visão Geral

Esta documentação descreve a arquitetura da solução para a etapa de ingestão de dados, que consiste em utilizar AWS Glue Jobs para extrair dados de um banco de dados AWS RDS Aurora, transformá-los, e armazená-los em um bucket S3 na camada Source of Record (SOR). Os dados serão ingeridos uma vez por dia às 3h da manhã, e estarão disponíveis para consulta e análise por meio do AWS Athena, com as tabelas sendo registradas no AWS Glue Data Catalog.

## Arquitetura da Solução

### 1. Ingestão de Dados com AWS Glue Jobs

**Objetivo:** Automatizar a extração diária de dados do banco de dados AWS RDS Aurora e armazená-los em um bucket S3 na camada SOR.

- **Tecnologia Utilizada:** AWS Glue Jobs
- **Descrição:** 
  - Um AWS Glue Job será agendado para executar diariamente às 3h da manhã (horário de Brasília). 
  - O job irá se conectar ao banco de dados AWS RDS Aurora e extrair os dados de todas as tabelas especificadas.
  - Após a extração, os dados serão transformados conforme necessário (por exemplo, formatados em Parquet ou CSV) e, em seguida, armazenados no bucket S3 da camada SOR.

### 2. Armazenamento de Dados na Camada SOR

**Objetivo:** Garantir que os dados extraídos estejam disponíveis para consumo e análise na camada SOR.

- **Tecnologia Utilizada:** Amazon S3
- **Descrição:** 
  - Os dados extraídos pelo AWS Glue Job serão armazenados em um bucket S3 dedicado à camada SOR. 
  - Cada execução do Glue Job criará um diretório baseado na data de execução, permitindo o versionamento e histórico dos dados.

### 3. Construção das Tabelas no AWS Glue Data Catalog

**Objetivo:** Catalogar os dados armazenados no S3 para facilitar o acesso e a consulta através do AWS Athena.

- **Tecnologia Utilizada:** AWS Glue Data Catalog
- **Descrição:** 
  - O AWS Glue Job incluirá um processo para criar e/ou atualizar as tabelas no AWS Glue Data Catalog. 
  - As tabelas serão criadas com base na estrutura dos arquivos armazenados no S3, permitindo que ferramentas como o AWS Athena possam consultar os dados diretamente.
  - Isso garante que os dados estejam prontamente disponíveis para análises e consultas ad hoc.

### 4. Consumo dos Dados via AWS Athena

**Objetivo:** Permitir consultas eficientes aos dados da camada SOR utilizando AWS Athena.

- **Tecnologia Utilizada:** AWS Athena
- **Descrição:**
  - Com os dados catalogados no AWS Glue Data Catalog, o AWS Athena pode ser usado para executar consultas SQL diretamente nos dados armazenados no S3.
  - Isso permite que os analistas de dados, engenheiros de dados, e outras partes interessadas possam acessar os dados de forma rápida e eficiente.

## Fluxo de Dados

1. **Agendamento do Glue Job:** O AWS Glue Job é agendado para execução diária às 3h da manhã.
2. **Extração e Transformação:** O Glue Job se conecta ao banco de dados AWS RDS Aurora, extrai os dados das tabelas especificadas, transforma-os conforme necessário, e os armazena em formato apropriado no bucket S3.
3. **Armazenamento no S3:** Os dados transformados são salvos em um bucket S3 na camada SOR, organizados por data de extração.
4. **Catalogação:** O Glue Job atualiza o AWS Glue Data Catalog com a estrutura das tabelas armazenadas no S3.
5. **Consulta com Athena:** Os dados catalogados no Glue Data Catalog estão disponíveis para consultas via AWS Athena.

## Desenho Arquitetural

- **Diagrama de Arquitetura:** O diagrama inclui os componentes como AWS Glue Job, AWS RDS Aurora, Amazon S3 (camada SOR), AWS Glue Data Catalog, e AWS Athena, ilustrando o fluxo de dados desde a extração até a consulta.

## Documentação Complementar

- **Repositório de Infraestrutura:** Link para o repositório GitHub contendo a configuração do AWS Glue Job e scripts relacionados.
- **Repositório de Aplicações:** Link para o repositório GitHub com o código de extração, transformação e carga (ETL) utilizado no AWS Glue.
- **Documentação AWS Glue:** Inclui links para a documentação oficial do AWS Glue, detalhando como configurar e executar jobs, bem como utilizar o Glue Data Catalog.
- **Documentação AWS Athena:** Links para a documentação oficial do AWS Athena, explicando como configurar e executar consultas SQL em dados armazenados no S3.

## Pontos Focais

- **Engenheiro de Dados:** Nome, E-mail
- **Arquiteto de Soluções:** Nome, E-mail
- **Responsável pela Infraestrutura:** Nome, E-mail

## Conclusão

A arquitetura de ingestão de dados descrita permite a automação do processo de extração e transformação de dados de um banco de dados AWS RDS Aurora, garantindo que os dados estejam disponíveis diariamente na camada SOR para consulta via AWS Athena. O uso do AWS Glue Job e Glue Data Catalog facilita o gerenciamento e acesso aos dados, proporcionando uma solução escalável e eficiente para as necessidades de análise de dados.

### Links Úteis
- **Repositório de Infraestrutura:** [Link para o repositório](#)
- **Repositório de Aplicações:** [Link para o repositório](#)
- **Documentação AWS Glue:** [AWS Glue](https://aws.amazon.com/glue/)
- **Documentação AWS Athena:** [AWS Athena](https://aws.amazon.com/athena/)
