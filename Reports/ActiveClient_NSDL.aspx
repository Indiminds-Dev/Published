<%@ page language="C#" autoeventwireup="true" inherits="Reports_ActiveClient_NSDL, App_Web_nres-wbk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    
     <script language="javascript" type="text/javascript">
  
    function Page_Load()///Call Into Page Load
            {
               FieldName='btnshow';
               Hide('filter');
               fnActive('0');
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
 function fnActive(obj)
{
     if(obj=='0')////select Active
            {        
             Show('tbl_Active');
             
            }
      else 
            {
            
            Hide('tbl_Active');
            }
}
function line(obj)
   {
     Show('tblDisplay');
     Show('filter');
     Hide('tab2');
     height();
     fnActive(obj);
   }
function filter() 
        {
          Hide('filter');
          Hide('tblDisplay');
          Show('tab2');
          height();
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
     function selecttion()
        {
            var combo=document.getElementById('ddlExport');
            combo.value='Ex';
        }  
 function NORECORD(obj)
  {
      Hide('tblDisplay');
      Show('tab2');
      fnActive(obj);
      alert('No Record Found!!');
      height();
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

       
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                        <strong><span id="SpanHeader" style="color: #000099">Most Active Clients</span></strong></td>
                           <td class="EHEADER" width="25%" id="filter">
                        <a href="javascript:void(0);" onclick="filter();"><span style="color: Blue; text-decoration: underline;
                            font-size: 8pt; font-weight: bold">Filter</span></a> || <asp:DropDownList
                                ID="ddlExport" Font-Size="Smaller" runat="server" AutoPostBack="True" 
                                Height="16px" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                                <asp:ListItem Value="E">Excel</asp:ListItem>
                                </asp:DropDownList>
                        
                    </td>
                </tr>
            </table>
        <table id="tab2" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <td style="width: 351px">
                    <table>
                        <tr>
                            <td colspan="5" class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                   
                                    <tr>
                                        <td bgcolor="#B7CEEC">
                                            <strong>Segment :</strong></td>
                                        <td>
                                            <asp:RadioButton ID="rdbSegAll" runat="server" GroupName="e" onclick="fn_Segment('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbSegSelected" runat="server" Checked="True" GroupName="e"
                                                onclick="fn_Segment('b')" />
                                            Current
                                        </td>
                                        <td>
                                            [ <span id="litSegment" runat="server" style="color: Maroon"></span>]
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table id="tbl_Active">
                        <tr>
                            <td bgcolor="#b7ceec">
                                <strong>Select Top
                                    <asp:TextBox ID="txtNo" runat="server" onkeypress="return AllowNumericOnly(this);"
                                        Width="50px">10</asp:TextBox>
                                    Clients who have traded more than
                                    <asp:TextBox ID="txtPercentage" runat="server" onkeypress="return AllowNumericOnly(this);"
                                        Width="39px">80</asp:TextBox>
                                    % of working days during the period </strong>
                            </td>
                        </tr>
                    </table>
                    
                    <table>
                        <tr>
                            <td id="Td1" style="height: 36px">
                                <dxe:ASPxDateEdit id="dtFrom" runat="server" ClientInstanceName="dtFrom" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                    Font-Size="10px" UseMaskBehavior="True" Width="108px">
                                    <dropdownbutton text="From">
                                        </dropdownbutton>
                                </dxe:ASPxDateEdit></td>
                            <td id="Td2" style="height: 36px">
                                <dxe:ASPxDateEdit id="dtTo" runat="server" ClientInstanceName="dtTo" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                    Font-Size="10px" UseMaskBehavior="True" Width="108px">
                                    <dropdownbutton text="To">
                                        </dropdownbutton>
                                </dxe:ASPxDateEdit></td>
                        </tr>
                    </table>
                    <tr>
                        <td>
                            <table>
                                <asp:HiddenField ID="HiddenField_Segment" runat="server" />
                                <tr>
                                    <td id="td_export" class="gridcellleft" style="height: 22px">
                                        <asp:Button ID="btnexport" runat="server" CssClass="btnUpdate" Height="20px" Text="Export To Excel"
                                            Width="120px" ValidationGroup="a" OnClick="btnexport_Click" />
                                    </td>
                                    <td id="td_btnshow" style="height: 22px">
                                        <asp:Button ID="btnshow" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                                            Width="120px" ValidationGroup="a" OnClick="btnshow_Click" OnClientClick="selecttion();" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr><td>  
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
                
</td></tr>
        </table>
                   
    
          <div id="tblDisplay" style="display: none;" width="100%">
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
                                <div id="displayALL" runat="server">
                                </div>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click"></asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
