<%@ page language="C#" autoeventwireup="true" inherits="management_cdslImpSattlement, App_Web_dw8rtpla" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
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
   function showDirectory()
   {
       document.getElementById('ctl00_ContentPlaceHolder3_TextBox1').value=  window.showModalDialog("browseDirectory.aspx",'jain',"dialogHeight: 560px; dialogWidth: 360px; edge: Raised; center: Yes; help: Yes; resizable: Yes; status: No;");   
       return false;   
   }
     
   function OnValueChanged(s, e) 
   {
            Page_ClientValidate(""); // undocumented
   }
      
   function validateDates(s, e)
    {
            var startDate = e1.GetDate();
            var endDate = e2.GetDate();                
            e.IsValid = startDate == null || endDate == null || startDate < endDate;  
            
    }
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
 <asp:Panel ID="Panelmain" runat="server" Visible="true">
        <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
            <tbody>
                <tr>
                    <td class="lt1">
                        <h5>
                            Import Settlement Details                        </h5>
                    </td>
                </tr>
                <tr>
                    <td class="lt brdr" style="height: 280px">
                        <table cellspacing="0" cellpadding="0" align="center">
                            <tbody>
                                <tr>
                                    <td class="lt">
                                        <table class="width100per" cellspacing="8" cellpadding="0">
                                            <tbody>
                                                <tr>
                                                    <td class="lt" style="height: 22px" colspan="2">
                                                    
                                                    </td>
                                                </tr>
                                               
                                               
                                                <tr>
                                                    <td class="lt" style="height: 22px">
                                                    </td>
                                                    <td align="left" style="width: 278px; height: 22px;">
                                                        <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                            Font-Bold="True" ForeColor="Red" />
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lt" colspan="2" valign="top" style="text-align:center; height: 51px;">
                                                    <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                    <td valign="top">
                                                       From :</td>
                                                        <td width="25">
                                                        </td>
                                                    <td>
                                                     <dxe:ASPxDateEdit ID="txtstartDate" runat="server" ClientInstanceName="e1" 
                                                              Width="130px" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" AllowNull="False">
                                                            <ButtonStyle Width="13px">
                                                            </ButtonStyle>
                                                            <ClientSideEvents ValueChanged="OnValueChanged" />
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td valign="top" style="padding-left:2px">To :</td>
                                                    <td>
                                                     <dxe:ASPxDateEdit ID="txtendDate" runat="server" ClientInstanceName="e2" 
                                                              Width="130px" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" AllowNull="False">
                                                            <ButtonStyle Width="13px">
                                                            </ButtonStyle>
                                                            <ClientSideEvents ValueChanged="OnValueChanged" />
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    </tr>
                                                    </table>
                                                       <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validateDates" ErrorMessage="Please Enter Valid Date Range." ></asp:CustomValidator>

                                                       </td>
                                                </tr>
                                                <tr>
                                                    <td class="lt" valign="top" >
                                                    File Path :
                                                    </td>
                                                    <td align="left" style="width: 278px; height: 22px">
                                                    <asp:FileUpload ID="OFDSelectFile" runat="server" Width="280px" Height="20px" />
                                                    Please Browse <b>CD07</b> Type File.
                                                        
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
