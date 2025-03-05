<%@ page language="C#" autoeventwireup="true" inherits="management_BillPrintingNseCM, App_Web_vvdfezxa" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>BillPrinting NSE-CM</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script language="javascript" type="text/javascript">
      var prm = Sys.WebForms.PageRequestManager.getInstance(); 
       prm.add_initializeRequest(InitializeRequest); 
       prm.add_endRequest(EndRequest);  
       var postBackElement; 
       function InitializeRequest(sender, args) 
       { 
          if (prm.get_isInAsyncPostBack()) 
          args.set_cancel(true);
          postBackElement = args.get_postBackElement(); 
          $get('UpdateProgress1').style.display = 'block';          
       }
       function EndRequest(sender, args) 
       { 
          $get('UpdateProgress1').style.display = 'none'; 
          divscroll(sessionvalue);
       }
       function height()
        {
            if(document.body.scrollHeight>=500)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '500px';
            window.frameElement.Width = document.body.scrollWidth;
        }    
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Generate Bill</span></strong>
                    </td>
                </tr>
            </table>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="36000">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table class="TableMain100">
                        <tr>
                            <td align="center">
                                <table>                                    
                                    <tr>
                                        <td class="EcoheadCon_">
                                            Generate/Delete :</td>
                                        <td style="text-align: left">
                                            <asp:DropDownList ID="ddlGenerate" runat="server" Width="200px">
                                                <asp:ListItem Value="1">Generate</asp:ListItem>
                                                <asp:ListItem Value="2">Delete</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: left">
                                            <asp:Button ID="btnGenerate" runat="server" Text="Generate" CssClass="btnUpdate"
                                                OnClick="btnGenerate_Click" Height="24px" Width="70px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <table>
                <tr>
                    <td>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <ProgressTemplate>
                                <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                    top: 50%; background-color: white; layer-background-color: white; height: 80;
                                    width: 150;'>
                                    <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loading..</strong></font></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
