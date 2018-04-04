using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RemediosImagens : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //pegar o ultimo Id de remédio cadastrado e adicionar na label lblIdRemedio
        //int ultimoIdRemedio = 
        lblIdRemedio.Text = "1";
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
            img.ImageUrl = InserirDados(usuario);
        }

    }

    /*Inserção da imagem do remédio na tabela imgRemedio*/
    public string InserirDados(DadosEImagem imagemRemedio)
    {
        Conexao c = new Conexao();
        try
        {
            c.AbrirConexao();
            SqlCommand comando = new SqlCommand();
            comando.Connection = c.conexao;
            comando.CommandText = "INSERT INTO tb_imgRemedio (imagemRemedio, nomeImgRemedio) VALUES (@imagemRemedio, @nomeImgRemedio)" + "SELECT SCOPE_IDENTITY()";
            // O SELECT SCOPE_IDENTITY() retorna o valor do escopo de identidade, nesse caso, o ID 

            SqlParameter parametro1 = new SqlParameter();
            parametro1.ParameterName = "@nomeImgRemedio";
            parametro1.SqlDbType = SqlDbType.VarChar;
            parametro1.Value = imagemRemedio.Nome;
            comando.Parameters.Add(parametro1);

            comando.Parameters.Add("@imagemRemedio", SqlDbType.VarBinary).Value = imagemRemedio.Caminho;

            var idI = comando.ExecuteScalar();
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
    protected void ButtonMeusRemedios_Click(object sender, EventArgs e)
    {
        Response.Redirect("RemediosPesquisa.aspx");
    }

    //public void InserirAssociativaImgRemedio()
    //{
    //    int id_remedio = 
    //    int id_imgRemedio = 

    //    Conexao c = new Conexao();
    //    c.AbrirConexao();

    //    String sql = "insert into tb_imgRemedio_remedio (id_remedio, id_imgRemedio) values (@id_remedio, @id_imgRemedio)";
    //    c.command.CommandText = sql;

    //    c.command.Parameters.Add("@id_remedio", SqlDbType.Int).Value = id_remedio;
    //    c.command.Parameters.Add("@id_imgRemedio", SqlDbType.Int).Value = id_imgRemedio;

    //    c.command.ExecuteNonQuery();
    //    c.FecharConexao();
    //    Response.Write("<script language = 'javascript'> alert ('Imagem adiciona com sucesso!');</script>");
    //}
}