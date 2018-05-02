using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Receitas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }
    }

    protected void ButtonMeusStatus_Click(object sender, EventArgs e)
    {
        Response.Redirect("StatusSaudePesquisa.aspx");
    }

    protected void ButtonSalvar_Click(object sender, EventArgs e)
    {
        if (Validar() == true)
        {
            IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
            int id_usuario = Convert.ToInt32(i.ID());

            double altura = Convert.ToDouble(TextBoxAltura.Text);
            double peso = Convert.ToDouble(TextBoxPeso.Text);

            double colesterol = Convert.ToDouble(TextBoxColesterol.Text);
            double glicemia = Convert.ToDouble(TextBoxGlicemia.Text);

            Conexao c = new Conexao();
            c.AbrirConexao();

            String sql = "insert into tb_statusSaude (id_usuario, altura, peso, colesterol, glicemia) values (@id_usuario, @altura, @peso, @colesterol, @glicemia)";
            c.command.CommandText = sql;

            c.command.Parameters.Add("@id_usuario", SqlDbType.Int).Value = id_usuario;
            c.command.Parameters.Add("@altura", SqlDbType.Decimal).Value = altura;
            c.command.Parameters.Add("@peso", SqlDbType.Decimal).Value = peso;
            c.command.Parameters.Add("@colesterol", SqlDbType.Decimal).Value = colesterol;
            c.command.Parameters.Add("@glicemia", SqlDbType.Decimal).Value = glicemia;

            c.command.ExecuteNonQuery();
            c.FecharConexao();
            Response.Write("<script language = 'javascript'> alert ('Informações salvas com sucesso!');</script>");

        }

    }

    protected Boolean Validar()
    {
        if (TextBoxPeso.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha o seu peso corretamente!');</script>");
            return false;
        }
        else if (TextBoxAltura.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha a sua altura corretamente!');</script>");
            return false;
        }
        else if (TextBoxColesterol.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha o seu Colesterol Total!');</script>");
            return false;
        }
        else if (TextBoxGlicemia.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha o seu nível glicêmico!');</script>");
            return false;
        }
        else
        {
            return true;
        }
    }

    protected void ButtonCalcularIMC_Click(object sender, EventArgs e)
    {
        double A = (Convert.ToDouble(TextBoxAltura.Text)) / 100;
        double P = Convert.ToDouble(TextBoxPeso.Text);
        double IMC = P / Math.Pow(A, 2);

        TextBoxIMC.Text = Convert.ToString(System.Math.Round(IMC, 2));

        if (IMC < 18.5)
        {
            LabelIMC.Text = "Você está abaixo do peso";
        }
        else if (IMC <= 24.9)
        {
            LabelIMC.Text = "Você está com o peso ideal";
        }
        else if (IMC <= 29.9)
        {
            LabelIMC.Text = "Você está levemente acima do peso";
        }
        else if (IMC <= 34.9)
        {
            LabelIMC.Text = "Você está com obesidade grau 1";
        }
        else if (IMC <= 39.9)
        {
            LabelIMC.Text = "Você está com obesidade grau 2";
        }
        else
        {
            LabelIMC.Text = "Você está com obesidade mórbida!";
        }
    }

    protected void ButtonColesterol_Click(object sender, EventArgs e)
    {
        int C = Convert.ToInt32(TextBoxColesterol.Text);

        if (C <= 200)
        {
            LabelColesterol.Text = "Seu Colesterol Total está dentro do desejável";
        }
        else if (C <= 239)
        {
            LabelColesterol.Text = "Seu Colesterol Total está no limite máximo do aceitável";
        }
        else
        {
            LabelColesterol.Text = "Seu Colesterol Total está Elevado";
        }
    }

    protected void ButtonGlicemia_Click(object sender, EventArgs e)
    {
        int G = Convert.ToInt32(TextBoxGlicemia.Text);

        if (G <= 100)
        {
            LabelGlicemia.Text = "Seu índice glicêmico está Normal";
        }
        else if (G <= 139)
        {
            LabelGlicemia.Text = "Seu índice glicêmico está Elevado";
        }
        else
        {
            LabelGlicemia.Text = "Seu índice glicêmico está muito Elevado";
        }
    }
}