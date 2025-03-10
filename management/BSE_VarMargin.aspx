<%@ page language="C#" autoeventwireup="true" inherits="management_Closingrateiframe, App_Web_npkqnqtr" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
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
                    <td class="lt1" style="height: 40px; width: 408px;">
                        <h5>
                            Imports Var Margin Rates BSE Files
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
                                              
                                                <tr id="trYesNo" runat="server">
                                                  
                                                    <td style="height: 33px"  >
                                                        <table width="100%">
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:Label ID="lblYesNo" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label></td>
                                                            </tr>
                                                           
                                                        </table>
                                                        <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                            Font-Bold="True" ForeColor="Red" /></td>
                                                </tr>
                                                
                                                  <tr>
                                                <td>
                                                
                                                <table>
                                                <tr>
                                                <td style=" width:150px;" >
                                               <asp:RadioButton ID="RadioButton1" AutoPostBack="true" 
                                                        Text=" New Style "   runat="server" 
                                                        oncheckedchanged="RadioButton1_CheckedChanged" />
                                                                                                                                            
                                                </td>
                                                
                                                <td>
                                                &nbsp;
                                                </td>
                                                
                                                <td style=" width:150px;">
                                                
                                                  <asp:RadioButton ID="RadioButton2" Text=" Old Style " AutoPostBack="true"  
                                                        runat="server" oncheckedchanged="RadioButton2_CheckedChanged" />
                                                
                                                </td>
                                               
                                                
                                                
                                                </tr>
                                                
                                               
                                                
                                                </table>
                                                
                                                    
                                                   
                                                
                                                </td>
                                                </tr>
                                                
                                                <tr cellspacing="2">
                                                  
                                                    <td class="lt" style="width: 278px; height: 22px;">
                                                        <table style="width: 275px; height: 20px;">
                                                            <tr valign="top">
                                                                <td style="height: 36px">
                                                                    <b>DATE</b></td>
                                                                <td style="height: 36px">
                                                                    <dxe:ASPxDateEdit ID="dtfor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                                        Font-Size="10px" Width="120px" ClientInstanceName="dtfor">
                                                                        <DropDownButton Text="For">
                                                                        </DropDownButton>
                                                                    </dxe:ASPxDateEdit>
                                                                </td>

                                                            </tr>
                                                     
                                                        </table>
                                                        <strong>&nbsp; EG: VARDDMMYY</strong></td>
                                                </tr>
                                      
                                                <tr>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Avialable At : "></asp:Label>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://www.bseindia.com/mktlive/market_summ/margin.asp">www.bseindia.com/mktlive/market_summ/margin.asp</asp:HyperLink></td>
                                                
                                                </tr>
                                               
                                                
                                              
                                                
                                                <tr>
                                                       <td align="right" style="height: 21px" >
                                                        <asp:FileUpload ID="FileUpload" runat="server" Width="272px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="middle" colspan="2">
                                                        <asp:HiddenField ID="hdnChk" runat="server" Value="0" />
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
