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

<img width="1874" height="1230" alt="Image" src="https://github.com/user-attachments/assets/7a474b6a-b907-4dc7-9feb-9a42a3e6e5f0" />

### Atributos

| Entidade              | Atributos|
| --------------------- | -------- |
| **Usuário**           | id_usuario (PK, int), nome (varchar), email (varchar UNIQUE), senha_hash (varchar), perfil (enum: analista, gestor, usuario_final), status (enum: ativo, inativo)|
| **Cliente**           | id_cliente (PK, int), nome (varchar NOT NULL), email (varchar), telefone (varchar), empresa (varchar), status (enum: ativo, inativo)|
| **Venda**             | id_venda (PK, int), id_cliente (FK), produto_servico (varchar), valor (decimal(10,2)), data (date), status (enum: aberto, fechado, cancelado)|
| **Relatório**         | id_relatorio (PK, int), id_usuario_criador (FK), titulo (varchar), descricao (text), data_criacao (timestamp DEFAULT CURRENT_TIMESTAMP)|
| **Gráfico**           | id_grafico (PK, int), id_relatorio (FK), tipo_grafico (varchar), status (enum: rascunho, final), data_criacao (timestamp DEFAULT CURRENT_TIMESTAMP)|
| **Análise**           | id_analise (PK, int), id_grafico (FK), id_analista (FK), status_aprovacao (enum: aprovado, pendente, rejeitado), comentarios (text), data_analise (timestamp DEFAULT CURRENT_TIMESTAMP)|
| **Solicitação**       | id_solicitacao (PK, int), id_grafico (FK), id_usuario (FK), tipo_solicitacao (varchar), status (enum: pendente, concluido), comentario (text), data_solicitacao (timestamp DEFAULT CURRENT_TIMESTAMP)|
| **Estratégia**        |id_estrategia (PK, int), id_relatorio (FK), descricao (text), responsavel (varchar), data_execucao (date)|
| **Feedback**          | id_feedback (PK, int), id_grafico (FK), id_usuario (FK), comentario (text), data_feedback (timestamp DEFAULT CURRENT_TIMESTAMP)|
| **Log_Processamento** | id_log (PK, int), id_relatorio (FK), acao (varchar), status (varchar), data_hora (timestamp DEFAULT CURRENT_TIMESTAMP)|
