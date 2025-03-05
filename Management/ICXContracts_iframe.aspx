<%@ page language="C#" autoeventwireup="true" inherits="management_ICXContracts_iframe, App_Web_n3rnr3dz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <title>Import ICX Contract</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Panel ID="Panelmain" runat="server" Visible="true">
        <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
            <tbody>
                <tr>
                    <td class="lt1" style="height: 22px">
                        <h5>
                            Imports ICXContracts
                        </h5>
                    </td>
                </tr>
                
                 
                <tr>
                    <td class="lt brdr" style="height: 280px">
                        <table cellspacing="0" cellpadding="0" align="center" style="width: 353px; height: 202px">
                            <tbody>
                                <tr>
                                    <td class="lt">
                                        <table class="width100per" cellspacing="12" cellpadding="0" style="width: 85%">
                                            <tbody>
                                            
                                            
                                                
                                                 
                                                  
                                            
                                                 
                                                    
                                                <tr>
                                                    <%--<td class="lt" style="height: 22px">
                                                    </td>--%>
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
                                                <%--<tr style="display: none">
                                                    <td>
                                                        <asp:TextBox ID="txtTableName" runat="server" Width="272px">TempTable</asp:TextBox></td>
                                                    <td style="width: 278px">
                                                        <asp:TextBox ID="txtCSVDir" runat="server" Width="272px">Import/Table</asp:TextBox></td>
                                                    <td>
                                                    </td>
                                                </tr>--%>
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
