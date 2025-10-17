# Justificativa da aplicação das formas normais
Durante a modelagem do banco de dados, foram aplicadas as **três primeiras formas normais (1FN, 2FN e 3FN)** com o objetivo de garantir **organização**, **consistência** e **evitar redundância de dados**.

### **-1ª Forma Normal (1FN):**
Todas as tabelas possuem atributos com **valores atômicos** (um único valor por célula), sem colunas multivaloradas ou repetidas.

Exemplo: nas tabelas **Clientes** e **Usuario**, os campos como **telefone** e **email** armazenam apenas um valor por registro, respeitando o princípio de atomicidade.

### **-2ª Forma Normal (2FN):**
Como todas as tabelas possuem **chaves primárias simples**, não existem dependências parciais.
Cada atributo não chave depende totalmente da chave primária da tabela correspondente.

### **3ª Forma Normal (3FN):**
Os atributos não chave *dependem diretamente da chave primária**, dessa forma, não há dependências transitivas.

Exemplo: na tabela **Cliente**, os campos **nomes**, **email**, **telefone** e **empresa** dependem exclusivamente de `id_cliente`.
