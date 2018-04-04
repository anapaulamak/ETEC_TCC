<%@ WebHandler Class="Upload_imagens.WebForms.IMGHandler"Language="C#" %>

using System.Data.SqlClient;
using System.Web;

namespace Upload_imagens.WebForms
{
    public class IMGHandler : IHttpHandler
    {
        public bool IsReusable { get { return false; } }

        public void ProcessRequest(HttpContext context)
        {
            var codigo = context.Request.QueryString["id"]; 
            // o context é o objeto da classe HttpContext
            //se a URL da imagem é IMGHandler.ashx?id=3, o código acima irá retornar o número 3
            if (codigo == null) { }
            else
            {                     
                Conexao c = new Conexao();    
                SqlDataReader dt = c.Iniciando(codigo);
                //o comando ExecuteReader() retorna um datareader com os dados da consulta, funciona apenas com o SELECT. É usado para somente leitura
                if (dt.Read())
                {
                    context.Response.BinaryWrite((byte[])dt[0]); // irá pegar a coluna 0 do datareader
                }


            }
        }
    }
}