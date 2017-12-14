# SECIF: dicionário de dados

  Conteúdo exemplificativo
  
### Instituicao

#### Estrutura da tabela

| Atributo | Tipo | Nulo? | Descrição | Domínio | PRI | EST | CAN |
|---|---|:-:|---|---|:-:|:-:|:-:|
| ie_id | smallint | não | código da ie | | x | | |
| nome | varchar(60) | não | nome da ie | | | |
| cnpj | varchar(14) | não | cnpj da ie | | | | x |

#### Especificações das constraints

| Coluna | Tipo | Nome | Expressão |
|---|---|---|---|
| ie_id | chave primária | pk_ie | primary key (ie_id) |
| cnpj | validação | ck_ie_cnpj | check(len(cnpj) = 14) |
