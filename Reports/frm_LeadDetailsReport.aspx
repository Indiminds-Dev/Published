<%@ page language="C#" autoeventwireup="true" inherits="Reports_frm_LeadDetailsReport, App_Web_yvy99of_" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript">
    function height()
    {
    if(document.body.scrollHeight>=350)
    {
         window.frameElement.height = document.body.scrollHeight;
    }
    else
    {
        window.frameElement.height = '350px';
    }
      
     window.frameElement.width = document.body.scrollWidth;
     }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td style="width:2%">
                    <asp:Label ID="Label1" runat="server" Text="Form" CssClass="mylabel1"></asp:Label></td>
                <td style="width:20%">
                    <dxe:aspxdateedit id="ASPxFromDate" runat="server" editformat="custom" usemaskbehavior="True">
                        <ButtonStyle Width="13px">
                        </ButtonStyle>
                    </dxe:aspxdateedit>
                </td>
                <td style="width:2%">
                    <asp:Label ID="Label2" runat="server" Text="To" CssClass="mylabel1"></asp:Label></td>
                <td style="width:20%">
                    <dxe:aspxdateedit id="ASPxToDate" runat="server" editformat="custom" usemaskbehavior="True">
                        <ButtonStyle Width="13px">
                        </ButtonStyle>
                    </dxe:aspxdateedit>
                </td>
                <td>
                    <asp:Button ID="btnShow" runat="server" Text="Show" CssClass="btnUpdate" OnClick="btnShow_Click" />
                    <asp:DropDownList ID="ddlExport" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged"
                        Width="113px">
                        <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                        <asp:ListItem Value="E">Excel</asp:ListItem>
                        <asp:ListItem Value="P">PDF</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td colspan="5">
                    <div id="MainContainer" runat="server" visible="false" style="border: solid 1px black">
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
