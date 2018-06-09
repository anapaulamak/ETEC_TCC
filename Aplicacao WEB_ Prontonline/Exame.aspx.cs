using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Exame : System.Web.UI.Page
{
    Conexao c = new Conexao();
    protected void Page_Load(object sender, EventArgs e)
    {
        ButtonAdicionarImagem.Visible = false;
        inserirImagem.Visible = false;
        ButtonNovoExame.Visible = false;
        ButtonEditar.Visible = false;

        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }

        if (!IsPostBack)
        {
            //DropDownListTipo.AppendDataBoundItems = true;
            //DropDownListTipo.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            //DropDownListTipo.SelectedIndex = 0;

            //DropDownListConsulta.AppendDataBoundItems = true;
            //DropDownListConsulta.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            //DropDownListConsulta.SelectedIndex = 0;
        }

        if (Request.QueryString["id_exame"] != null)
        {
            ButtonAdicionarImagem.Visible = true;
            inserirImagem.Visible = true;
            ButtonNovoExame.Visible = true;
            ButtonEditar.Visible = true;
            ButtonAdicionar.Visible = false;

            PopulaInfos1();
            PopulaInfos2();
        }
    }

    protected void ButtonMeusExames_Click(object sender, EventArgs e)
    {
        Response.Redirect("ExamePesquisa.aspx");
    }

    //Função para adicionar um novo exame médico
    protected void ButtonAdicionar_Click(object sender, EventArgs e)
    {
        if (Validar() == true)
        {
            int id_tipoExame = Convert.ToInt32(DropDownListTipo.SelectedValue);
            String nomeExame = Convert.ToString(TextBoxNome.Text);
            DateTime dataExame = Convert.ToDateTime(TextBoxData.Text);
            int id_consulta = Convert.ToInt32(DropDownListConsulta.SelectedValue);

            Conexao c = new Conexao();
            c.AbrirConexao();

            String sql = "insert into tb_exame (id_tipoExame, nome, data, id_consulta) values (@tipoExame, @nome, @data, @id_consulta)";
            c.command.CommandText = sql;

            c.command.Parameters.Add("@id_consulta", SqlDbType.Int).Value = id_consulta;
            c.command.Parameters.Add("@tipoExame", SqlDbType.Int).Value = id_tipoExame;
            c.command.Parameters.Add("@nome", SqlDbType.VarChar).Value = nomeExame;
            c.command.Parameters.Add("@data", SqlDbType.VarChar).Value = dataExame;

            c.command.ExecuteNonQuery();
            c.FecharConexao();
            Response.Write("<script language = 'javascript'> alert ('Informação adicionada com sucesso!');</script>");

            UltimoIdExame();
            ButtonAdicionarImagem.Visible = true;
        }
    }

    //Validação das informações preenchidas
    protected Boolean Validar()
    {
        if (DropDownListTipo.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Escolha um tipo de exame!');</script>");
            return false;
        }
        else if (DropDownListConsulta.Text == "")
        {            
            Response.Write("<script language = 'javascript'> alert ('Escolha uma consulta!');</script>");
            return false;  
            //esse item não deve ser obrigatório, mas deu erro quando não coloquei validação. VERIFICAR
        }
        else if (TextBoxNome.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha o nome do exame!');</script>");
            return false;
        }
        else if (TextBoxData.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha corretamente a data!');</script>");
            return false;
        }
        else
        {
            return true;
        }
    }

    // Botão para habilitar a inserção de imagens
    protected void ButtonAdicionarImagem_Click(object sender, EventArgs e)
    {
        ButtonAdicionarImagem.Visible = true;
        inserirImagem.Visible = true;
        ButtonNovoExame.Visible = true;
    }

    //Pegar o ultimo id_exame gravado
    public void UltimoIdExame()
    {
        c.AbrirConexao();
        SqlCommand command = new SqlCommand();
        command.Connection = c.conexao;

        String sql = "Select MAX(id_exame) as ultimoId from tb_exame where id_consulta in (select id_consulta from tb_consulta where id_usuario = @usuario)";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@usuario", SqlDbType.Int).Value = Session["IdUsuario"];

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        String ultimoId = dt.Tables[0].Rows[0]["ultimoId"].ToString();
        lblIdExame.Text = ultimoId.ToString();
    }

    //Inserção da imagem do exame na tabela imgExame
    public string InserirDados(DadosEImagem imagemExame)
    {
        ButtonAdicionarImagem.Visible = true;
        inserirImagem.Visible = true;
        ButtonNovoExame.Visible = true;

        Conexao c = new Conexao();
        try
        {
            c.AbrirConexao();
            SqlCommand comando = new SqlCommand();
            comando.Connection = c.conexao;
            comando.CommandText = "INSERT INTO tb_imgExame(imagemExame, nomeImgExame, id_exame) VALUES (@imagemExame, @nomeImgExame, @id_exame)" + "SELECT SCOPE_IDENTITY()";
            // O SELECT SCOPE_IDENTITY() retorna o valor do escopo de identidade, nesse caso, o ID 

            SqlParameter parametro1 = new SqlParameter();
            parametro1.ParameterName = "@nomeImgExame";
            parametro1.SqlDbType = SqlDbType.VarChar;
            parametro1.Value = imagemExame.Nome;
            comando.Parameters.Add(parametro1);

            comando.Parameters.Add("@imagemExame", SqlDbType.VarBinary).Value = imagemExame.Caminho;
            comando.Parameters.Add("@id_exame", SqlDbType.Int).Value = lblIdExame.Text;

            var idI = comando.ExecuteScalar();
            lblIdImgExame.Text = (idI + "");
            // O ExecuteScalar() é um método que retorna o valor da primeira coluna e da primeira linha (ou seja, o ID)
            string url = ("IMGHandler.ashx?id=" + idI + "&indiceSql=3").ToString();
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

    //Evento no botão para salvar a imagem
    protected void btnImagemExame_Click(object sender, EventArgs e)
    {
        ButtonAdicionarImagem.Visible = true;
        inserirImagem.Visible = true;
        ButtonNovoExame.Visible = true;

        byte[] image;

        if (ImagemExame.HasFile)
        {
            string savePath = @"C:\Users\Ana Paula\Documents\ImagemTesteExame";
            string file_name = ImagemExame.FileName;
            savePath = savePath + @"\" + file_name;
            ImagemExame.SaveAs(savePath);
            image = File.ReadAllBytes(savePath);

            DadosEImagem usuario = new DadosEImagem();
            usuario.Nome = NomeImagemExame.Text;
            usuario.Caminho = image;

            img1.ImageUrl = InserirDados(usuario);

            Response.Write("<script language = 'javascript'> alert ('Imagem adiciona com sucesso!');</script>");
        }
    }

    protected void ButtonNovoExame_Click(object sender, EventArgs e)
    {
        Response.Redirect("Exame.aspx");
    }

    //Função para popular os campos para edição
    protected void PopulaInfos1()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "SELECT * from tb_exame where id_exame=@id_exame";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@id_exame", SqlDbType.Int).Value = Request.QueryString["id_exame"];

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        String id_tipoExame = dt.Tables[0].Rows[0]["id_tipoExame"].ToString();
        DropDownListTipo.Text = id_tipoExame;

        String nome = dt.Tables[0].Rows[0]["nome"].ToString();
        TextBoxNome.Text = nome;

        String data = dt.Tables[0].Rows[0]["data"].ToString();
        TextBoxData.Text = data;

        c.FecharConexao();
    }

    //Função para popular os campos para edição
    protected void PopulaInfos2()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "Select * from tb_imgExame where id_exame=@id_exame";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@id_exame", SqlDbType.Int).Value = Request.QueryString["id_exame"];

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        byte[] bytes = (byte[])dt.Tables[0].DefaultView[0].Row["imagemExame"];
        String base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
        img1.ImageUrl = "data:image/png;base64," + base64String;

        String nomeImgExame = dt.Tables[0].Rows[0]["nomeImgExame"].ToString();
        NomeImagemExame.Text = nomeImgExame;
        c.FecharConexao();

    }

    protected void UpdateInfos1(int id_tipoExame, int id_consulta, DateTime data, string nome)
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        SqlCommand comando = new SqlCommand();
        comando.Connection = c.conexao;
        comando.CommandText = "update tb_exame set id_tipoExame=@id_tipoExame, id_consulta=@id_consulta, data=@data, nome=@nome where id_exame=@id_exame";

        SqlParameter parametro = new SqlParameter();
        parametro.ParameterName = "@id_tipoExame";
        parametro.SqlDbType = SqlDbType.Int;
        parametro.Value = id_tipoExame;
        comando.Parameters.Add(parametro);

        SqlParameter parametro1 = new SqlParameter();
        parametro1.ParameterName = "@id_consulta";
        parametro1.SqlDbType = SqlDbType.Int;
        parametro1.Value = id_consulta;
        comando.Parameters.Add(parametro1);

        SqlParameter parametro2 = new SqlParameter();
        parametro2.ParameterName = "@data";
        parametro2.SqlDbType = SqlDbType.DateTime;
        parametro2.Value = data;
        comando.Parameters.Add(parametro2);

        SqlParameter parametro4 = new SqlParameter();
        parametro4.ParameterName = "@nome";
        parametro4.SqlDbType = SqlDbType.VarChar;
        parametro4.Value = nome;
        comando.Parameters.Add(parametro4);

        SqlParameter parametro5 = new SqlParameter();
        parametro5.ParameterName = "@id_exame";
        parametro5.SqlDbType = SqlDbType.Int;
        parametro5.Value = Request.QueryString["id_exame"];
        comando.Parameters.Add(parametro5);

        comando.ExecuteNonQuery();
        }

    protected void UpdateInfos2(string imagemExame, string nomeImgExame)
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        SqlCommand comando = new SqlCommand();
        comando.Connection = c.conexao;
        comando.CommandText = "update tb_imgExame set imagemExame=@id_imagemExame, nomeImgExame=@nomeImgExame where id_exame=@id_exame";

        SqlParameter parametro = new SqlParameter();
        parametro.ParameterName = "@imagemExame";
        parametro.SqlDbType = SqlDbType.VarChar;
        parametro.Value = imagemExame;
        comando.Parameters.Add(parametro);

        SqlParameter parametro1 = new SqlParameter();
        parametro1.ParameterName = "@nomeImgExame";
        parametro1.SqlDbType = SqlDbType.VarChar;
        parametro1.Value = nomeImgExame;
        comando.Parameters.Add(parametro1);

        SqlParameter parametro5 = new SqlParameter();
        parametro5.ParameterName = "@id_exame";
        parametro5.SqlDbType = SqlDbType.Int;
        parametro5.Value = Request.QueryString["id_exame"];
        comando.Parameters.Add(parametro5);

        comando.ExecuteNonQuery();
    }

    protected void ButtonEditar_Click(object sender, EventArgs e)
    {
        UpdateInfos1(Convert.ToInt32(DropDownListTipo.Text), Convert.ToInt32(DropDownListConsulta.Text), Convert.ToDateTime(TextBoxData.Text), TextBoxNome.Text);
        UpdateInfos2(NomeImagemExame.Text, img1.AlternateText);
    }
}