<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebRole1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
     <script type="text/javascript" src="Scripts/angular.js"> </script>
    <script type="text/javascript" src="AppScripts/App.js"> </script>
        
    <link rel="stylesheet" href="css/reset.css" />

    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900' />
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' />

        <link rel="stylesheet" href="css/style.css" />
    



</head>
<body>
    <div class="container">
    <h1 style="margin-left:160px;margin-top:30px; border-left:none;">Login</h1>
    <form id="form1" runat="server" style="margin-left:50px;margin-top:50px;">
    <div class="input-container"></div>
        
         <asp:Label ID="Label1"  runat="server" Text="User Name:"></asp:Label>&nbsp;&nbsp;<asp:TextBox ID="txb1" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Password: "></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txb2" TextMode="Password" runat="server" />
        <br />
        <div style="margin-left:120px;margin-top:30px;">
        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
        </div>
        <br />
        <br />
        <asp:Label ID="lblresult" runat="server" ></asp:Label>
        </form>
        <div class="pen-title">
            </div>
            </div>
    </body>

