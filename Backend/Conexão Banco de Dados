import mysql.connector
from mysql.connector import Error

def conectar():
	try:
		conexao = mysql.connector.connect(
			host= “101010”
			user= “user_3 ”
			password= “Twq7e9YE-3!”
			database= “db_user_3”
		)

		if conexao.is_connected():
			print (“Conexão bem-sucedida ao MySQL!”)
			return conexao

    except Error as e:
		print (“Erro ao conectar ao MySQL:”, e)
		return None
