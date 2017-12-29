using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdicionarMedico : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }
    }

    protected void ButtonAdicionar_Click(object sender, EventArgs e)
    {
        String novoMedico = Convert.ToString(TextBoxNomeMedico.Text);
        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "insert into tb_medico(nome) values(@nome)";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@nome", SqlDbType.VarChar).Value = novoMedico;

        c.command.ExecuteNonQuery();
        c.FecharConexao();
        Response.Write("<script language = 'javascript'> alert ('Cadastro realizado com sucesso!');</script>");
    }

    protected void ButtonVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("ConsultaMedica.aspx");
    }
}