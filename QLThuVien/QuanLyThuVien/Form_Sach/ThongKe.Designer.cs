namespace QuanLyThuVien.Form_Sach
{
    partial class ThongKe
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
            this.button3 = new System.Windows.Forms.Button();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.lvTKDauSach = new System.Windows.Forms.ListView();
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader9 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader10 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader11 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader12 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader13 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader14 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.lvTKCuonSach = new System.Windows.Forms.ListView();
            this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader4 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader5 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader6 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader8 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.tabPage4 = new System.Windows.Forms.TabPage();
            this.lvTheLoai = new System.Windows.Forms.ListView();
            this.columnHeader20 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader21 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader23 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader24 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.tabPage4.SuspendLayout();
            this.SuspendLayout();
            // 
            // button3
            // 
            this.button3.BackColor = System.Drawing.SystemColors.AppWorkspace;
            this.button3.FlatAppearance.BorderSize = 0;
            this.button3.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button3.ForeColor = System.Drawing.Color.White;
            this.button3.Location = new System.Drawing.Point(957, -3);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(25, 24);
            this.button3.TabIndex = 54;
            this.button3.Text = "X";
            this.button3.UseVisualStyleBackColor = false;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Controls.Add(this.tabPage4);
            this.tabControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControl1.Location = new System.Drawing.Point(0, 0);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(981, 661);
            this.tabControl1.TabIndex = 56;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.lvTKDauSach);
            this.tabPage1.Location = new System.Drawing.Point(4, 32);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(973, 625);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Theo đầu sách";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // lvTKDauSach
            // 
            this.lvTKDauSach.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(250)))), ((int)(((byte)(248)))), ((int)(((byte)(245)))));
            this.lvTKDauSach.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1,
            this.columnHeader9,
            this.columnHeader10,
            this.columnHeader11,
            this.columnHeader12,
            this.columnHeader13,
            this.columnHeader14});
            this.lvTKDauSach.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lvTKDauSach.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lvTKDauSach.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(36)))), ((int)(((byte)(64)))));
            this.lvTKDauSach.FullRowSelect = true;
            this.lvTKDauSach.GridLines = true;
            this.lvTKDauSach.HideSelection = false;
            this.lvTKDauSach.Location = new System.Drawing.Point(3, 3);
            this.lvTKDauSach.Name = "lvTKDauSach";
            this.lvTKDauSach.Size = new System.Drawing.Size(967, 619);
            this.lvTKDauSach.TabIndex = 56;
            this.lvTKDauSach.UseCompatibleStateImageBehavior = false;
            this.lvTKDauSach.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "Mã Đầu Sách";
            this.columnHeader1.Width = 66;
            // 
            // columnHeader9
            // 
            this.columnHeader9.Text = "Tên đầu sách";
            this.columnHeader9.Width = 180;
            // 
            // columnHeader10
            // 
            this.columnHeader10.Text = "Tác giả";
            this.columnHeader10.Width = 190;
            // 
            // columnHeader11
            // 
            this.columnHeader11.Text = "Ngôn ngữ";
            this.columnHeader11.Width = 130;
            // 
            // columnHeader12
            // 
            this.columnHeader12.Text = "Nhà xuất bản";
            this.columnHeader12.Width = 150;
            // 
            // columnHeader13
            // 
            this.columnHeader13.Text = "Thể loại";
            this.columnHeader13.Width = 150;
            // 
            // columnHeader14
            // 
            this.columnHeader14.Text = "Số cuốn sách";
            this.columnHeader14.Width = 130;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.lvTKCuonSach);
            this.tabPage2.Location = new System.Drawing.Point(4, 32);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(973, 625);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Theo cuốn sách";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // lvTKCuonSach
            // 
            this.lvTKCuonSach.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(250)))), ((int)(((byte)(248)))), ((int)(((byte)(245)))));
            this.lvTKCuonSach.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader2,
            this.columnHeader3,
            this.columnHeader4,
            this.columnHeader5,
            this.columnHeader6,
            this.columnHeader8});
            this.lvTKCuonSach.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lvTKCuonSach.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lvTKCuonSach.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(36)))), ((int)(((byte)(64)))));
            this.lvTKCuonSach.FullRowSelect = true;
            this.lvTKCuonSach.GridLines = true;
            this.lvTKCuonSach.HideSelection = false;
            this.lvTKCuonSach.Location = new System.Drawing.Point(3, 3);
            this.lvTKCuonSach.Name = "lvTKCuonSach";
            this.lvTKCuonSach.Size = new System.Drawing.Size(967, 619);
            this.lvTKCuonSach.TabIndex = 57;
            this.lvTKCuonSach.UseCompatibleStateImageBehavior = false;
            this.lvTKCuonSach.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "STT";
            this.columnHeader2.Width = 70;
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "Tên đầu sách";
            this.columnHeader3.Width = 250;
            // 
            // columnHeader4
            // 
            this.columnHeader4.Text = "Tập";
            this.columnHeader4.Width = 110;
            // 
            // columnHeader5
            // 
            this.columnHeader5.Text = "Lần tái bản";
            this.columnHeader5.Width = 150;
            // 
            // columnHeader6
            // 
            this.columnHeader6.Text = "Số trang";
            this.columnHeader6.Width = 200;
            // 
            // columnHeader8
            // 
            this.columnHeader8.Text = "Số cuốn sách";
            this.columnHeader8.Width = 210;
            // 
            // tabPage4
            // 
            this.tabPage4.Controls.Add(this.lvTheLoai);
            this.tabPage4.Location = new System.Drawing.Point(4, 32);
            this.tabPage4.Name = "tabPage4";
            this.tabPage4.Size = new System.Drawing.Size(973, 625);
            this.tabPage4.TabIndex = 3;
            this.tabPage4.Text = "Theo thể loại";
            this.tabPage4.UseVisualStyleBackColor = true;
            // 
            // lvTheLoai
            // 
            this.lvTheLoai.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(250)))), ((int)(((byte)(248)))), ((int)(((byte)(245)))));
            this.lvTheLoai.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader20,
            this.columnHeader21,
            this.columnHeader23,
            this.columnHeader24});
            this.lvTheLoai.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lvTheLoai.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lvTheLoai.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(36)))), ((int)(((byte)(64)))));
            this.lvTheLoai.FullRowSelect = true;
            this.lvTheLoai.GridLines = true;
            this.lvTheLoai.HideSelection = false;
            this.lvTheLoai.Location = new System.Drawing.Point(0, 0);
            this.lvTheLoai.Name = "lvTheLoai";
            this.lvTheLoai.Size = new System.Drawing.Size(973, 625);
            this.lvTheLoai.TabIndex = 59;
            this.lvTheLoai.UseCompatibleStateImageBehavior = false;
            this.lvTheLoai.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader20
            // 
            this.columnHeader20.Text = "STT";
            // 
            // columnHeader21
            // 
            this.columnHeader21.Text = "Tên thể loại";
            this.columnHeader21.Width = 287;
            // 
            // columnHeader23
            // 
            this.columnHeader23.Text = "Số đầu sách";
            this.columnHeader23.Width = 308;
            // 
            // columnHeader24
            // 
            this.columnHeader24.Text = "Số cuốn sách";
            this.columnHeader24.Width = 454;
            // 
            // ThongKe
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.ClientSize = new System.Drawing.Size(981, 661);
            this.Controls.Add(this.tabControl1);
            this.Controls.Add(this.button3);
            this.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ForeColor = System.Drawing.Color.White;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.SizableToolWindow;
            this.Name = "ThongKe";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Thống kê";
            this.Load += new System.EventHandler(this.ThongKe_Load);
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage2.ResumeLayout(false);
            this.tabPage4.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.ListView lvTKDauSach;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.ColumnHeader columnHeader9;
        private System.Windows.Forms.ColumnHeader columnHeader10;
        private System.Windows.Forms.ColumnHeader columnHeader11;
        private System.Windows.Forms.ColumnHeader columnHeader12;
        private System.Windows.Forms.ColumnHeader columnHeader13;
        private System.Windows.Forms.ColumnHeader columnHeader14;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.ListView lvTKCuonSach;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        private System.Windows.Forms.ColumnHeader columnHeader4;
        private System.Windows.Forms.ColumnHeader columnHeader5;
        private System.Windows.Forms.ColumnHeader columnHeader6;
        private System.Windows.Forms.ColumnHeader columnHeader8;
        private System.Windows.Forms.TabPage tabPage4;
        private System.Windows.Forms.ListView lvTheLoai;
        private System.Windows.Forms.ColumnHeader columnHeader20;
        private System.Windows.Forms.ColumnHeader columnHeader21;
        private System.Windows.Forms.ColumnHeader columnHeader23;
        private System.Windows.Forms.ColumnHeader columnHeader24;
    }
}