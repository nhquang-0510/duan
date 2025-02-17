/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JInternalFrame.java to edit this template
 */
package com.shoes.ui;

import com.shoes.dao.HoaDonChiTietDAO;
import com.shoes.dao.HoaDonDAO;
import com.shoes.model.ChiTietHoaDon;
import com.shoes.model.HoaDon;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.plaf.basic.BasicInternalFrameUI;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author ntq04
 */
public class HoaDonForm extends javax.swing.JInternalFrame {

    DefaultTableModel model;
    HoaDonDAO serviceHD = new HoaDonDAO();
    List<HoaDon> dsHD = new ArrayList<>();
    HoaDonChiTietDAO serviceCT = new HoaDonChiTietDAO();
    List<ChiTietHoaDon> dsCT = new ArrayList<>();

    /**
     * Creates new form HoaDon
     */
    public HoaDonForm() {
        initComponents();
        loadDataHD();
        BasicInternalFrameUI ui = (BasicInternalFrameUI) this.getUI();
        ui.setNorthPane(null);
    }

    void loadDataHD() {
        model = (DefaultTableModel) tblHoaDon.getModel();
        model.setRowCount(0);
        dsHD = serviceHD.getAll();
        String tt;
        for (HoaDon hd : dsHD) {
            if (hd.getTrangThai() == 0) {
                tt = "Chưa thanh toán";
            } else if (hd.getTrangThai() == 1) {
                tt = "Đã thanh toán";
            } else {
                tt = "Đã huỷ";
            }
            model.addRow(new Object[]{
                hd.getIDHoaDon(),
                hd.getKhachHang(),
                hd.getNhanVien(),
                hd.getNgayTao(),
                tt,
                hd.getTongTien()
            });
        }
    }

    void loadDataHDCT(int id) {
        model = (DefaultTableModel) tblCTHD.getModel();
        model.setRowCount(0);
        dsCT = serviceCT.getSelect(id);
        for (ChiTietHoaDon ct : dsCT) {
            model.addRow(new Object[]{
                dsCT.indexOf(ct) + 1,
                ct.getIDCTsanPham(),
                ct.getTenSanPham(),
                ct.getSoLuong(),
                ct.getDonGia(),
                ct.getTongTien()
            });
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblHoaDon = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();
        jScrollPane9 = new javax.swing.JScrollPane();
        tblCTHD = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jComboBox1 = new javax.swing.JComboBox<>();
        jLabel3 = new javax.swing.JLabel();
        jButton2 = new javax.swing.JButton();

        setBorder(null);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel1.setBackground(new java.awt.Color(0, 204, 204));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel2.setBackground(new java.awt.Color(255, 255, 255));
        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "QUẢN LÍ HOÁ ĐƠN", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Segoe UI", 1, 18))); // NOI18N

        tblHoaDon.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null}
            },
            new String [] {
                "MÃ HOÁ ĐƠN", "MÃ KHÁCH HÀNG", "MÃ NHÂN VIÊN", "NGÀY TẠO", "TRẠNG THÁI", "TỔNG TIỀN"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblHoaDon.getTableHeader().setReorderingAllowed(false);
        tblHoaDon.addMouseMotionListener(new java.awt.event.MouseMotionAdapter() {
            public void mouseDragged(java.awt.event.MouseEvent evt) {
                tblHoaDonMouseDragged(evt);
            }
        });
        tblHoaDon.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblHoaDonMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblHoaDon);
        if (tblHoaDon.getColumnModel().getColumnCount() > 0) {
            tblHoaDon.getColumnModel().getColumn(0).setResizable(false);
            tblHoaDon.getColumnModel().getColumn(1).setResizable(false);
            tblHoaDon.getColumnModel().getColumn(2).setResizable(false);
            tblHoaDon.getColumnModel().getColumn(3).setResizable(false);
            tblHoaDon.getColumnModel().getColumn(4).setResizable(false);
            tblHoaDon.getColumnModel().getColumn(5).setResizable(false);
        }

        jButton1.setText("XUẤT FILE");

