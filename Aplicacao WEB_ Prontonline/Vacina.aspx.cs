using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class img_Vacina : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
            String imagem = Convert.ToString(TextBoxImagem.Text);

            Conexao c = new Conexao();
            c.AbrirConexao();

            String sql = "insert into tb_vacina (id_tipoVacina, data, imagem, id_usuario) values (@tipoVacina, @data, @imagem, @id_usuario)";
            c.command.CommandText = sql;

            c.command.Parameters.Add("@tipoVacina", SqlDbType.Int).Value = id_tipoVacina;
            c.command.Parameters.Add("@data", SqlDbType.DateTime).Value = dataVacina;
            c.command.Parameters.Add("@imagem", SqlDbType.VarChar).Value = imagem;
            c.command.Parameters.Add("@id_usuario", SqlDbType.Int).Value = usuario;

            c.command.ExecuteNonQuery();
            c.FecharConexao();
            Response.Write("<script language = 'javascript'> alert ('Informação inserida com sucesso!');</script>");
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

    }