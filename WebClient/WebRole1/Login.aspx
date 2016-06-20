<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebRole1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
     <script type="text/javascript" src="Scripts/angular.js"> </script>
    <script type="text/javascript" src="AppScripts/App.js"> </script>
    



</head>
<body>
    <form id="form1" runat="server" class="form-horizontal" style="margin-left:50px;margin-top:50px;">
    <div>
        
         <asp:Label ID="Label1"  runat="server" Text="User Name:"></asp:Label>&nbsp;&nbsp;<asp:TextBox ID="txb1" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Password: "></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txb2" TextMode="Password" runat="server" />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Label ID="lblresult" runat="server" ></asp:Label>


    </div>
    </form>
</body>
</html>

