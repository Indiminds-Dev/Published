<%@ page language="C#" autoeventwireup="true" inherits="management_GenerateQtrTransfers, App_Web_akbpwr7y" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
     <title>Generate Transfers</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
 <script language="javascript" type="text/javascript">
  
    function Page_Load()///Call Into Page Load
            {
                 Hide('tr_filter');
                 document.getElementById('hiddencount').value=0;
                 height();
            }
   function height()
        {
            if(document.body.scrollHeight>=300)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '300px';
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
    function FnGenerate(obj)
    {
        if(obj=="1" || obj=="3" || obj=="4")
        {
            Show('Tab_Selection');
            Hide('Tab_Display');
            Hide('tr_filter');
            FnType(document.getElementById('DdlType').value);
            
            if(obj=="1")
                alert('No Record Found !!!');
            if(obj=="4")
                alert('Processing Successfully !!');
            
        }
        if(obj=="2")
        {
            Show('tr_filter');
            Hide('Tab_Selection');
            Show('Tab_Display');
        }
        
        document.getElementById('hiddencount').value=0;
        height();
    }
    function FnType(obj)
    {
        if(obj=="F")
        {
            Show('Tr_bank');
        }
        if(obj=="S" || obj=="I")
        {
            Hide('Tr_bank');
        }
    }
    
     function heightlight(obj)
        {
      
        var colorcode=obj.split('&');
        
         if((document.getElementById('hiddencount').value)==0)
         {
            prevobj='';
            prevcolor='';
            document.getElementById('hiddencount').value=1;
           
         }
          document.getElementById(obj).style.backgroundColor='#ffe1ac';
         
          if(prevobj!='')
          {
            document.getElementById(prevobj).style.backgroundColor=prevcolor;
          }
          prevobj=obj;
          prevcolor=colorcode[1];

        } 
 function selecttion()
  {
     var combo=document.getElementById('cmbExport');
     combo.value='Ex';
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
                    <strong><span id="SpanHeader" style="color: #000099">Generate Transfers</span></strong></td>
                <td class="EHEADER" width="15%" id="tr_filter" style="height: 22px">
                    <a href="javascript:void(0);" onclick="FnGenerate('3');"><span style="color: Blue; text-decoration: underline;
                        font-size: 8pt; font-weight: bold">Filter</span></a>
                    <asp:DropDownList ID="cmbExport" runat="server" AutoPostBack="True" Font-Size="10px" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                        >
                        <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                        <asp:ListItem Value="E">Excel</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <table  id="Tab_Selection">
            <tr>
                <td>
                    <table border="10" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Date :
                            </td>
                            <td>
                                <dxe:ASPxDateEdit id="dtSettlementDate" runat="server" ClientInstanceName="cdtSettlementDate"
                                    EditFormat="Custom" EditFormatString="dd-MM-yyyy" Font-Size="10px" UseMaskBehavior="True"
                                    Width="108px">
                                </dxe:ASPxDateEdit></td>
                            
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                Select Type :
                            </td>
                            <td>
                                <asp:DropDownList ID="DdlType" runat="server" Font-Size="10px" Width="250px" onchange="FnType(this.value)">
                                    <asp:ListItem Value="F">Funds</asp:ListItem>
                                    <asp:ListItem Value="S">Stocks</asp:ListItem>
                                     <asp:ListItem Value="I">Inter-Account Transfer JV</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                    </table>
                </td>
            </tr>
              <tr id="Tr_bank">
                <td>
                    <table border="10" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Bank Account :
                            </td>
                            <td>
                                <asp:DropDownList ID="DdlBankAc" runat="server" Font-Size="10px">
                                </asp:DropDownList></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnshow" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                        Width="101px" OnClick="btnshow_Click" /></td>
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
        <table id="Tab_Display" style="display: none;">
       
            <tr>
                <td>
                    <div>
                        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                            <ContentTemplate>
                                <table width="100%" border="1">
                                    <tr style="display: none;">
                                        <td>
                                            <asp:HiddenField ID="hiddencount" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div id="DivHeader" runat="server">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><table>     <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnGenerate1" OnClientClick="selecttion()" runat="server" CssClass="btnUpdate" Height="20px" OnClick="btnGenerate1_Click" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGenerate1" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr> <tr><td>   <div id="Divdisplay" runat="server">
                                            </div></td></tr> <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnGenerate2" OnClientClick="selecttion()" runat="server" CssClass="btnUpdate" Height="20px" OnClick="btnGenerate2_Click" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGenerate2" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr></table>
                                         
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click"></asp:AsyncPostBackTrigger>
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </td>
            </tr>
             
        </table>
    </div>
    </form>
</body>
</html>
