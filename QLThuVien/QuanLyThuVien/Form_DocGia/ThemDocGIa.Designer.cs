namespace QuanLyThuVien.Form_DocGia
{
    partial class ThemDocGIa
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
            this.btnHuy = new System.Windows.Forms.Button();
            this.btnAddTTDocGia = new System.Windows.Forms.Button();
            this.txtBoxThemQuequan = new System.Windows.Forms.TextBox();
            this.txtBoxThemSdt = new System.Windows.Forms.TextBox();
            this.txtBoxThemDonVi = new System.Windows.Forms.TextBox();
            this.txtBoxThemTenDocGia = new System.Windows.Forms.TextBox();
            this.lbSuaMaDocGia = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.txtBoxMaDocGia = new System.Windows.Forms.TextBox();
            this.dateTimeNgaySinh = new System.Windows.Forms.DateTimePicker();
            this.SuspendLayout();
            // 
            // btnHuy
            // 
            this.btnHuy.ForeColor = System.Drawing.Color.Black;
            this.btnHuy.Location = new System.Drawing.Point(585, 498);
            this.btnHuy.Margin = new System.Windows.Forms.Padding(4);
            this.btnHuy.Name = "btnHuy";
            this.btnHuy.Size = new System.Drawing.Size(213, 28);
            this.btnHuy.TabIndex = 8;
            this.btnHuy.Text = "Hủy";
            this.btnHuy.UseVisualStyleBackColor = true;
            this.btnHuy.Click += new System.EventHandler(this.btnHuy_Click);
            // 
            // btnAddTTDocGia
            // 
            this.btnAddTTDocGia.ForeColor = System.Drawing.Color.Black;
            this.btnAddTTDocGia.Location = new System.Drawing.Point(321, 498);
            this.btnAddTTDocGia.Margin = new System.Windows.Forms.Padding(4);
            this.btnAddTTDocGia.Name = "btnAddTTDocGia";
            this.btnAddTTDocGia.Size = new System.Drawing.Size(213, 28);
            this.btnAddTTDocGia.TabIndex = 7;
            this.btnAddTTDocGia.Text = "Lưu Thông tin";
            this.btnAddTTDocGia.UseVisualStyleBackColor = true;
            this.btnAddTTDocGia.Click += new System.EventHandler(this.saveDocGiaDB);
            // 
            // txtBoxThemQuequan
            // 
            this.txtBoxThemQuequan.Location = new System.Drawing.Point(505, 441);
            this.txtBoxThemQuequan.Margin = new System.Windows.Forms.Padding(4);
            this.txtBoxThemQuequan.Name = "txtBoxThemQuequan";
            this.txtBoxThemQuequan.Size = new System.Drawing.Size(292, 22);
            this.txtBoxThemQuequan.TabIndex = 6;
            // 
            // txtBoxThemSdt
            // 
            this.txtBoxThemSdt.Location = new System.Drawing.Point(505, 386);
            this.txtBoxThemSdt.Margin = new System.Windows.Forms.Padding(4);
            this.txtBoxThemSdt.Name = "txtBoxThemSdt";
            this.txtBoxThemSdt.Size = new System.Drawing.Size(292, 22);
            this.txtBoxThemSdt.TabIndex = 5;
            // 
            // txtBoxThemDonVi
            // 
            this.txtBoxThemDonVi.Location = new System.Drawing.Point(505, 249);
            this.txtBoxThemDonVi.Margin = new System.Windows.Forms.Padding(4);
            this.txtBoxThemDonVi.Name = "txtBoxThemDonVi";
            this.txtBoxThemDonVi.Size = new System.Drawing.Size(292, 22);
            this.txtBoxThemDonVi.TabIndex = 3;
            // 
            // txtBoxThemTenDocGia
            // 
            this.txtBoxThemTenDocGia.Location = new System.Drawing.Point(505, 175);
            this.txtBoxThemTenDocGia.Margin = new System.Windows.Forms.Padding(4);
            this.txtBoxThemTenDocGia.Name = "txtBoxThemTenDocGia";
            this.txtBoxThemTenDocGia.Size = new System.Drawing.Size(292, 22);
            this.txtBoxThemTenDocGia.TabIndex = 2;
            // 
            // lbSuaMaDocGia
            // 
            this.lbSuaMaDocGia.AutoSize = true;
            this.lbSuaMaDocGia.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbSuaMaDocGia.ForeColor = System.Drawing.Color.White;
            this.lbSuaMaDocGia.Location = new System.Drawing.Point(499, 108);
            this.lbSuaMaDocGia.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbSuaMaDocGia.Name = "lbSuaMaDocGia";
            this.lbSuaMaDocGia.Size = new System.Drawing.Size(0, 29);
            this.lbSuaMaDocGia.TabIndex = 22;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.ForeColor = System.Drawing.Color.White;
            this.label7.Location = new System.Drawing.Point(269, 441);
            this.label7.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(130, 29);
            this.label7.TabIndex = 21;
            this.label7.Text = "Quê quán:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.ForeColor = System.Drawing.Color.White;
            this.label6.Location = new System.Drawing.Point(269, 379);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(70, 29);
            this.label6.TabIndex = 20;
            this.label6.Text = "SĐT:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.White;
            this.label5.Location = new System.Drawing.Point(269, 311);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(133, 29);
            this.label5.TabIndex = 19;
            this.label5.Text = "Ngày sinh:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.White;
            this.label4.Location = new System.Drawing.Point(269, 242);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(92, 29);
            this.label4.TabIndex = 18;
            this.label4.Text = "Đơn vị:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.White;
            this.label3.Location = new System.Drawing.Point(269, 167);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(145, 29);
            this.label3.TabIndex = 17;
            this.label3.Text = "Tên độc giả";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.White;
            this.label2.Location = new System.Drawing.Point(269, 108);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(144, 29);
            this.label2.TabIndex = 16;
            this.label2.Text = "Mã độc giả:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.Yellow;
            this.label1.Location = new System.Drawing.Point(425, 27);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(272, 48);
            this.label1.TabIndex = 15;
            this.label1.Text = "Thêm độc giả";
            // 
            // txtBoxMaDocGia
            // 
            this.txtBoxMaDocGia.Location = new System.Drawing.Point(505, 108);
            this.txtBoxMaDocGia.Margin = new System.Windows.Forms.Padding(4);
            this.txtBoxMaDocGia.Name = "txtBoxMaDocGia";
            this.txtBoxMaDocGia.Size = new System.Drawing.Size(292, 22);
            this.txtBoxMaDocGia.TabIndex = 1;
            // 
            // dateTimeNgaySinh
            // 
            this.dateTimeNgaySinh.Location = new System.Drawing.Point(505, 311);
            this.dateTimeNgaySinh.Margin = new System.Windows.Forms.Padding(4);
            this.dateTimeNgaySinh.Name = "dateTimeNgaySinh";
            this.dateTimeNgaySinh.Size = new System.Drawing.Size(292, 22);
            this.dateTimeNgaySinh.TabIndex = 4;
            // 
            // ThemDocGIa
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(11)))), ((int)(((byte)(63)))), ((int)(((byte)(112)))));
            this.ClientSize = new System.Drawing.Size(1067, 581);
            this.Controls.Add(this.dateTimeNgaySinh);
            this.Controls.Add(this.txtBoxMaDocGia);
            this.Controls.Add(this.btnHuy);
            this.Controls.Add(this.btnAddTTDocGia);
            this.Controls.Add(this.txtBoxThemQuequan);
            this.Controls.Add(this.txtBoxThemSdt);
            this.Controls.Add(this.txtBoxThemDonVi);
            this.Controls.Add(this.txtBoxThemTenDocGia);
            this.Controls.Add(this.lbSuaMaDocGia);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "ThemDocGIa";
            this.Text = "Thêm độc giả";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnHuy;
        private System.Windows.Forms.Button btnAddTTDocGia;
        private System.Windows.Forms.TextBox txtBoxThemQuequan;
        private System.Windows.Forms.TextBox txtBoxThemSdt;
        private System.Windows.Forms.TextBox txtBoxThemDonVi;
        private System.Windows.Forms.TextBox txtBoxThemTenDocGia;
        private System.Windows.Forms.Label lbSuaMaDocGia;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtBoxMaDocGia;
        private System.Windows.Forms.DateTimePicker dateTimeNgaySinh;
    }
}