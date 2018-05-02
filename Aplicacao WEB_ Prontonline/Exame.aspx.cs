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

            DropDownListConsulta.AppendDataBoundItems = true;
            DropDownListConsulta.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            DropDownListConsulta.SelectedIndex = 0;
        }
    }

    protected void ButtonMeusExames_Click(object sender, EventArgs e)
    {
        Response.Redirect("ExamePesquisa.aspx");
    }

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

            String sql = "insert into tb_Exame (id_tipoExame, nome, data, id_consulta) values (@tipoExame, @nome, @data, @id_consulta)";
            c.command.CommandText = sql;

            c.command.Parameters.Add("@id_consulta", SqlDbType.Int).Value = id_consulta;
            c.command.Parameters.Add("@tipoExame", SqlDbType.Int).Value = id_tipoExame;
            c.command.Parameters.Add("@nome", SqlDbType.VarChar).Value = nomeExame;
            c.command.Parameters.Add("@data", SqlDbType.VarChar).Value = dataExame;


            c.command.ExecuteNonQuery();
            c.FecharConexao();
            Response.Write("<script language = 'javascript'> alert ('Informação adicionada com sucesso!');</script>");
            //ButtonAdicionarImagem.Enabled = true;

            UltimoIdExame();
        }
    }

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

    //Pegar o ultimo id_exame gravado
    public void UltimoIdExame()
    {
        c.AbrirConexao();
        SqlCommand command = new SqlCommand();
        command.Connection = c.conexao;

        IdentificaUsuario i = new IdentificaUsuario(Session["UserId"].ToString());
        int usuario = Convert.ToInt32(i.ID());

        String sql = "";
            //"Select MAX(e.id_exame) as ultimoId" +
            //"from tb_exame as e join tb_consulta as c on e.id_consulta = c.id_consulta " +
            //"where c.id_usuario = @usuario " +
            //"group by e.id_exame, e.id_consulta,c.id_usuario";

        c.command.CommandText = sql;
        c.command.Parameters.Add("@usuario", SqlDbType.Int).Value = usuario;

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        DataSet dt = new DataSet();
        dAdapter.SelectCommand = c.command;
        dAdapter.Fill(dt);

        String ultimoId = dt.Tables[0].Rows[0]["ultimoId"].ToString();
        lblIdExame.Text = ultimoId.ToString();
    }

    /*Inserção da imagem do exame na tabela imgExame*/
    public string InserirDados(DadosEImagem imagemExame)
    {
        Conexao c = new Conexao();
        try
        {
            c.AbrirConexao();
            SqlCommand comando = new SqlCommand();
            comando.Connection = c.conexao;
            comando.CommandText = "INSERT INTO tb_imgExame(imagemExame, nomeImgExame) VALUES (@imagemExame, @nomeImgExame)" + "SELECT SCOPE_IDENTITY()";
            // O SELECT SCOPE_IDENTITY() retorna o valor do escopo de identidade, nesse caso, o ID 

            SqlParameter parametro1 = new SqlParameter();
            parametro1.ParameterName = "@nomeImgExame";
            parametro1.SqlDbType = SqlDbType.VarChar;
            parametro1.Value = imagemExame.Nome;
            comando.Parameters.Add(parametro1);

            comando.Parameters.Add("@imagemExame", SqlDbType.VarBinary).Value = imagemExame.Caminho;

            var idI = comando.ExecuteScalar();
            lblIdImgExame.Text = (idI + "");
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
    protected void btnImagemExame_Click(object sender, EventArgs e)
    {
        byte[] image;

        if (ImagemExame.HasFile)
        {
            string savePath = @"C:\Users\Ana Paula\Documents\ImagemTeste";
            string file_name = ImagemExame.FileName;
            savePath = savePath + @"\" + file_name;
            ImagemExame.SaveAs(savePath);
            image = File.ReadAllBytes(savePath);

            DadosEImagem usuario = new DadosEImagem();
            usuario.Nome = NomeImagemExame.Text;
            usuario.Caminho = image;

            img1.ImageUrl = InserirDados(usuario);
            InserirAssociativaImgExame();
        }
        //Criar regra para inserir até 6 imagens
        //if (img1 == nul){}
    }

    /*Salvar informações na tabela associativa*/
    public void InserirAssociativaImgExame()
    {
        int id_exame = Convert.ToInt32(lblIdExame.Text);
        int id_imgExame = Convert.ToInt32(lblIdImgExame.Text);

        Conexao c = new Conexao();
        c.AbrirConexao();

        String sql = "insert into tb_imgExame_exame (id_exame, id_imgExame) values (@id_exame, @id_imgExame)";
        c.command.CommandText = sql;

        c.command.Parameters.Add("@id_exame", SqlDbType.Int).Value = id_exame;
        c.command.Parameters.Add("@id_imgExame", SqlDbType.Int).Value = id_imgExame;

        c.command.ExecuteNonQuery();
        c.FecharConexao();
        Response.Write("<script language = 'javascript'> alert ('Imagem adiciona com sucesso!');</script>");
    }
}