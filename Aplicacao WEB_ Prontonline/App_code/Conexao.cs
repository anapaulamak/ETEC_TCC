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

    public void AtualizarInfo(string nome, DateTime data, string email, string cpf)
    {

        try
        {
            AbrirConexao();

            SqlCommand comando = new SqlCommand();
            comando.Connection = conexao;
            comando.CommandText = "update tb_usuario set nome_usuario = @nome_usuario, data_nascimento = @data_nascimento, e_mail_usuario = @e_mail_usuario  where cpf = @cpf";

            SqlParameter parametro = new SqlParameter();
            parametro.ParameterName = "@nome_usuario";
            parametro.SqlDbType = SqlDbType.VarChar;
            parametro.Value = nome;
            comando.Parameters.Add(parametro);

            SqlParameter parametro1 = new SqlParameter();
            parametro1.ParameterName = "@data_nascimento";
            parametro1.SqlDbType = SqlDbType.Date;
            parametro1.Value = data;
            comando.Parameters.Add(parametro1);

            SqlParameter parametro2 = new SqlParameter();
            parametro2.ParameterName = "@e_mail_usuario";
            parametro2.SqlDbType = SqlDbType.VarChar;
            parametro2.Value = email;
            comando.Parameters.Add(parametro2);

            SqlParameter parametro3 = new SqlParameter();
            parametro3.ParameterName = "@cpf";
            parametro3.SqlDbType = SqlDbType.VarChar;
            parametro3.Value = cpf;
            comando.Parameters.Add(parametro3);

            comando.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write("ERRO:" + ex);
        }
        finally
        {
            conexao.Close();
        }
    }

}