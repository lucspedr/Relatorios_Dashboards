# Justificativa da aplicação das formas normais
Durante a modelagem do banco de dados, foram aplicadas as **três primeiras formas normais (1FN, 2FN e 3FN)** com o objetivo de garantir **organização**, **consistência** e **evitar redundância de dados**.

### **1ª Forma Normal (1FN):**
Todas as tabelas possuem atributos com **valores atômicos** (um único valor por célula), sem colunas multivaloradas ou repetidas.

Exemplo: nas tabelas **Clientes** e **Usuario**, os campos como **telefone** e **email** armazenam apenas um valor por registro, respeitando o princípio de atomicidade.

### **2ª Forma Normal (2FN):**
Como todas as tabelas possuem **chaves primárias simples**, não existem dependências parciais.
Cada atributo não chave depende totalmente da chave primária da tabela correspondente.

### **3ª Forma Normal (3FN):**
Os atributos não chave *dependem diretamente da chave primária**, dessa forma, não há dependências transitivas.

Exemplo: na tabela **Cliente**, os campos **nomes**, **email**, **telefone** e **empresa** dependem exclusivamente de `id_cliente`.

# Exemplos de eliminação de redundâncias

### Clientes e Vendas:
Informações do cliente (nome, email, telefone) não se repetemem cada venda, pois **Venda** utiliza `id_cliente` como chave estrangeira. Isso garante centralização e evita duplicações.

### Usuário e Relatório:
Dados do usuário não são replicados em cada relatório. A relação é feita por meio da FK `id_usuario`, mantendo as informações do usuário em apenas uma tabela.

### Relacionamentos com Relatório:
Tabelas como **Grafico**, **Estrategia**, **Analise** e **Solicitacao** fazem referência a **Relatorio** através de chaves estrangeiras, evitando repetição de dados descritivos do relatório em cada tabela relacionada.

### Casos de flexibilização da normalização
Por mais que as formas normais tenham sido aplicadas, **alguns pontos foram flexibilizdos intencionalmente** para garantir melhor **desempenho** e **simplicidade** da estrutura:

- **Campo STATUS em múltiplas tabelas:**
  Foi mantido em diversas entidades para facilitar consultas diretas e controle individual, evitando a necessidade de relacionamentos extras apenas para identificar estados dos registros.

- **PRODUTO_SERVICO na tabela Venda:**
  Poderia estar em uma tabela separada (Produto), mas foi mantido na mesma tabela para simplificar a estrutura inicial, já que o catálogo não é extendo.

- **PERFIL na tabela Usuario:**
  Foi denifido como **varchar** em vez de FK para permitir maior flexibilidade na definição de perfis, reduzindo a complexidade em etapas iniciais do sistema.
