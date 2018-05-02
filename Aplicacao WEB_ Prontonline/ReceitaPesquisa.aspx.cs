using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReceitaPesquisa : System.Web.UI.Page
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
        Response.Redirect("Receita.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
    }

    //private void PesquisaReceita()
    //{
    //    Conexao c = new Conexao();
    //    c.AbrirConexao();
    //    String nomeReceita = "%" + TextBoxNome.Text + "%";

    //    IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
    //    int usuario = Convert.ToInt32(i.ID());

    //    String sql = "Select m.nome as descricao, r.imagem, r.data, r.id_receita, concat(Convert(VarChar,c.data, 120)+'-',m.nome) as consulta, c.id_consulta from tb_consulta as c join tb_medico as m on c.id_medico=m.id_medico join tb_receita as r on r.id_consulta=c.id_consulta where m.nome like @nome and c.id_usuario=@id_usuario";
    //    c.command.CommandText = sql;
    //    c.command.Parameters.Add("@nome", SqlDbType.VarChar).Value = nomeReceita;
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