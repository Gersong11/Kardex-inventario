/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scrik.vista.provepro;

import scik.controlador.provepro.IProvePro;

/**
 *
 * @author Masamorro
 */
public class UIProvePro extends javax.swing.JFrame {
 public IProvePro interfaz;
    /**
     * Creates new form UIProvepro
     */
    public UIProvePro(IProvePro interfaz) {
        this.interfaz=interfaz;
        initComponents();
        setVisible(true);
        this.interfaz.cargar(tblregistros);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        tblregistros = new javax.swing.JTable();
        cmdinsertar = new javax.swing.JButton();
        cmdeliminar = new javax.swing.JButton();
        cmdvolver = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        tblregistros.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "Producto", "Proveedor"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jScrollPane1.setViewportView(tblregistros);

        cmdinsertar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/scik/recursos/insertar.png"))); // NOI18N
        cmdinsertar.setText("Insertar");
        cmdinsertar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmdinsertarActionPerformed(evt);
            }
        });

        cmdeliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/scik/recursos/eliminar.png"))); // NOI18N
        cmdeliminar.setText("Eliminar");
        cmdeliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmdeliminarActionPerformed(evt);
            }
        });

        cmdvolver.setIcon(new javax.swing.ImageIcon(getClass().getResource("/scik/recursos/menu.png"))); // NOI18N
        cmdvolver.setText("Volver");
        cmdvolver.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmdvolverActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 410, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(35, 35, 35)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(cmdinsertar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(cmdeliminar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(cmdvolver, javax.swing.GroupLayout.DEFAULT_SIZE, 138, Short.MAX_VALUE))
                .addContainerGap(38, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(86, 86, 86)
                        .addComponent(cmdinsertar, javax.swing.GroupLayout.PREFERRED_SIZE, 58, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(60, 60, 60)
                        .addComponent(cmdeliminar, javax.swing.GroupLayout.PREFERRED_SIZE, 58, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(53, 53, 53)
                        .addComponent(cmdvolver, javax.swing.GroupLayout.PREFERRED_SIZE, 73, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(68, 68, 68)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 417, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(45, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cmdeliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmdeliminarActionPerformed
        // TODO add your handling code here:
        interfaz.eliminar(tblregistros);
    }//GEN-LAST:event_cmdeliminarActionPerformed

    private void cmdvolverActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmdvolverActionPerformed
        // TODO add your handling code here:
        interfaz.menu();
    }//GEN-LAST:event_cmdvolverActionPerformed

    private void cmdinsertarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmdinsertarActionPerformed
        // TODO add your handling code here:
        interfaz.insertar();
    }//GEN-LAST:event_cmdinsertarActionPerformed

    /**
     * @param args the command line arguments
     */


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton cmdeliminar;
    private javax.swing.JButton cmdinsertar;
    private javax.swing.JButton cmdvolver;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblregistros;
    // End of variables declaration//GEN-END:variables
}
