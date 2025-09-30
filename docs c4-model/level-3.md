## Diagrama de Componentes - C3

O API Backend (Python/Node.js) é responsável por gerenciar toda a lógica do sistema. Ele controla a autenticação e autorização, garantindo que os usuários acessem apenas os dados permitidos, e valida tokens de acesso do Web App. Recebe requisições dos usuários por meio dos controladores de dados, que direcionam as chamadas para os serviços adequados, responsáveis pela limpeza, transformação e organização dos dados (ETL). 

O backend também integra-se ao Banco de Dados para consultar, inserir e atualizar informações de clientes, vendas e KPIs, além de enviar dados processados ao Módulo de BI para gerar gráficos e relatórios automáticos. Logs e monitoramento registram todas as operações, permitindo auditoria e suporte à manutenção. Essa estrutura garante que os dados cheguem organizados e consistentes, entregando insights estratégicos em tempo real para usuários e equipes de decisão.

```mermaid
flowchart TD
    API["API Backend"]
    Aut["Autenticação e Autorização"]
    Web["Web App"]
    Contro["Controladores de Dados"]
    Serv["Serviços de Processamento de Dados"]
    Intre["Integração com Banco de Dados"]
    Banco[("Banco de Dados MySQL")]
    Bi["Integração com Módulo de BI"]
    Modulo["Módulo de BI"]
    Log["Logs e Monitoramento"]

