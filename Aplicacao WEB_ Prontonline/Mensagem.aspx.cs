using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Memsagem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }

        //TextBoxResposta.Enabled = false;
        //TextBoxResposta.CssClass = "ConfTextArea";

        if (!IsPostBack)
        {
            DropDownListTipo.AppendDataBoundItems = true;
            DropDownListTipo.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            DropDownListTipo.SelectedIndex = 0;
        }
    }

    protected void ButtonMinhasMensagens_Click(object sender, EventArgs e)
    {
        Response.Redirect("MensagemPesquisa.aspx");
    }

    protected void ButtonEnviar_Click(object sender, EventArgs e)
    {
        if (Validar() == true)
        {
            IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
            int usuario = Convert.ToInt32(i.ID());

            String tipoMensagem = Convert.ToString(DropDownListTipo.SelectedValue);
            String assunto = Convert.ToString(TextBoxAssunto.Text);
            String mensagem = Convert.ToString(TextBoxMensagem.Text);
            int situacao = Convert.ToInt32(LabelSituacao.Text);

            Conexao c = new Conexao();
            c.AbrirConexao();

            String sql = "insert into tb_mensagem (tipoMensagem, titulo, mensagem, id_usuario, situacao) values (@tipoMensagem, @titulo, @mensagem, @id_usuario, @situacao)";
            c.command.CommandText = sql;

            c.command.Parameters.Add("@tipoMensagem", SqlDbType.VarChar).Value = tipoMensagem;
            c.command.Parameters.Add("@titulo", SqlDbType.VarChar).Value = assunto;
            c.command.Parameters.Add("@mensagem", SqlDbType.VarChar).Value = mensagem;
            c.command.Parameters.Add("@id_usuario", SqlDbType.Int).Value = usuario;
            c.command.Parameters.Add("@situacao", SqlDbType.Int).Value = situacao;

            c.command.ExecuteNonQuery();
            c.FecharConexao();
            Response.Write("<script language = 'javascript'> alert ('Mensagem enviada com sucesso!');</script>");

            DropDownListTipo.SelectedValue = "";
            TextBoxAssunto.Text = "";
            TextBoxMensagem.Text = "";
        }

    }

    protected Boolean Validar()
    {
        if (DropDownListTipo.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Selecione o tipo da Mensagem!');</script>");
            return false;
        }
        else if (TextBoxAssunto.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha o assunto da Mensagem!');</script>");
            return false;
        }
        else if (TextBoxMensagem.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha a Mensagem!');</script>");
            return false;
        }
        else
        {
            return true;
        }
    }

}