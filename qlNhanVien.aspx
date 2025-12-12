<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="qlNhanVien.aspx.cs" Inherits="Lab_CSDL.qlNhanVien" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Quản lý nhân viên</title>

    <style>
        body { font-family: Arial; }
        .page-title { text-align: center; font-size: 26px; font-weight: bold; margin-top: 20px; }
        .grid-wrapper { width: 900px; margin: auto; margin-top: 20px; }
        .gridview table { width: 100%; border-collapse: collapse; margin: 0 auto; }
        .gridview th { background-color: #507CD1; color: white; font-weight: bold; text-align: center; padding: 8px; }
        .gridview td { padding: 6px; }
        .gridview .edit-buttons input, .gridview .delete-buttons input { padding: 4px 10px; font-size: 13px; cursor: pointer; }
        .gridview .edit-row { background-color: #FFFFCC !important; }
        hr { width: 900px; }
        .gridview .aspNetPager { text-align: center; margin: 10px 0; white-space: nowrap; }
        .gridview .aspNetPager a, .gridview .aspNetPager span { margin: 0 1px; padding: 4px 8px; font-size: 14px; text-decoration: none; display: inline-block; border: 1px solid #ccc; border-radius: 3px; }
        .gridview .aspNetPager span { font-weight: bold; background-color: #507CD1; color: white; border-color: #507CD1; }
        .gridview .aspNetPager a:hover { text-decoration: none; background-color: #E0E0E0; }
        .gridview { text-align: center; margin-bottom: 0px; }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <h2 class="page-title">DANH SÁCH NHÂN VIÊN</h2>
        <hr />

        <div class="grid-wrapper">

            <asp:SqlDataSource ID="DSNhanVien" runat="server"
                ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>"
                SelectCommand="SELECT * FROM [NhanVien]"
                DeleteCommand="DELETE FROM [NhanVien] WHERE [MaNV] = @MaNV"
                InsertCommand="INSERT INTO [NhanVien] ([HoNV], [TenNV], [PHAI], [NgaySinh], [NoiSinh], [MaPhong]) VALUES (@HoNV, @TenNV, @PHAI, @NgaySinh, @NoiSinh, @MaPhong)"
                UpdateCommand="UPDATE [NhanVien] SET [HoNV] = @HoNV, [TenNV] = @TenNV, [PHAI] = @PHAI, [NgaySinh] = @NgaySinh, [NoiSinh] = @NoiSinh, [MaPhong] = @MaPhong WHERE [MaNV] = @MaNV">

                <DeleteParameters>
                    <asp:Parameter Name="MaNV" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="HoNV" Type="String" />
                    <asp:Parameter Name="TenNV" Type="String" />
                    <asp:Parameter Name="PHAI" Type="Boolean" />
                    <asp:Parameter Name="NgaySinh" Type="DateTime" />
                    <asp:Parameter Name="NoiSinh" Type="String" />
                    <asp:Parameter Name="MaPhong" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="HoNV" Type="String" />
                    <asp:Parameter Name="TenNV" Type="String" />
                    <asp:Parameter Name="PHAI" Type="Boolean" />
                    <asp:Parameter Name="NgaySinh" Type="DateTime" />
                    <asp:Parameter Name="NoiSinh" Type="String" />
                    <asp:Parameter Name="MaPhong" Type="String" />
                    <asp:Parameter Name="MaNV" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="gvNhanVien" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="MaNV"
                DataSourceID="DSNhanVien"
                CssClass="gridview"
                AllowPaging="True"
                PageSize="10"
                PagerSettings-Mode="NumericFirstLast"  
                PagerSettings-Position="Bottom"       
                PagerStyle-CssClass="aspNetPager"
                PagerStyle-HorizontalAlign="Center"
                RowStyle-CssClass="row-style"
                AlternatingRowStyle-BackColor="#FFFFFF"
                RowStyle-BackColor="#EFF3FB"
                EditRowStyle-CssClass="edit-row"
                HeaderStyle-Font-Bold="True"
                HeaderStyle-ForeColor="White"
                HeaderStyle-BackColor="#507CD1">
            
                <Columns>
                    <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" ReadOnly="True" />
                    <asp:BoundField DataField="HoNV" HeaderText="Họ nhân viên" />
                    <asp:BoundField DataField="TenNV" HeaderText="Tên nhân viên" />
                    <asp:CheckBoxField DataField="PHAI" HeaderText="Phái" />
                    <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
                    <asp:BoundField DataField="NoiSinh" HeaderText="Nơi sinh" />
                    <asp:BoundField DataField="MaPhong" HeaderText="Mã phòng" />

                    <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="edit-buttons" />
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ControlStyle-CssClass="delete-buttons" />
                </Columns>
            </asp:GridView>

        </div>

        <br />
        <div style="text-align:center;">
            <a href="Default.aspx">Go Back</a>
        </div>

    </form>
</body>
</html>
