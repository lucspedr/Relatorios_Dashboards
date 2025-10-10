## Modelo Entidade Relacionamento MER 

O Modelo Entidade-Relacionamento (MER) do sistema foi projetado para integrar e organizar informações provenientes de planilhas de CRM, transformando-as em dashboards e relatórios interativos que apoiam a tomada de decisão estratégica.

O modelo contempla todo o ciclo de vida dos dados: importação, análise, geração de gráficos, validação e uso das informações para gestão.

## Entidades e Atributos

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

- **Usuário** – Cada Usuário pertence a um único Perfil (N:1). Pode criar vários Relatórios (1:N). Pode realizar várias Análises (1:N) e enviar várias Solicitações (1:N). Pode dar várias Opiniões (1:N).
- **Cliente** – Um Cliente pode ter várias Vendas (1:N). Pode estar associado a vários Relatórios via tabela intermediária (N:N).
- **Venda** – Cada Venda pertence a um Cliente (N:1).
- **Relatório** – Um Relatório é criado por um Usuário (N:1). Pode ter vários Gráficos (1:N). Pode gerar várias Estratégias (1:N). Pode estar associado a vários Clientes e Usuários via tabela intermediária (N:N).
- **Gráfico** – Cada Gráfico pertence a um Relatório (N:1). Pode ter várias Análises (1:N) e várias Solicitações (1:N). Pode receber várias Opiniões (1:N)
- **Análise** – Cada Análise pertence a um Gráfico e a um Usuário (N:1).
- **Solicitação** – Cada Solicitação pertence a um Gráfico e a um Usuário (N:1).
- **Estratégia** – Cada Estratégia pertence a um Relatório (N:1).
- **Opinião** – Cada Opinião pertence a um Gráfico e a um Usuário (N:1).
- **Log_Processamento** – Cada Log pertence a um Relatório (N:1).

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

O Modelo Entidade-Relacionamento (MER) organiza as informações do sistema de CRM, permitindo gerar relatórios, gráficos e análises para apoiar decisões estratégicas. O sistema possui as entidades Usuário, Cliente, Venda, Relatório, Gráfico, Análise, Solicitação, Estratégia, Opinião e Log_Processamento. Usuários podem criar relatórios, realizar análises, enviar solicitações e fornecer opiniões. Clientes podem ter várias vendas e estar associados a relatórios. Cada relatório gera gráficos e estratégias, e cada gráfico pode receber análises, solicitações e opiniões. O log registra todas as ações importantes.

Os relacionamentos garantem rastreabilidade, colaboração e controle de qualidade. Regras de negócio incluem perfis de usuários, unicidade de clientes, status de vendas e gráficos, aprovação de análises, comentários obrigatórios em solicitações e opiniões, e registro de todas as ações no log. Este MER assegura integridade dos dados e suporte eficiente à tomada de decisão.

## Regras de Negócio

Todo usuário deve ter perfil definido (analista, gestor ou usuário final) e status ativo ou inativo. Clientes devem ter CPF/CNPJ ou e-mail únicos e podem estar ligados a várias vendas e relatórios. Vendas devem estar vinculadas a clientes existentes e ter status aberto, fechado ou cancelado. Cada relatório gera timestamp, pertence a um usuário e pode gerar gráficos, estratégias e logs, além de se relacionar a múltiplos clientes e usuários. 

Gráficos pertencem a relatórios e têm status rascunho ou final, podendo receber análises, solicitações e opiniões. Análises só podem ser feitas por analistas ou gestores, vinculadas a gráficos e usuários, com status aprovado, pendente ou rejeitado. Solicitações e opiniões vinculam gráficos e usuários, com comentário obrigatório e status controlado. Estratégias devem estar associadas a relatórios, registrando descrição, responsável e data. Logs registram todas ações importantes, falhas e processamentos, vinculados a relatórios existentes.

#### Usuário
- Deve ter perfil definido (analista, gestor, usuario_final).
- Status limitado a **ativo** ou **inativo**.
- Pode criar relatórios, realizar análises, enviar solicitações e emitir opiniões, dependendo do perfil.

#### Cliente

- CPF/CNPJ ou e-mail devem ser únicos para evitar duplicidade.
- Pode ter várias vendas e estar associado a múltiplos relatórios (via tabela intermediária).

#### Venda
- Deve estar vinculada a um cliente existente.
- status limitado a aberto, fechado ou cancelado.
- Registra produto/serviço, valor e dados adicionais.

#### Relatório
- Cada criação gera timestamp (data_criacao).
- Deve estar vinculado a um usuário.
- Pode gerar múltiplos gráficos, estratégias e logs.
- Pode estar associado a múltiplos clientes e usuários (N:N).

#### Gráfico
- Deve pertencer a um relatório existente.
- status limitado a rascunho ou final.
- Pode receber análises, solicitações e opiniões.

#### Análise
- Só usuários com perfil analista ou gestor podem realizar análises.
- Cada análise deve estar vinculada a um gráfico e a um usuário.
- status_aprovacao pode ser aprovado, pendente ou rejeitado.

#### Solicitação
- Vinculada a um gráfico e a um usuário.
- status limitado a pendente ou concluído.
- Comentário obrigatório.

#### Estratégia
- Deve estar vinculada a um relatório existente.
- Contém descrição, responsável e data de execução.

#### Opinião (Feedback)
- Vinculada a um gráfico e a um usuário.
- Comentário obrigatório.

#### Log Processamento
- Registra todas ações importantes, incluindo falhas, restrições e processamentos.
- Cada log deve estar vinculado a um relatório existente.

