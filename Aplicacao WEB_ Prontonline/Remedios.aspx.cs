using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Remedios : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }
    }

    protected void ButtonMeusRemedios_Click(object sender, EventArgs e)
    {
        Response.Redirect("RemediosPesquisa.aspx");
    }

    protected void ButtonAdicionar_Click(object sender, EventArgs e)
    {
        if (Validar() == true)
        {
            String remedio = Convert.ToString(TextBoxRemedio.Text);
            String dosagem = Convert.ToString(TextBoxDosagem.Text);
            DateTime dataInicio = Convert.ToDateTime(TextBoxDataInicio.Text);
            DateTime dataFim = Convert.ToDateTime(TextBoxDataFim.Text);
            IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
            int usuario = Convert.ToInt32(i.ID());

            Conexao c = new Conexao();
            c.AbrirConexao();

            String sql = "insert into tb_remedios (id_usuario, nome, dosagem, dataInicio, dataFim) values (@id_usuario, @nome, @dosagem, @dataInicio, @dataFim)";
            c.command.CommandText = sql;

            c.command.Parameters.Add("@id_usuario", SqlDbType.Int).Value = usuario;
            c.command.Parameters.Add("@nome", SqlDbType.VarChar).Value = remedio;
            c.command.Parameters.Add("@dosagem", SqlDbType.VarChar).Value = dosagem;
            c.command.Parameters.Add("@dataInicio", SqlDbType.DateTime).Value = dataInicio;
            c.command.Parameters.Add("@dataFim", SqlDbType.DateTime).Value = dataFim;

            c.command.ExecuteNonQuery();
            c.FecharConexao();
            Response.Write("<script language = 'javascript'> alert ('Informação adiciona com sucesso!');</script>");
        }
    }

    protected Boolean Validar()
    {
        if (TextBoxRemedio.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Escreva o nome do remédio!');</script>");
            return false;
        }
        else if (TextBoxDosagem.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Escreva qual a dosagem tomada!');</script>");
            return false;
        }
        else if (TextBoxDataInicio.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha corretamente a data de início!');</script>");
            return false;
        }
        else if (TextBoxDataFim.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha corretamente a data de término!');</script>");
            return false;
        }
        else
        {
            return true;
        }
    }

    protected void ButtonAdicionarImagem_Click(object sender, EventArgs e)
    {
        Response.Redirect("RemediosImagens.aspx");
    }
}