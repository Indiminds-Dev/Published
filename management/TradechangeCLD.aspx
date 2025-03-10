<%@ page language="C#" autoeventwireup="true" inherits="management_TradechangeCLD, App_Web_lyh0nvfl" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Trade Change EXPORT</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
   <script language="javascript" type="text/javascript">
      function Page_Load()///Call Into Page Load
      { 
         document.getElementById('td_file').style.display='none';
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
    function alertshow()
    {
        
          document.getElementById('td_file').style.display='inline';
       
    }
    function norecord()
    {
            document.getElementById('td_file').style.display='none';
           alert('No Record Found!');
    }

 </script>
      
</head>


<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
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
                    <strong><span style="color: #000099">Generate CLD File</span></strong>
                </td>
            </tr>
        </table>
        <table id="SELECT">
            <tr valign="top">
                <td>
                    For</td>
                <td>
                    <dxe:ASPxDateEdit ID="dtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                        Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                        <dropdownbutton text="For">
                        </dropdownbutton>
                    </dxe:ASPxDateEdit>
                </td>
             </tr>    
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Generate" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate"
                            Width="100px" OnClick="Generate_Click" />
                    </td>
                </tr>
                 <tr>
                     <td colspan="2" id="td_file">
                       
                         <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Label ID="lbltxt" runat="server" Text="File" Font-Size="10px"></asp:Label>
                            <asp:TextBox ID="txtname" runat="server" Font-Size="10px"></asp:TextBox>
                            <asp:Label ID="lblgenerate" runat="server" Text="Generated Successfully !" Font-Size="10px"></asp:Label>
                            
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Generate" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                            <asp:Button ID="Download" runat="server" CssClass="btnUpdate" Height="20px" Text="Download File"
                            Width="100px" OnClick="Download_Click" />
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
                                                        <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loading..</strong></font></td>
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
