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
        //ButtonAdicionarImagem.Enabled = false;
        //ButtonAdicionarImagem.CssClass = "ConfButton";

        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }

        if (!IsPostBack)
        {
            DropDownListTipo.AppendDataBoundItems = true;
            DropDownListTipo.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            DropDownListTipo.SelectedIndex = 0;
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
            IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
            int usuario = Convert.ToInt32(i.ID());

            int id_tipoVacina = Convert.ToInt32(DropDownListTipo.SelectedValue);
            DateTime dataVacina = Convert.ToDateTime(TextBoxData.Text);

            Conexao c = new Conexao();
            c.AbrirConexao();

            String sql = "insert into tb_vacina (id_tipoVacina, data, id_usuario) values (@tipoVacina, @data, @id_usuario)";
            c.command.CommandText = sql;

            c.command.Parameters.Add("@tipoVacina", SqlDbType.Int).Value = id_tipoVacina;
            c.command.Parameters.Add("@data", SqlDbType.DateTime).Value = dataVacina;
            c.command.Parameters.Add("@id_usuario", SqlDbType.Int).Value = usuario;

            c.command.ExecuteNonQuery();
            c.FecharConexao();
            Response.Write("<script language = 'javascript'> alert ('Informação inserida com sucesso!');</script>");
            //ButtonAdicionarImagem.Enabled = true;

            UltimoIdVacina();
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
    public string InserirDados(DadosEImagem imagemVacina)
    {
        Conexao c = new Conexao();
        try
        {
            c.AbrirConexao();
            SqlCommand comando = new SqlCommand();
            comando.Connection = c.conexao;
            comando.CommandText = "INSERT INTO tb_imgVacina (imagemVacina, nomeImgVacina) VALUES (@imagemVacina, @nomeImgVacina)" + "SELECT SCOPE_IDENTITY()";
            // O SELECT SCOPE_IDENTITY() retorna o valor do escopo de identidade, nesse caso, o ID 

            SqlParameter parametro1 = new SqlParameter();
            parametro1.ParameterName = "@nomeImgVacina";
            parametro1.SqlDbType = SqlDbType.VarChar;
            parametro1.Value = imagemVacina.Nome;
            comando.Parameters.Add(parametro1);

            comando.Parameters.Add("@imagemVacina", SqlDbType.VarBinary).Value = imagemVacina.Caminho;

            var idI = comando.ExecuteScalar();
            lblIdImgVacina.Text = (idI + "");
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
    protected void btnImagemVacina_Click(object sender, EventArgs e)
    {
        byte[] image;

        if (ImagemVacina.HasFile)
        {
            string savePath = @"C:\Users\Ana Paula\Documents\ImagemTeste";
            string file_name = ImagemVacina.FileName;
            savePath = savePath + @"\" + file_name;
            ImagemVacina.SaveAs(savePath);
            image = File.ReadAllBytes(savePath);

            DadosEImagem usuario = new DadosEImagem();
            usuario.Nome = NomeImagemVacina.Text;
            usuario.Caminho = image;

            img1.ImageUrl = InserirDados(usuario);
            InserirAssociativaImgVacina();
        }
    }

    /*Salvar informações na tabela associativa*/
    public void InserirAssociativaImgVacina()
    {
        int id_vacina = Convert.ToInt32(lblIdVacina.Text);
        int id_imgVacina = Convert.ToInt32(lblIdImgVacina.Text);

        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "insert into tb_imgVacina_vacina (id_vacina, id_imgVacina) values (@id_vacina, @id_imgVacina)";
        c.command.CommandText = sql;

        c.command.Parameters.Add("@id_vacina", SqlDbType.Int).Value = id_vacina;
        c.command.Parameters.Add("@id_imgVacina", SqlDbType.Int).Value = id_imgVacina;

        c.command.ExecuteNonQuery();
        c.FecharConexao();
        Response.Write("<script language = 'javascript'> alert ('Imagem adiciona com sucesso!');</script>");
    }
}