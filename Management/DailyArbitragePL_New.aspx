<%@ page language="C#" autoeventwireup="true" inherits="management_DailyArbitragePL_New, App_Web_sjbhlkdr" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Daily Arbitrage P/L  (Process)</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript">

    function Page_Load()///Call Into Page Load
            {
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
    function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
   function fnAlert(obj)
   {
         alert(obj);
         height();
   }
   function FnCycleChange(obj)
   {
     var objVal=obj.split('~');
     
     dtFrom1.SetDate(new Date(objVal[1]));
     dtTo1.SetDate(new Date(objVal[2]));
     dtFrom.SetDate(new Date(objVal[1]));
     dtTo.SetDate(new Date(objVal[2]));
   }
   function FromDateCheck(obj)
   {
        var date1 = dtFrom.GetDate();
        var date2 =(new Date(date1.getFullYear(), date1.getMonth(), date1.getDate())).getTime();
        
        var date3 = dtFrom1.GetDate();
        var date4 =(new Date(date3.getFullYear(), date3.getMonth(), date3.getDate())).getTime();
        
        if(date2<date4)
        {
            dtFrom.SetDate(new Date(dtFrom1.GetDate()));
            alert('Dates Can Not Be Outside The Selected Settlement Cycle !!');
        }
   }
   function ToDateCheck(obj)
   {
        var date1 = dtTo.GetDate();
        var date2 =(new Date(date1.getFullYear(), date1.getMonth(), date1.getDate())).getTime();
        
        var date3 = dtTo1.GetDate();
        var date4 =(new Date(date3.getFullYear(), date3.getMonth(), date3.getDate())).getTime();
        
        if(date2>date4)
        {
            dtTo.SetDate(new Date(dtTo1.GetDate()));
            alert('Dates Can Not Be Outside The Selected Settlement Cycle !!');
        }
   }
     </script>
 

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="36000">
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
                <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                    <strong><span id="SpanHeader" style="color: #000099">Daily Arbitrage P/L  (Process)</span></strong></td>

           
            </tr>
        </table>
            <table class="TableMain100">
                <tr>
                    <td align="center">
                        <table>
                            <tr>
                                <td>
                                    <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                               Settlement Cycle :
                                            </td>
                                            <td colspan="2" align="left">
                                                <asp:DropDownList ID="DdlCycle" runat="server" Font-Size="10px" onchange="FnCycleChange(this.value)">
                                                   
                                                </asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Period :
                                            </td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="dtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="dtFrom">
                                                    <dropdownbutton text="For">
                                                    </dropdownbutton>
                                                     <clientsideevents valuechanged="function(s, e) {FromDateCheck(s);}" />
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="dtTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="dtTo">
                                                    <dropdownbutton text="To">
                                                    </dropdownbutton>
                                                     <clientsideevents valuechanged="function(s, e) {ToDateCheck(s);}" />
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Generate Type :
                                            </td>
                                            <td colspan="2" align="left">
                                                <asp:DropDownList ID="dllGenerate" runat="server" Width="100px" Font-Size="10px">
                                                    <asp:ListItem Value="1">Generate</asp:ListItem>
                                                    <asp:ListItem Value="2">Delete</asp:ListItem>
                                                </asp:DropDownList></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" colspan="3">
                                    <asp:Button ID="btnGenerate" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate"
                                        Width="101px" OnClick="btnGenerate_Click" />
                                </td>
                            </tr>
                            <tr  style="display: none;">
                                <td colspan="3">
                                        <dxe:ASPxDateEdit ID="dtFrom1" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                            Font-Size="10px" Width="108px" ClientInstanceName="dtFrom1">
                                            <dropdownbutton text="For">
                                                    </dropdownbutton>
                                        </dxe:ASPxDateEdit>
                                    
                                        <dxe:ASPxDateEdit ID="dtTo1" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                            Font-Size="10px" Width="108px" ClientInstanceName="dtTo1">
                                            <dropdownbutton text="To">
                                                    </dropdownbutton>
                                        </dxe:ASPxDateEdit>
                                    </td>
                                
                            </tr>
                        </table>
                    </td>
                </tr>
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
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
               </ContentTemplate>
                             <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnGenerate" EventName="Click"></asp:AsyncPostBackTrigger>
                </Triggers>
                        </asp:UpdatePanel>
            </table>
           
            
        </div>
    </form>
</body>
</html>
