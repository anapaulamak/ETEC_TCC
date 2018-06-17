using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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

        if (Request.QueryString["id_saude"] != null)
        {
            PopulaInfos();
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

            String mes = Convert.ToString(DropDownListMeses.Text);
            String ano = Convert.ToString(TextBoxAno.Text);

            double altura = Convert.ToDouble(TextBoxAltura.Text);
            double peso = Convert.ToDouble(TextBoxPeso.Text);

            double colesterol = Convert.ToDouble(TextBoxColesterol.Text);
            double glicemia = Convert.ToDouble(TextBoxGlicemia.Text);

            Conexao c = new Conexao();
            c.AbrirConexao();

            String sql = "insert into tb_statusSaude (id_usuario, altura, peso, colesterol, glicemia, mes, ano) values (@id_usuario, @altura, @peso, @colesterol, @glicemia, @mes, @ano)";
            c.command.CommandText = sql;

            c.command.Parameters.Add("@id_usuario", SqlDbType.Int).Value = id_usuario;
            c.command.Parameters.Add("@altura", SqlDbType.Decimal).Value = altura;
            c.command.Parameters.Add("@peso", SqlDbType.Decimal).Value = peso;
            c.command.Parameters.Add("@colesterol", SqlDbType.Decimal).Value = colesterol;
            c.command.Parameters.Add("@glicemia", SqlDbType.Decimal).Value = glicemia;
            c.command.Parameters.Add("@mes", SqlDbType.VarChar).Value = mes;
            c.command.Parameters.Add("@ano", SqlDbType.VarChar).Value = ano;

            c.command.ExecuteNonQuery();
            c.FecharConexao();
            Response.Write("<script language = 'javascript'> alert ('Informações salvas com sucesso!');</script>");
        }

    }

    protected Boolean Validar()
    {
        if (TextBoxAno.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha uma ano válido!');</script>");
            return false;
        }
            
        else if(TextBoxPeso.Text == "")
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

    protected void PopulaInfos()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "SELECT * from tb_statusSaude where id_saude=@id_saude";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@id_saude", SqlDbType.Int).Value = Request.QueryString["id_saude"];

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        String mes = dt.Tables[0].Rows[0]["mes"].ToString();
        DropDownListMeses.Text = mes;

        String ano= dt.Tables[0].Rows[0]["ano"].ToString();
        TextBoxAno.Text = ano;

        String peso = dt.Tables[0].Rows[0]["peso"].ToString();
        TextBoxPeso.Text = peso;

        String altura = dt.Tables[0].Rows[0]["altura"].ToString();
        TextBoxAltura.Text = altura;
          
        String glicemia = dt.Tables[0].Rows[0]["glicemia"].ToString();
        TextBoxGlicemia.Text = glicemia;

        String colesterol = dt.Tables[0].Rows[0]["colesterol"].ToString();
        TextBoxColesterol.Text = colesterol;

        c.FecharConexao();
    }

    //Função para edutar as informações 
    protected void UpdateInfos(string mes, string ano, double peso, double altura, double glicemia, double colesterol)
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        SqlCommand comando = new SqlCommand();
        comando.Connection = c.conexao;
        comando.CommandText = "update tb_statusSaude set mes=@mes, ano=@ano, peso=@peso, altura=@altura, glicemia=@glicemia, colesterol=@colesterol where id_saude=@id_saude";

        SqlParameter parametro = new SqlParameter();
        parametro.ParameterName = "@mes";
        parametro.SqlDbType = SqlDbType.VarChar;
        parametro.Value = mes;
        comando.Parameters.Add(parametro);

        SqlParameter parametro1 = new SqlParameter();
        parametro1.ParameterName = "@ano";
        parametro1.SqlDbType = SqlDbType.VarChar;
        parametro1.Value = ano;
        comando.Parameters.Add(parametro1);

        SqlParameter parametro2 = new SqlParameter();
        parametro2.ParameterName = "@peso";
        parametro2.SqlDbType = SqlDbType.Decimal;
        parametro2.Value = peso;
        comando.Parameters.Add(parametro2);

        SqlParameter parametro3 = new SqlParameter();
        parametro3.ParameterName = "@altura";
        parametro3.SqlDbType = SqlDbType.Decimal;
        parametro3.Value = altura;
        comando.Parameters.Add(parametro3);

        SqlParameter parametro4 = new SqlParameter();
        parametro4.ParameterName = "@glicemia";
        parametro4.SqlDbType = SqlDbType.Decimal;
        parametro4.Value = glicemia;
        comando.Parameters.Add(parametro4);

        SqlParameter parametro5 = new SqlParameter();
        parametro5.ParameterName = "@colesterol";
        parametro5.SqlDbType = SqlDbType.Decimal;
        parametro5.Value = colesterol;
        comando.Parameters.Add(parametro5);

        SqlParameter parametro6 = new SqlParameter();
        parametro6.ParameterName = "@id_saude";
        parametro6.SqlDbType = SqlDbType.Int;
        parametro6.Value = Request.QueryString["id_saude"];
        comando.Parameters.Add(parametro6);

        comando.ExecuteNonQuery();
    }
}