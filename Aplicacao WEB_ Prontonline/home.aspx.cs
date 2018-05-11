using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page
{
    Conexao conectar = new Conexao();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonCadastrar_Click(object sender, EventArgs e)
    {
        String nomeUsuario = Convert.ToString(TextBoxNome.Text);
        String emailUsuario = Convert.ToString(TextBoxEmail.Text);
        String cpf = Convert.ToString(TextBoxCPF.Text);
        String dataNascimento = Convert.ToString(TextBoxNascimento.Text);
        String sexo = Convert.ToString(RadioButtonList1.SelectedValue);
        String estado = Convert.ToString(DropDownListEstado.Text);
        String senha = Convert.ToString(TextBoxSenha1.Text);

        Conexao c = new Conexao();
        c.AbrirConexao();

        if (Validar() == true)
        {
            String sql = "insert into tb_usuario (nome_usuario, e_mail_usuario, cpf, data_nascimento, sexo, senha, estado) values (@nomeUsuario, @emailUsuario, @cpf, @dataNascimento, @sexo, @senha, @estado)";
            c.command.CommandText = sql;

            c.command.Parameters.Add("@nomeUsuario", SqlDbType.VarChar).Value = nomeUsuario;
            c.command.Parameters.Add("@emailUsuario", SqlDbType.VarChar).Value = emailUsuario;
            c.command.Parameters.Add("@cpf", SqlDbType.Char).Value = cpf;
            c.command.Parameters.Add("@dataNascimento", SqlDbType.VarChar).Value = dataNascimento;
            c.command.Parameters.Add("@sexo", SqlDbType.Char).Value = sexo;
            c.command.Parameters.Add("@senha", SqlDbType.Char).Value = senha;
            c.command.Parameters.Add("@estado", SqlDbType.Char).Value = estado;

            c.command.ExecuteNonQuery();
            Response.Write("<script language = 'javascript'> alert ('Cadastro realizado com sucesso!');</script>");
            c.FecharConexao();

            Session["logado"] = 1;
            Session["UserId"] = cpf;

            Response.Redirect("InfUsuario.aspx");
        }
        else
        {
            Response.Write("<script language = 'javascript'> alert ('Verifique se os dados informados estão corretos!');</script>");
        }

    }

    protected Boolean Validar()
    {
        if (TextBoxNome.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha corretamente o seu nome!');</script>");
            return false;
        }
        else if (TextBoxEmail.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha corretamente o seu e-mail!');</script>");
            return false;
        }
        else if (TextBoxCPF.Text == "" || TextBoxCPF.Text.Length < 11)
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha corretamente o seu CPF!');</script>");
            return false;
        }
        else if (TextBoxNascimento.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha corretamente a data no seu nascimento!');</script>");
            return false;
        }
        else if (TextBoxSenha1.Text == "" || TextBoxSenha1.Text.Length != 8)
        {
            Response.Write("<script language = 'javascript'> alert ('Sua senha precisa ter 8 characteres!');</script>");
            return false;
        }
        else if (TextBoxSenha1.Text != TextBoxSenha2.Text)
        {
            Response.Write("<script language = 'javascript'> alert ('A validação da senha não confere');</script>");
            return false;
        }
        else
        {
            return true;
        }
    }

    protected void ButtonLogar_Click(object sender, EventArgs e)
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();

        c.command.CommandText = "Select * from tb_usuario where cpf=@cpf and senha=@senha";
        c.command.Parameters.Add("@cpf", SqlDbType.VarChar).Value = TextBoxLogin.Text;
        c.command.Parameters.Add("@senha", SqlDbType.VarChar).Value = TextBoxSenha.Text;

        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        if (dt.Tables[0].DefaultView.Count == 1)
        {
            Session["logado"] = 1;
            Session["UserId"] = dt.Tables[0].DefaultView[0].Row["cpf"].ToString();
            Session["IdUsuario"] = Convert.ToInt32(dt.Tables[0].DefaultView[0].Row["id_usuario"].ToString());
            Response.Redirect("InfUsuario.aspx");
        }
        else
        {
            Response.Write("<script language = 'javascript'> alert ('Login Invalido');</script>");
            TextBoxLogin.Text = "";
            TextBoxSenha.Text = "";
        }
    }
}