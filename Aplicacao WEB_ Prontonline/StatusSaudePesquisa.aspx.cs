using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StatusSaudePesquisa : System.Web.UI.Page
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
        Response.Redirect("StatusSaude.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    //private void PesquisaStatus()
    //{
    //    Conexao c = new Conexao();
    //    c.AbrirConexao();
    //    DateTime dataStatusSaude = Convert.ToDateTime(TextBoxNome.Text);

    //    IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
    //    int usuario = Convert.ToInt32(i.ID());

    //    String sql = "Select id_saude, dataStatus, peso, altura, glicemia, colesterol from tb_statusSaude where dataStatus=@dataStatus and id_usuario=@id_usuario";
    //    c.command.CommandText = sql;
    //    c.command.Parameters.Add("@dataStatus", SqlDbType.Date).Value = dataStatusSaude;
    //    c.command.Parameters.Add("@id_usuario", SqlDbType.Int).Value = usuario;

    //    SqlDataAdapter dAdapter = new SqlDataAdapter();
    //    DataSet dt = new DataSet();
    //    dAdapter.SelectCommand = c.command;
    //    dAdapter.Fill(dt);

    //    DataGrid1.DataSource = dt;
    //    DataGrid1.DataBind();
    //    c.FecharConexao();
    //}
}