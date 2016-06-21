<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MovieList.aspx.cs" Inherits="WebRole1.MovieList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="border:5px;">

        <asp:Label ID="Label1" runat="server" Text="Search movie by name"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txb1" runat="server"></asp:TextBox>
        <asp:Button ID="btn1" runat="server" Text="Search" OnClick="btn1_Click" /><asp:Label ID="lblresult" runat="server" Visible="false"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br /><br /><br /><br />
        <asp:Table  BorderStyle="Solid" CellPadding="10"  ID="tbl1" runat="server"></asp:Table>
        <span id="span1"></span>


    </div>
       
    </form>
</body>
</html>

