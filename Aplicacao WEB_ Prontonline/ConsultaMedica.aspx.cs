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

    protected void ButtonAdicionarMedico_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdicionarMedico.aspx");
    }
}