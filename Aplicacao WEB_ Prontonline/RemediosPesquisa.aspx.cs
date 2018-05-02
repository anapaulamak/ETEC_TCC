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
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }
    }

    protected void ButtonVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("Remedios.aspx");
    }


    protected void ButtonBuscar_Click(object sender, EventArgs e)
    {

    }
}