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
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }

        if (!IsPostBack)
        {
            DropDownListMedico.AppendDataBoundItems = true;
            DropDownListMedico.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            DropDownListMedico.SelectedIndex = 0;

            DropDownListEspecialidade.AppendDataBoundItems = true;
            DropDownListEspecialidade.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            DropDownListEspecialidade.SelectedIndex = 0;
        }
    }

    protected void ButtonReceita_Click(object sender, EventArgs e)
    {
        Response.Redirect("Receita.aspx");
    }

    protected void ButtonExame_Click(object sender, EventArgs e)
    {
        Response.Redirect("Exame.aspx");
    }

    protected void ButtonMinhasConsulta_Click(object sender, EventArgs e)
    {
        Response.Redirect("ConsultaMedicaPesquisa.aspx");
    }

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

    protected void ButtonAdicionarMedico_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdicionarMedico.aspx");
    }

    protected void DropDownListMedico_SelectedIndexChanged(object sender, EventArgs e)
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
}