        tblCTHD.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null}
            },
            new String [] {
                "STT", "MÃ SP", "TÊN SP", "SỐ LƯỢNG", "ĐƠN GIÁ", "THÀNH TIỀN"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblCTHD.getTableHeader().setReorderingAllowed(false);
        tblCTHD.addMouseMotionListener(new java.awt.event.MouseMotionAdapter() {
            public void mouseDragged(java.awt.event.MouseEvent evt) {
                tblCTHDMouseDragged(evt);
            }
        });
        jScrollPane9.setViewportView(tblCTHD);
        if (tblCTHD.getColumnModel().getColumnCount() > 0) {
            tblCTHD.getColumnModel().getColumn(0).setResizable(false);
            tblCTHD.getColumnModel().getColumn(1).setResizable(false);
            tblCTHD.getColumnModel().getColumn(2).setResizable(false);
            tblCTHD.getColumnModel().getColumn(3).setResizable(false);
            tblCTHD.getColumnModel().getColumn(4).setResizable(false);
            tblCTHD.getColumnModel().getColumn(5).setResizable(false);
        }

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel1.setText("HOÁ ĐƠN");

        jLabel2.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel2.setText("HOÁ ĐƠN CHI TIẾT");

        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "All", "Chưa thanh toán", "Đã thanh toán", "Đã huỷ" }));
        jComboBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox1ActionPerformed(evt);
            }
        });

        jLabel3.setText("TRẠNG THÁI HOÁ ĐƠN");

        jButton2.setText("SỬA TRẠNG THÁI");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1)
                    .addComponent(jScrollPane9)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 180, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(57, 57, 57)
                        .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 178, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 673, Short.MAX_VALUE)
                        .addComponent(jLabel3)
                        .addGap(18, 18, 18)
                        .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, 271, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jLabel1))
                    .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLabel3)))
                .addGap(12, 12, 12)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 228, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jLabel2)
                .addGap(18, 18, 18)
                .addComponent(jScrollPane9, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jButton2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton1, javax.swing.GroupLayout.DEFAULT_SIZE, 59, Short.MAX_VALUE))
                .addContainerGap(39, Short.MAX_VALUE))
        );

        jPanel1.add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 10, 1180, 670));

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 1200, 690));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void tblHoaDonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblHoaDonMouseClicked
        // TODO add your handling code here:
        int row = tblHoaDon.getSelectedRow();
        if (row >= 0) {
            int id = (int) tblHoaDon.getValueAt(row, 0);
            loadDataHDCT(id);
        }
    }//GEN-LAST:event_tblHoaDonMouseClicked

    private void jComboBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox1ActionPerformed
        // TODO add your handling code here:
        int cbott = jComboBox1.getSelectedIndex();
        dsHD = serviceHD.getAll();
        model = (DefaultTableModel) tblHoaDon.getModel();
        model.setRowCount(0);
        String tt;
        if (cbott == 0) {
            loadDataHD();
        } else if (cbott == 1) {
            for (HoaDon hd : dsHD) {
                if (hd.getTrangThai() == 0) {
                    if (hd.getTrangThai() == 0) {
                        tt = "Chưa thanh toán";
                    } else if (hd.getTrangThai() == 1) {
                        tt = "Đã thanh toán";
                    } else {
                        tt = "Đã huỷ";
                    }
                    model.addRow(new Object[]{
                        hd.getIDHoaDon(),
                        hd.getKhachHang(),
                        hd.getNhanVien(),
                        hd.getNgayTao(),
                        tt,
                        hd.getTongTien()
                    });
                }
            }
        } else if (cbott == 2) {
            for (HoaDon hd : dsHD) {
                if (hd.getTrangThai() == 1) {
                    if (hd.getTrangThai() == 0) {
                        tt = "Chưa thanh toán";
                    } else if (hd.getTrangThai() == 1) {
                        tt = "Đã thanh toán";
                    } else {
                        tt = "Đã huỷ";
                    }
                    model.addRow(new Object[]{
                        hd.getIDHoaDon(),
                        hd.getKhachHang(),
                        hd.getNhanVien(),
                        hd.getNgayTao(),
                        tt,
                        hd.getTongTien()
                    });
                }
            }
        } else {
            for (HoaDon hd : dsHD) {
                if (hd.getTrangThai() == 2) {
                    if (hd.getTrangThai() == 0) {
                        tt = "Chưa thanh toán";
                    } else if (hd.getTrangThai() == 1) {
                        tt = "Đã thanh toán";
                    } else {
                        tt = "Đã huỷ";
                    }
                    model.addRow(new Object[]{
                        hd.getIDHoaDon(),
                        hd.getKhachHang(),
                        hd.getNhanVien(),
                        hd.getNgayTao(),
                        tt,
                        hd.getTongTien()
                    });
                }
            }
        }
    }//GEN-LAST:event_jComboBox1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
        int row = tblHoaDon.getSelectedRow();
        if (row >= 0) {
            String[] options = {"Chưa thanh toán", "Đã thanh toán", "Đã huỷ"};
            int id = (int) tblHoaDon.getValueAt(row, 0);
            // Hiển thị JOptionPane với 3 lựa chọn
            int tt = JOptionPane.showOptionDialog(null, "Chọn trạng thái muốn đổi", "Thay đổi trạng thái hoá đơn", JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, options, options[0]);
            if (serviceHD.update(tt, id)) {
                loadDataHD();
                JOptionPane.showMessageDialog(this, "Sửa thành công !");
            } else {
                JOptionPane.showMessageDialog(this, "Sửa thất bại !");
            }
        }
    }//GEN-LAST:event_jButton2ActionPerformed

    private void tblHoaDonMouseDragged(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblHoaDonMouseDragged
        // TODO add your handling code here:
        int rowCount = tblHoaDon.getSelectedRowCount();
        if (rowCount >1) {
            JOptionPane.showMessageDialog(this, "Chỉ được chọn 1 dòng !");
            tblHoaDon.clearSelection();
        }
    }//GEN-LAST:event_tblHoaDonMouseDragged

    private void tblCTHDMouseDragged(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblCTHDMouseDragged
        // TODO add your handling code here:
        int rowCount = tblCTHD.getSelectedRowCount();
        if (rowCount >1) {
            JOptionPane.showMessageDialog(this, "Chỉ được chọn 1 dòng !");
            tblCTHD.clearSelection();
        }
    }//GEN-LAST:event_tblCTHDMouseDragged


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane9;
    private javax.swing.JTable tblCTHD;
    private javax.swing.JTable tblHoaDon;
    // End of variables declaration//GEN-END:variables
}
