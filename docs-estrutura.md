# Estrutura das Tabelas

## Tabela Produto Consórcio - `tbrt7034_prod_csrc`

| Nome da Coluna            | Tipo da Chave | Tipo de Dados (Number) | Descrição                                      |
|---------------------------|---------------|------------------------|------------------------------------------------|
| cod_prod_csrc             | PK            | Number                 | Código único que identifica o produto consórcio|
| cod_exto_prod_csrc        |               | Number                 | Código externo associado ao produto consórcio  |
| cod_copl_exto_prod_csrc   |               | Number                 | Código complementar externo do produto consórcio|
| nom_prod_csrc             |               | String                 | Nome do produto consórcio                      |

## Tabela Grupo Consórcio - `tbrt7032_grup_csrc`

| Nome da Coluna                  | Tipo da Chave | Tipo de Dados (Number) | Descrição                                          |
|---------------------------------|---------------|------------------------|----------------------------------------------------|
| cod_grup_csrc                   | PK            | Number                 | Código único que identifica o grupo consórcio      |
| cod_exto_grup_csrc              |               | Number                 | Código externo associado ao grupo consórcio        |
| cod_exto_copl_grup_csrc         |               | Number                 | Código complementar externo do grupo consórcio     |
| cod_prod_csrc                   | FK            | Number                 | Código do produto consórcio associado ao grupo     |
| cod_situ_grup_csrc              | FK            | Number                 | Código da situação do grupo consórcio              |
| num_dia_vcto_parc_grup_csrc     |               | Number                 | Dia de vencimento das parcelas do grupo consórcio  |
| prz_comc_grup_csrc              |               | Number                 | Prazo de comercialização do grupo consórcio        |
| prz_rest_grup_csrc              |               | Number                 | Prazo restante do grupo consórcio                  |
| dat_hor_cada_grup_csrc          |               | DateTime               | Data e hora de cadastro do grupo consórcio         |
| dat_hor_frmc_grup_csrc          |               | DateTime               | Data e hora da última atualização do grupo consórcio|
| num_qtd_pati_grup_csrc          |               | Number                 | Quantidade de participantes no grupo consórcio     |
| num_qtd_vaga_grup_csrc          |               | Number                 | Quantidade de vagas disponíveis no grupo consórcio |
| ind_pmte_vend_grup_csrc         |               | Boolean                | Indicador se o grupo permite venda                 |

## Tabela Situação Grupo Consórcio - `tbrt7036_situ_grup_csrc`

| Nome da Coluna             | Tipo da Chave | Tipo de Dados (Number) | Descrição                                    |
|----------------------------|---------------|------------------------|----------------------------------------------|
| cod_situ_grup_csrc         | PK            | Number                 | Código único que identifica a situação do grupo |
| cod_exto_situ_grup_csrc    |               | Number                 | Código externo associado à situação do grupo |
| nom_situ_grup_csrc         |               | String                 | Nome da situação do grupo                    |

## Tabela Bem Consórcio - `tbrt7030_bem_csrc`

| Nome da Coluna             | Tipo da Chave | Tipo de Dados (Number) | Descrição                                    |
|----------------------------|---------------|------------------------|----------------------------------------------|
| cod_bem_csrc               | PK            | Number                 | Código único que identifica o bem consórcio  |
| cod_exto_bem_csrc          | FK            | Number                 | Código externo associado ao bem consórcio    |
| cod_copl_exto_bem_csrc     |               | Number                 | Código complementar externo do bem consórcio |
| nom_bem_csrc               |               | String                 | Nome do bem consórcio                        |
| vlr_bem_csrc               |               | Number                 | Valor do bem consórcio                       |
| ind_pmte_vend_bem_csrc     |               | Boolean                | Indicador se o bem permite venda             |
| ind_pmte_trca_bem_csrc     |               | Boolean                | Indicador se o bem permite troca             |

## Tabela Grupo Bem Consórcio - `tbrt7031_grup_bem`

| Nome da Coluna             | Tipo da Chave | Tipo de Dados (Number) | Descrição                                    |
|----------------------------|---------------|------------------------|----------------------------------------------|
| cod_bem_csrc               | PK            | Number                 | Código do bem consórcio                      |
| cod_grup_csrc              | FK            | Number                 | Código do grupo consórcio associado ao bem   |
| vlr_atlz_bem_csrc          |               | Number                 | Valor atualizado do bem consórcio            |

## Tabela Plano Comercialização Consórcio - `tbrt7033_plno_comc_csrc`

| Nome da Coluna                     | Tipo da Chave | Tipo de Dados (Number) | Descrição                                     |
|------------------------------------|---------------|------------------------|-----------------------------------------------|
| cod_plno_comc_csrc                 | PK            | Number                 | Código único que identifica o plano de comercialização |
| cod_exto_txa_plno_csrc             |               | Number                 | Código externo associado à taxa do plano      |
| cod_exto_plno_vend_csrc            |               | Number                 | Código externo do plano de venda              |
| cod_exto_tipo_vend_grup_csrc       |               | Number                 | Código externo do tipo de venda do grupo      |
| cod_exto_list_prec_csrc            |               | Number                 | Código externo da lista de preços             |
| vlr_txa_admi_csrc                  |               | Number                 | Valor da taxa de administração                |
| vlr_fund_rese_csrc                 |               | Number                 | Valor do fundo de reserva                     |
| ind_plno_comc_disi_csrc            |               | Boolean                | Indicador se o plano está disponível          |
| dat_hor_cada_plno_comc_csrc        |               | DateTime               | Data e hora de cadastro do plano              |

## Tabela Plateleira Comercial Consórcio - `tbrt7035_ptle_coml_csrc`

| Nome da Coluna             | Tipo da Chave | Tipo de Dados (Number) | Descrição                                    |
|----------------------------|---------------|------------------------|----------------------------------------------|
| cod_plno_comc_csrc         | PK            | Number                 | Código do plano de comercialização           |
| cod_bem_csrc               | FK            | Number                 | Código do bem consórcio                      |
| cod_grup_csrc              |               | Number                 | Código do grupo consórcio associado          |
| ind_ptle_disi_csrc         |               | Boolean                | Indicador se a prateleira está disponível    |
