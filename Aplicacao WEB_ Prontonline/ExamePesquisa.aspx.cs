﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExamesPesquisa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Exame.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        PesquisaExame();
    }
    private void PesquisaExame()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();
        String nomeExame = "%" + TextBoxNome.Text + "%";

        IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
        int usuario = Convert.ToInt32(i.ID());

        String sql = "Select te.nome as tipoExame, e.id_exame as id_exame, e.nome as nome, e.data as data, e.imagem as imagem, concat(Convert(VarChar,c.data, 120)+'-',m.nome) as consulta, c.id_consulta from tb_consulta as c join tb_medico as m on c.id_medico=m.id_medico join tb_exame as e on e.id_consulta=c.id_consulta join tb_tipoExame as te on e.id_tipoExame=te.id_tipoExame where te.nome like @nomeExame and c.id_usuario=@id_usuario";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@nomeExame", SqlDbType.VarChar).Value = nomeExame;
        c.command.Parameters.Add("@id_usuario", SqlDbType.Int).Value = usuario;

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        GridView1.DataSource = dt;
        GridView1.DataBind();
        c.FecharConexao();
    }
}