using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReceitasPesquisa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("Remedios.aspx");
    }

    protected void ButtonBuscar_Click(object sender, EventArgs e)
    {
        PesquisaRemedio();
    }
    private void PesquisaRemedio()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();
        String nomeReceita = "%" + TextBoxNomeRemedio.Text + "%";

        IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
        int usuario = Convert.ToInt32(i.ID());

        String sql = "Select nome, dosagem, imagem, dataInicio, dataFim from tb_remedios where nome=@_usuario=@id_usuario";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@nome", SqlDbType.VarChar).Value = nomeReceita;
        c.command.Parameters.Add("@id_usuario", SqlDbType.Int).Value = usuario;

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        GridViewRemedios.DataSource = dt;
        GridViewRemedios.DataBind();
        c.FecharConexao();
    }
}