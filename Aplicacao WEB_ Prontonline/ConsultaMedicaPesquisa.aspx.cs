using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConsultaMedicaPesquisa : System.Web.UI.Page
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
        Response.Redirect("ConsultaMedica.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        PesquisaConsultaMedica();
    }
    private void PesquisaConsultaMedica()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();
        String buscaMotivo = "%" + TextBoxNome.Text + "%";
        IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
        int usuario = Convert.ToInt32(i.ID());

        String sql = "Select c.id_usuario, c.id_consulta, c.data, c.motivo, c.diagnostico, c.recomendacoes, c.obs, m.nome, m.CRM from tb_consulta as c inner join tb_medico as m on c.id_medico=m.id_medico where c.motivo like @buscaMotivo and c.id_usuario=@id_usuario";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@buscaMotivo", SqlDbType.VarChar).Value = buscaMotivo;
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
        c.command.CommandText = "delete from tb_consulta where id_consulta=@registro";
        c.command.Parameters.Add("@registro", SqlDbType.Int).Value = registro;
        c.command.ExecuteNonQuery();
        c.FecharConexao();

        PesquisaConsultaMedica();
    }

    protected void DataGrid1_EditCommand(object source, DataGridCommandEventArgs e)
    {
        int linha = e.Item.ItemIndex;
        DataGrid1.EditItemIndex = linha;
        PesquisaConsultaMedica();
    }

    protected void DataGrid1_UpdateCommand(object source, DataGridCommandEventArgs e)
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        //IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
        //int usuario = Convert.ToInt32(i.ID());

        String usuario = ((TextBox)Convert.ChangeType(e.Item.Cells[0].Controls[0], typeof(TextBox))).Text;
        String id_consulta = ((TextBox)Convert.ChangeType(e.Item.Cells[1].Controls[0], typeof(TextBox))).Text;
        String data = ((TextBox)Convert.ChangeType(e.Item.Cells[2].Controls[0], typeof(TextBox))).Text;
        String id_medico = ((TextBox)Convert.ChangeType(e.Item.Cells[3].Controls[0], typeof(TextBox))).Text;
        String motivo = ((TextBox)Convert.ChangeType(e.Item.Cells[4].Controls[0], typeof(TextBox))).Text;
        String diagnostico = ((TextBox)Convert.ChangeType(e.Item.Cells[5].Controls[0], typeof(TextBox))).Text;
        String recomendacoes = ((TextBox)Convert.ChangeType(e.Item.Cells[6].Controls[0], typeof(TextBox))).Text;
        String obs = ((TextBox)Convert.ChangeType(e.Item.Cells[7].Controls[0], typeof(TextBox))).Text;

        String sql = "update tb_consulta set id_usuario=@id_usuario, data=@data, id_medico=@id_medico, motivo=@motivo, diagnostico=@diagnostico, recomendacoes=@recomendacoes, obs=@obs where id_consulta=@id_consulta";

        c.command.CommandText = sql;
        c.command.Parameters.Add("@id_usuario", SqlDbType.VarChar).Value = usuario;
        c.command.Parameters.Add("@id_consulta", SqlDbType.VarChar).Value = id_consulta;
        c.command.Parameters.Add("@data", SqlDbType.DateTime).Value = data;
        c.command.Parameters.Add("@id_medico", SqlDbType.VarChar).Value = id_medico;
        c.command.Parameters.Add("@motivo", SqlDbType.VarChar).Value = motivo;
        c.command.Parameters.Add("@diagnostico", SqlDbType.VarChar).Value = diagnostico;
        c.command.Parameters.Add("@recomendacoes", SqlDbType.VarChar).Value = recomendacoes;
        c.command.Parameters.Add("@obs", SqlDbType.VarChar).Value = obs;

        c.command.ExecuteNonQuery();
        c.FecharConexao();

        DataGrid1.EditItemIndex = -1;
        PesquisaConsultaMedica();
    }
}