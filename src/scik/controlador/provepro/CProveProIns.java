/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scik.controlador.provepro;

import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import scik.modelo.Producto;
import scik.modelo.ProvePro;
import scik.modelo.Proveedor;

import scrik.vista.provepro.UIProveProIns;

/**
 *
 * @author Masamorro
 */
public class CProveProIns implements IProveProIns {

    UIProveProIns ventana;
    ArrayList<Producto> productos;
    ArrayList<Proveedor> proveedores;

    public CProveProIns() {

        productos = Producto.getLista();
        proveedores = Proveedor.getLista();
        this.ventana = new UIProveProIns(this);
    }

    @Override
    public void menu() {
        new CProvePro();
        ventana.dispose();
    }

    @Override
    public void cargar(JTable tblproductos, JTable tblproveedores) {
        DefaultTableModel model = (DefaultTableModel) tblproductos.getModel();
        model.setRowCount(0);

        int proveedoresSize = productos.size();

        for (int i = 0; i < proveedoresSize; i++) {

            model.addRow(new Object[]{productos.get(i).getProCod(),
                productos.get(i).getProNom()});
        }

        model = (DefaultTableModel) tblproveedores.getModel();
        model.setRowCount(0);
        proveedoresSize = proveedores.size();

        for (int i = 0; i < proveedoresSize; i++) {

            model.addRow(new Object[]{proveedores.get(i).getIndice(),
                proveedores.get(i).getNombre()});
        }
    }

    @Override
    public void asociar(JTable tblproductos, JTable tblproveedores) {
        int i = tblproductos.getSelectedRow();
        int j = tblproveedores.getSelectedRow();
        if (i != -1 && j != -1) {
            Producto pro = productos.get(i);
            Proveedor pe = proveedores.get(j);
            ProvePro provepro = new ProvePro();
            provepro.setProducto(pro);
            provepro.setProvedor(pe);
            provepro.Insertar();

            JOptionPane.showMessageDialog(null, "Se ha relizado la Asociacion de manera exitosa");

        } else {
            JOptionPane.showMessageDialog(null, "Seleccione un registro a modificar", "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    @Override
    public boolean verificar(JTable tblproductos, JTable tblproveedores) {
        ArrayList<ProvePro> p;
        p = ProvePro.getLista();
        int i = tblproductos.getSelectedRow();
        int j = tblproveedores.getSelectedRow();
        if (i != -1 && j != -1) {
            Producto pro = productos.get(i);
            Proveedor pe = proveedores.get(j);

            for (int k = 0; k < p.size(); k++) {

                if (p.get(k).getProducto().getProNom().equalsIgnoreCase(pro.getProNom()) && p.get(k).getProvedor().getNombre().equalsIgnoreCase(pe.getNombre())) {

                    return true;
                }

            }
        } else {
            JOptionPane.showMessageDialog(null, "Seleccione Correctamente");
        }

        return false;

    }

}
