## Modelo Entidade Relacionamento MER 

O Modelo Entidade-Relacionamento (MER) do sistema foi projetado para integrar e organizar informações provenientes de planilhas de CRM, transformando-as em dashboards e relatórios interativos que apoiam a tomada de decisão estratégica.

O modelo contempla todo o ciclo de vida dos dados: importação, análise, geração de gráficos, validação e uso das informações para gestão.

### Entidades e Atributos

| Entidade              | Atributos                                                                                                                   | Descrição                                                                               |
| --------------------- | --------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| **Usuário**           | `id_usuario` (PK), `nome`, `email`, `senha`, `perfil`, `status`                                                             | Guarda dados dos usuários do sistema, como analistas, gestores e usuários finais.       |
| **Cliente**           | `id_cliente` (PK), `nome`, `email`, `telefone`, `empresa`, `status`                                                         | Cadastro de clientes e informações importadas do CRM.                                   |
| **Venda**             | `id_venda` (PK), `id_cliente` (FK), `produto_servico`, `valor`, `dados`, `status`                                           | Registra vendas, leads e negociações associadas a clientes.                             |
| **Relatório**         | `id_relatorio` (PK), `id_usuario_criador` (FK), `titulo`, `descricao`, `data_criacao`                                       | Armazena informações dos relatórios criados pelo sistema.                               |
| **Gráfico**           | `id_grafico` (PK), `id_relatorio` (FK), `tipo_grafico`, `status`, `data_criacao`                                            | Guarda gráficos gerados a partir dos relatórios para análise visual.                    |
| **Análise**           | `id_analise` (PK), `id_grafico` (FK), `id_usuario` (FK), `status_aprovacao`, `comentarios`, `data_analise`                  | Registro do processo de verificação e validação dos gráficos.                           |
| **Solicitação**       | `id_solicitacao` (PK), `id_grafico` (FK), `id_usuario` (FK), `tipo_solicitacao`, `status`, `comentario`, `data_solicitacao` | Controle de solicitações de alteração ou configuração feitas pelos usuários finais.     |
| **Estratégia**        | `id_estrategia` (PK), `id_relatorio` (FK), `descricao`, `responsavel`, `data_execucao`                                      | Registra estratégias e objetivos baseados nos relatórios e gráficos finais.             |
| **Opinião**           | `id_feedback` (PK), `id_grafico` (FK), `id_usuario` (FK), `comentario`, `data_feedback`                                     | Armazena comentários e sugestões de melhorias dos usuários sobre gráficos e relatórios. |
| **Log_Processamento** | `id_log` (PK), `id_relatorio` (FK), `acao`, `status`, `data_hora`                                                           | Mantém histórico de limitações e processamentos das planilhas.                          |
