/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scik.controlador.proveedor;

import javax.swing.JTextField;

/**
 *
 * @author Masamorro
 */
public interface IProveedorMod {
    
    
    public void modificar(JTextField txtnombre);
    public void cargar(JTextField indice,JTextField nombre);
    public void menu();
}
