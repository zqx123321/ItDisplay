<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Tongji.aspx.cs" Inherits="Tongji" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>标题</th>
                            <th>类型</th>
                            <th>意向人数</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="Data" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("name") %></td>
                                    <td><%#Eval("cate") %></td>
                                    <td><%#Eval("number") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                    </tbody>
                </table>
            </div>
        <div class="col-md-2"></div>
        </div>
    </form>
</body>
</html>
