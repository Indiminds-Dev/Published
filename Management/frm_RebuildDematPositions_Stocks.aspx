<%@ page language="C#" autoeventwireup="true" inherits="management_frm_RebuildDematPositions_Stocks, App_Web_8qixh_8w" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">

    function SignOff()
        {
            window.parent.SignOff();
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
            window.frameElement.width = document.body.scrollWidth;
        }
        
</script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="load()">
    <form id="form1" runat="server">
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
    <div align="center"   style="background-color:#DDECFE; height:90%">
    <table  width="100%"> 
        <tr>    
            <td>
            &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnRebuild" runat="server" Text="Rebuild DematPositions and DematStocks"
                    OnClick="btnRebuild_Click" CssClass="btnUpdate" Height="23px" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                            top: 50%; background-color: white; layer-background-color: white; height: 30;
                            width: 150;'>
                            <table width='100' border='1' cellpadding='0' cellspacing='0' bordercolor='#c0d6e4'>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td height='25' align='center' bgcolor='#ffffff'>
                                                    <img src='../images/progress.gif' width='18' height='18'></td>
                                                <td height='10' width='100%' align='center' bgcolor='#ffffff'>
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
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Label ID="lblStatus" runat="server" Font-Size="X-Small" Font-Names="Arial" Font-Bold="True"
                            ForeColor="Red" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnRebuild" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
     
    </table>
    </div>
    </form>
</body>
</html>
