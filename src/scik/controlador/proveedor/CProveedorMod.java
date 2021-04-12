/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scik.controlador.proveedor;

import javax.swing.JOptionPane;
import javax.swing.JTextField;
import scik.modelo.Proveedor;
import scik.vista.proveedor.UIProveedorMod;

/**
 *
 * @author Masamorro
 */
public class CProveedorMod implements IProveedorMod{
    private Proveedor p;
    UIProveedorMod ventana;
    
    public CProveedorMod(int i) {
        p = Proveedor.buscar(i);
        this.ventana=new UIProveedorMod(this);
    }

    @Override
    public void modificar(JTextField txtnombre) {
             p.setNombre(txtnombre.getText());
        String err = p.modificar();
        
        if(err.equals(""))
        {
            JOptionPane.showMessageDialog(null, "Se ha modificado el registro", "MODIFICACIÓN", JOptionPane.INFORMATION_MESSAGE);
            new CProveedor();
            ventana.dispose();
        }
        else
            JOptionPane.showMessageDialog(null, err, "ERROR", JOptionPane.ERROR_MESSAGE);
    }

    @Override
    public void cargar(JTextField indice, JTextField nombre) {
        indice.setText(""+p.getIndice());
        nombre.setText(p.getNombre());
    }

    @Override
    public void menu() {
      new CProveedor();
      ventana.dispose();
    }

    
    
}
