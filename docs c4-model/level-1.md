## Diagrama de Contexto (C1)

O usuário final utiliza o Sistema CRM para criar gráficos e dashbords. Os dados de clientes e vendas, contidos em planilhas, são exportados para o sistema, que processa as informações e gera os gráficos, os quais são enviados para análise e ajustes caso haja inconsistências ou divergências. Após a análise, o usuário final visualiza um rascunho do gráfico e pode aprová-lo ou solicitar modificações. 

Com a aprovação, a equipe de análise envia o gráfico finalizado para o time responsável, que utiliza as informações para definir estratégias e estabelecer objetivos que apoiem a tomada de decisões. Além disso, o time fornece sugestões de melhorias ao usuário final, garantindo que os próximos gráficos ou dashboards sejam ainda mais eficientes e assertivos.


```mermaid
flowchart TD
    Colaborador["Colaborador\Usuário final"]
    CRM["Exporta dados"]
    Planilhas["Gerar Gráficos"]
    InsightSales["Visualização dos Gráficos."]
    Equipe["Envio do Gráfico"]
    Recebimento["Recebimento do Gráfico"]
    FeedBack["FeedBack"]

    Colaborador -->|Utiliza o CRM para criar gráficos e Dashbords.| CRM
    CRM -->|Planilhas e Relatórios de clientes e vendas.| Planilhas
    Planilhas -->|O usuário final recebe um rascunho do gráfico| InsightSales
    InsightSales -->|Rascunho de gráfico| Colaborador
    Colaborador -->|Solicita ajustes ou aprova| InsightSales
    InsightSales -->|Gráfico final Aprovado| Equipe
    Recebimento -->|A equipe recebe o gráfico e cria as suas estratégias para ajudar nas tomadas de decisão.| FeedBack
    FeedBack -->|Feedback e melhorias| Colaborador
    Recebimento -->|Envia o Gráfico para o time| Equipe
