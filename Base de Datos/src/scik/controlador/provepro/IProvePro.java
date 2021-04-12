/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scik.controlador.provepro;

import javax.swing.JTable;
import javax.swing.JTextField;

/**
 *
 * @author Masamorro
 */
public interface IProvePro {
    
    public void cargar(JTable tblregistros);
    public void menu();
    public void insertar();

    public void eliminar(JTable tblregistros);


    
}
