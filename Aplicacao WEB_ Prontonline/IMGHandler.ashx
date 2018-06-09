<%@ WebHandler Class="Upload_imagens.WebForms.IMGHandler"Language="C#" %>

using System.Data.SqlClient;
using System.Web;
using System;

namespace Upload_imagens.WebForms
{
    public class IMGHandler : IHttpHandler
    {
        public bool IsReusable { get { return false; } }

        public void ProcessRequest(HttpContext context)
        {
            string[] indiceSql = new string[] {
            "SELECT imagemRemedio FROM tb_imgRemedio WHERE id_imgRemedio= @Id",
            "SELECT imagemVacina FROM tb_imgVacina WHERE id_imgVacina= @Id",
            "SELECT imagemReceita FROM tb_imgReceita WHERE id_imgReceita= @Id",
            "SELECT imagemExame FROM tb_imgExame WHERE id_imgExame= @Id"};

            var codigo = context.Request.QueryString["id"];
            int indice = Convert.ToInt32(context.Request.QueryString["indiceSql"]);
            //o context é o objeto da classe HttpContext
            //se a URL da imagem é IMGHandler.ashx?id=3, o código acima irá retornar o número 3
            if (codigo == null) { }
            else
            {
                Conexao c = new Conexao();
                SqlDataReader dt = c.SelecionaImg(codigo, indiceSql[indice]);
                //o comando ExecuteReader() retorna um datareader com os dados da consulta, funciona apenas com o SELECT. É usado para somente leitura
                if (dt.Read())
                {
                    context.Response.BinaryWrite((byte[])dt[0]); // irá pegar a coluna 0 do datareader
                }
            }
        }
    }
}