/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scik.controlador.provepro;

import javax.swing.JTable;

/**
 *
 * @author Masamorro
 */
public interface IProveProIns {
    public void menu();
    public void cargar(JTable tblproductos ,JTable tblproveedores);
    public void asociar(JTable tblproductos ,JTable tblproveedores);
    public boolean verificar(JTable tblproductos ,JTable tblproveedores);
    
}
