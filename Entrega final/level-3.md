## Diagrama de Componentes - C3

O API Backend (Python/Node.js) é responsável por gerenciar toda a lógica do sistema. Ele controla a autenticação e autorização, garantindo que os usuários acessem apenas os dados permitidos, e valida tokens de acesso do Web App. Recebe requisições dos usuários por meio dos controladores de dados, que direcionam as chamadas para os serviços adequados, responsáveis pela limpeza, transformação e organização dos dados (ETL). 

O Backend também integra-se ao Banco de Dados para consultar, inserir e atualizar informações de clientes, vendas e KPIs, além de enviar dados processados ao Módulo de BI para gerar gráficos e relatórios automáticos. Logs e monitoramento registram todas as operações, permitindo auditoria e suporte à manutenção. Essa estrutura garante que os dados cheguem organizados e consistentes, entregando insights estratégicos em tempo real para usuários e equipes de decisão.

```mermaid
flowchart TD
    API["API Backend"]
    Aut["Autenticação e Autorização"]
    Web["Web App Gráficos e Dashbords"]
    Contro["Controladores de Dados"]
    Serv["Serviços de Processamento de Dados"]
    Intre["Integração com Banco de Dados"]
    Banco[("Banco de Dados MySQL")]
    Bi["Integração com Módulo de BI"]
    Modulo["Módulo de BI"]
    Log["Logs e Monitoramento"]

    API -->|Responsável por processar dados, gerenciar acessos e integrar todos os contêineres| Aut
    Aut -->|Gerência login, permissões e tokens de acesso do Web App.| Web
    Aut -->|Garante segurança e controle de acesso aos dados| Contro
    Contro -->|Recebem requisições do Web App e direcionam para os serviços corretos| Web
    Contro -->|Orquestram o fluxo de dados dentro do backend| Serv
    Serv -->|Realizam limpeza, transformação e agregação de dados ETL| Intre
    Intre -->|Consulta, insere e atualiza clientes, vendas e KPIs no MySQL| Banco
    Serv -->|Preparam informações para dashboards e relatórios| Bi
    Bi -->|Envia dados processados para geração automática de relatórios e gráficos| Modulo
    Log -->|Registra atividades e erros do sistema| Bi
    Log -->|Registra atividades e erros do sistema| Serv
    Log -->|Registra atividades e erros do sistema| Contro
    Log -->|Registra atividades e erros do sistema| Aut

    %% Estilos
    style API fill:#1E3A8A,stroke:#0F1F4D,stroke-width:3px,color:#ffffff
    style Aut fill:#A3C4F3,stroke:#5B8BD6,stroke-width:2px,color:#000000
    style Web fill:#A3C4F3,stroke:#5B8BD6,stroke-width:2px,color:#000000
    style Contro fill:#A3C4F3,stroke:#5B8BD6,stroke-width:2px,color:#000000
    style Serv fill:#A3C4F3,stroke:#5B8BD6,stroke-width:2px,color:#000000
    style Intre fill:#A3C4F3,stroke:#5B8BD6,stroke-width:2px,color:#000000
    style Banco fill:#A3C4F3,stroke:#5B8BD6,stroke-width:2px,color:#000000
    style Bi fill:#A3C4F3,stroke:#5B8BD6,stroke-width:2px,color:#000000
    style Modulo fill:#A3C4F3,stroke:#5B8BD6,stroke-width:2px,color:#000000
    style Log fill:#A3C4F3,stroke:#5B8BD6,stroke-width:2px,color:#000000
