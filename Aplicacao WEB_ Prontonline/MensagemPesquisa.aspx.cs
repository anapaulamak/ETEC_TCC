using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MensagemPesquisa : System.Web.UI.Page
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
        Response.Redirect("Mensagem.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        PesquisaMensagem();
    }

    private void PesquisaMensagem()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();
        String nomeMensagem = "%" + TextBoxNome.Text + "%";
        IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
        int usuario = Convert.ToInt32(i.ID());

        String sql = "Select id_usuario, id_mensagem, dataEnvio, tipoMensagem, titulo, mensagem, situacao from tb_mensagem where titulo like @nomeMensagem and id_usuario=@id_usuario";
        // inserir  resposta e dataResposta no comando
        c.command.CommandText = sql;
        c.command.Parameters.Add("@nomeMensagem", SqlDbType.VarChar).Value = nomeMensagem;
        c.command.Parameters.Add("@id_usuario", SqlDbType.Int).Value = usuario;

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        DataGrid1.DataSource = dt;
        DataGrid1.DataBind();
        c.FecharConexao();

    }

    protected void DataGrid1_DeleteCommand(object source, DataGridCommandEventArgs e)
    {
        int registro;
        registro = Convert.ToInt32(e.Item.Cells[0].Text);
        Conexao c = new Conexao();
        c.AbrirConexao();
        c.command.CommandText = "delete from tb_mensagem where id_mensagem=@registro";
        c.command.Parameters.Add("@registro", SqlDbType.Int).Value = registro;
        c.command.ExecuteNonQuery();
        c.FecharConexao();
        PesquisaMensagem();
    }

}