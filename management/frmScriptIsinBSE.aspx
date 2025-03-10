<%@ page language="C#" autoeventwireup="true" inherits="management_frmScriptIsinBSE, App_Web_6_wayyot" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

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
    </script>
    </head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center">
        <asp:Panel ID="Panelmain" runat="server" Visible="true">
        <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
            <tbody>
                <tr>
                    <td class="lt1" style="height: 22px">
                        <h5>
                            Imports BSE Scrips Files
                        </h5>
                    </td>
                </tr>
                
                 
                <tr>
                    <td class="lt brdr" style="height: 280px">
                        <table cellspacing="0" cellpadding="0" align="center">
                            <tbody>
                                <tr>
                                    <td class="lt" style="height: 267px">
                                        <table class="width100per" cellspacing="12" cellpadding="0">
                                            <tbody>
                                            
                                            <tr id="trYesNo" runat="server">
                                                    <td style="height: 22px; width: 283px;">
                                                                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                                    </asp:ScriptManager> 
                                                        <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                            Font-Bold="True" ForeColor="Green" />
                                                    </td>
                                                  
                                                </tr>
                                              
                                                 
                                                  <tr>
                                                    
                                                    <td class="lt" >
                                                        
                                                       
                                                        <table>
                                                        
                                                            <tr>
                                                                <td >
                                                                   <asp:UpdatePanel ID="UpdatePanel1" runat="server">                                         
                                                            <ContentTemplate>
                                                            <br />
                                                         <asp:Label id="lblMessage" runat="server" Width="270px"></asp:Label><br />
                                                           <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Select SCRIP.txt file"
                                                               Width="177px"></asp:Label>
                                                            </ContentTemplate>
                                                      
                                                       </asp:UpdatePanel>
                                                                    <strong>Files Avialable At :<br />
                                                                        <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" Width="153px" Font-Bold="True" ForeColor="#0000C0" NavigateUrl="http://www.bseindia.com/help">http://www.bseindia.com/help</asp:HyperLink></strong></td>
                                                            </tr>
                                                           
                                                            <tr>
                                                                <td >
                                                        <asp:FileUpload ID="OFDSelectFile" runat="server" Width="272px" Height="23px"/>
                                                        </td>
                                                        
                                               
                                                            </tr>
                                                      
                                                       <tr>
                                                            <td>
                                                                <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" OnClick="BtnSave_Click" Width="84px" />
                                                            </td>
                                                      </tr>
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
