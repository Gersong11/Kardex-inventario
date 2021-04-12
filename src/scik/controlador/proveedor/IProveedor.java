/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scik.controlador.proveedor;

import javax.swing.JTable;

/**
 *
 * @author Masamorro
 */
public interface IProveedor {
    
    public void menu();
    public void insertar();
    public void cargar(JTable tblproveedor);
    public void modificar(JTable tblproveedor);
    public void eliminar(JTable tblproveedor);
}
