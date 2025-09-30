## Diagrama de Contêineres - C2

O sistema possui quatro contêineres principais que trabalham juntos para gerar insights. O Web App (React/JS) é a interface onde os usuários acessam dashboards e gráficos. O API Backend (Python/Node.js) processa dados, autentica usuários e conecta o Web App ao Banco de Dados (MySQL), que armazena clientes, vendas e KPIs. O Módulo de BI (Power BI/Python) cria relatórios e gráficos a partir dos dados, enviando-os ao Web App para apoiar decisões rápidas e precisas.


```mermaid
flowchart TD
    Colaborador["Usuários/Gestores/Funcionários"]
    App["Aplicativo Web"]
    API["API Backend"]
    Bi["Módulo de BI"]
    Banco[("Banco de Dados MySQL")]

    Colaborador -->|Utiliza para visualização, criação e edição| App
    App -->|Interface principal, acessa dashboards, gráficos e dados.| API
    API -->|Processa os dados e fornece dados para web App| Banco
    API -->|Autentica usuários e integra sistemas| Colaborador
    Banco -->|Armaneza cliente, vendas e KPIs, fonte central para consultas| Bi
    Bi -->|Gera relatórios e gráficos a partir do banco; envia visualizações para o Web App.| Colaborador

    %% Estilos
    style Colaborador fill:#1E3A8A,stroke:#0F1F4D,stroke-width:2px,color:#ffffff
    style App fill:#A3C4F3,stroke:#5B8BD6,stroke-width:2px,color:#000000
    style API fill:#A3C4F3,stroke:#5B8BD6,stroke-width:2px,color:#000000
    style Bi fill:#A3C4F3,stroke:#5B8BD6,stroke-width:2px,color:#000000
    style Banco fill:#A3C4F3,stroke:#5B8BD6,stroke-width:2px,color:#000000
