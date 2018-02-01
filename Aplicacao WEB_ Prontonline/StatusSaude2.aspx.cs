using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StatusSaude2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownListAlergia.AppendDataBoundItems = true;
            DropDownListAlergia.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            DropDownListAlergia.SelectedIndex = 0;

            DropDownListCirurgia.AppendDataBoundItems = true;
            DropDownListCirurgia.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            DropDownListCirurgia.SelectedIndex = 0;

            DropDownListFratura.AppendDataBoundItems = true;
            DropDownListFratura.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            DropDownListFratura.SelectedIndex = 0;
        }

        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "select id_saude from tb_statusSaude where id_usuario=@id_usuario";
        c.command.CommandText = sql;

        IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
        int id_usuario = Convert.ToInt32(i.ID());

        c.command.Parameters.Add("@id_usuario", SqlDbType.Int).Value = id_usuario;

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        String id_saude = dt.Tables[0].Rows[0]["id_saude"].ToString();
        c.FecharConexao();

        TextBoxIdSaude.Text = id_saude;

    }

    protected void ButtonMeusStatus_Click(object sender, EventArgs e)
    {
        Response.Redirect("StatusSaudePesquisa.aspx");
    }

    protected Boolean ValidarAlergia()
    {
        if (DropDownListAlergia.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Escolha uma alergia!');</script>");
            return false;
        }
        else if (TextBoxData.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Selecione uma data!');</script>");
            return false;
        }
        else
        {
            return true;
        }
    }
    protected void ButtonAdicionar1_Click(object sender, EventArgs e)
    {
        if (ValidarAlergia() == true)
        {
            int id_tipoAlergia = Convert.ToInt32(DropDownListAlergia.Text);
            int id_saude = Convert.ToInt32(TextBoxIdSaude.Text);
            DateTime dataAlergia = Convert.ToDateTime(TextBoxData.Text);

            Conexao c = new Conexao();
            c.AbrirConexao();

            String sql = "insert into tb_alergia (id_tipoAlergia, id_saude, dataAlergia) values (@id_tipoAlergia, @id_saude, @dataAlergia)";
            c.command.CommandText = sql;
            c.command.Parameters.Add("@id_tipoAlergia", SqlDbType.Int).Value = id_tipoAlergia;
            c.command.Parameters.Add("@id_saude", SqlDbType.Int).Value = id_saude;
            c.command.Parameters.Add("@dataAlergia", SqlDbType.DateTime).Value = dataAlergia;

            c.command.ExecuteNonQuery();
            c.FecharConexao();

            CadastroAlergia();
        }
    }

    private void CadastroAlergia()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();
        String Alergia = TextBoxIdSaude.Text;

        String sql = "select a.id_saude, a.id_alergia, a.dataAlergia, ta.descricao from tb_tipoAlergia as ta inner join tb_alergia as a on ta.id_tipoAlergia=a.id_tipoAlergia where id_saude=@Alergia";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@Alergia", SqlDbType.Int).Value = Alergia;

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        DataGridAlergia.DataSource = dt;
        DataGridAlergia.DataBind();
        c.FecharConexao();    
    }

    protected void DataGridAlergia_DeleteCommand(object source, DataGridCommandEventArgs e)
    {
        int registro;
        registro = Convert.ToInt32(e.Item.Cells[0].Text);
        Conexao c = new Conexao();
        c.AbrirConexao();
        c.command.CommandText = "delete from tb_alergia where id_alergia=@registro";
        c.command.Parameters.Add("@registro", SqlDbType.Int).Value = registro;
        c.command.ExecuteNonQuery();
        c.FecharConexao();

        CadastroAlergia();
    }


    protected Boolean ValidarCirurgia()
    {
        if (DropDownListCirurgia.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Escolha uma cirurgia!');</script>");
            return false;
        }
        else if (TextBoxData2.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Selecione uma data!');</script>");
            return false;
        }
        else
        {
            return true;
        }
    }
    protected void ButtonAdicionar2_Click(object sender, EventArgs e)
    {
        if (ValidarCirurgia() == true)
        {
            int tipoCirurgia = Convert.ToInt32(DropDownListCirurgia.Text);
            int id_saude = Convert.ToInt32(TextBoxIdSaude.Text);
            DateTime dataCirurgia = Convert.ToDateTime(TextBoxData2.Text);

            Conexao c = new Conexao();
            c.AbrirConexao();

            String sql = "insert into tb_cirurgia (id_tipoCirurgia, id_saude, dataCirurgia) values (@id_tipoCirurgia, @id_saude, @dataCirurgia)";
            c.command.CommandText = sql;
            c.command.Parameters.Add("@id_tipoCirurgia", SqlDbType.Int).Value = tipoCirurgia;
            c.command.Parameters.Add("@id_saude", SqlDbType.Int).Value = id_saude;
            c.command.Parameters.Add("@dataCirurgia", SqlDbType.DateTime).Value = dataCirurgia;

            c.command.ExecuteNonQuery();
            c.FecharConexao();
            CadastroCirurgia();
        }

    }
    private void CadastroCirurgia()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();
        String Cirurgia = TextBoxIdSaude.Text;

        String sql = "select c.id_cirurgia, c.id_saude, c.dataCirurgia, tc.descricao from tb_tipoCirurgia as tc inner join tb_cirurgia as c on tc.id_tipoCirurgia=c.id_tipoCirurgia where id_saude=@Cirurgia";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@Cirurgia", SqlDbType.Int).Value = Cirurgia;

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        DataGridCirurgia.DataSource = dt;
        DataGridCirurgia.DataBind();
        c.FecharConexao();
    }

    protected void DataGridCirurgia_DeleteCommand(object source, DataGridCommandEventArgs e)
    {
        int registro;
        registro = Convert.ToInt32(e.Item.Cells[0].Text);
        Conexao c = new Conexao();
        c.AbrirConexao();
        c.command.CommandText = "delete from tb_cirurgia where id_cirurgia=@registro";
        c.command.Parameters.Add("@registro", SqlDbType.Int).Value = registro;
        c.command.ExecuteNonQuery();
        c.FecharConexao();

        CadastroCirurgia();
    }

    protected Boolean ValidarFratura()
    {
        if (DropDownListFratura.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Escolha uma Fratura!');</script>");
            return false;
        }
        else if (TextBoxData3.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Selecione uma data!');</script>");
            return false;
        }
        else
        {
            return true;
        }
    }
    protected void ButtonAdicionar3_Click(object sender, EventArgs e)
    {
        if (ValidarFratura() == true)
        {
            int tipoFratura = Convert.ToInt32(DropDownListFratura.Text);
            int id_saude = Convert.ToInt32(TextBoxIdSaude.Text);
            DateTime dataFratura = Convert.ToDateTime(TextBoxData3.Text);

            Conexao c = new Conexao();
            c.AbrirConexao();

            String sql = "insert into tb_fratura (id_tipoFratura, id_saude, dataFratura) values (@id_tipoFratura, @id_saude, @dataFratura)";
            c.command.CommandText = sql;
            c.command.Parameters.Add("@id_tipoFratura", SqlDbType.Int).Value = tipoFratura;
            c.command.Parameters.Add("@id_saude", SqlDbType.Int).Value = id_saude;
            c.command.Parameters.Add("@dataFratura", SqlDbType.DateTime).Value = dataFratura;

            c.command.ExecuteNonQuery();
            c.FecharConexao();
            CadastroFratura();
        }
    }

    private void CadastroFratura()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();
        String Fratura = TextBoxIdSaude.Text;

        String sql = "select f.id_fratura, f.id_saude, f.dataFratura, tf.descricao from tb_tipoFratura as tf inner join tb_fratura as f on tf.id_tipoFratura=f.id_tipoFratura where id_saude=@Fratura";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@Fratura", SqlDbType.Int).Value = Fratura;

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        DataGridFratura.DataSource = dt;
        DataGridFratura.DataBind();
        c.FecharConexao();
    }

    protected void DataGridFratura_DeleteCommand(object source, DataGridCommandEventArgs e)
    {
        int registro;
        registro = Convert.ToInt32(e.Item.Cells[0].Text);
        Conexao c = new Conexao();
        c.AbrirConexao();
        c.command.CommandText = "delete from tb_fratura where id_fratura=@registro";
        c.command.Parameters.Add("@registro", SqlDbType.Int).Value = registro;
        c.command.ExecuteNonQuery();
        c.FecharConexao();

        CadastroFratura();
    }

    protected void ButtonSalvar_Click(object sender, EventArgs e)
    {
        Response.Write("<script language = 'javascript'> alert ('Cadastro realizado com sucesso!');</script>");
    }
}