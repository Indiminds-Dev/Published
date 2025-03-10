<%@ page language="C#" autoeventwireup="true" inherits="management_GenerateCFMTM, App_Web_kqhq1k1d" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Generate CF-Obligation</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
   
    <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }

    function Page_Load(obj)///Call Into Page Load
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
    function AlertRecord()
    {
       alert('CF-Obligation Successfully Generate !!');
    }
    </script>
    
    
 
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server"  autocomplete="off">
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
                <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                    <strong><span id="SpanHeader" style="color: #000099">Generate CF-Obligation</span></strong></td>
               
            </tr>
        </table>
        <table border="10" cellpadding="1" cellspacing="1">
           
            <tr>
                <td class="gridcellleft" bgcolor="#B7CEEC"> For A Period :
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <dxe:aspxdateedit id="dtFrom" runat="server" editformat="Custom" usemaskbehavior="True"
                                    font-size="10px" width="108px" clientinstancename="dtFrom">
                                    <dropdownbutton text="From">
                        </dropdownbutton>
                                </dxe:aspxdateedit></td>
                            <td>
                                <dxe:aspxdateedit id="dtTo" runat="server" editformat="Custom" usemaskbehavior="True"
                                    font-size="10px" width="108px" clientinstancename="dtTo">
                                    <dropdownbutton text="To">
                        </dropdownbutton>
                                </dxe:aspxdateedit></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="tr_BtnCF">
                <td valign="top" class="gridcellleft">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnGenerateposition" runat="server" Text="Generate MTM" CssClass="btnUpdate"
                                Height="23px" Width="120px" OnClick="btnGenerateposition_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
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
    </div>
    </form>
</body>
</html>
