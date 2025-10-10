## Modelo Entidade Relacionamento MER 

O Modelo Entidade-Relacionamento (MER) do sistema foi projetado para integrar e organizar informações provenientes de planilhas de CRM, transformando-as em dashboards e relatórios interativos que apoiam a tomada de decisão estratégica.

O modelo contempla todo o ciclo de vida dos dados: importação, análise, geração de gráficos, validação e uso das informações para gestão.

### Entidades e Atributos

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
