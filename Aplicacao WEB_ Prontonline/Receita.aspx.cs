using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Receita : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }
    }

        protected void ButtonMinhasReceitas_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReceitaPesquisa.aspx");
    }

    protected void ButtonAdicionar_Click(object sender, EventArgs e)
    {
        int nomeReceita = Convert.ToInt32(DropDownListMedico.Text);
        DateTime dataReceita = Convert.ToDateTime(TextBoxData.Text);
        String imagem = Convert.ToString(TextBoxImagem.Text);
        int id_consulta = Convert.ToInt32(DropDownListConsulta.SelectedValue);

        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "insert into tb_Receita (nome, data, imagem, id_consulta) values (@nome, @data, @imagem, @id_consulta)";
        c.command.CommandText = sql;

        c.command.Parameters.Add("@id_consulta", SqlDbType.Int).Value = id_consulta;
        c.command.Parameters.Add("@nome", SqlDbType.Int).Value = nomeReceita;
        c.command.Parameters.Add("@data", SqlDbType.VarChar).Value = dataReceita;
        c.command.Parameters.Add("@imagem", SqlDbType.VarChar).Value = imagem;

        c.command.ExecuteNonQuery();
        c.FecharConexao();
        Response.Write("<script language = 'javascript'> alert ('Cadastro realizado com sucesso!');</script>");
    }
}