/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scik.modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import static scik.KardexIni.con;

/**
 *
 * @author Masamorro
 */
public class ProvePro {
    
    int indice;
    Producto producto;
    Proveedor provedor;

    public ProvePro() {
    }

    public ProvePro(int indice, Producto producto, Proveedor provedor) {
        this.indice = indice;
        this.producto = producto;
        this.provedor = provedor;
    }

    public int getIndice() {
        return indice;
    }

    public void setIndice(int indice) {
        this.indice = indice;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public Proveedor getProvedor() {
        return provedor;
    }

    public void setProvedor(Proveedor provedor) {
        this.provedor = provedor;
    }

    
  
    
     public static ArrayList<ProvePro> getLista()
    {
        ArrayList<ProvePro> provepros = new ArrayList<> ();
        try
        {
         ResultSet resultado = con.ejecutar("SELECT * FROM PROVEEDOR_PRODUCTO", null, true);
            while(resultado.next())
            {
                int codigo = resultado.getInt("Id");
                int codigopro = resultado.getInt("id_producto");
                int codigoprove = resultado.getInt("Id_proveedor");
                ProvePro provepro = new ProvePro();
                provepro.setIndice(codigo);
                provepro.setProducto(Producto.buscar(""+codigopro));
                provepro.setProvedor(Proveedor.buscar(codigoprove));
      
                provepros.add(provepro);
            }
        }
        catch (SQLException ex) 
        {
            JOptionPane.showMessageDialog(null, "Error de conexión a la base de datos.\nConfigure la conexión correctamente", "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return provepros;
    }
    
     public String Insertar(){
        String msg = "";
        try
        {
            con.ejecutar("INSERT INTO PROVEEDOR_PRODUCTO VALUES(DEFAULT, ?, ?)", new String[] { ""+producto.getProCod(), ""+provedor.getIndice()}, false);
        }
        catch (SQLException ex)
        {
            msg = ex.getMessage();
        }
        return msg;
         
         
         
     }

    public String eliminar() {
      String msg = "";
        try
        {
            
            con.ejecutar("DELETE FROM PROVEEDOR_PRODUCTO WHERE id = ?", new String[] {""+indice}, false);
        }
        catch (SQLException ex)
        {
             msg = ex.getMessage();
        }
        return msg;
    }
    
}
