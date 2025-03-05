<%@ page language="C#" autoeventwireup="true" inherits="management_FoPosition, App_Web_vvdfezxa" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Fo Position</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <script language="javascript" type="text/javascript">

    function height()
    { 
        if(document.body.scrollHeight>250)
        {
            window.frameElement.height = document.body.scrollHeight;
            window.frameElement.widht = document.body.scrollWidht;
        }
        else
        {
            window.frameElement.height = '250px';
            window.frameElement.widht = document.body.scrollWidht;
        }
    }
 function NORECORD(obj)
  {
      alert('No Difference Found!!');
      height();
  }

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panelmain" runat="server" Visible="true" HorizontalAlign="Center">
                <table id="tbl_main" class="login" cellspacing="0" cellpadding="0"  style="border: solid 1px blue; width: 402px;">
                    
                    <tbody>
                    <tr>
                            <td class="EHEADER">
                                <span style="color: blue"><strong>FO Position</strong></span></td>
                            
                    </tr>
                        <tr>
                            <td class="lt">
                                <table class="width100per" cellspacing="12" cellpadding="0" style="width: 100%">
                                    <tbody>
                                    <tr>
                                         <td class="gridcellleft" colspan="2">
                                                <span style="color: #000099; text-align: left;">Select Type</span></td>
                                         <td>
                                            <asp:DropDownList ID="ddlPosition" runat="server" Width="102px">
                                                <asp:ListItem Value="Select ">Select</asp:ListItem>
                                                <asp:ListItem>Import</asp:ListItem>
                                                <asp:ListItem>Compare</asp:ListItem>
                                            </asp:DropDownList>
                                            </td>
                                    </tr>
                                        <tr>
                                            <td class="gridcellleft" colspan="2">
                                                <span style="color: #000099; text-align: left;">Position File</span></td>
                                            <td align="right" style="width: 278px">
                                                <asp:FileUpload ID="FOTradeSelectFile" runat="server" Width="272px" Height="21px" />
                                            </td>
                                        </tr>
                                        <tr>
                                    
                                            <td align="right" colspan="2">
                                                 <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" OnClick="BtnSave_Click"
                                                                Width="84px" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
             </asp:Panel>
            </div>
    </form>
</body>
</html>

