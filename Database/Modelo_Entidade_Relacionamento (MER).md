## Modelo Entidade Relacionamento MER 

O Modelo Entidade-Relacionamento (MER) do sistema foi projetado para integrar e organizar informações provenientes de planilhas de CRM, transformando-as em dashboards e relatórios interativos que apoiam a tomada de decisão estratégica.

O modelo contempla todo o ciclo de vida dos dados: importação, análise, geração de gráficos, validação e uso das informações para gestão.

## Entidades e Atributos

| Entidade              | Atributos|
| --------------------- | -------- |
| **Usuário**           | id_usuario (PK), nome, email, senha, perfil (analista, gestor, usuario_final), status (ativo, inativo)|
| **Cliente**           | id_cliente (PK), nome, email, telefone, empresa, status (ativo, inativo)
| **Venda**             | id_venda (PK), id_cliente (FK), produto_servico, valor, data, status (aberto, fechado, cancelado)|
| **Relatório**         | id_relatorio (PK), id_usuario_criador (FK), titulo, descricao, data_criacao|
| **Gráfico**           | id_grafico (PK), id_relatorio (FK), tipo_grafico, status (rascunho, final), data_criacao|
| **Análise**           | id_analise (PK), id_grafico (FK), id_usuario (FK), status_aprovacao (aprovado, pendente, rejeitado), comentarios, data_analise|
| **Solicitação**       | id_solicitacao (PK), id_grafico (FK), id_usuario (FK), tipo_solicitacao, status (pendente, concluido), comentario, data_solicitacao|
| **Estratégia**        | id_estrategia (PK, int), id_relatorio (FK), descricao, responsavel, data_execucao|
| **Feedback**          | id_feedback (PK), id_grafico (FK), id_usuario (FK), comentario, data_feedback|
| **Log_Processamento** | id_log (PK), id_relatorio (FK), acao, status, data_hora|


## Relacionamentos e Cardinalidades

**Usuário** – Cada Usuário pertence a um único Perfil (N:1). Pode criar vários Relatórios (1:N). Pode realizar várias Análises (1:N) e enviar várias Solicitações (1:N). Pode dar várias Opiniões (1:N).
**Cliente** – Um Cliente pode ter várias Vendas (1:N). Pode estar associado a vários Relatórios via tabela intermediária (N:N).
**Venda** – Cada Venda pertence a um Cliente (N:1).
**Relatório** – Um Relatório é criado por um Usuário (N:1). Pode ter vários Gráficos (1:N). Pode gerar várias Estratégias (1:N). Pode estar associado a vários Clientes e Usuários via tabela intermediária (N:N).

**Gráfico** – Cada Gráfico pertence a um Relatório (N:1). Pode ter várias Análises (1:N) e várias Solicitações (1:N). Pode receber várias Opiniões (1:N)
**Análise** – Cada Análise pertence a um Gráfico e a um Usuário (N:1).
**Solicitação** – Cada Solicitação pertence a um Gráfico e a um Usuário (N:1).
**Estratégia** – Cada Estratégia pertence a um Relatório (N:1).
**Opinião** – Cada Opinião pertence a um Gráfico e a um Usuário (N:1).
**Log_Processamento** – Cada Log pertence a um Relatório (N:1).

| Relacionamento | Tipo | Cardinalidade | Justificativa |
| ---------------| ---- | ------------- | ------------- |
| Usuário → Relatório           | 1:N  | 1 usuário pode criar vários relatórios               | Cada relatório precisa de um criador, mas um usuário pode criar múltiplos relatórios |
| Usuário → Análise             | 1:N  | 1 usuário pode realizar várias análises              | Analistas validam vários gráficos, cada análise pertence a um usuário                |
| Usuário → Solicitação         | 1:N  | 1 usuário pode enviar várias solicitações            | Usuários finais podem solicitar ajustes em vários gráficos                           |
| Usuário → Opinião             | 1:N  | 1 usuário pode dar várias opiniões                   | Feedbacks são feitos por usuários, cada opinião pertence a um usuário                |
| Cliente → Venda               | 1:N  | 1 cliente pode ter várias vendas                     | Cada venda é de um cliente, mas clientes podem ter múltiplas negociações             |
| Cliente ↔ Relatório           | N:N  | Um cliente pode aparecer em vários relatórios        | Relatórios podem agregar dados de múltiplos clientes                                 |
| Relatório → Gráfico           | 1:N  | 1 relatório pode ter vários gráficos                 | Cada relatório gera gráficos diferentes para visualização                            |
| Relatório → Estratégia        | 1:N  | 1 relatório pode gerar várias estratégias            | Estratégias são baseadas nos resultados dos relatórios                               |
| Relatório ↔ Usuário           | N:N  | Relatórios podem ter múltiplos usuários relacionados | Para compartilhamento e colaboração                                                  |
| Gráfico → Análise             | 1:N  | 1 gráfico pode ter várias análises                   | Cada gráfico pode ser analisado múltiplas vezes                                      |
| Gráfico → Solicitação         | 1:N  | 1 gráfico pode ter várias solicitações               | Ajustes podem ser solicitados em qualquer gráfico                                    |
| Gráfico → Opinião             | 1:N  | 1 gráfico pode ter várias opiniões                   | Feedback é feito para cada gráfico                                                   |
| Log_Processamento → Relatório | N:1  | Cada log pertence a um relatório                     | Cada ação de processamento precisa estar vinculada a um relatório específico         |


## Justificativa

