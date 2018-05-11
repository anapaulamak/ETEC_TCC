using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Remedios : System.Web.UI.Page
{
    Conexao c = new Conexao();

    protected void Page_Load(object sender, EventArgs e)
    {
        ButtonAdicionarImagem.Visible = false;

        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }
    }

    protected void ButtonMeusRemedios_Click(object sender, EventArgs e)
    {
        Response.Redirect("RemediosPesquisa.aspx");
    }

    protected void ButtonAdicionar_Click(object sender, EventArgs e)
    {
        if (Validar() == true)
        {
            String remedio = Convert.ToString(TextBoxRemedio.Text);
            String dosagem = Convert.ToString(TextBoxDosagem.Text);
            DateTime dataInicio = Convert.ToDateTime(TextBoxDataInicio.Text);
            DateTime dataFim = Convert.ToDateTime(TextBoxDataFim.Text);

            Conexao c = new Conexao();
            c.AbrirConexao();

            String sql = "insert into tb_remedios (id_usuario, nome, dosagem, dataInicio, dataFim) values (@id_usuario, @nome, @dosagem, @dataInicio, @dataFim)";
            c.command.CommandText = sql;

            c.command.Parameters.Add("@id_usuario", SqlDbType.Int).Value = Session["IdUsuario"];
            c.command.Parameters.Add("@nome", SqlDbType.VarChar).Value = remedio;
            c.command.Parameters.Add("@dosagem", SqlDbType.VarChar).Value = dosagem;
            c.command.Parameters.Add("@dataInicio", SqlDbType.DateTime).Value = dataInicio;
            c.command.Parameters.Add("@dataFim", SqlDbType.DateTime).Value = dataFim;

            c.command.ExecuteNonQuery();
            c.FecharConexao();
            Response.Write("<script language = 'javascript'> alert ('Informação adiciona com sucesso!');</script>");
            ButtonAdicionarImagem.Visible = true;

            UltimoIdRemedio();
        }
    }

    protected Boolean Validar()
    {
        if (TextBoxRemedio.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Escreva o nome do remédio!');</script>");
            return false;
        }
        else if (TextBoxDosagem.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Escreva qual a dosagem tomada!');</script>");
            return false;
        }
        else if (TextBoxDataInicio.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha corretamente a data de início!');</script>");
            return false;
        }
        else if (TextBoxDataFim.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha corretamente a data de término!');</script>");
            return false;
        }
        else
        {
            return true;
        }
    }

    //Pegar o ultimo id_remedio gravado
    public void UltimoIdRemedio()
    {
        c.AbrirConexao();
        SqlCommand command = new SqlCommand();
        command.Connection = c.conexao;

        IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
        int usuario = Convert.ToInt32(i.ID());

        String sql = "Select MAX(id_remedio) as ultimoId from tb_remedios where id_usuario=@usuario";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@usuario", SqlDbType.Int).Value = usuario;

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        String ultimoId = dt.Tables[0].Rows[0]["ultimoId"].ToString();
        lblIdRemedio.Text = ultimoId.ToString();
    }


    /*Inserção da imagem do remédio na tabela imgRemedio*/
    public string InserirDadosImgRemedio(DadosEImagem imagemRemedio)
    {
        Conexao c = new Conexao();
        try
        {
            c.AbrirConexao();
            SqlCommand comando = new SqlCommand();
            comando.Connection = c.conexao;
            comando.CommandText = "INSERT INTO tb_imgRemedio (imagemRemedio, nomeImgRemedio, id_remedio) VALUES (@imagemRemedio, @nomeImgRemedio, @id_remedio)" + "SELECT SCOPE_IDENTITY()";
            // O SELECT SCOPE_IDENTITY() retorna o valor do escopo de identidade, nesse caso, o ID 

            SqlParameter parametro1 = new SqlParameter();
            parametro1.ParameterName = "@nomeImgRemedio";
            parametro1.SqlDbType = SqlDbType.VarChar;
            parametro1.Value = imagemRemedio.Nome;
            comando.Parameters.Add(parametro1);

            comando.Parameters.Add("@imagemRemedio", SqlDbType.VarBinary).Value = imagemRemedio.Caminho;
            comando.Parameters.Add("@id_remedio", SqlDbType.Int).Value = lblIdRemedio.Text;

            var idI = comando.ExecuteScalar();
            lblIdImgRemedio.Text = (idI + "");
            // O ExecuteScalar() é um método que retorna o valor da primeira coluna e da primeira linha (ou seja, o ID)
            string url = ("IMGHandler.ashx?id=" + idI).ToString();
            return url;
        }
        catch (Exception e)
        {
            Console.Write("Erro ao inserir informações no banco de dados! Erro: " + e);
            return e.ToString();
        }
        finally
        {
            c.FecharConexao();
        }
    }


    /*Evento no botão para salvar a imagem*/
    protected void btnImagemRemedio_Click(object sender, EventArgs e)
    {
        byte[] image;

        if (ImagemRemedio.HasFile)
        {
            string savePath = @"C:\Users\Ana Paula\Documents\ImagemTeste";
            string file_name = ImagemRemedio.FileName;
            savePath = savePath + @"\" + file_name;
            ImagemRemedio.SaveAs(savePath);
            image = File.ReadAllBytes(savePath);

            DadosEImagem usuario = new DadosEImagem();
            usuario.Nome = NomeImagemRemedio.Text;
            usuario.Caminho = image;

            img1.ImageUrl = InserirDadosImgRemedio(usuario);

            TextBoxRemedio.Text = "";
            TextBoxDosagem.Text = "";
            TextBoxDataInicio.Text = "";
            TextBoxDataFim.Text = "";

            Response.Write("<script language = 'javascript'> alert ('Imagem adiciona com sucesso!');</script>");
        }
    } 
}