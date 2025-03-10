<%@ page language="C#" autoeventwireup="true" inherits="management_MONTHLYDISCLOSURE, App_Web_5zwtjf_c" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Monthly Disclosure Of Client Funding</title>
       <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

   <script language="javascript" type="text/javascript">
    function Page_Load()///Call Into Page Load
    {
          txtAmnt.SetValue('100000.00');
          document.getElementById('hiddencount').value=0; 
          Hide('tr_filter');
          Hide('displayAll');
          Hide('divgenerate');
          Show('tab2');
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
  function display()
  {
      Show('tr_filter');
      Show('displayAll');
      Hide('tab2');
      Show('divgenerate');
      selecttion();
      height();
  }
  function NoRecord()
  {
      Hide('tr_filter');
      Hide('displayAll');
      Show('tab2');
      Hide('divgenerate');
      height();
      selecttion();
      alert('No Record Found');
  }
  function Filter()
  {
      Hide('tr_filter');
      Hide('displayAll');
      Hide('divgenerate');
      Show('tab2');
      selecttion();
      height();
  }
  function selecttion()
  {
            var combo=document.getElementById('ddlExport');
            combo.value='Ex';
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
        
   </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
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
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 22px;">
                        <strong><span id="SpanHeader" style="color: #000099">Monthly Disclosure Of Client Funding</span></strong>
                    </td>
                    <td class="EHEADER" width="25%" id="tr_filter" style="height: 22px">
                         <a href="javascript:void(0);"
                                onclick="Filter();"><span style="color: Blue; text-decoration: underline; font-size: 8pt;
                                    font-weight: bold">Filter</span></a>
                        <asp:DropDownList ID="ddlExport" runat="server" AutoPostBack="True" Font-Size="10px" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged" 
                            >
                            <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                            <asp:ListItem Value="E">Excel</asp:ListItem>
                            <asp:ListItem Value="P">PDF</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <table id="tab2">
                <tr>
                    <td align="left">
                        <table>
                            <tr valign="top">
                                <td>
                                    <table>
                                        <tr>
                                            <td valign="top">
                                                Month :</td>
                                            <td colspan="5">
                                                <asp:DropDownList ID="ddlMonth" runat="server" Width="150px" Font-Size="10px">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                         <tr>
                                            <td valign="top">
                                               Report Date :</td>
                                            <td colspan="5">
                                                <dxe:ASPxDateEdit ID="dtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="150px" ClientInstanceName="dtfor">
                                                    <dropdownbutton text="For"></dropdownbutton>
                                                </dxe:ASPxDateEdit> 
                                            </td>
                                        </tr>
                                         <tr>
                                            <td valign="top">
                                               Consider Obligation More Than :</td>
                                            <td colspan="5">
                                                <dxe:ASPxTextBox ID="txtAmnt" runat="server" HorizontalAlign="Right"
                                                    Width="150px" Height="5px">
                            <masksettings mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" includeliterals="DecimalSymbol" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                   
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                       
                                        <tr id="tr_show">
                                            <td colspan="6">
                                                <asp:Button ID="btn_show" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                                                    Width="101px"  OnClientClick="selecttion()" OnClick="btn_show_Click"  />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                               
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table id="tab3">
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
      <div id="divgenerate"><asp:Button ID="btngenerate" runat="server" Text="Generate File" OnClientClick="selecttion()" CssClass="btnUpdate" Height="20px" OnClick="btngenerate_Click"/></div>
        <div id="displayAll">
          <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                <ContentTemplate>
                    <table width="100%" border="1">
                      
                      
                       
                        <tr>
                            <td>
                                <div id="display" runat="server" >
                                   </div>
                            </td>
                        </tr>
                      
                         
                    </table>
              </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btn_show" EventName="Click"></asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <asp:HiddenField ID="hiddencount" runat="server" />
    </form>
</body>
</html>

