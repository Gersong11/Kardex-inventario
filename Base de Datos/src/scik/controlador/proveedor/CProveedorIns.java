/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scik.controlador.proveedor;

import javax.swing.JOptionPane;
import javax.swing.JTextField;
import scik.modelo.Proveedor;

import scik.vista.proveedor.UIProveedorIns;

/**
 *
 * @author Masamorro
 */
public class CProveedorIns implements IProveedorIns{
    
    UIProveedorIns interfaz;

    public CProveedorIns() {
        this.interfaz = new UIProveedorIns(this);
    }
    
    @Override
    public void menu() {
      new CProveedor();
      interfaz.dispose();
    }

    @Override
    public void insertar(JTextField txtnombre) {
         Proveedor p = new Proveedor(txtnombre.getText());
        String err = p.insertar();
        if(err.equals(""))
        {
            JOptionPane.showMessageDialog(null, "Se ha agregado el registro nuevo", "INSERCION", JOptionPane.INFORMATION_MESSAGE);
            new CProveedorIns();
            interfaz.dispose();
        }
        else
            JOptionPane.showMessageDialog(null, err, "ERROR", JOptionPane.ERROR_MESSAGE);
    }
    
    
    
}
