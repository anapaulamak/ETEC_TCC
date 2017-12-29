using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InfUsuario : System.Web.UI.Page
{
    Conexao c = new Conexao();
    String cpf;

    protected void Page_Load(object sender, EventArgs e)
    {
        TextBoxNome.Enabled = false;
        TextBoxEmail.Enabled = false;
        TextBoxCPF.Enabled = false;
        TextBoxData.Enabled = false;
        RadioButtonList1.Enabled = false;
        ButtonSalvar.Enabled = false;
        ButtonCancelar.Enabled = false;
        ButtonEditar.Enabled = true;

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

                String sql = "select * from tb_usuario where cpf=@cpf";
                c.command.CommandText = sql;
                c.command.Parameters.Add("@cpf", SqlDbType.Char).Value = Session["UserId"];

                SqlDataAdapter dAdapter = new SqlDataAdapter();
                DataSet dt = new DataSet();
                dAdapter.SelectCommand = c.command;
                dAdapter.Fill(dt);

                String nome = dt.Tables[0].Rows[0]["nome_usuario"].ToString();
                TextBoxNome.Text = nome;

                String email = dt.Tables[0].Rows[0]["e_mail_usuario"].ToString();
                TextBoxEmail.Text = email;

                Session["CPF"] = dt.Tables[0].Rows[0]["cpf"].ToString();
                TextBoxCPF.Text = Session["CPF"].ToString();

                String data = dt.Tables[0].Rows[0]["data_nascimento"].ToString();
                TextBoxData.Text = data;

                String sexo = dt.Tables[0].Rows[0]["sexo"].ToString();
                RadioButtonList1.SelectedValue = sexo;

                c.FecharConexao();
            }
        }
    }

    protected void ButtonEditar_Click(object sender, EventArgs e)
    {
        TextBoxNome.Enabled = true;
        TextBoxEmail.Enabled = true;
        TextBoxData.Enabled = true;
        RadioButtonList1.Enabled = true;
        ButtonSalvar.Enabled = true;
        ButtonCancelar.Enabled = true;
        ButtonEditar.Enabled = false;
        TextBoxData.TextMode = TextBoxMode.Date;
    }

    protected void ButtonSalvar_Click(object sender, EventArgs e)
    {
        c.AtualizarInfo(TextBoxNome.Text, Convert.ToDateTime(TextBoxData.Text), TextBoxEmail.Text, Session["CPF"].ToString());
    }

}