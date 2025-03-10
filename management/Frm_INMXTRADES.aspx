<%@ page language="C#" autoeventwireup="true" inherits="management_Frm_INMXTRADES, App_Web_v5pngf_u" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
   <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=400)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '400px';
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
                            <td class="lt1" style="height: 22px">
                                <h5>
                                    Imports MAREX .csv Trade Files
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
                                                    <%-- <tr id="trYesNo" runat="server">
                                                    <td style="height: 22px">
                                                    </td>
                                                    <td  >
                                                        <table width="100%">
                                                            <tr>
                                                                <td align="center" >
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td  >
                                                                                <asp:Label ID="lblYesNo"  runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td >
                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        
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
                                                    <td class="lt" style="height: 22px">
                                                    </td>
                                                    <td class="lt" style="width: 278px; height: 22px;">
                                                        <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                            Font-Bold="True" ForeColor="Red" />
                                                    </td>
                                                </tr>
                                                 
                                                  <tr>
                                                    <td style="height: 22px">
                                                    </td>
                                                    <td class="lt" style="width: 278px; height: 22px;">
                                                        <table>
                                                            <tr>
                                                                
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 3px">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>--%>
                                                 
                                                        <tr>
                                                            <td class="lt" style="height: 22px">
                                                            </td>
                                                            <td class="lt" style="width: 278px; height: 22px;">
                                                                <table>
                                                                    <tr>
                                                                        <td style="width: 6px">
                                                                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                                            </asp:ScriptManager>
                                                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                                <ContentTemplate>
                                                                                    <asp:DropDownList ID="ddlFileList" runat="server" Width="192px" AutoPostBack="True"
                                                                                        Height="19px">
                                                                                        <asp:ListItem Value="0">Marex-CSV</asp:ListItem>
                                                                                       
                                                                                    </asp:DropDownList><br />
                                                                                    <asp:Label ID="lblMessage" runat="server" Width="270px"></asp:Label>
                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 6px; height: 18px;">
                                                                            <asp:FileUpload ID="OFDSelectFile" runat="server" Width="272px" />
                                                                        </td>
                                                          
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" OnClick="BtnSave_Click"
                                                                                Width="84px" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lt" style="height: 22px">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lt" style="height: 22px">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            
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
