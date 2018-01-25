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
        TextBoxResposta.Enabled = false;
    }

    protected void ButtonMinhasMensagens_Click(object sender, EventArgs e)
    {
        Response.Redirect("MensagemPesquisa.aspx");
    }

    protected void ButtonEnviar_Click(object sender, EventArgs e)
    {
        IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
        int usuario = Convert.ToInt32(i.ID());

        String tipoMensagem = Convert.ToString(DropDownListTipo.SelectedValue);
        String assunto = Convert.ToString(TextBoxAssunto.Text);
        String mensagem = Convert.ToString(TextBoxMensagem.Text);

        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "insert into tb_mensagem (tipoMensagem, titulo, mensagem, id_usuario) values (@tipoMensagem, @titulo, @mensagem, @id_usuario)";
        c.command.CommandText = sql;

        c.command.Parameters.Add("@tipoMensagem", SqlDbType.VarChar).Value = tipoMensagem;
        c.command.Parameters.Add("@titulo", SqlDbType.VarChar).Value = assunto;
        c.command.Parameters.Add("@mensagem", SqlDbType.VarChar).Value = mensagem;
        c.command.Parameters.Add("@id_usuario", SqlDbType.Int).Value = usuario;

        c.command.ExecuteNonQuery();
        c.FecharConexao();
        Response.Write("<script language = 'javascript'> alert ('Cadastro realizado com sucesso!');</script>");
    }
}