/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scik.controlador.provepro;

import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import scik.controlador.CKardexMenu;
import scik.modelo.ProvePro;
import scrik.vista.provepro.UIProvePro;

/**
 *
 * @author Masamorro
 */
public class CProvePro implements IProvePro {

    UIProvePro ventana;
    ArrayList<ProvePro> provepros;

    public CProvePro() {

        provepros = ProvePro.getLista();
        this.ventana = new UIProvePro(this);

    }

    @Override
    public void cargar(JTable tblregistros) {

        DefaultTableModel model = (DefaultTableModel) tblregistros.getModel();
        model.setRowCount(0);
        int proveedoresSize = provepros.size();

        for (int i = 0; i < proveedoresSize; i++) {

            model.addRow(new Object[]{provepros.get(i).getIndice(),
                provepros.get(i).getProducto().getProNom(),provepros.get(i).getProvedor().getNombre()});
        }
    }

    @Override
    public void menu() {
        new CKardexMenu();
        ventana.dispose();
    
    }

    @Override
    public void insertar() {
        new CProveProIns();
        ventana.dispose();
    }

    @Override
    public void eliminar(JTable tblRegistros) {
            int i = tblRegistros.getSelectedRow();
        if(i != -1)
        {
            ProvePro p = provepros.get(i);
            
            
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

    
   
}


