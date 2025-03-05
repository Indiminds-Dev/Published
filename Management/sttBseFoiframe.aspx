<%@ page language="C#" autoeventwireup="true" inherits="management_Sttcmiframe, App_Web_8qixh_8w" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
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
        if(document.body.scrollHeight>=250)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '250px';
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
                            Imports STT Files
                        </h5>
                    </td>
                </tr>
                
                 
                <tr>
                    <td class="lt brdr">
                        <table cellspacing="0" cellpadding="0" align="center">
                            <tbody>
                                <tr>
                                    <td class="lt">
                                        <table class="width100per" cellspacing="12" cellpadding="0">
                                            <tbody>
                                                     <tr>
                                                   
                                                    <td class="lt" style="height: 18px">
                                                        <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                            Font-Bold="True" ForeColor="Green" />
                                                    </td>
                                                </tr>
                                           
                                                 
                                                  <tr>
                                                   
                                                    <td class="lt" >
                                                        <table>
                                                            <tr>
                                                                <td style="height: 16px"><B>DSTTM_TMCode_YYYYMMDD.TMCode</B></td>
                                                            </tr>
                                                           
                                                        </table>
                                                    </td>
                                                </tr>
                                         
                                            
                                                <tr>
                                                    
                                                    <td align="right" >
                                                        <asp:FileUpload ID="OFDSelectFile" runat="server" Width="272px" />
                                                    </td>
                                                </tr>
                                   <tr>
                                                    <td align="right" valign="middle" colspan="2">
                                                        <table cellspacing="0" cellpadding="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td valign="top" align="left" >
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
