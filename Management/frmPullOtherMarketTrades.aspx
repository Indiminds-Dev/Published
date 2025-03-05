<%@ page language="C#" autoeventwireup="true" inherits="management_frmPullOtherMarketTrades, App_Web_ng-agpzn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/GenericJscript.js"></script>
    <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
     {
  
        if(document.body.scrollHeight>=380)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '380px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    
   
    
    function Validate()
    {
    alert('Successfully Pulled...');
    }
   
     function ValidateEr()
    {
    alert('Please Try Again...!!');
    }
    
    //Financial Year Checking
    function DateChange(DateObj)
    { 
        var FYS ='<%=Session["FinYearStart"]%>';
        var FYE ='<%=Session["FinYearEnd"]%>'; 
        var LFY ='<%=Session["LastFinYear"]%>';
        
        DevE_CheckForFinYear(DateObj,FYS,FYE,LFY);
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
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
        
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">PULL OTHER MARKET TRADES</span></strong>
                    </td>
                </tr>
            </table>
            <asp:UpdatePanel id="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
          
            <table>
                <tr>
                    <td class="gridcellleft">
                        <table border="10" cellpadding="1" cellspacing="1">
                                 <td class="gridcellleft" bgcolor="#b7ceec">
                                    For Client:
                                </td>
                                <td>
                                    <asp:DropDownList ID="cmbTargetCl" runat="server" Width="320px" AutoPostBack="true" Font-Size="11px"
                                        OnSelectedIndexChanged="cmbTargetCl_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        <table border="10" cellpadding="1" cellspacing="1">
                            <tr>
                                <td class="gridcellleft" bgcolor="#b7ceec">
                                    Source Company:
                                </td>
                                <td>
                                    <asp:DropDownList ID="cmbCompSeg" runat="server" Width="320px" Font-Size="11px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
               
                <tr>
                  
                    <td class="gridcellleft">
                        <table border="10" cellpadding="1" cellspacing="1">
                            <tr>
                              <td class="gridcellleft" bgcolor="#b7ceec">
                        Select Date:
                    </td>
                                <td>
                                    <dxe:ASPxDateEdit ID="dtDate" ClientInstanceName="cDtDate" runat="server" EditFormat="Custom"
                                        UseMaskBehavior="True" TabIndex="1" Font-Size="10px" Width="108px">
                                        <dropdownbutton text="From"></dropdownbutton>
                                        <ClientSideEvents LostFocus="function(s,e){DateChange(cDtDate);}"/>
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td>
                                    <dxe:ASPxDateEdit ID="dtToDate" ClientInstanceName="cDtToDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        TabIndex="2" Font-Size="10px" Width="108px">
                                        <dropdownbutton text="To"></dropdownbutton>
                                        <ClientSideEvents LostFocus="function(s,e){DateChange(cDtToDate);}"/>
                                    </dxe:ASPxDateEdit>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        <asp:Button ID="btnAdd" runat="server" Text="Pull Other Trades" CssClass="btnUpdate"
                            OnClick="btnAdd_Click" Height="20px"/>
                    </td>
                   
                </tr>
            </table>
              </ContentTemplate>
                <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
                            </Triggers>
            </asp:UpdatePanel>
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
        </div>
    </form>
</body>
</html>
