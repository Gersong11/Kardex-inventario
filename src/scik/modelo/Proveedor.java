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
public class Proveedor {
    
    int indice;
    String Nombre;

    public Proveedor() {
    }

    public Proveedor(String Nombre) {
        this.Nombre = Nombre;
    }

    public Proveedor(int indice, String Nombre) {
        this.indice = indice;
        this.Nombre = Nombre;
    }

    public int getIndice() {
        return indice;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setIndice(int indice) {
        this.indice = indice;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }
    
      public String insertar()
    {
        String msg = "";
        try
        {
            con.ejecutar("INSERT INTO PROVEEDOR VALUES(DEFAULT,?)", new String[] {Nombre}, false);
        }
        catch (SQLException ex)
        {
            msg = ex.getMessage();
        }
        return msg;
    }
      public static ArrayList<Proveedor> getLista()
              
    {
        ArrayList<Proveedor> proveedores = new ArrayList<> ();
        try
        {
            ResultSet resultado = con.ejecutar("SELECT * FROM PROVEEDOR ORDER BY ID ASC", null, true);
            while(resultado.next())
            {
                int codigo = resultado.getInt("id");
                String nombre = resultado.getString("nombre");
                Proveedor pro = new Proveedor(codigo, nombre);
                proveedores.add(pro);
                
            }
        }
        
        catch (SQLException ex) 
        {
            JOptionPane.showMessageDialog(null, "Error de conexión a la base de datos.\nConfigure la conexión correctamente", "ERROR", JOptionPane.ERROR_MESSAGE);
        }
       
        return proveedores;
    }
      
       public static Proveedor buscar(int codigo)
    {
        Proveedor p = null;
        try
        {
            ResultSet rs = con.ejecutar("SELECT * FROM PROVEEDOR WHERE ID = ?", new String[] {""+codigo}, true);
            rs.next();
            p = new Proveedor();
            p.setIndice(rs.getInt("Id"));
            p.setNombre(rs.getString("Nombre"));
        }
        catch (SQLException ex)
        {
            JOptionPane.showMessageDialog(null, "Error de conexión a la base de datos.\nConfigure la conexión correctamente", "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return p;           
    }
          public  Proveedor buscar2(int codigo)
    {
        Proveedor p = null;
        try
        {
            ResultSet rs = con.ejecutar("SELECT * FROM PROVEEDOR WHERE ID = ?", new String[] {""+codigo}, true);
            rs.next();
            p = new Proveedor();
            p.setIndice(rs.getInt("Id"));
            p.setNombre(rs.getString("Nombre"));
        }
        catch (SQLException ex)
        {
            JOptionPane.showMessageDialog(null, "Error de conexión a la base de datos.\nConfigure la conexión correctamente", "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return p;           
    }
      
    public String modificar()
    {
	String msg = "";
        try
        {
            con.ejecutar("UPDATE PROVEEDOR SET NOMBRE = ? WHERE ID = ?", new String[] {Nombre, ""+indice}, false);
        }
        catch (SQLException ex)
        {
            msg = ex.getMessage();
        }
        return msg;
    }
    
  public String eliminar()
    {
	String msg = "";
        try
        {
            
            con.ejecutar("DELETE FROM PROVEEDOR WHERE id = ?", new String[] {""+indice}, false);
        }
        catch (SQLException ex)
        {
             msg = ex.getMessage();
        }
        return msg;
    }
  
    
}
