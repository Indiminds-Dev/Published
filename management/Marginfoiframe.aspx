<%@ page language="C#" autoeventwireup="true" inherits="management_Marginfoiframe, App_Web_lyh0nvfl" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
    <%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

    

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
   <script language="javascript" type="text/javascript">
    function Page_Load(obj)///Call Into Page Load
      { 
           height();
           Hide('tr_Adhoc');
           Hide('trMarginDate');
      }
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=450)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '450px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
function fnddlGeneration(obj)
     {
       if(obj=='2' | obj=='3')
       {
         Show('tr_Adhoc');
       }
       else
       {
        Hide('tr_Adhoc');
       }
       if(obj=='4' | obj=='6')
       {
         Show('trMarginDate');
       }
       else
       {
        Hide('trMarginDate');
       }
     }  

      function AllowNumericOnly(e)
    {
        var keycode;
        if (window.event) keycode = window.event.keyCode;
        else if (event) keycode = event.keyCode;
        else if(e) keycode = e.which;
        else return true;
        if( (keycode > 47 && keycode <= 57) )
        {
          return true;
        }
        else
        {
          return false;
        }
      return true;  
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
                            Imports Margin Files
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
                                            
                                            <tr id="trYesNo" runat="server">
                                                    
                                                    <td style="width: 202px"  >
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
                                                   
                                                    <td class="lt" style="height: 22px;">
                                                        <asp:Label ID="importstatus" runat="server" Font-Size="11px" Font-Names="Arial"
                                                            Font-Bold="True" />
                                                    </td>
                                                </tr>
                                                                                            
                                                  <tr>
                                                   
                                                    <td class="lt" style="width: 202px; height: 22px;">
                                                        <table>
                                                           
                                                            <tr>
                                                                <td>
                                                                    <asp:DropDownList ID="cmbFileType" runat="server" Width="345px" onchange="fnddlGeneration(this.value)">
									<asp:ListItem Value="0">Select Type Of File To Import </asp:ListItem>
									<asp:ListItem Value="1">Exchange File : F_MG13_memcode_DDMMYYYY.csv</asp:ListItem>
									<asp:ListItem Value="2">V-Tech File : csmrg.csv</asp:ListItem>
									<asp:ListItem Value="3">PC-SPAN File (in CSV Format)</asp:ListItem>
									<asp:ListItem Value="4">Protector File : TerminalWiseScripWiseMargin.csv</asp:ListItem>
									<asp:ListItem Value="5">ICMTM File : F_MG17_memcode_DDMMYYYY.lis</asp:ListItem>
									<asp:ListItem Value="6">Protector(PeakMargin) File : TerminalWisePeakMargin.csv</asp:ListItem>
									<asp:ListItem Value="7">UDiFF File : Margin_NCL_FO_0_TM_memcode_YYYYmmDD_F/P_hhmm.csv</asp:ListItem>
                                                                    </asp:DropDownList></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                         
                                            
                                                <tr>
                                                  
                                                    <td align="right" style="width: 202px">
                                                        <asp:FileUpload ID="OFDSelectFile" runat="server" Width="272px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr_Adhoc" runat="server">
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                Ad-Hoc/TopUP Margin (in %) 
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtAdhoc" runat="server" Width="75px" onkeypress="return AllowNumericOnly(this);"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    </td>
                                                </tr>
                                                <tr id="trMarginDate">
                                                    <td>
                                                        <table>
                                                        <tr>
                                                            <td>
                                                                Margin Date 
                                                            </td>
                                                            <td>
                                                                <dxe:ASPxDateEdit ID="cmbDate" runat="server" DateOnError="Today" EditFormat="Custom"
                                                EditFormatString="dd-MM-yyyy" Font-Size="10px" Width="130px" UseMaskBehavior="True">
                                                <ButtonStyle Width="13px">
                                                </ButtonStyle>
                                                <DropDownButton ImagePosition="Top" Text="Date" Width="30px">
                                                </DropDownButton>
                                            </dxe:ASPxDateEdit>
                                                            </td>
                                                        </tr>
                                                    </table>
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
