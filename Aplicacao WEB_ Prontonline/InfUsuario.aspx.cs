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
        ButtonSalvar.CssClass = "ConfButton";
        ButtonCancelar.Enabled = false;
        ButtonCancelar.CssClass = "ConfButton";
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
        ButtonEditar.CssClass = "ConfButton";
        TextBoxData.Enabled = true;
    }

    protected void ButtonSalvar_Click(object sender, EventArgs e)
    {
        AtualizarInfo(TextBoxNome.Text, Convert.ToDateTime(TextBoxData.Text), TextBoxEmail.Text, Session["CPF"].ToString());
    }

    private void AtualizarInfo(string nome, DateTime data, string email, string cpf)
    {
        Conexao c = new Conexao();
        try
        {
            c.AbrirConexao();

            SqlCommand comando = new SqlCommand();
            comando.Connection = c.conexao;
            comando.CommandText = "update tb_usuario set nome_usuario = @nome_usuario, data_nascimento = @data_nascimento, e_mail_usuario = @e_mail_usuario  where cpf = @cpf";

            SqlParameter parametro = new SqlParameter();
            parametro.ParameterName = "@nome_usuario";
            parametro.SqlDbType = SqlDbType.VarChar;
            parametro.Value = nome;
            comando.Parameters.Add(parametro);

            SqlParameter parametro1 = new SqlParameter();
            parametro1.ParameterName = "@data_nascimento";
            parametro1.SqlDbType = SqlDbType.Date;
            parametro1.Value = data;
            comando.Parameters.Add(parametro1);

            SqlParameter parametro2 = new SqlParameter();
            parametro2.ParameterName = "@e_mail_usuario";
            parametro2.SqlDbType = SqlDbType.VarChar;
            parametro2.Value = email;
            comando.Parameters.Add(parametro2);

            SqlParameter parametro3 = new SqlParameter();
            parametro3.ParameterName = "@cpf";
            parametro3.SqlDbType = SqlDbType.VarChar;
            parametro3.Value = cpf;
            comando.Parameters.Add(parametro3);

            comando.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write("ERRO:" + ex);
        }
        finally
        {
            c.conexao.Close();
        }
    }
}