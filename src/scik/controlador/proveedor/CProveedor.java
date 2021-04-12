/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scik.controlador.proveedor;

import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import scik.controlador.CKardexMenu;
import scik.modelo.Proveedor;
import scik.vista.proveedor.UIProveedor;


/**
 *
 * @author Masamorro
 */
public class CProveedor implements IProveedor {

    UIProveedor ventana;
    ArrayList<Proveedor>proveedores;

    public CProveedor() {
        
         proveedores = Proveedor.getLista();
         this.ventana = new UIProveedor(this);
       
    }
    
    
    @Override
    public void menu() {
        new CKardexMenu();
        ventana.dispose();
    }

    @Override
    public void insertar() {
        new CProveedorIns();
        ventana.dispose();
    }

    @Override
    public void cargar(JTable tblproveedor) {
        DefaultTableModel model = (DefaultTableModel) tblproveedor.getModel();
        model.setRowCount(0);
        int proveedoresSize = proveedores.size();
        
        
        for(int i = 0; i < proveedoresSize; i++)
        {
           
                
            model.addRow(new Object[]{  proveedores.get(i).getIndice(),
                                        proveedores.get(i).getNombre()});
        }
    }


   
    @Override
    public void eliminar(JTable tblRegistros) {
            int i = tblRegistros.getSelectedRow();
        if(i != -1)
        {
            Proveedor p = proveedores.get(i);
            
            
                if(JOptionPane.showConfirmDialog(null, "¿Está seguro que desea eliminar el registro?", "Eliminar", JOptionPane.YES_NO_OPTION) == JOptionPane.YES_OPTION)
                {
                    DefaultTableModel model = (DefaultTableModel) tblRegistros.getModel();
                    p.eliminar();
                    model.removeRow(i);
                    
                   
                }
            
        }
        else
            JOptionPane.showMessageDialog(null, "Seleccione un registro a eliminar", "ERROR", JOptionPane.ERROR_MESSAGE);
        
        
    }

    @Override
    public void modificar(JTable tblRegistros) {
       
        int i = tblRegistros.getSelectedRow();
        if(i != -1)
        {
            Proveedor p = proveedores.get(i);
             new CProveedorMod(p.getIndice());
                ventana.dispose();
            
           
        }
        else
            JOptionPane.showMessageDialog(null, "Seleccione un registro a modificar", "ERROR", JOptionPane.ERROR_MESSAGE);
    }

  

 
    
}
