<%
            String nombre=request.getParameter("nombre");
            int valor=Integer.parseInt(request.getParameter("valor"));
            Articulo art=new Articulo();
            art.setNombre(nombre);
            art.setValor(valor);
            ControlArticulo.registrarArticulo(art);
        %>