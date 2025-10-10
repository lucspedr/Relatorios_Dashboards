# 🧩 Documento de Normalização – Sistema de CRM e Dashboards

## Introdução
O processo de normalização foi aplicado ao modelo de dados do sistema de CRM, cujo objetivo é integrar informações de planilhas e gerar relatórios e gráficos interativos. A normalização tem como meta eliminar redundâncias, garantir integridade referencial e otimizar o armazenamento e a manipulação dos dados, sem comprometer a performance das consultas e relatórios analíticos.

---

## 1ª Forma Normal (1FN)

### Definição
Uma tabela está na Primeira Forma Normal (1FN) quando:
- Todos os atributos contêm apenas valores atômicos (não divisíveis);
- Não há grupos repetitivos ou colunas multivaloradas;
- Cada registro é identificado unicamente por uma chave primária (PK).

### Aplicação no projeto
Todas as entidades foram estruturadas para respeitar a 1FN. Cada campo contém um valor único e indivisível:
- Em **Cliente**, o campo `telefone` guarda apenas um número de telefone por registro (caso haja múltiplos contatos, são armazenados em uma tabela separada futuramente).
- Em **Venda**, o atributo `produto_servico` contém apenas uma descrição por venda.
- Em **Usuário**, o campo `perfil` armazena um único valor entre (`analista`, `gestor`, `usuario_final`).

### Exemplo
**Situação não normalizada:**
```
Cliente(id, nome, email, telefones)
```
**Correção (1FN aplicada):**
```
Cliente(id_cliente, nome, email, telefone)
```
Cada linha agora contém um único telefone por cliente, evitando listas dentro de campos.

---

## 2ª Forma Normal (2FN)

### Definição
Uma tabela está na Segunda Forma Normal (2FN) quando:
- Já está na 1FN;
- E todos os atributos não-chave dependem totalmente da chave primária, e não apenas de parte dela (ou seja, elimina dependências parciais).

### Aplicação no projeto
As tabelas compostas foram revisadas para garantir que não existam dependências parciais.  
No projeto, as tabelas possuem chaves simples (campos como `id_usuario`, `id_cliente`, etc.), logo não havia dependências parciais diretas.  

Um exemplo mais visível de aplicação é nas relações N:N, onde foram criadas tabelas intermediárias (como `relatorio_cliente` e `relatorio_usuario`), garantindo que:
- As informações sobre o relacionamento dependem da combinação completa das chaves estrangeiras (`id_relatorio`, `id_cliente`), e não de uma delas isoladamente.

### Exemplo
**Situação não normalizada:**
```
Relatorio_Cliente(id_relatorio, id_cliente, nome_cliente)
```
Aqui, `nome_cliente` depende apenas de `id_cliente` → violação da 2FN.

**Correção (2FN aplicada):**
```
Relatorio_Cliente(id_relatorio, id_cliente)
Cliente(id_cliente, nome_cliente, ...)
```
O nome do cliente é armazenado na entidade Cliente, eliminando redundância.

---

## 3ª Forma Normal (3FN)

### Definição
Uma tabela está na Terceira Forma Normal (3FN) quando:
- Já está na 2FN;
- E não há dependências transitivas, ou seja, nenhum atributo não-chave depende de outro atributo não-chave.

### Aplicação no projeto
As entidades foram revisadas para remover dependências transitivas.  
Exemplo:
- Em **Usuário**, `perfil` e `status` dependem apenas do id_usuario.
- Em **Venda**, atributos como `valor`, `data` e `status` dependem diretamente do id_venda e não de id_cliente.
- Em **Relatório**, `titulo` e `descricao` dependem apenas do id_relatorio, e não do usuário criador.

### Exemplo
**Situação não normalizada:**
```
Venda(id_venda, id_cliente, nome_cliente, valor)
```
Aqui, `nome_cliente` depende de `id_cliente`, não de `id_venda` → dependência transitiva.

**Correção (3FN aplicada):**
```
Venda(id_venda, id_cliente, valor)
Cliente(id_cliente, nome_cliente)
```
Elimina-se a redundância, pois o nome do cliente é recuperado por meio da chave estrangeira.

---

## Comparativo “Antes e Depois da Normalização”

| Entidade | Situação Antes | Situação Depois |
|-----------|----------------|----------------|
| Cliente | Campo `telefones` com lista de números | Campo `telefone` atômico |
| Venda | Campo `nome_cliente` duplicado | FK `id_cliente` usada para busca |
| Relatorio_Cliente | Guardava `nome_cliente` redundante | Relacionamento limpo com PK composta |
| Log_Processamento | Poderia ter tabela extra para tipo de ação | Mantido simples por performance |
| Usuario | Poderia separar tabela de perfis e status | Mantido com ENUM por simplicidade |

---

## Exceções e Desnormalização Controlada

Apesar da aplicação completa das três primeiras formas normais, alguns pontos de desnormalização controlada foram adotados por motivos de performance e simplicidade:

1. **Logs de Processamento**  
   - A tabela `Log_Processamento` guarda atributos como `acao`, `status` e `data_hora` diretamente, sem normalizar o tipo de ação em uma tabela separada, pois são valores simples e o objetivo é agilidade de gravação e leitura em alto volume.

2. **Status e Perfis de Usuário**  
   - Os campos `perfil` e `status` foram implementados como enumerações dentro da tabela `Usuario`.  
     Essa escolha evita joins desnecessários com tabelas auxiliares e simplifica o controle administrativo, sem comprometer a integridade dos dados.

3. **Valores Descritivos em Relatórios e Estratégias**  
   - Campos como `descricao` e `comentario` foram mantidos dentro das tabelas principais (Relatório, Estratégia, Feedback), mesmo sendo textuais e potencialmente repetitivos, para facilitar consultas diretas e evitar complexidade excessiva.

---

## Conclusão
O processo de normalização garantiu que o modelo de dados do sistema de CRM:
- Elimine redundâncias e dependências indesejadas;
- Mantenha integridade referencial;
- Permita escalabilidade e clareza na modelagem;
- Ao mesmo tempo, preserve a performance operacional em consultas e geração de relatórios.

Em síntese, o modelo segue rigorosamente até a Terceira Forma Normal (3FN), com exceções pontuais justificadas por requisitos práticos de desempenho e simplicidade.
