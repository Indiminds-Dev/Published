<%@ page language="C#" autoeventwireup="true" inherits="management_Import_cdslBODetails, App_Web_leuczwkw" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div align="center">
  <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=350)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '350px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function ChangeFormat(obj)
    {
        document.getElementById("B_FileFormat").InnerHTML=obj.value;
    }

    
    </script>
 <asp:Panel ID="Panelmain" runat="server" Visible="true">
        <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
            <tbody>
                <tr>
                    <td class="lt1">
                        <h5>
                            Import BO Details                        </h5>
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
                                                    <td class="lt" style="height: 22px" colspan="2">
                                                    
                                                    </td>
                                                </tr>
                                               
                                               
                                                <tr>
                                                    <td class="lt" style="height: 22px">
                                                    </td>
                                                    <td align="left" style="width: 278px; height: 22px;">
                                                        <asp:Label ID="importstatus" runat="server" Font-Size="Larger" Font-Names="Arial"
                                                            Font-Bold="True" ForeColor="SeaGreen" />
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lt" style="height: 22px">Choose Format
                                                    </td>
                                                    <td align="left" style="width: 278px; height: 22px;">
                                                        <asp:DropDownList ID="ddlChooseFormat" runat="server"
                                                        onchange="ChangeFormat(this)">
                                                        <asp:ListItem Text="DPA5" Value="DPA5"></asp:ListItem>
                                                        <asp:ListItem Text="DPS8" Value="DPS8"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lt" valign="top"  >
                                                    File Path :
                                                    </td>
                                                    <td align="left" style="width: 278px;"  >
                                                    <asp:FileUpload ID="OFDSelectFile" runat="server" Width="272px"   />
                                                        Please Browse <b id="B_FileFormat">DPA5/ DPS8</b> Type File.
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td class="lt" style="height: 22px">
                                                    </td>
                                                    <td align="left" style="width: 278px; height: 22px" valign="top">
                                                        <asp:CheckBox ID="CheckBox1" runat="server" />Update
                                                     Signature</td>
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
                                                <tr style="display: none">
                                                    <td>
                                                        </td>
                                                    <td style="width: 278px">
                                                        </td>
                                                    <td>
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
