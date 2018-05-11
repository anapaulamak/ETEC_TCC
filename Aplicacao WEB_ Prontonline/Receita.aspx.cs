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
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("home.aspx");
        }

        if (!IsPostBack)
        {
            DropDownListConsulta.AppendDataBoundItems = true;
            DropDownListConsulta.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            DropDownListConsulta.SelectedIndex = 0;
        }

        ButtonAdicionarImagem.Visible = false;
    }

    protected void ButtonMinhasReceitas_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReceitaPesquisa.aspx");
    }

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
    public string InserirDados(DadosEImagem imagemReceita)
    {
        Conexao c = new Conexao();
        try
        {
            c.AbrirConexao();
            SqlCommand comando = new SqlCommand();
            comando.Connection = c.conexao;
            comando.CommandText = "INSERT INTO tb_imgReceita(imagemReceita, nomeImgReceita, id_receita) VALUES (@imagemReceita, @nomeImgReceita, @id_receita)" + "SELECT SCOPE_IDENTITY()";
            // O SELECT SCOPE_IDENTITY() retorna o valor do escopo de identidade, nesse caso, o ID )

            SqlParameter parametro1 = new SqlParameter();
            parametro1.ParameterName = "@nomeImgReceita";
            parametro1.SqlDbType = SqlDbType.VarChar;
            parametro1.Value = imagemReceita.Nome;
            comando.Parameters.Add(parametro1);

            comando.Parameters.Add("@imagemReceita", SqlDbType.VarBinary).Value = imagemReceita.Caminho;
            c.command.Parameters.Add("@id_receita", SqlDbType.Int).Value = lblIdReceita.Text;

            var idI = comando.ExecuteScalar();
            lblIdImgReceita.Text = (idI + "");
            // O ExecuteScalar() é um método que retorna o valor da primeira coluna e da primeira linha (ou seja, o ID)
            string url = ("IMGHandlerReceita.ashx?id=" + idI).ToString();
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
        byte[] image;

        if (ImagemReceita.HasFile)
        {
            string savePath = @"C:\Users\Ana Paula\Documents\ImagemTeste";
            string file_name = ImagemReceita.FileName;
            savePath = savePath + @"\" + file_name;
            ImagemReceita.SaveAs(savePath);
            image = File.ReadAllBytes(savePath);

            DadosEImagem usuario = new DadosEImagem();
            usuario.Nome = NomeImagemReceita.Text;
            usuario.Caminho = image;

            img1.ImageUrl = InserirDados(usuario);

            TextBoxNomeReceita.Text = "";
            TextBoxData.Text = "";
            DropDownListConsulta.Text = "";

            Response.Write("<script language = 'javascript'> alert ('Imagem adiciona com sucesso!');</script>");
        }
        //Criar regra para inserir até 6 imagens
        //if (img1 == nul){}
    }
}