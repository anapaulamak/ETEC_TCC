using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VacinaPesquisa : System.Web.UI.Page
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
        Response.Redirect("Vacina.aspx");
    }

    protected void ButtonBuscar_Click(object sender, EventArgs e)
    {
        PesquisaVacina();
    }


    private void PesquisaVacina()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();
        String nomeVacina = "%" + TextBoxNome.Text + "%";
        IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
        int usuario = Convert.ToInt32(i.ID());

        String sql = "Select v.id_vacina as id_vacina, tv.descricao as descricao, v.data as data, v.imagem as imagem, v.id_usuario as id_usuario from tb_tipoVacina as tv right join tb_vacina as v on v.id_tipoVacina=tv.id_tipoVacina where tv.descricao like @nomeVacina and v.id_usuario=@id_usuario";
        //String sql = "Select * from tb_vacina where id_tipoVacina in (Select id_tipoVacina from tb_tipoVacina where descricao like @nomeVacina)";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@nomeVacina", SqlDbType.VarChar).Value = nomeVacina;
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
        c.command.CommandText = "delete from tb_vacina where id_vacina=@registro";
        c.command.Parameters.Add("@registro", SqlDbType.Int).Value = registro;
        c.command.ExecuteNonQuery();
        c.FecharConexao();
        PesquisaVacina();
    }

    //protected void DataGrid1_EditCommand(object source, DataGridCommandEventArgs e)
    //{
    //    int linha = e.Item.ItemIndex;
    //    DataGrid1.EditItemIndex = linha;
    //    PesquisaVacina();
    //}

    //protected void DataGrid1_UpdateCommand(object source, DataGridCommandEventArgs e)
    //{
    //    Conexao c = new Conexao();
    //    c.AbrirConexao();

    //    int id_vacina = Convert.ToInt32(e.Item.Cells[0].Text);
    //    String data = ((TextBox)Convert.ChangeType(e.Item.Cells[1].Controls[0], typeof(TextBox))).Text;
    //    String imagem = ((TextBox)Convert.ChangeType(e.Item.Cells[2].Controls[0], typeof(TextBox))).Text;
    //    String tipoVacina = ((TextBox)Convert.ChangeType(e.Item.Cells[3].Controls[0], typeof(TextBox))).Text;

    //    String sql = "update tb_vacina set data=@data, imagem=@imagem, tipoVacina=@tipoVacina where id_vacina=@id_vacina";

    //    c.command.CommandText = sql;
    //    c.command.Parameters.Add("@data", SqlDbType.DateTime).Value = data;
    //    c.command.Parameters.Add("@imagem", SqlDbType.VarChar).Value = imagem;
    //    c.command.Parameters.Add("@tipoVacina", SqlDbType.Int).Value = tipoVacina;

    //    c.command.ExecuteNonQuery();
    //    c.FecharConexao();

    //    DataGrid1.EditItemIndex = -1;
    //    PesquisaVacina();
    //}

    private void PesquisaProd()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();
        String prod = "%" + TextBoxNome.Text + "%";

        String sql = "select * from produto where nome like @prod";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@prod", SqlDbType.VarChar).Value = prod;

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        DataGrid1.DataSource = dt;
        DataGrid1.DataBind();
        c.FecharConexao();

    }
}