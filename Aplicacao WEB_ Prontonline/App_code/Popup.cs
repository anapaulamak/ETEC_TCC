using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Descrição resumida de Popup
/// </summary>
public class Popup
{
    public void Show(string msg)
    {
        Page page = HttpContext.Current.Handler as Page;
        if (page != null)
        {
            ScriptManager.RegisterStartupScript(page, page.GetType(), "msg", "alert('" + msg + "');", true);
        }
    }
    public Popup()
    {
        //
        // TODO: Adicionar lógica do construtor aqui
        //
    }
}