<%@ page language="C#" autoeventwireup="true" inherits="Reports_mtest3, App_Web_91unyima" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ScriptManager ID="sm" runat="server" EnablePartialRendering="true" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
        <asp:AsyncPostBackTrigger ControlID="Button2" />
        <asp:AsyncPostBackTrigger ControlID="Button3" />
        </Triggers>
        <ContentTemplate>
            
            <asp:Label ID="Label1" runat="server"></asp:Label><%=DateTime .Now %><br />
            <asp:Button ID="Button1" runat="server" Text="Button1" OnClick="Button1_Click" />
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
            Processing...
            </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:Button ID="Button4" runat="server" Text="Button4" OnClick="Button1_Click"/>
        
        </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button1_Click"/>
        <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button1_Click"/>
    </div>
    </form>
</body>
</html>
