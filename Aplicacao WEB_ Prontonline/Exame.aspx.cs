using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Exame : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }


    }

    protected void ButtonMeusExames_Click(object sender, EventArgs e)
    {
        Response.Redirect("ExamePesquisa.aspx");
    }

    protected void ButtonAdicionar_Click(object sender, EventArgs e)
    {
        int id_tipoExame = Convert.ToInt32(DropDownListTipo.SelectedValue);
        String nomeExame = Convert.ToString(TextBoxNome.Text);
        DateTime dataExame = Convert.ToDateTime(TextBoxData.Text);
        String imagem = Convert.ToString(TextBoxImagem.Text);
        int id_consulta = Convert.ToInt32(DropDownListConsulta.SelectedValue);

        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "insert into tb_Exame (id_tipoExame, nome, data, imagem, id_consulta) values (@tipoExame, @nome, @data, @imagem, @id_consulta)";
        c.command.CommandText = sql;

        c.command.Parameters.Add("@id_consulta", SqlDbType.Int).Value = id_consulta;
        c.command.Parameters.Add("@tipoExame", SqlDbType.Int).Value = id_tipoExame;
        c.command.Parameters.Add("@nome", SqlDbType.VarChar).Value = nomeExame;
        c.command.Parameters.Add("@data", SqlDbType.VarChar).Value = dataExame;
        c.command.Parameters.Add("@imagem", SqlDbType.VarChar).Value = imagem;


        c.command.ExecuteNonQuery();
        c.FecharConexao();
        Response.Write("<script language = 'javascript'> alert ('Cadastro realizado com sucesso!');</script>");
    }
}