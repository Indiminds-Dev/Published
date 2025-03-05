<%@ page language="C#" autoeventwireup="true" inherits="management_Closingrateiframe, App_Web_e81qjzgk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server"> 
<link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
 <title>Untitled Page</title>
<script language="javascript" type="text/javascript">
   
      function SignOff()
    {
        window.parent.SignOff();
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
    <div align="center">
      <asp:Panel ID="Panelmain" runat="server" Visible="true">
        <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
            <tbody>
                <tr>
                    <td class="lt1">
                        <h5>
                            Imports Closing Rates & Contract Lots Updation Files
                        </h5>
                    </td>
                </tr>
                <tr>
                    <td class="lt brdr" style="height: 280px">
                        <table cellspacing="0" cellpadding="0" align="center">
                            <tbody>
                                <tr>
                                    <td class="lt">
                                        <table class="width100per" cellspacing="12" cellpadding="0">
                                            <tbody>
                                                <tr>
                                                    <td class="lt" style="height: 22px">
                                                    </td>
                                                    <td class="lt" style="width: 278px; height: 22px;">
                                                        <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                            Font-Bold="True" ForeColor="Green" />
                                                    </td>
                                                </tr>
                                                <tr id="trYesNo" runat="server">
                                                    <td style="height: 22px">
                                                    </td>
                                                    <td  >
                                                        <table width="100%">
                                                            <tr>
                                                                <td align="center" >
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td  >
                                                                                <asp:Label ID="lblYesNo"  runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td >
                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            <asp:Button ID="btnYes" runat="server" CssClass="btn" Text="Yes" OnClick="btnYes_Click" />
                                                                                        </td>
                                                                                        <td align="left">
                                                                                            <asp:Button ID="btnNo" runat="server" CssClass="btn" Text="No" OnClick="btnNo_Click" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                           
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 22px">
                                                    </td>
                                                    <td class="lt" style="width: 278px; height: 22px;">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                  
                                                                    <asp:DropDownList ID="ddlFiles" runat="server" Width="269px" OnSelectedIndexChanged="ddlFiles_SelectedIndexChanged" AutoPostBack="True">
                                                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                                                        <asp:ListItem Value="1">FODDMONYYYYBhav.csv</asp:ListItem>
                                                                        <asp:ListItem Value="2">F_CN01_DDMMYYYY.csv</asp:ListItem>
                                                                        <asp:ListItem Value="3">DDMM0000.MS Files</asp:ListItem>
                                                                        <asp:ListItem Value="4">DDMM0000.MD Files</asp:ListItem>
                                                                        <asp:ListItem Value="5">Update Market Lots</asp:ListItem>
                                                                        <asp:ListItem Value="6">FnO Common Bhawcopy</asp:ListItem>
                                                                        <asp:ListItem Value="7">FnO Daily Settlement Prices</asp:ListItem>
                                                                        <asp:ListItem Value="8">BSE's EQD_SET_PRICE_DDMMYYYY</asp:ListItem>
                                                                        <asp:ListItem Value="9">UDiFF Common Bhavcopy</asp:ListItem>
                                                                    </asp:DropDownList></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblMessage" runat="server" Text="" Width="263px"></asp:Label></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            
                                                <tr>
                                                    <td class="lt" style="height: 22px">
                                                        <asp:HiddenField ID="hdnChk" runat="server" Value="0" />
                                                    </td>
                                                    <td align="right" style="width: 278px; height: 22px;">
                                                        <asp:FileUpload ID="OFDSelectFile" runat="server" Width="272px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="middle" colspan="2">
                                                        <table cellspacing="0" cellpadding="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td valign="top" align="left" style="height: 19px">
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
