namespace QuanLyThuVien.Form_ThongKe
{
    partial class fThongKe
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tabThongKe = new MetroFramework.Controls.MetroTabControl();
            this.metroTabPage2 = new MetroFramework.Controls.MetroTabPage();
            this.panel2 = new System.Windows.Forms.Panel();
            this.lvDauSachMuonNhieu = new System.Windows.Forms.ListView();
            this.columnHeader3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader7 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader8 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader10 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.metroTabPage1 = new MetroFramework.Controls.MetroTabPage();
            this.panel3 = new System.Windows.Forms.Panel();
            this.lvSachConLai = new System.Windows.Forms.ListView();
            this.columnHeader9 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader11 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader12 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader13 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.tabThongKe.SuspendLayout();
            this.metroTabPage2.SuspendLayout();
            this.panel2.SuspendLayout();
            this.metroTabPage1.SuspendLayout();
            this.panel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabThongKe
            // 
            this.tabThongKe.Appearance = System.Windows.Forms.TabAppearance.Buttons;
            this.tabThongKe.Controls.Add(this.metroTabPage2);
            this.tabThongKe.Controls.Add(this.metroTabPage1);
            this.tabThongKe.ItemSize = new System.Drawing.Size(364, 40);
            this.tabThongKe.Location = new System.Drawing.Point(0, 0);
            this.tabThongKe.Margin = new System.Windows.Forms.Padding(4);
            this.tabThongKe.Multiline = true;
            this.tabThongKe.Name = "tabThongKe";
            this.tabThongKe.SelectedIndex = 0;
            this.tabThongKe.Size = new System.Drawing.Size(1262, 723);
            this.tabThongKe.TabIndex = 0;
            this.tabThongKe.Theme = MetroFramework.MetroThemeStyle.Light;
            this.tabThongKe.UseSelectable = true;
            // 
            // metroTabPage2
            // 
            this.metroTabPage2.Controls.Add(this.panel2);
            this.metroTabPage2.HorizontalScrollbarBarColor = true;
            this.metroTabPage2.HorizontalScrollbarHighlightOnWheel = false;
            this.metroTabPage2.HorizontalScrollbarSize = 12;
            this.metroTabPage2.Location = new System.Drawing.Point(4, 44);
            this.metroTabPage2.Margin = new System.Windows.Forms.Padding(4);
            this.metroTabPage2.Name = "metroTabPage2";
            this.metroTabPage2.Size = new System.Drawing.Size(1254, 675);
            this.metroTabPage2.TabIndex = 1;
            this.metroTabPage2.Text = "Số lượt mượn sách";
            this.metroTabPage2.VerticalScrollbarBarColor = true;
            this.metroTabPage2.VerticalScrollbarHighlightOnWheel = false;
            this.metroTabPage2.VerticalScrollbarSize = 13;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.lvDauSachMuonNhieu);
            this.panel2.Location = new System.Drawing.Point(4, 4);
            this.panel2.Margin = new System.Windows.Forms.Padding(4);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(1035, 592);
            this.panel2.TabIndex = 2;
            // 
            // lvDauSachMuonNhieu
            // 
            this.lvDauSachMuonNhieu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(189)))), ((int)(((byte)(201)))), ((int)(((byte)(217)))));
            this.lvDauSachMuonNhieu.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader3,
            this.columnHeader7,
            this.columnHeader8,
            this.columnHeader10});
            this.lvDauSachMuonNhieu.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lvDauSachMuonNhieu.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lvDauSachMuonNhieu.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(36)))), ((int)(((byte)(64)))));
            this.lvDauSachMuonNhieu.FullRowSelect = true;
            this.lvDauSachMuonNhieu.GridLines = true;
            this.lvDauSachMuonNhieu.HideSelection = false;
            this.lvDauSachMuonNhieu.Location = new System.Drawing.Point(0, 0);
            this.lvDauSachMuonNhieu.Margin = new System.Windows.Forms.Padding(4);
            this.lvDauSachMuonNhieu.Name = "lvDauSachMuonNhieu";
            this.lvDauSachMuonNhieu.Size = new System.Drawing.Size(1035, 592);
            this.lvDauSachMuonNhieu.TabIndex = 38;
            this.lvDauSachMuonNhieu.UseCompatibleStateImageBehavior = false;
            this.lvDauSachMuonNhieu.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "STT";
            this.columnHeader3.Width = 76;
            // 
            // columnHeader7
            // 
            this.columnHeader7.Text = "Tên đầu sách";
            this.columnHeader7.Width = 343;
            // 
            // columnHeader8
            // 
            this.columnHeader8.Text = "Tập";
            this.columnHeader8.Width = 116;
            // 
            // columnHeader10
            // 
            this.columnHeader10.Text = "Số lượt mượn";
            this.columnHeader10.Width = 133;
            // 
            // metroTabPage1
            // 
            this.metroTabPage1.BackColor = System.Drawing.SystemColors.Control;
            this.metroTabPage1.Controls.Add(this.panel3);
            this.metroTabPage1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.metroTabPage1.ForeColor = System.Drawing.SystemColors.ControlText;
            this.metroTabPage1.HorizontalScrollbarBarColor = true;
            this.metroTabPage1.HorizontalScrollbarHighlightOnWheel = false;
            this.metroTabPage1.HorizontalScrollbarSize = 12;
            this.metroTabPage1.Location = new System.Drawing.Point(4, 44);
            this.metroTabPage1.Margin = new System.Windows.Forms.Padding(4);
            this.metroTabPage1.Name = "metroTabPage1";
            this.metroTabPage1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.metroTabPage1.Size = new System.Drawing.Size(1254, 675);
            this.metroTabPage1.TabIndex = 0;
            this.metroTabPage1.Text = "       Số lượng sách còn trong kho         ";
            this.metroTabPage1.VerticalScrollbarBarColor = true;
            this.metroTabPage1.VerticalScrollbarHighlightOnWheel = false;
            this.metroTabPage1.VerticalScrollbarSize = 13;
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.lvSachConLai);
            this.panel3.Location = new System.Drawing.Point(4, 4);
            this.panel3.Margin = new System.Windows.Forms.Padding(4);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(1068, 610);
            this.panel3.TabIndex = 2;
            // 
            // lvSachConLai
            // 
            this.lvSachConLai.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(189)))), ((int)(((byte)(201)))), ((int)(((byte)(217)))));
            this.lvSachConLai.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader9,
            this.columnHeader11,
            this.columnHeader12,
            this.columnHeader13});
            this.lvSachConLai.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lvSachConLai.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lvSachConLai.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(36)))), ((int)(((byte)(64)))));
            this.lvSachConLai.FullRowSelect = true;
            this.lvSachConLai.GridLines = true;
            this.lvSachConLai.HideSelection = false;
            this.lvSachConLai.Location = new System.Drawing.Point(0, 0);
            this.lvSachConLai.Margin = new System.Windows.Forms.Padding(4);
            this.lvSachConLai.Name = "lvSachConLai";
            this.lvSachConLai.Size = new System.Drawing.Size(1068, 610);
            this.lvSachConLai.TabIndex = 38;
            this.lvSachConLai.UseCompatibleStateImageBehavior = false;
            this.lvSachConLai.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader9
            // 
            this.columnHeader9.Text = "STT";
            this.columnHeader9.Width = 76;
            // 
            // columnHeader11
            // 
            this.columnHeader11.Text = "Tên đầu sách";
            this.columnHeader11.Width = 343;
            // 
            // columnHeader12
            // 
            this.columnHeader12.Text = "Tập";
            this.columnHeader12.Width = 116;
            // 
            // columnHeader13
            // 
            this.columnHeader13.Text = "Số lượng";
            this.columnHeader13.Width = 133;
            // 
            // fThongKe
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.tabThongKe);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "fThongKe";
            this.Size = new System.Drawing.Size(1100, 747);
            this.tabThongKe.ResumeLayout(false);
            this.metroTabPage2.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.metroTabPage1.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
        private MetroFramework.Controls.MetroTabPage metroTabPage1;
        private MetroFramework.Controls.MetroTabPage metroTabPage2;
        private MetroFramework.Controls.MetroTabControl tabThongKe;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.ListView lvDauSachMuonNhieu;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        private System.Windows.Forms.ColumnHeader columnHeader7;
        private System.Windows.Forms.ColumnHeader columnHeader8;
        private System.Windows.Forms.ColumnHeader columnHeader10;
        private System.Windows.Forms.ListView lvSachConLai;
        private System.Windows.Forms.ColumnHeader columnHeader9;
        private System.Windows.Forms.ColumnHeader columnHeader11;
        private System.Windows.Forms.ColumnHeader columnHeader12;
        private System.Windows.Forms.ColumnHeader columnHeader13;
    }
}
