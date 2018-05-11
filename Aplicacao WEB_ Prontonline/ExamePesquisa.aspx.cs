using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExamesPesquisa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }

        Conexao c = new Conexao();
        c.AbrirConexao();

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();

        c.command.CommandText = "select * from tb_consulta where id_usuario=@usuario";
        c.command.Parameters.Add("@usuario", SqlDbType.Int).Value = Session["IdUsuario"];
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        if (dt.Tables[0].DefaultView.Count == 1)
        {
            Session["IdConsulta"] = Convert.ToInt32(dt.Tables[0].DefaultView[0].Row["id_consulta"].ToString());
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Exame.aspx");
    }

    protected void ButtonBuscar_Click(object sender, EventArgs e)
    {

    }
}