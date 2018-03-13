using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        NomeUsuario();
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session["UserId"] = "";
        Response.Redirect("home.aspx");
    }

    protected void NomeUsuario()
    {
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }
        else
        {
            if (!Page.IsPostBack)
            {
                Conexao c = new Conexao();
                c.AbrirConexao();

                String sql = "select nome_usuario from tb_usuario where cpf=@cpf";
                c.command.CommandText = sql;
                c.command.Parameters.Add("@cpf", SqlDbType.Char).Value = Session["UserId"];

                SqlDataAdapter dAdapter = new SqlDataAdapter();
                DataSet dt = new DataSet();
                dAdapter.SelectCommand = c.command;
                dAdapter.Fill(dt);

                String nome = dt.Tables[0].Rows[0]["nome_usuario"].ToString();
                lblNomeUsuario.Text = nome;

                c.FecharConexao();
            }
        }
    }
}
