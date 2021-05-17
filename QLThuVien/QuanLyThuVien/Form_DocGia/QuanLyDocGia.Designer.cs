namespace QuanLyThuVien.Form_DocGia
{
    partial class QuanLyDocGia
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(QuanLyDocGia));
            this.btnThemDocGia = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.btnTimKiem = new System.Windows.Forms.Button();
            this.txtboxTkDocGia = new System.Windows.Forms.TextBox();
            this.themDocGia = new System.Windows.Forms.Button();
            this.panel2 = new System.Windows.Forms.Panel();
            this.listViewDocGia = new System.Windows.Forms.ListView();
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader4 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader5 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader6 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.contextMenuStripItemDocGia = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.thôngTinChiTiếtToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.làmMớiToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.xóaĐộcGiảToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.contextMenuStripItemDocGia.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnThemDocGia
            // 
            this.btnThemDocGia.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnThemDocGia.FlatAppearance.BorderSize = 0;
            this.btnThemDocGia.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnThemDocGia.ForeColor = System.Drawing.Color.White;
            this.btnThemDocGia.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnThemDocGia.Location = new System.Drawing.Point(0, 0);
            this.btnThemDocGia.Name = "btnThemDocGia";
            this.btnThemDocGia.Size = new System.Drawing.Size(174, 68);
            this.btnThemDocGia.TabIndex = 0;
            this.btnThemDocGia.Text = "       Thêm sách";
            this.btnThemDocGia.UseVisualStyleBackColor = true;
            this.btnThemDocGia.Click += new System.EventHandler(this.btnThemDocGia_Click);
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(11)))), ((int)(((byte)(63)))), ((int)(((byte)(112)))));
            this.panel1.Controls.Add(this.btnTimKiem);
            this.panel1.Controls.Add(this.txtboxTkDocGia);
            this.panel1.Controls.Add(this.themDocGia);
            this.panel1.Location = new System.Drawing.Point(4, 4);
            this.panel1.Margin = new System.Windows.Forms.Padding(4);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1059, 62);
            this.panel1.TabIndex = 0;
            // 
            // btnTimKiem
            // 
            this.btnTimKiem.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnTimKiem.FlatAppearance.BorderSize = 0;
            this.btnTimKiem.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTimKiem.Image = ((System.Drawing.Image)(resources.GetObject("btnTimKiem.Image")));
            this.btnTimKiem.Location = new System.Drawing.Point(589, 0);
            this.btnTimKiem.Margin = new System.Windows.Forms.Padding(4);
            this.btnTimKiem.Name = "btnTimKiem";
            this.btnTimKiem.Size = new System.Drawing.Size(71, 46);
            this.btnTimKiem.TabIndex = 8;
            this.btnTimKiem.UseVisualStyleBackColor = true;
            this.btnTimKiem.Click += new System.EventHandler(this.onClickTimKiemDocGIa);
            // 
            // txtboxTkDocGia
            // 
            this.txtboxTkDocGia.Location = new System.Drawing.Point(448, 4);
            this.txtboxTkDocGia.Margin = new System.Windows.Forms.Padding(4);
            this.txtboxTkDocGia.Name = "txtboxTkDocGia";
            this.txtboxTkDocGia.Size = new System.Drawing.Size(132, 22);
            this.txtboxTkDocGia.TabIndex = 1;
            this.txtboxTkDocGia.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtBoxTimKiemKeyDown);
            // 
            // themDocGia
            // 
            this.themDocGia.Dock = System.Windows.Forms.DockStyle.Left;
            this.themDocGia.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.themDocGia.ForeColor = System.Drawing.Color.White;
            this.themDocGia.Location = new System.Drawing.Point(0, 0);
            this.themDocGia.Margin = new System.Windows.Forms.Padding(4);
            this.themDocGia.Name = "themDocGia";
            this.themDocGia.Size = new System.Drawing.Size(148, 62);
            this.themDocGia.TabIndex = 0;
            this.themDocGia.Text = "Thêm độc giả";
            this.themDocGia.UseVisualStyleBackColor = true;
            this.themDocGia.Click += new System.EventHandler(this.onClickThemDocgia);
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.listViewDocGia);
            this.panel2.Location = new System.Drawing.Point(4, 73);
            this.panel2.Margin = new System.Windows.Forms.Padding(4);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(1059, 478);
            this.panel2.TabIndex = 1;
            // 
            // listViewDocGia
            // 
            this.listViewDocGia.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(189)))), ((int)(((byte)(201)))), ((int)(((byte)(217)))));
            this.listViewDocGia.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1,
            this.columnHeader2,
            this.columnHeader4,
            this.columnHeader3,
            this.columnHeader5,
            this.columnHeader6});
            this.listViewDocGia.ContextMenuStrip = this.contextMenuStripItemDocGia;
            this.listViewDocGia.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listViewDocGia.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.listViewDocGia.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(36)))), ((int)(((byte)(64)))));
            this.listViewDocGia.FullRowSelect = true;
            this.listViewDocGia.GridLines = true;
            this.listViewDocGia.HideSelection = false;
            this.listViewDocGia.Location = new System.Drawing.Point(0, 0);
            this.listViewDocGia.Margin = new System.Windows.Forms.Padding(4);
            this.listViewDocGia.Name = "listViewDocGia";
            this.listViewDocGia.Size = new System.Drawing.Size(1059, 478);
            this.listViewDocGia.TabIndex = 28;
            this.listViewDocGia.UseCompatibleStateImageBehavior = false;
            this.listViewDocGia.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "Mã Độc giả";
            this.columnHeader1.Width = 132;
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "Tên độc giả";
            this.columnHeader2.Width = 250;
            // 
            // columnHeader4
            // 
            this.columnHeader4.Text = "Ngày sinh";
            this.columnHeader4.Width = 120;
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "Đơn vị";
            this.columnHeader3.Width = 87;
            // 
            // columnHeader5
            // 
            this.columnHeader5.Text = "SDT";
            this.columnHeader5.Width = 68;
            // 
            // columnHeader6
            // 
            this.columnHeader6.Text = "Quê Quán";
            this.columnHeader6.Width = 250;
            // 
            // contextMenuStripItemDocGia
            // 
            this.contextMenuStripItemDocGia.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.contextMenuStripItemDocGia.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.thôngTinChiTiếtToolStripMenuItem,
            this.làmMớiToolStripMenuItem,
            this.xóaĐộcGiảToolStripMenuItem});
            this.contextMenuStripItemDocGia.Name = "contextMenuStripItemDocGia";
            this.contextMenuStripItemDocGia.Size = new System.Drawing.Size(191, 76);
            // 
            // thôngTinChiTiếtToolStripMenuItem
            // 
            this.thôngTinChiTiếtToolStripMenuItem.Name = "thôngTinChiTiếtToolStripMenuItem";
            this.thôngTinChiTiếtToolStripMenuItem.Size = new System.Drawing.Size(190, 24);
            this.thôngTinChiTiếtToolStripMenuItem.Text = "Thông tin chi tiết";
            this.thôngTinChiTiếtToolStripMenuItem.Click += new System.EventHandler(this.clickItemThongTinChiTietDocGia);
            // 
            // làmMớiToolStripMenuItem
            // 
            this.làmMớiToolStripMenuItem.Name = "làmMớiToolStripMenuItem";
            this.làmMớiToolStripMenuItem.Size = new System.Drawing.Size(190, 24);
            this.làmMớiToolStripMenuItem.Text = "Làm mới";
            this.làmMớiToolStripMenuItem.Click += new System.EventHandler(this.lamMoi);
            // 
            // xóaĐộcGiảToolStripMenuItem
            // 
            this.xóaĐộcGiảToolStripMenuItem.Name = "xóaĐộcGiảToolStripMenuItem";
            this.xóaĐộcGiảToolStripMenuItem.Size = new System.Drawing.Size(190, 24);
            this.xóaĐộcGiảToolStripMenuItem.Text = "Xóa độc giả";
            this.xóaĐộcGiảToolStripMenuItem.Click += new System.EventHandler(this.xoaDocGia);
            // 
            // QuanLyDocGia
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "QuanLyDocGia";
            this.Size = new System.Drawing.Size(1067, 554);
            this.Load += new System.EventHandler(this.QuanLyDocGiaLoad);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.contextMenuStripItemDocGia.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Button btnThemDocGia;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.ListView listViewDocGia;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private System.Windows.Forms.ColumnHeader columnHeader4;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        private System.Windows.Forms.ColumnHeader columnHeader5;
        private System.Windows.Forms.ColumnHeader columnHeader6;
        private System.Windows.Forms.Button themDocGia;
        private System.Windows.Forms.TextBox txtboxTkDocGia;
        private System.Windows.Forms.Button btnTimKiem;
        private System.Windows.Forms.ContextMenuStrip contextMenuStripItemDocGia;
        private System.Windows.Forms.ToolStripMenuItem thôngTinChiTiếtToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem xóaĐộcGiảToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem làmMớiToolStripMenuItem;
    }
}
