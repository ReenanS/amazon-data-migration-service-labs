# amazon-data-migration-service-labs

## Prova de Conceito - AWS Services DMS

### 1. Criar database source (origem) para DMS

Nesta etapa, você criará um banco de dados RDS Microsoft SQL Server na AWS, que será usado como fonte de dados para o serviço de migração de dados (DMS).

#### Criar banco de dados RDS Microsoft SQL Server:

1. **Acesse o Console da AWS:**
   - Abra um navegador da web e acesse o Console de Gerenciamento da AWS em [https://console.aws.amazon.com/](https://console.aws.amazon.com/).

2. **Navegue até o serviço RDS:**
   - No Console de Gerenciamento da AWS, pesquise por "RDS" ou encontre o serviço em "Banco de dados" na lista de serviços disponíveis.

3. **Inicie a criação de uma instância de banco de dados RDS:**
   - No painel de controle do Amazon RDS, clique em "Criar banco de dados".

4. **Escolha o mecanismo de banco de dados Microsoft SQL Server:**
   - Selecione "SQL Server" como o mecanismo de banco de dados desejado.

5. **Configure as opções do banco de dados:**
   - Escolha a versão do SQL Server que deseja usar.
   - Selecione as opções de instância, como tipo de instância, tamanho da instância, armazenamento, etc.
   - Configure as opções adicionais, como nome de usuário e senha para acesso ao banco de dados.

6. **Defina as opções de rede:**
   - Especifique as configurações de rede, como VPC, subnet, segurança de grupo, etc.

7. **Configure as opções de segurança:**
   - Defina as opções de segurança, como se deseja habilitar a criptografia de dados em repouso, se deseja usar o AWS Secrets Manager para gerenciar as credenciais, etc.

8. **Revisão e criação:**
   - Revise todas as configurações para garantir que estejam corretas.
   - Clique no botão "Criar banco de dados" para iniciar a criação da instância do banco de dados RDS.

Após esses passos, o banco de dados RDS Microsoft SQL Server será criado na AWS e estará pronto para ser configurado como fonte de dados para o serviço de migração de dados (DMS).

Certifique-se de configurar corretamente as permissões de acesso e políticas de segurança para permitir que o DMS acesse o banco de dados RDS, conforme necessário.

### 2. Entrar no security group do cluster de banco de dados e incluir uma regra de entrada do tipo MSSQL, com origem qualquer local-IPv4

Nesta atividade, você precisará acessar o grupo de segurança (security group) associado ao cluster de banco de dados. Siga os passos abaixo para incluir uma regra de entrada que permita conexões MSSQL de qualquer endereço IPv4:

- Acesse o console da AWS e navegue até a seção de "Security Groups" (Grupos de Segurança).
- Encontre o grupo de segurança associado ao cluster de banco de dados SQL Server.
- Edite as configurações do grupo de segurança para adicionar uma nova regra de entrada.
- Escolha o tipo de protocolo como "MSSQL" (porta 1433).
- Defina a fonte como "Anywhere" para permitir conexões de qualquer endereço IPv4.
- Salve as alterações para aplicar a nova regra de entrada.

Certifique-se de revisar e aplicar as alterações no grupo de segurança corretamente para garantir que o acesso ao cluster de banco de dados seja configurado conforme necessário.

### 3. Aplicar scripts SQL no cluster

Nesta etapa, você aplicará scripts SQL no cluster de banco de dados para criar as tabelas necessárias e uma view. Siga as instruções abaixo:

- Execute os scripts SQL apropriados para criar as seguintes estruturas no banco de dados:
  - Tabela de Cursos
  - Tabela de Professores
  - Tabela de Estudantes
  - View UniversidadeView

Certifique-se de que os scripts SQL estão corretamente formulados e que as estruturas das tabelas e a view são criadas conforme necessário para suportar a migração de dados e as operações esperadas no ambiente de destino.

### 4. Criar bucket S3 target (destino)

Nesta etapa, você criará um bucket no Amazon Simple Storage Service (S3) que servirá como destino para os dados migrados pelo serviço de migração de dados (DMS).

Para criar um novo bucket S3 na AWS, siga estes passos:

1. **Acesse o Console da AWS:**
   - Abra um navegador da web e acesse o Console de Gerenciamento da AWS em [https://console.aws.amazon.com/](https://console.aws.amazon.com/).

2. **Navegue até o serviço S3:**
   - No Console de Gerenciamento da AWS, pesquise por "S3" ou encontre o serviço em "Armazenamento" na lista de serviços disponíveis.

3. **Inicie a criação do bucket:**
   - No painel de controle do Amazon S3, clique no botão "Criar bucket".

4. **Configure as opções do bucket:**
   - Insira um nome único para o bucket no campo "Nome do bucket". Este nome deve ser globalmente único em toda a AWS.
   - Selecione a região onde deseja criar o bucket no menu suspenso "Região".
   - Escolha as opções de configuração adicionais, como versão de controle, logging, criptografia, etc., conforme necessário.

5. **Defina as permissões de acesso:**
   - Configure as permissões de acesso ao bucket, definindo políticas de bucket ou usando o sistema de permissões do AWS IAM.
   - Certifique-se de revisar e configurar as permissões de forma adequada para garantir que o DMS tenha permissão para gravar dados no bucket, se necessário.

6. **Revisão e criação:**
   - Revise as configurações do bucket para garantir que estejam corretas.
   - Clique no botão "Criar bucket" para finalizar o processo de criação.

Após esses passos, o bucket S3 será criado na região selecionada e estará pronto para ser utilizado como destino para os dados migrados pelo serviço de migração de dados (DMS) da AWS.

Certifique-se de que o nome escolhido seja descritivo e fácil de identificar como o destino dos dados migrados. Além disso, é importante revisar e configurar as permissões de acesso e políticas de segurança do bucket S3 para garantir que o serviço de migração de dados tenha permissão adequada para gravar dados no bucket.

### 5. Criar Instâncias de replicação DMS

Nesta etapa, você criará instâncias de replicação no AWS Database Migration Service (DMS), que serão responsáveis por migrar os dados entre a origem e o destino.

#### Criar instâncias de replicação DMS:

1. **Acesse o Console da AWS:**
   - Abra um navegador da web e acesse o Console de Gerenciamento da AWS em [https://console.aws.amazon.com/](https://console.aws.amazon.com/).

2. **Navegue até o serviço DMS:**
   - No Console de Gerenciamento da AWS, pesquise por "DMS" ou encontre o serviço em "Banco de dados" na lista de serviços disponíveis.

3. **Inicie a criação de uma nova instância de replicação:**
   - No painel de controle do AWS DMS, clique em "Criar instância".

4. **Configure as opções da instância de replicação:**
   - Escolha um nome descritivo para a instância de replicação.
   - Selecione o tipo de instância e o tamanho conforme necessário para suportar a carga de trabalho de replicação.
   - Defina a região onde deseja implantar a instância de replicação.

5. **Defina as opções de rede:**
   - Especifique as configurações de rede, como VPC, subnet, segurança de grupo, etc.

6. **Configure as opções de acesso e segurança:**
   - Defina as opções de acesso e segurança, como se deseja usar uma IAM role ou chaves de acesso para autenticação, se deseja habilitar a criptografia de dados em trânsito, etc.

7. **Configure as opções de replicação:**
   - Escolha o tipo de carga de trabalho que deseja migrar (por exemplo, migração de banco de dados completo, replicação contínua, etc.).
   - Selecione as opções de migração, como a escolha dos objetos a serem migrados, opções de transformação de dados, etc.

8. **Revisão e criação:**
   - Revise todas as configurações para garantir que estejam corretas.
   - Clique no botão "Criar instância" para iniciar a criação da instância de replicação DMS.

Após esses passos, a instância de replicação DMS será criada na AWS e estará pronta para ser configurada para replicar os dados entre a origem e o destino.

Certifique-se de revisar e configurar corretamente todas as opções de configuração para atender aos requisitos do seu projeto de migração de dados.

### 6. Criar endpoint de origem do DMS

Nesta etapa, você criará um endpoint de origem no AWS Database Migration Service (DMS) para se conectar ao seu banco de dados RDS Microsoft SQL Server.

#### Criar endpoint de origem do DMS:

1. **Acesse o Console da AWS:**
   - Abra um navegador da web e acesse o Console de Gerenciamento da AWS em [https://console.aws.amazon.com/](https://console.aws.amazon.com/).

2. **Navegue até o serviço DMS:**
   - No Console de Gerenciamento da AWS, pesquise por "DMS" ou encontre o serviço em "Banco de dados" na lista de serviços disponíveis.

3. **Crie um novo endpoint de origem:**
   - No painel de controle do AWS DMS, clique em "Endpoints" no menu lateral e, em seguida, clique em "Criar endpoint".

4. **Configure o endpoint de origem:**
   - Escolha um nome descritivo para o endpoint de origem.
   - Selecione o tipo de endpoint como "Endpoint de origem do banco de dados".
   - Selecione o mecanismo do banco de dados como "Microsoft SQL Server".
   - Insira o nome do servidor do banco de dados RDS Microsoft SQL Server, o nome do banco de dados, o nome de usuário e a senha necessários para acessar o banco de dados.

5. **Defina as opções de conexão:**
   - Especifique as opções de conexão, como porta e protocolo de comunicação (geralmente a porta padrão para SQL Server é 1433 e o protocolo é TCP).

6. **Configure as opções de segurança:**
   - Selecione a opção de autenticação que deseja usar para se conectar ao banco de dados RDS (por exemplo, usar um AWS Secrets Manager ou inserir as credenciais manualmente).

7. **Defina as opções de teste de conexão:**
   - Teste a conexão com o banco de dados RDS para garantir que as configurações estejam corretas e a conexão seja bem-sucedida.

8. **Revisão e criação:**
   - Revise todas as configurações para garantir que estejam corretas.
   - Clique no botão "Criar endpoint" para criar o endpoint de origem do DMS.

Após esses passos, o endpoint de origem do DMS estará configurado e pronto para ser usado para migrar dados do seu banco de dados RDS Microsoft SQL Server.

Certifique-se de configurar corretamente as opções de conexão e segurança para garantir uma conexão segura e confiável ao seu banco de dados de origem.

### 7. Criar endpoint de destino (bucket S3) do DMS

Nesta etapa, você criará um endpoint de destino no AWS Database Migration Service (DMS) para se conectar ao seu bucket S3, onde os dados migrados serão armazenados.

#### Criar endpoint de destino (bucket S3) do DMS:

1. **Acesse o Console da AWS:**
   - Abra um navegador da web e acesse o Console de Gerenciamento da AWS em [https://console.aws.amazon.com/](https://console.aws.amazon.com/).

2. **Navegue até o serviço DMS:**
   - No Console de Gerenciamento da AWS, pesquise por "DMS" ou encontre o serviço em "Banco de dados" na lista de serviços disponíveis.

3. **Crie um novo endpoint de destino:**
   - No painel de controle do AWS DMS, clique em "Endpoints" no menu lateral e, em seguida, clique em "Criar endpoint".

4. **Configure o endpoint de destino:**
   - Escolha um nome descritivo para o endpoint de destino.
   - Selecione o tipo de endpoint como "Endpoint de destino do Amazon S3".
   - Especifique o nome do bucket S3 onde deseja armazenar os dados migrados.

5. **Defina as opções de acesso:**
   - Configure as opções de acesso ao bucket S3, como a IAM Role que o DMS usará para acessar o bucket. 
   - Certifique-se de que o DMS tenha permissões adequadas para gravar dados no bucket S3.

6. **Defina as opções de mapeamento de dados (se aplicável):**
   - Nas configurações de endpoint, escolha a opção de Editor e inclua o seguinte JSON:
```json
{
  "rules": [
    {
      "rule-type": "selection",
      "rule-id": "447422326",
      "rule-name": "447422326",
      "object-locator": {
        "schema-name": "dbo",
        "table-name": "Cursos"
      },
      "rule-action": "include",
      "filters": [],
      "parallel-load": null,
      "isAutoSegmentationChecked": false
    },
    {
      "rule-type": "selection",
      "rule-id": "447411803",
      "rule-name": "447411803",
      "object-locator": {
        "schema-name": "dbo",
        "table-name": "Professores"
      },
      "rule-action": "include",
      "filters": [],
      "parallel-load": null,
      "isAutoSegmentationChecked": false
    },
    {
      "rule-type": "selection",
      "rule-id": "447411803",
      "rule-name": "447411803",
      "object-locator": {
        "schema-name": "dbo",
        "table-name": "Estudantes"
      },
      "rule-action": "include",
      "filters": [],
      "parallel-load": null,
      "isAutoSegmentationChecked": false
    },	
    {
      "rule-type": "selection",
      "rule-id": "448158867",
      "rule-name": "448158867",
      "object-locator": {
        "schema-name": "dbo",
        "table-name": "UniversidadeView",
        "table-type": "view"
      },
      "rule-action": "include",
      "filters": [],
      "parallel-load": null,
      "isAutoSegmentationChecked": false
    }
  ]
}
```
7. **Revisão e criação:**
   - Revise todas as configurações para garantir que estejam corretas.
   - Clique no botão "Criar endpoint" para criar o endpoint de destino do DMS.

Após esses passos, o endpoint de destino do DMS estará configurado e pronto para ser usado para armazenar os dados migrados no bucket S3.

Certifique-se de configurar corretamente as permissões de acesso e as opções de mapeamento de dados, se necessário, para garantir que os dados migrados sejam armazenados corretamente no bucket S3.

### 8. Criar tarefas de migração de banco de dados

Nesta etapa, você criará tarefas de migração de banco de dados no AWS Database Migration Service (DMS) para definir o escopo e os detalhes da migração de dados entre a origem e o destino.

#### Criar tarefas de migração de banco de dados no DMS:

1. **Acesse o Console da AWS:**
   - Abra um navegador da web e acesse o Console de Gerenciamento da AWS em [https://console.aws.amazon.com/](https://console.aws.amazon.com/).

2. **Navegue até o serviço DMS:**
   - No Console de Gerenciamento da AWS, pesquise por "DMS" ou encontre o serviço em "Banco de dados" na lista de serviços disponíveis.

3. **Crie uma nova tarefa de migração:**
   - No painel de controle do AWS DMS, clique em "Tarefas" no menu lateral e, em seguida, clique em "Criar tarefa".

4. **Configure os detalhes da tarefa de migração:**
   - Escolha um nome descritivo para a tarefa de migração.
   - Selecione a instância de origem e o endpoint de origem criado anteriormente no DMS.
   - Escolha a instância de destino e o endpoint de destino criado anteriormente no DMS.
   - Defina o tipo de migração (por exemplo, migração completa, replicação contínua, etc.).
   - Especifique as opções de transformação de dados, se necessário, como mapeamento de esquema, filtragem de dados, etc.

5. **Defina as opções de carga e monitoramento:**
   - Configure as opções de carga, como o modo de carga (online ou offline) e o comportamento em caso de conflitos de dados.
   - Escolha as opções de monitoramento, como definir alarmes para métricas específicas durante a migração.

6. **Revisão e criação:**
   - Revise todas as configurações para garantir que estejam corretas.
   - Clique no botão "Criar tarefa" para criar a tarefa de migração de banco de dados no DMS.

Após esses passos, a tarefa de migração de banco de dados estará configurada e pronta para ser executada no AWS DMS.

Certifique-se de revisar e configurar corretamente todos os detalhes da tarefa de migração para garantir uma migração bem-sucedida e sem problemas.

### 9. Liberar acesso do DMS ao bucket S3 via IAM Role

Nesta etapa, você criará uma IAM Role no AWS Identity and Access Management (IAM) para conceder ao AWS Database Migration Service (DMS) permissões adequadas para acessar o bucket S3 de destino.

#### Criar IAM Role para acesso do DMS ao bucket S3:

1. **Acesse o Console da AWS:**
   - Abra um navegador da web e acesse o Console de Gerenciamento da AWS em [https://console.aws.amazon.com/iam/](https://console.aws.amazon.com/iam/).

2. **Navegue até a seção "Funções" no IAM:**
   - No Console de Gerenciamento da AWS, vá para a seção "Funções" no painel de navegação esquerdo.

3. **Crie uma nova função:**
   - Clique no botão "Criar função" para começar a criar uma nova IAM Role.

4. **Escolha o serviço que usará essa função:**
   - No assistente de criação de função, escolha "Serviço da AWS" como o serviço que usará essa função.
   - Selecione "DMS" na lista de serviços disponíveis.

5. **Anexe as políticas necessárias:**
   - Na próxima etapa, selecione a política "AmazonS3FullAccess" para conceder ao DMS acesso completo ao Amazon S3.
   - Você também pode adicionar outras políticas específicas, dependendo dos requisitos de acesso do DMS.

6. **Defina as tags (opcional):**
   - Adicione tags para identificar e categorizar a IAM Role, se necessário.

7. **Revise e finalize:**
   - Revise todas as configurações para garantir que estejam corretas.
   - Insira um nome descritivo para a IAM Role e uma descrição, se desejar.
   - Clique no botão "Criar função" para criar a IAM Role.

8. **Atribua a IAM Role à instância do DMS:**
   - Após a criação da IAM Role, anote o ARN (Amazon Resource Name) da Role.
   - Atribua essa IAM Role à instância do AWS DMS durante a configuração da migração de dados, para que o DMS tenha permissões adequadas para acessar o bucket S3 de destino.

Após esses passos, a IAM Role estará configurada e pronta para ser usada pelo AWS DMS para acessar o bucket S3 de destino.

Certifique-se de revisar e atribuir corretamente as permissões necessárias para garantir que o DMS tenha acesso seguro e autorizado ao bucket S3.