namespace QuanLyThuVien.Form_NhanVien
{
    partial class ThongKeNV
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
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.ListViewThongKe1 = new System.Windows.Forms.ListView();
            this.columnHeader3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader4 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader5 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.ListViewThongKe2 = new System.Windows.Forms.ListView();
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader6 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControl1.Location = new System.Drawing.Point(0, 0);
            this.tabControl1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.Padding = new System.Drawing.Point(6, 0);
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(536, 450);
            this.tabControl1.TabIndex = 2;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.ListViewThongKe1);
            this.tabPage1.Location = new System.Drawing.Point(4, 23);
            this.tabPage1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.tabPage1.Size = new System.Drawing.Size(528, 423);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Thống kê theo chức vụ";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // ListViewThongKe1
            // 
            this.ListViewThongKe1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(189)))), ((int)(((byte)(201)))), ((int)(((byte)(217)))));
            this.ListViewThongKe1.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader3,
            this.columnHeader4,
            this.columnHeader5});
            this.ListViewThongKe1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ListViewThongKe1.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ListViewThongKe1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(36)))), ((int)(((byte)(64)))));
            this.ListViewThongKe1.FullRowSelect = true;
            this.ListViewThongKe1.GridLines = true;
            this.ListViewThongKe1.HideSelection = false;
            this.ListViewThongKe1.Location = new System.Drawing.Point(3, 2);
            this.ListViewThongKe1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.ListViewThongKe1.Name = "ListViewThongKe1";
            this.ListViewThongKe1.Size = new System.Drawing.Size(522, 419);
            this.ListViewThongKe1.TabIndex = 27;
            this.ListViewThongKe1.UseCompatibleStateImageBehavior = false;
            this.ListViewThongKe1.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "Mã chức vụ";
            this.columnHeader3.Width = 130;
            // 
            // columnHeader4
            // 
            this.columnHeader4.Text = "Tên chức vụ";
            this.columnHeader4.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.columnHeader4.Width = 154;
            // 
            // columnHeader5
            // 
            this.columnHeader5.Text = "Số lượng nhân viên";
            this.columnHeader5.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.columnHeader5.Width = 226;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.ListViewThongKe2);
            this.tabPage2.Location = new System.Drawing.Point(4, 23);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(528, 423);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Thống kê hoạt động nhân viên";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // ListViewThongKe2
            // 
            this.ListViewThongKe2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(189)))), ((int)(((byte)(201)))), ((int)(((byte)(217)))));
            this.ListViewThongKe2.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1,
            this.columnHeader2,
            this.columnHeader6});
            this.ListViewThongKe2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ListViewThongKe2.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ListViewThongKe2.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(36)))), ((int)(((byte)(64)))));
            this.ListViewThongKe2.FullRowSelect = true;
            this.ListViewThongKe2.GridLines = true;
            this.ListViewThongKe2.HideSelection = false;
            this.ListViewThongKe2.Location = new System.Drawing.Point(3, 3);
            this.ListViewThongKe2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.ListViewThongKe2.Name = "ListViewThongKe2";
            this.ListViewThongKe2.Size = new System.Drawing.Size(522, 417);
            this.ListViewThongKe2.TabIndex = 28;
            this.ListViewThongKe2.UseCompatibleStateImageBehavior = false;
            this.ListViewThongKe2.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "Mã nhân viên";
            this.columnHeader1.Width = 143;
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "Họ và tên";
            this.columnHeader2.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.columnHeader2.Width = 201;
            // 
            // columnHeader6
            // 
            this.columnHeader6.Text = "Số cuốn sách";
            this.columnHeader6.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.columnHeader6.Width = 169;
            // 
            // ThongKeNV
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(536, 450);
            this.Controls.Add(this.tabControl1);
            this.Name = "ThongKeNV";
            this.Text = "ThongKeNV";
            this.Load += new System.EventHandler(this.ThongKeNV_Load);
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage2.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.ListView ListViewThongKe1;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        private System.Windows.Forms.ColumnHeader columnHeader4;
        private System.Windows.Forms.ColumnHeader columnHeader5;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.ListView ListViewThongKe2;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private System.Windows.Forms.ColumnHeader columnHeader6;
    }
}