<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="qlPhongBan.aspx.cs" Inherits="Lab_CSDL.qlPhongBan" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Quản lý phòng ban</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .header-title {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 30px;
            color: #333;
        }

        .main-container {
            width: 80%;
            margin: 0 auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .dropdown-box {
            text-align: center;
            margin-bottom: 20px;
        }

        .dropdown-box label {
            font-size: 16px;
            margin-right: 10px;
        }

        .dropdown-box select {
            padding: 10px;
            font-size: 16px;
            width: 250px;
            margin-top: 10px;
        }

        .gridview {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .gridview th,
        .gridview td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        .gridview th {
            background-color: #507CD1;
            color: white;
            font-weight: bold;
        }

        .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .gridview tr:hover {
            background-color: #ddd;
        }

        .gridview .delete-btn {
            background-color: #ff4d4d;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }

        .gridview .delete-btn:hover {
            background-color: #ff1a1a;
        }

        .footer {
            text-align: center;
            margin-top: 30px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-container">
            <h2 class="header-title">QUẢN LÝ PHÒNG BAN</h2>
            <hr />

            <div class="dropdown-box">
                <label for="DLPhongBan"><strong>Phòng ban:</strong></label>
                <asp:DropDownList ID="DLPhongBan" runat="server" DataSourceID="DSPhongBan"
                    DataTextField="TenPhong" DataValueField="MaPhong" AutoPostBack="True" Width="250px">
                </asp:DropDownList>
            </div>

            <asp:SqlDataSource ID="DSPhongBan" runat="server" 
                ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" 
                SelectCommand="SELECT * FROM [Phong]">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="DSNhanVienPhongBan" runat="server" 
                ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" 
                SelectCommand="SELECT * FROM [NhanVien] WHERE ([MaPhong] = @MaPhong)" 
                DeleteCommand="DELETE FROM [NhanVien] WHERE [MaNV] = @MaNV">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DLPhongBan" Name="MaPhong" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="MaNV" Type="String" />
                </DeleteParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="gvNhanVienPhongBan" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="MaNV" DataSourceID="DSNhanVienPhongBan" class="gridview" 
                AllowPaging="True" PageSize="10">
                <Columns>
                    <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" InsertVisible="False" 
                        ReadOnly="True" SortExpression="MaNV" />
                    <asp:BoundField DataField="HoNV" HeaderText="Họ nhân viên" SortExpression="HoNV" />
                    <asp:BoundField DataField="TenNV" HeaderText="Tên nhân viên" SortExpression="TenNV" />
                    <asp:CheckBoxField DataField="PHAI" HeaderText="Giới tính" SortExpression="PHAI" />
                    <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh" 
                        SortExpression="NgaySinh" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="NoiSinh" HeaderText="Nơi sinh" SortExpression="NoiSinh" />
                    <asp:BoundField DataField="MaPhong" HeaderText="Mã phòng" SortExpression="MaPhong" />
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                </Columns>
            </asp:GridView>

            <div class="footer">
                <a href="Default.aspx">Go Back</a>
            </div>
        </div>
    </form>
</body>
</html>
