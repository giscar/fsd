﻿using PE.GOB.FSD.BusinessLogic.Core;
using PE.GOB.FSD.Entity.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PE.GOB.FSD.Web.pages
{
    public partial class listadoAcciones : System.Web.UI.Page
    {
        AccionBusinessLogic accionBusinessLogic = new AccionBusinessLogic();

        List<Accion> listadoAccion;
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarLista();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            cargarLista();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        private void cargarLista()
        {
            listadoAccion = accionBusinessLogic.listarPorAccion();
            GridView1.DataSource = listadoAccion;
            GridView1.DataBind();
        }
    }
}