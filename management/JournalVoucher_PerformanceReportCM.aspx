<%@ page language="C#" autoeventwireup="true" inherits="management_JournalVoucher_PerformanceReportCM, App_Web_yf04ozfw" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Stock Adjustments</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

 <script language="javascript" type="text/javascript">
 
    function Page_Load()///Call Into Page Load
            {
                 
                 document.getElementById('Tr_ValuationDate').style.display='none';
                 height();
            }
   function height()
        {
            if(document.body.scrollHeight>=350)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '350px';
            }
            window.frameElement.width = document.body.scrollwidth;
        }
    function SignOff()
    {
        window.parent.SignOff();
    } 
    function FnValuationMathod(obj)
    {
        if(obj=="0")
         document.getElementById('Tr_ValuationDate').style.display='none';
        else
         document.getElementById('Tr_ValuationDate').style.display='inline';
         
         height();
    }
 </script>	
  <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
               
                var j=rValue.split('~');
                var btn = document.getElementById('btnhide');

                if(j[0]=='Group')
                {
                   groupvalue=j[1];
                    btn.click();
                }
                if(j[0]=='Branch')
                {
                   groupvalue=j[1];
                   btn.click();

                }
               
        }
        </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>

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
 
   } 
            </script>
    <div>
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                    <strong><span id="SpanHeader" style="color: #000099">Stock Adjustments</span></strong></td>
            </tr>
        </table>
        <table id="tab2" border="1" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <td class="gridcellleft" bgcolor="#B7CEEC">
                    As On Date:
                </td>
                <td id="td_dtto" class="gridcellleft">
                    <dxe:ASPxDateEdit ID="dtfor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                        Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                        <DropDownButton Text="For">
                        </DropDownButton>
                    </dxe:ASPxDateEdit>
                </td>
                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 84px">
                    Consider Bill Date</td>
                <td class="gridcellleft">
                    <asp:CheckBox ID="chkConsBillDate" runat="server" Width="1px" Height="1px" /></td>
            </tr>
            
            <tr>
                <td class="gridcellleft" bgcolor="#B7CEEC">
                    Closing Stock
                    <br />
                    Valuation Method :</td>
                <td class="gridcellleft">
                    <asp:DropDownList ID="ddlclosingstock" runat="server" Font-Size="11px" Width="120px"
                        onchange="FnValuationMathod(this.value)">
                        <asp:ListItem Value="0">At Cost</asp:ListItem>
                        <asp:ListItem Value="1">At Market</asp:ListItem>
                        <asp:ListItem Value="2">Cost/Market Lower</asp:ListItem>
                        <asp:ListItem Value="3">Avg Cost/Market Lower</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="gridcellleft" style="width: 84px">
                </td>
                <td class="gridcellleft" style="width: 117px">
                </td>
            </tr>
            <tr id="Tr_ValuationDate">
                <td class="gridcellleft" bgcolor="#B7CEEC">
                    Valuation Date :</td>
                <td class="gridcellleft">
                    <dxe:ASPxDateEdit ID="dtValuationDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                        Font-Size="10px" Width="108px" ClientInstanceName="dtValuationDate">
                        <dropdownbutton text="For">
                                        </dropdownbutton>
                    </dxe:ASPxDateEdit>
                </td>
                <td class="gridcellleft" style="width: 84px">
                </td>
                <td class="gridcellleft" style="width: 117px">
                </td>
            </tr>
            <tr>
                <td class="gridcellleft" bgcolor="#B7CEEC">
                   Generate In :</td>
                <td class="gridcellleft">
                    <asp:DropDownList ID="ddlgeneratein" runat="server" Font-Size="11px" Width="120px"
                        Enabled="true">
                      
                    </asp:DropDownList>
                </td>
                <td class="gridcellleft" style="width: 84px">
                </td>
                <td class="gridcellleft" style="width: 117px">
                </td>
            </tr>
           
             <tr valign="top">
               
                <td colspan="2" class="gridcellleft">
                    &nbsp;<asp:Button ID="btnshow" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate" Width="100px" OnClick="btnshow_Click" /></td>
                 <td class="gridcellleft" colspan="1" style="width: 84px">
                 </td>
                 <td class="gridcellleft" colspan="1" style="width: 117px">
                 </td>
            </tr>
        </table>
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
                                                        <font size='1' face='Tahoma'><strong align='center'>Please Wait..</strong></font></td>
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
                    
     <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                        </ContentTemplate>
                         <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click" />
                        </Triggers>
                        </asp:UpdatePanel>
       
    </div>
    </form>
</body>
</html>
