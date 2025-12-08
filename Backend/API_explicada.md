A aplicação desenvolvida com Flask disponibiliza uma API REST para gerenciamento de usuários, seguindo o padrão CRUD. 
O endpoint /usuarios utiliza o método GET para listar todos os usuários cadastrados e o método POST para inserir um novo usuário, recebendo os dados no corpo da requisição em formato JSON. 
Para operações específicas em um usuário, o endpoint /usuarios/{id} é utilizado, permitindo a atualização dos dados por meio do método PUT e a exclusão do registro com o método DELETE, 
sendo o identificador do usuário passado como parâmetro na URL. As entradas da API são realizadas via JSON e parâmetros de rota, enquanto as saídas são retornadas em formato JSON, 
caracterizando uma arquitetura REST simples e padronizada.
