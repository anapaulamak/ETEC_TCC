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
        Conexao c = new Conexao();
        c.AbrirConexao();

        String novoMedico = Convert.ToString(TextBoxNomeMedico.Text);
        String CRM = Convert.ToString(TextBoxCRM.Text);

        String sql = "insert into tb_medico(nome, CRM, id_usuario) values(@nome, @CRM, @id_usuario)";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@nome", SqlDbType.VarChar).Value = novoMedico;
        c.command.Parameters.Add("@CRM", SqlDbType.VarChar).Value = CRM;
        c.command.Parameters.Add("@id_usuario", SqlDbType.Int).Value = Session["IdUsuario"];

        c.command.ExecuteNonQuery();
        c.FecharConexao();
        Response.Write("<script language = 'javascript'> alert ('Cadastro realizado com sucesso!');</script>");
    }

    protected void ButtonVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("ConsultaMedica.aspx");
    }
}