using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConsultaMedica : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ButtonEditar.Visible = false;

        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }

        if (!IsPostBack)
        {
            //DropDownListMedico.AppendDataBoundItems = true;
            //DropDownListMedico.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            //DropDownListMedico.SelectedIndex = 0;

            //DropDownListEspecialidade.AppendDataBoundItems = true;
            //DropDownListEspecialidade.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            //DropDownListEspecialidade.SelectedIndex = 0;
        }

        if (Request.QueryString["id_consulta"] != null)
        {
            PopulaInfos();
            ButtonEditar.Visible = true;
            ButtonAdicionar.Visible = false;
        }
    }

    protected void ButtonMinhasConsulta_Click(object sender, EventArgs e)
    {
        Response.Redirect("ConsultaMedicaPesquisa.aspx");
    }

    //Função para adicionar uma nova consulta médica
    protected void ButtonAdicionar_Click(object sender, EventArgs e)
    {
        if (Validar() == true)
        {
            IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
            int usuario = Convert.ToInt32(i.ID());

            DateTime dataConsulta = Convert.ToDateTime(TextBoxData.Text);
            int nomeMedico = Convert.ToInt32(DropDownListMedico.SelectedValue);
            String crm = Convert.ToString(TextBoxCRM.Text);
            int especialidade = Convert.ToInt32(DropDownListEspecialidade.SelectedValue);

            String Motivo = Convert.ToString(TextBoxMotivo.Text);
            String Diagnostico = Convert.ToString(TextBoxDiagnostico.Text);
            String Recomendacoes = Convert.ToString(TextBoxRecomendacoes.Text);
            String OutrasInf = Convert.ToString(TextBoxOutrasInformacoes.Text);

            Conexao c = new Conexao();
            c.AbrirConexao();

            String sql1 = "insert into tb_consulta (data, motivo, diagnostico, recomendacoes, obs, id_especialidade, id_medico, id_usuario) values (@data, @motivo, @diagnostico, @recomendacoes, @obs, @id_especialidade, @id_medico, @id_usuario)";
            c.command.CommandText = sql1;
            c.command.Parameters.Add("@data", SqlDbType.DateTime).Value = dataConsulta;
            c.command.Parameters.Add("@motivo", SqlDbType.VarChar).Value = Motivo;
            c.command.Parameters.Add("@diagnostico", SqlDbType.VarChar).Value = Diagnostico;
            c.command.Parameters.Add("@recomendacoes", SqlDbType.VarChar).Value = Recomendacoes;
            c.command.Parameters.Add("@obs", SqlDbType.VarChar).Value = OutrasInf;
            c.command.Parameters.Add("@id_especialidade", SqlDbType.Int).Value = especialidade;
            c.command.Parameters.Add("@id_medico", SqlDbType.Int).Value = nomeMedico;
            c.command.Parameters.Add("@id_usuario", SqlDbType.Int).Value = usuario;

            c.command.ExecuteNonQuery();
            c.FecharConexao();
            Response.Write("<script language = 'javascript'> alert ('Cadastro realizado com sucesso!');</script>");
        }
    }

    //Validação das informações preenchidas
    protected Boolean Validar()
    {
        if (TextBoxData.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Coloque a data da consulta médica!');</script>");
            return false;
        }
        else if (DropDownListMedico.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Selecione um Médico!');</script>");
            return false;
        }
        else if (TextBoxCRM.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha o CRM do Médico!');</script>");
            return false;
        }
        else if (DropDownListEspecialidade.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Selecione a especialidade do Médico!');</script>");
            return false;
        }
        else if (TextBoxMotivo.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Informe os Motivos!');</script>");
            return false;
        }
        else if (TextBoxRecomendacoes.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Informe as recomendações que o Médico deu!');</script>");
            return false;
        }
        else if (TextBoxDiagnostico.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Informa o Diagnóstico dado!');</script>");
            return false;
        }
        else
        {
            return true;
        }
    }

    //Action do botão para adicionar um novo médico
    protected void ButtonAdicionarMedico_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdicionarMedico.aspx");
    }

    //Preenchimento do CRM assim que escolhe o médico na lista
    protected void DropDownListMedico_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        int id_medico = Convert.ToInt32(DropDownListMedico.SelectedValue);

        String sql = "select CRM from tb_medico where id_medico=@id_medico";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@id_medico", SqlDbType.Int).Value = id_medico;

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        String CRM = dt.Tables[0].Rows[0]["CRM"].ToString();
        TextBoxCRM.Text = CRM;

        c.FecharConexao();
    }

    //Popular os campos do formulário para edição
    protected void PopulaInfos()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "SELECT * from tb_consulta where id_consulta=@id_consulta";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@id_consulta", SqlDbType.Int).Value = Request.QueryString["id_consulta"];

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        String id_medico = dt.Tables[0].Rows[0]["id_medico"].ToString();
        DropDownListMedico.Text = id_medico;

        String id_especialidade = dt.Tables[0].Rows[0]["id_especialidade"].ToString();
        DropDownListEspecialidade.Text = id_especialidade;

        String data = dt.Tables[0].Rows[0]["data"].ToString();
        TextBoxData.Text = data;

        String motivo = dt.Tables[0].Rows[0]["motivo"].ToString();
        TextBoxMotivo.Text = motivo;

        String diagnostico = dt.Tables[0].Rows[0]["diagnostico"].ToString();
        TextBoxDiagnostico.Text = diagnostico;

        String recomendacoes = dt.Tables[0].Rows[0]["recomendacoes"].ToString();
        TextBoxRecomendacoes.Text = recomendacoes;

        String obs = dt.Tables[0].Rows[0]["obs"].ToString();
        TextBoxOutrasInformacoes.Text = obs;

        c.FecharConexao();
    }

    //Atualizar as informações de uma consulta
    protected void UpdateInfos(int id_medico, int id_especialidade, int id_usuario, DateTime data, string motivo, string diagnostico, string recomendacoes, string obs)
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        SqlCommand comando = new SqlCommand();
        comando.Connection = c.conexao;
        comando.CommandText = "update tb_consulta set id_medico=@id_medico, id_especialidade=@id_especialidade, id_usuario=@id_usuario, data=@data, motivo=@motivo, diagnostico=@diagnostico, recomendacoes=@recomendacoes, obs=@obs where id_consulta=@id_consulta";

        SqlParameter parametro = new SqlParameter();
        parametro.ParameterName = "@id_medico";
        parametro.SqlDbType = SqlDbType.Int;
        parametro.Value = id_medico;
        comando.Parameters.Add(parametro);

        SqlParameter parametro1 = new SqlParameter();
        parametro1.ParameterName = "@id_especialidade";
        parametro1.SqlDbType = SqlDbType.Int;
        parametro1.Value = id_especialidade;
        comando.Parameters.Add(parametro1);

        SqlParameter parametro2 = new SqlParameter();
        parametro2.ParameterName = "@id_usuario";
        parametro2.SqlDbType = SqlDbType.Int;
        parametro2.Value = id_usuario;
        comando.Parameters.Add(parametro2);

        SqlParameter parametro3 = new SqlParameter();
        parametro3.ParameterName = "@data";
        parametro3.SqlDbType = SqlDbType.DateTime;
        parametro3.Value = data;
        comando.Parameters.Add(parametro3);

        SqlParameter parametro4 = new SqlParameter();
        parametro4.ParameterName = "@motivo";
        parametro4.SqlDbType = SqlDbType.VarChar;
        parametro4.Value = motivo;
        comando.Parameters.Add(parametro4);

        SqlParameter parametro5 = new SqlParameter();
        parametro5.ParameterName = "@diagnostico";
        parametro5.SqlDbType = SqlDbType.VarChar;
        parametro5.Value = diagnostico;
        comando.Parameters.Add(parametro5);

        SqlParameter parametro6 = new SqlParameter();
        parametro6.ParameterName = "@recomendacoes";
        parametro6.SqlDbType = SqlDbType.VarChar;
        parametro6.Value = recomendacoes;
        comando.Parameters.Add(parametro6);

        SqlParameter parametro7 = new SqlParameter();
        parametro7.ParameterName = "@obs";
        parametro7.SqlDbType = SqlDbType.VarChar;
        parametro7.Value = obs;
        comando.Parameters.Add(parametro7);

        SqlParameter parametro8 = new SqlParameter();
        parametro8.ParameterName = "@id_consulta";
        parametro8.SqlDbType = SqlDbType.Int;
        parametro8.Value = Request.QueryString["id_consulta"];
        comando.Parameters.Add(parametro8);

        comando.ExecuteNonQuery();
    }

    protected void ButtonEditar_Click(object sender, EventArgs e)
    {
        UpdateInfos(Convert.ToInt32(DropDownListMedico.Text), Convert.ToInt32(DropDownListEspecialidade.Text), Convert.ToInt32(Session["IdUsuario"]), Convert.ToDateTime(TextBoxData.Text), TextBoxMotivo.Text, TextBoxDiagnostico.Text, TextBoxRecomendacoes.Text, TextBoxOutrasInformacoes.Text);
        Response.Write("<script language = 'javascript'> alert ('Alterações salvas com sucesso!');</script>");
        Response.Redirect("ConsultaMedica.aspx");
    }
}