using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Faq : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        PesquisaFaq();
    }
    private void PesquisaFaq()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();
        String nomeFaq = "%" + TextBoxPalavra.Text + "%";

        String sql = "Select pergunta, resposta from tb_faq where pergunta like @pergunta";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@pergunta", SqlDbType.VarChar).Value = nomeFaq;

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        DataGrid1.DataSource = dt;
        DataGrid1.DataBind();
        c.FecharConexao();

    }
}