using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Receita : System.Web.UI.Page
{
    Conexao c = new Conexao();
    protected void Page_Load(object sender, EventArgs e)
    {
        ButtonAdicionarImagem.Visible = false;
        inserirImagem.Visible = false;
        ButtonNovaReceita.Visible = false;
        ButtonEditar.Visible = false;

        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }

        if (!IsPostBack)
        {
            //DropDownListConsulta.AppendDataBoundItems = true;
            //DropDownListConsulta.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            //DropDownListConsulta.SelectedIndex = 0;
        }

        if (Request.QueryString["id_receita"] != null)
        {
            ButtonAdicionarImagem.Visible = true;
            inserirImagem.Visible = true;
            ButtonNovaReceita.Visible = true;
            ButtonEditar.Visible = true;
            ButtonSalvar.Visible = false;

            PopulaInfos1();
            PopulaInfos2();
        }

    }

    protected void ButtonMinhasReceitas_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReceitaPesquisa.aspx");
    }

    //função de adicionar uma nova receita
    protected void ButtonSalvar_Click(object sender, EventArgs e)
    {
        if (Validar() == true)
        {
            String nomeReceita =TextBoxNomeReceita.Text;
            DateTime dataReceita = Convert.ToDateTime(TextBoxData.Text);
            int id_consulta = Convert.ToInt32(DropDownListConsulta.SelectedValue);

            Conexao c = new Conexao();
            c.AbrirConexao();

            String sql = "insert into tb_receita (nome, data, id_consulta) values (@nome, @data, @id_consulta)";
            c.command.CommandText = sql;

            c.command.Parameters.Add("@id_consulta", SqlDbType.Int).Value = id_consulta;
            c.command.Parameters.Add("@nome", SqlDbType.VarChar).Value = nomeReceita;
            c.command.Parameters.Add("@data", SqlDbType.DateTime).Value = dataReceita;

            c.command.ExecuteNonQuery();
            c.FecharConexao();
            Response.Write("<script language = 'javascript'> alert ('Informação adiciona com sucesso!');</script>");

            ButtonAdicionarImagem.Visible = true;
            UltimoIdReceita();
        }
    }

    //Função para validar os dados inseridos para uma nova receita
    protected Boolean Validar()
    {
        if (TextBoxNomeReceita.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Selecione o Médico!');</script>");
            return false;
        }
        else if (DropDownListConsulta.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Escolha uma consulta!');</script>");
            return false;
            //esse item não deve ser obrigatório, mas deu erro quando não coloquei validação. VERIFICAR
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
        ButtonNovaReceita.Visible = true;
    }

    //Pegar o ultimo id_receita gravado
    public void UltimoIdReceita()
    {
        c.AbrirConexao();
        SqlCommand command = new SqlCommand();
        command.Connection = c.conexao;

        String sql = "Select MAX(id_receita) as ultimoId from tb_receita where id_consulta in (select id_consulta from tb_consulta where id_usuario = @usuario)";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@usuario", SqlDbType.Int).Value = Session["IdUsuario"];

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        String ultimoId = dt.Tables[0].Rows[0]["ultimoId"].ToString();
        lblIdReceita.Text = ultimoId.ToString();
    }

    /*Inserção da imagem da receita na tabela imgReceita*/
    public string InserirDadosImgReceita(DadosEImagem imagemReceita)
    {

        ButtonAdicionarImagem.Visible = true;
        inserirImagem.Visible = true;
        ButtonNovaReceita.Visible = true;

        Conexao c = new Conexao();
        try
        {
            c.AbrirConexao();
            SqlCommand comando = new SqlCommand();
            comando.Connection = c.conexao;
            comando.CommandText = "INSERT INTO tb_imgReceita (imagemReceita, nomeImgReceita, id_receita) VALUES (@imagemReceita, @nomeImgReceita, @id_receita)" + "SELECT SCOPE_IDENTITY()";
            // O SELECT SCOPE_IDENTITY() retorna o valor do escopo de identidade, nesse caso, o ID 

            SqlParameter parametro1 = new SqlParameter();
            parametro1.ParameterName = "@nomeImgReceita";
            parametro1.SqlDbType = SqlDbType.VarChar;
            parametro1.Value = imagemReceita.Nome;
            comando.Parameters.Add(parametro1);

            comando.Parameters.Add("@imagemReceita", SqlDbType.VarBinary).Value = imagemReceita.Caminho;
            comando.Parameters.Add("@id_receita", SqlDbType.Int).Value = lblIdReceita.Text;

            var idI = comando.ExecuteScalar();
            lblIdImgReceita.Text = (idI + "");
            // O ExecuteScalar() é um método que retorna o valor da primeira coluna e da primeira linha (ou seja, o ID)
            string url = ("IMGHandler.ashx?id=" + idI + "&indiceSql=2").ToString();
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
    protected void btnImagemReceita_Click(object sender, EventArgs e)
    {
        ButtonAdicionarImagem.Visible = true;
        inserirImagem.Visible = true;
        ButtonNovaReceita.Visible = true;

        byte[] image;

        if (ImagemReceita.HasFile)
        {
            ButtonAdicionarImagem.Visible = true;
            inserirImagem.Visible = true;

            string savePath = @"C:\Users\Ana Paula\Documents\ImagemTesteReceita";
            string file_name = ImagemReceita.FileName;
            savePath = savePath + @"\" + file_name;
            ImagemReceita.SaveAs(savePath);
            image = File.ReadAllBytes(savePath);

            DadosEImagem usuario = new DadosEImagem();
            usuario.Nome = NomeImagemReceita.Text;
            usuario.Caminho = image;

            img1.ImageUrl = InserirDadosImgReceita(usuario);

            Response.Write("<script language = 'javascript'> alert ('Imagem adiciona com sucesso!');</script>");
        }
    }

    protected void ButtonNovaReceita_Click(object sender, EventArgs e)
    {
        Response.Redirect("Receita.aspx");
    }

    //Função para popular os campos para edição
    public void PopulaInfos1()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "SELECT * from tb_receita where id_receita=@id_receita";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@id_receita", SqlDbType.Int).Value = Request.QueryString["id_receita"];

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        String id_consulta = dt.Tables[0].Rows[0]["id_consulta"].ToString();
        DropDownListConsulta.Text = id_consulta;

        String nome = dt.Tables[0].Rows[0]["nome"].ToString();
        TextBoxNomeReceita.Text = nome;

        String data = dt.Tables[0].Rows[0]["data"].ToString();
        TextBoxData.Text = data;

        c.FecharConexao();        
    }

    //Função para popular os campos para edição
    protected void PopulaInfos2()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "Select * from tb_imgReceita where id_receita=@id_receita";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@id_receita", SqlDbType.Int).Value = Request.QueryString["id_receita"];

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);


        byte[] bytes = (byte[])dt.Tables[0].DefaultView[0].Row["imagemReceita"];
        String base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
        img1.ImageUrl = "data:image/png;base64," + base64String;

        String nomeImgReceita = dt.Tables[0].Rows[0]["nomeImgReceita"].ToString();
        NomeImagemReceita.Text = nomeImgReceita;

        c.FecharConexao();
    }

    protected void UpdateInfos1(int id_consulta, DateTime data, string nome)
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        SqlCommand comando = new SqlCommand();
        comando.Connection = c.conexao;
        comando.CommandText = "update tb_receita set id_consulta=@id_consulta, data=@data, nome=@nome where id_receita=@id_receita";

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
        parametro5.ParameterName = "@id_receita";
        parametro5.SqlDbType = SqlDbType.Int;
        parametro5.Value = Request.QueryString["id_receita"];
        comando.Parameters.Add(parametro5);

        comando.ExecuteNonQuery();
    }

    protected void UpdateInfos2(string imagemReceita, string nomeImgReceita)
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        SqlCommand comando = new SqlCommand();
        comando.Connection = c.conexao;
        comando.CommandText = "update tb_imgReceita set imagemReceita=@id_imagemReceita, nomeImgReceita=@nomeImgReceita where id_receita=@id_receita";

        SqlParameter parametro = new SqlParameter();
        parametro.ParameterName = "@imagemReceita";
        parametro.SqlDbType = SqlDbType.VarChar;
        parametro.Value = imagemReceita;
        comando.Parameters.Add(parametro);

        SqlParameter parametro1 = new SqlParameter();
        parametro1.ParameterName = "@nomeImgReceita";
        parametro1.SqlDbType = SqlDbType.VarChar;
        parametro1.Value = nomeImgReceita;
        comando.Parameters.Add(parametro1);

        SqlParameter parametro5 = new SqlParameter();
        parametro5.ParameterName = "@id_receita";
        parametro5.SqlDbType = SqlDbType.Int;
        parametro5.Value = Request.QueryString["id_receita"];
        comando.Parameters.Add(parametro5);

        comando.ExecuteNonQuery();
    }

    protected void ButtonEditar_Click(object sender, EventArgs e)
    {
        UpdateInfos1( Convert.ToInt32(DropDownListConsulta.Text), Convert.ToDateTime(TextBoxData.Text), TextBoxNomeReceita.Text);
        UpdateInfos2(NomeImagemReceita.Text, img1.AlternateText);
    }
}