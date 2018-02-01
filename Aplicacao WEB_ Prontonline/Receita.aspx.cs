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

        if (!IsPostBack)
        {
            DropDownListMedico.AppendDataBoundItems = true;
            DropDownListMedico.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            DropDownListMedico.SelectedIndex = 0;

            DropDownListConsulta.AppendDataBoundItems = true;
            DropDownListConsulta.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            DropDownListConsulta.SelectedIndex = 0;
        }
    }

        protected void ButtonMinhasReceitas_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReceitaPesquisa.aspx");
    }

    protected void ButtonAdicionar_Click(object sender, EventArgs e)
    {
        if (Validar() == true)
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
            Response.Write("<script language = 'javascript'> alert ('Informação adiciona com sucesso!');</script>");
        }
    }

    protected Boolean Validar()
    {
        if (DropDownListMedico.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Selecione o Médico!');</script>");
            return false;
        }
        else if (DropDownListConsulta.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Escolha uma consulta!');</script>");
            return false;
            //esse item não deve ser obrigatório, mas deu erro quando não coloquei validação. VERIFICAR
        }
        else if (TextBoxData.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha corretamente a data!');</script>");
            return false;
        }
        else
        {
            return true;
        }
    }
}