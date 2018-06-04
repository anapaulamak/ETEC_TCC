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
        inserirImagem.Visible = false;
        ButtonNovoRemedio.Visible = false;
        ButtonEditar.Visible = false;

        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }

        if (Request.QueryString["id_remedio"] != null)
        {
            ButtonAdicionarImagem.Visible = true;
            inserirImagem.Visible = true;
            ButtonNovoRemedio.Visible = true;
            ButtonEditar.Visible = false;

            PopulaInfos1();
            PopulaInfos2();
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

            UltimoIdRemedio();
            ButtonAdicionarImagem.Visible = true;
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

    protected void ButtonAdicionarImagem_Click(object sender, EventArgs e)
    {
        ButtonAdicionarImagem.Visible = true;
        inserirImagem.Visible = true;
        ButtonNovoRemedio.Visible = true;
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

        ButtonAdicionarImagem.Visible = true;
        inserirImagem.Visible = true;
        ButtonNovoRemedio.Visible = true;

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
            string url = ("IMGHandler.ashx?id=" + idI + "&indiceSql=0").ToString();
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
        ButtonAdicionarImagem.Visible = true;
        inserirImagem.Visible = true;
        ButtonNovoRemedio.Visible = true;

        byte[] image;

        if (ImagemRemedio.HasFile)
        {
            ButtonAdicionarImagem.Visible = true;
            inserirImagem.Visible = true;

            string savePath = @"C:\Users\Ana Paula\Documents\ImagemTesteRemedio";
            string file_name = ImagemRemedio.FileName;
            savePath = savePath + @"\" + file_name;
            ImagemRemedio.SaveAs(savePath);
            image = File.ReadAllBytes(savePath);

            DadosEImagem usuario = new DadosEImagem();
            usuario.Nome = NomeImagemRemedio.Text;
            usuario.Caminho = image;

            img1.ImageUrl = InserirDadosImgRemedio(usuario);

            Response.Write("<script language = 'javascript'> alert ('Imagem adiciona com sucesso!');</script>");
        }
    }

    protected void ButtonNovoRemedio_Click(object sender, EventArgs e)
    {
        Response.Redirect("Remedios.aspx");
    }

    //Função para popular os campos 
    protected void PopulaInfos1()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "SELECT * from tb_remedios where id_remedio=@id_remedio";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@id_remedio", SqlDbType.Int).Value = Request.QueryString["id_remedio"];

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        String nome = dt.Tables[0].Rows[0]["nome"].ToString();
        TextBoxRemedio.Text = nome;

        String dosagem = dt.Tables[0].Rows[0]["dosagem"].ToString();
        TextBoxDosagem.Text = dosagem;

        String dataInicio = dt.Tables[0].Rows[0]["dataInicio"].ToString();
        TextBoxDataInicio.Text = dataInicio;

        String dataFim = dt.Tables[0].Rows[0]["dataFim"].ToString();
        TextBoxDataFim.Text = dataFim;

        c.FecharConexao();
    }

    //Função para popular os campos 
    protected void PopulaInfos2()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "SELECT * from tb_imgRemedio where id_remedio=@id_remedio";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@id_remedio", SqlDbType.Int).Value = Request.QueryString["id_remedio"];

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        String imagemRemedio = dt.Tables[0].Rows[0]["imagemRemedio"].ToString();
        img1.AlternateText = imagemRemedio;

        String nomeImgRemedio = dt.Tables[0].Rows[0]["nomeImgRemedio"].ToString();
        NomeImagemRemedio.Text = nomeImgRemedio;

        c.FecharConexao();
    }
    //Função para edutar as informações 
    protected void UpdateInfos1(string nome, string dosagem, DateTime dataInicio, DateTime dataFim)
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        SqlCommand comando = new SqlCommand();
        comando.Connection = c.conexao;
        comando.CommandText = "update tb_remedios set nome=@nome, dosagem=@dosagem, dataInicio=@dataInicio, dataFim=@dataFim where id_remedio=@id_remedio";

        SqlParameter parametro = new SqlParameter();
        parametro.ParameterName = "@nome";
        parametro.SqlDbType = SqlDbType.Int;
        parametro.Value = nome;
        comando.Parameters.Add(parametro);

        SqlParameter parametro1 = new SqlParameter();
        parametro1.ParameterName = "@dosagem";
        parametro1.SqlDbType = SqlDbType.Int;
        parametro1.Value = dosagem;
        comando.Parameters.Add(parametro1);

        SqlParameter parametro2 = new SqlParameter();
        parametro2.ParameterName = "@dataInicio";
        parametro2.SqlDbType = SqlDbType.DateTime;
        parametro2.Value = dataInicio;
        comando.Parameters.Add(parametro2);

        SqlParameter parametro3 = new SqlParameter();
        parametro3.ParameterName = "@dataFim";
        parametro3.SqlDbType = SqlDbType.DateTime;
        parametro3.Value = dataFim;
        comando.Parameters.Add(parametro3);

        SqlParameter parametro4 = new SqlParameter();
        parametro4.ParameterName = "@id_remedio";
        parametro4.SqlDbType = SqlDbType.Int;
        parametro4.Value = Request.QueryString["id_remedio"];
        comando.Parameters.Add(parametro4);

        comando.ExecuteNonQuery();
    }

    //Função para edutar as informações 
    protected void UpdateInfos2(string imagemRemedio, string nomeImgRemedio)
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        SqlCommand comando = new SqlCommand();
        comando.Connection = c.conexao;
        comando.CommandText = "update tb_imgRemedio set imagemRemedio=@id_imagemRemedio, nomeImgRemedio=@nomeImgRemedio where id_remedio=@id_remedio";

        SqlParameter parametro = new SqlParameter();
        parametro.ParameterName = "@imagemRemedio";
        parametro.SqlDbType = SqlDbType.VarChar;
        parametro.Value = imagemRemedio;
        comando.Parameters.Add(parametro);

        SqlParameter parametro1 = new SqlParameter();
        parametro1.ParameterName = "@nomeImgRemedio";
        parametro1.SqlDbType = SqlDbType.VarChar;
        parametro1.Value = nomeImgRemedio;
        comando.Parameters.Add(parametro1);

        SqlParameter parametro2 = new SqlParameter();
        parametro2.ParameterName = "@id_remedio";
        parametro2.SqlDbType = SqlDbType.Int;
        parametro2.Value = Request.QueryString["id_remedio"];
        comando.Parameters.Add(parametro2);

        comando.ExecuteNonQuery();
    }

    protected void ButtonEditar_Click(object sender, EventArgs e)
    {
        UpdateInfos1(TextBoxRemedio.Text, TextBoxDosagem.Text, Convert.ToDateTime(TextBoxDataInicio.Text), Convert.ToDateTime(TextBoxDataFim.Text));
        UpdateInfos2(NomeImagemRemedio.Text, img1.AlternateText);

    }
}