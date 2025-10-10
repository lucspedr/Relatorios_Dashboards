## Diagrama Entidade Relacionamento - DER
O DER do sistema foi projetado para integrar e organizar as informações provenientes de planilhas de CRM, transformando-as em dashboards e relatórios interativos que apoiam a tomada de decisão estratégica.

O modelo contempla todo o ciclo de vida dos dados — da importação, análise e geração de gráficos até a validação e uso das informações pelo time de gestão.


### Principais Entidades 

- **Usuário** – Guarda dados dos usuários do sistema, como analistas, gestores e usuários finais.
- **Cliente** – Cadastro de clientes e dados importados
- **Vendas** – Registra vendas, leads e negociações geradas a partir dos dados de clientes.
- **Relatório** – Armazena as informações dos relatórios criados pelo sistema.
- **Gráficos** – Guarda os gráficos gerados a partir dos relatórios para análise visual.
- **Análise** – Registra o processo de verificação e validação dos gráficos.
- **Solicitação** – Controla as solicitações de registro de alteração ou ajustes dos usuários finais.
- **Estratégia** – Registra as estratégias e objetivos definidos com base nos relatórios e gráficos finais.
- **Feedback** – Guarda comentários e sugestões de melhoria feitos pelos usuários sobre os gráficos e relatórios.
- **Log_Processamento** – Registra o histórico de importações e processamentos de planilhas.


## Relacionamentos

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

### Atributos

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
