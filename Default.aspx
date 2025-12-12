<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Lab_CSDL.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Trang chủ</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%; border-collapse: collapse;">
                <tr>
                    <td class="auto-style1" style="padding: 20px;">
                        <h2 style="margin: 0; font-weight: bold;">DEMO QUẢN LÝ NHÂN VIÊN</h2>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 20px;">
                        <table style="width: 400px; margin: 0 auto; border: 1px solid #ccc; border-collapse: collapse;">
                            <tr>
                                <td style="padding: 10px; background-color: #f5f5f5;">
                                    <strong>Chức năng</strong>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 10px;">
                                    <a href="qlNhanVien.aspx" style="text-decoration: none; color: blue;">
                                        <img src="Images/icon_users.gif" alt="Quản lý nhân viên" style="vertical-align: middle; margin-right: 5px;" />
                                        <span style="text-decoration: underline;">Quản lý nhân viên</span>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 10px;">
                                    <a href="qlPhongBan.aspx" style="text-decoration: none; color: blue;">
                                        <img src="Images/Group.gif" alt="Quản lý phòng ban" style="vertical-align: middle; margin-right: 5px;" />
                                        <span style="text-decoration: underline;">Quản lý phòng ban</span>
                                    </a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
