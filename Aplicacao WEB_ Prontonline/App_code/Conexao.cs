using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class Conexao
{

    public SqlConnection conexao;
    public SqlCommand command;
    string strConexao = "Server=localhost; DataBase=Prontonline; user id=sa;password=12345";
    //string strConexao = "Server=localhost;DataBase=exe_produtos; trusted_connection=true";

    public void AbrirConexao()
    {
        conexao = new SqlConnection(strConexao);
        conexao.Open();
        command = new SqlCommand();
        command.Connection = conexao;
    }

    public void FecharConexao()
    {
        conexao.Close();
        conexao = null;
        command = null;
    }

    public Conexao()
    {
        //
        // TODO: Adicionar lógica de construtor aqui
        //
    }
}