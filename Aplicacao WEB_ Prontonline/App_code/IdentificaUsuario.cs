  using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de IdentificaUsuario
/// </summary>
public class IdentificaUsuario
{
    String SessionCPF; 

    public IdentificaUsuario(String CPF)
    {
        this.SessionCPF = CPF;
    }

    public String ID()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "select id_usuario from tb_usuario where cpf=@cpf";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@cpf", SqlDbType.Char).Value = SessionCPF;

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);
        String id_usuario = dt.Tables[0].Rows[0]["id_usuario"].ToString();

        c.FecharConexao();
        return id_usuario;
    }

}