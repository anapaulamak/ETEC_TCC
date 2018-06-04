using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class img_Vacina : System.Web.UI.Page
{

    Conexao c = new Conexao();
    protected void Page_Load(object sender, EventArgs e)
    {
        ButtonAdicionarImagem.Visible = false;
        inserirImagem.Visible = false;
        ButtonNovaVacina.Visible = false;
        ButtonEditar.Visible = false;

        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }

        if (!IsPostBack)
        {
            //    DropDownListTipo.AppendDataBoundItems = true;
            //    DropDownListTipo.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            //    DropDownListTipo.SelectedIndex = 0;
        }

        if (Request.QueryString["id_vacina"] != null)
        {
            ButtonAdicionarImagem.Visible = true;
            inserirImagem.Visible = true;
            ButtonNovaVacina.Visible = true;
            ButtonEditar.Visible = true;
            ButtonSalvar.Visible = false;

            PopulaInfos1();
            PopulaInfos2();
        }
    }

    protected void ButtonMinhasVacinas_Click(object sender, EventArgs e)
    {
        Response.Redirect("VacinaPesquisa.aspx");
    }

    protected void ButtonSalvar_Click(object sender, EventArgs e)
    {
        if (Validar() == true)
        {
            int id_tipoVacina = Convert.ToInt32(DropDownListTipo.SelectedValue);
            DateTime dataVacina = Convert.ToDateTime(TextBoxData.Text);

            Conexao c = new Conexao();
            c.AbrirConexao();

            String sql = "insert into tb_vacina (id_tipoVacina, data, id_usuario) values (@tipoVacina, @data, @id_usuario)";
            c.command.CommandText = sql;

            c.command.Parameters.Add("@tipoVacina", SqlDbType.Int).Value = id_tipoVacina;
            c.command.Parameters.Add("@data", SqlDbType.DateTime).Value = dataVacina;
            c.command.Parameters.Add("@id_usuario", SqlDbType.Int).Value = Session["IdUsuario"];

            c.command.ExecuteNonQuery();
            c.FecharConexao();
            Response.Write("<script language = 'javascript'> alert ('Informação inserida com sucesso!');</script>");

            UltimoIdVacina();
            ButtonAdicionarImagem.Visible = true;
        }
    }

    protected Boolean Validar()
    {
        if (DropDownListTipo.Text == "")
        {
            Response.Write("<script language = 'javascript'> alert ('Preencha corretamente o tipo de vacina!');</script>");
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

    protected void ButtonAdicionarImagem_Click(object sender, EventArgs e)
    {
        ButtonAdicionarImagem.Visible = true;
        inserirImagem.Visible = true;
        ButtonNovaVacina.Visible = true;
    }

    //Pegar o ultimo id_vacina gravado
    public void UltimoIdVacina()
    {
        c.AbrirConexao();
        SqlCommand command = new SqlCommand();
        command.Connection = c.conexao;

        IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
        int usuario = Convert.ToInt32(i.ID());

        String sql = "Select MAX(id_vacina) as ultimoId from tb_vacina where id_usuario=@usuario";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@usuario", SqlDbType.Int).Value = usuario;

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        String ultimoId = dt.Tables[0].Rows[0]["ultimoId"].ToString();
        lblIdVacina.Text = ultimoId.ToString();
    }

    /*Inserção da imagem da vacina na tabela imgVacina*/
    public string InserirDadosImgVacina(DadosEImagem imagemVacina)
    {

        ButtonAdicionarImagem.Visible = true;
        inserirImagem.Visible = true;
        ButtonNovaVacina.Visible = true;

        Conexao c = new Conexao();
        try
        {
            c.AbrirConexao();
            SqlCommand comando = new SqlCommand();
            comando.Connection = c.conexao;
            comando.CommandText = "INSERT INTO tb_imgVacina (imagemVacina, nomeImgVacina, id_vacina) VALUES (@imagemVacina, @nomeImgVacina, @id_vacina)" + "SELECT SCOPE_IDENTITY()";
            // O SELECT SCOPE_IDENTITY() retorna o valor do escopo de identidade, nesse caso, o ID 

            SqlParameter parametro1 = new SqlParameter();
            parametro1.ParameterName = "@nomeImgVacina";
            parametro1.SqlDbType = SqlDbType.VarChar;
            parametro1.Value = imagemVacina.Nome;
            comando.Parameters.Add(parametro1);

            comando.Parameters.Add("@imagemVacina", SqlDbType.VarBinary).Value = imagemVacina.Caminho;
            comando.Parameters.Add("@id_vacina", SqlDbType.Int).Value = lblIdVacina.Text;

            var idI = comando.ExecuteScalar();
            lblIdImgVacina.Text = (idI + "");
            // O ExecuteScalar() é um método que retorna o valor da primeira coluna e da primeira linha (ou seja, o ID)
            string url = ("IMGHandler.ashx?id=" + idI + "&indiceSql=1").ToString();
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



    /*Evento no botão para salvar a imagem e mostrá-la na tela*/
    protected void btnImagemVacina_Click(object sender, EventArgs e)
    {
        ButtonAdicionarImagem.Visible = true;
        inserirImagem.Visible = true;
        ButtonNovaVacina.Visible = true;

        byte[] image;

        if (ImagemVacina.HasFile)
        {
            string savePath = @"C:\Users\Ana Paula\Documents\ImagemTesteVacina";
            string file_name = ImagemVacina.FileName;
            savePath = savePath + @"\" + file_name;
            ImagemVacina.SaveAs(savePath);
            image = File.ReadAllBytes(savePath);

            DadosEImagem usuario = new DadosEImagem();
            usuario.Nome = NomeImagemVacina.Text;
            usuario.Caminho = image;

            img1.ImageUrl = InserirDadosImgVacina(usuario);

            Response.Write("<script language = 'javascript'> alert ('Imagem adiciona com sucesso!');</script>");
        }
    }

    protected void ButtonNovaVacina_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vacina.aspx");
    }

    protected void PopulaInfos1()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "SELECT * from tb_vacina where id_vacina=@id_vacina";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@id_vacina", SqlDbType.Int).Value = Request.QueryString["id_vacina"];

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        String id_tipoVacina = dt.Tables[0].Rows[0]["id_tipoVacina"].ToString();
        DropDownListTipo.Text = id_tipoVacina;

        String data = dt.Tables[0].Rows[0]["data"].ToString();
        TextBoxData.Text = data;

        c.FecharConexao();
    }

    protected void PopulaInfos2()
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "Select * from tb_imgVacina where id_vacina=@id_vacina";
        c.command.CommandText = sql;
        c.command.Parameters.Add("@id_vacina", SqlDbType.Int).Value = Request.QueryString["id_vacina"];

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        String imagemVacina = dt.Tables[0].Rows[0]["imagemVacina"].ToString();
        img1.AlternateText = imagemVacina;

        String nomeImgVacina = dt.Tables[0].Rows[0]["nomeImgVacina"].ToString();
        NomeImagemVacina.Text = nomeImgVacina;
        c.FecharConexao();
    }

    protected void UpdateInfos1(int id_tipoVacina, DateTime data)
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        SqlCommand comando = new SqlCommand();
        comando.Connection = c.conexao;
        comando.CommandText = "update tb_vacina set id_tipoVacina=@id_tipoVacina, data=@data where id_vacina=@id_vacina";

        SqlParameter parametro = new SqlParameter();
        parametro.ParameterName = "@id_tipoVacina";
        parametro.SqlDbType = SqlDbType.Int;
        parametro.Value = id_tipoVacina;
        comando.Parameters.Add(parametro);

        SqlParameter parametro1 = new SqlParameter();
        parametro1.ParameterName = "@data";
        parametro1.SqlDbType = SqlDbType.DateTime;
        parametro1.Value = data;
        comando.Parameters.Add(parametro1);

        SqlParameter parametro2 = new SqlParameter();
        parametro2.ParameterName = "@id_vacina";
        parametro2.SqlDbType = SqlDbType.Int;
        parametro2.Value = Request.QueryString["id_vacina"];
        comando.Parameters.Add(parametro2);

        comando.ExecuteNonQuery();
    }

    protected void UpdateInfos2(string imagemVacina, string nomeImgVacina)
    {
        Conexao c = new Conexao();
        c.AbrirConexao();

        SqlCommand comando = new SqlCommand();
        comando.Connection = c.conexao;
        comando.CommandText = "update tb_imgVacina set imagemVacina=@id_imagemVacina, nomeImgVacina=@nomeImgVacina where id_vacina=@id_vacina";

        SqlParameter parametro = new SqlParameter();
        parametro.ParameterName = "@imagemVacina";
        parametro.SqlDbType = SqlDbType.VarChar;
        parametro.Value = imagemVacina;
        comando.Parameters.Add(parametro);

        SqlParameter parametro1 = new SqlParameter();
        parametro1.ParameterName = "@nomeImgVacina";
        parametro1.SqlDbType = SqlDbType.VarChar;
        parametro1.Value = nomeImgVacina;
        comando.Parameters.Add(parametro1);

        SqlParameter parametro2 = new SqlParameter();
        parametro2.ParameterName = "@id_vacina";
        parametro2.SqlDbType = SqlDbType.Int;
        parametro2.Value = Request.QueryString["id_vacina"];
        comando.Parameters.Add(parametro2);

        comando.ExecuteNonQuery();
    }

    protected void ButtonEditar_Click(object sender, EventArgs e)
    {
        UpdateInfos1(Convert.ToInt32(DropDownListTipo.Text), Convert.ToDateTime(TextBoxData.Text));
        UpdateInfos2(NomeImagemVacina.Text, img1.AlternateText);

    }
}