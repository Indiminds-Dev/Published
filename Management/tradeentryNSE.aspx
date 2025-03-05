<%@ page language="C#" autoeventwireup="true" inherits="management_tradeentryNSE, App_Web_n3rnr3dz" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Trades Entry</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
</head>

<script language="javascript" type="text/javascript">
      function Page_Load()///Call Into Page Load
      { 
           document.getElementById('btnadd').focus();
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
     function SpanShow(obj)
       {
         document.getElementById('spantxt').innerText=obj;
       }
       function OnAddButtonClick() 
        {
                var date2=null;
                d1=new Date(dtfor.GetDate());
                var date1 = dtfor.GetDate();
                 if(date1 != null) 
                 {
                   date2 =parseInt(date1.getMonth()+1)+'-'+date1.getDate()+'-'+ date1.getFullYear();
                 } 
                
             var url='tradeentryNSEpopup.aspx?date='+date2 +'&type='+'Add';
             
             parent.OnMoreInfoClick(url,"Add Trade Entry",'600px','350px',"Y");
            
        }
        function OnAddButtonClickMOREINFO(obj) 
        {
               
                var date2=null;
                d1=new Date(dtfor.GetDate());
                var date1 = dtfor.GetDate();
                 if(date1 != null) 
                 {
                   date2 =parseInt(date1.getMonth()+1)+'-'+date1.getDate()+'-'+ date1.getFullYear();
                 } 
             var url='tradeentryNSEpopup.aspx?date='+date2 +'&type='+'Edit'+'&id='+obj ;
             parent.OnMoreInfoClick(url,"Modify Trade",'600px','350px',"Y");
        }
        
        function callback()
        {
         document.getElementById('btnadd').focus();   
         document.getElementById('btn_Show').click();
        }
        function ChangeRowColor(rowID) 
        {
            var gridview = document.getElementById('grdtradeentry'); 
            var rCount = gridview.rows.length; 
            var rowIndex=1; 
            for (rowIndex; rowIndex<=rCount-2; rowIndex++) 
            { 
                var rowElement = gridview.rows[rowIndex]; 
                rowElement.style.backgroundColor='#FFFFFF'
            }
            var color = document.getElementById(rowID).style.backgroundColor;
            if(color != '#ffe1ac') 
            {
                oldColor = color;
            }
            if(color == '#ffe1ac') 
            {
                document.getElementById(rowID).style.backgroundColor = oldColor;
            }
            else 
                document.getElementById(rowID).style.backgroundColor = '#ffe1ac'; 

        }
        function display(obj)
        {
            if(obj=='1')
                alert('No Reocrd Found !!');
                
            height();
        }
       
</script>
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
     
      document.getElementById('btn_Show').disabled=true;
         
   } 
   function EndRequest(sender, args) 
   {
     $get('UpdateProgress1').style.display = 'none'; 
   
     document.getElementById('btn_Show').disabled=false;
        
   } 


   </script>
     <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;" colspan="2">
                    <strong><span style="color: #000099">Trades Entry</span></strong>
                </td>
            
            </tr>
        </table>
        <table>
            <tr valign="top">
                <td>
                    Date:
                </td>
                <td>
                    <dxe:ASPxDateEdit ID="dtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                        Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                        <DropDownButton Text="For">
                        </DropDownButton>
                    </dxe:ASPxDateEdit>
                </td>
                <td>
                    <b>Settlement No.&nbsp; :&nbsp;</b>
                </td>
                 <td>
                    <span id="spantxt"></span>
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="btn_Show" runat="server" Text="Show" CssClass="btnUpdate" Height="20px"
                                    Width="100px" OnClick="btn_Show_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnexcelopen" runat="server" CssClass="btnUpdate" Height="20px" Text="Open To Excel"
                                    Width="101px" OnClick="btnexcelopen_Click" /></td>
                            <td>
                                <asp:Button ID="btnadd" runat="server" CssClass="btnUpdate" Height="20px" Text="Add New"
                                    Width="101px" OnClientClick="OnAddButtonClick();"/></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr><td colspan="5">  <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                         <ProgressTemplate>
                             <div id='Div2' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                 top: 50%; background-color: white; layer-background-color: white; height: 80;
                                 width: 150;'>
                                 <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                     <tr>
                                         <td>
                                             <table>
                                                 <tr>
                                                     <td align='center' bgcolor='#FFFFFF' style="height: 25px">
                                                         <img src='../images/progress.gif' width='18' height='18'></td>
                                                     <td width='100%' align='center' bgcolor='#FFFFFF' style="height: 25px">
                                                         <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loading..</strong></font></td>
                                                 </tr>
                                             </table>
                                         </td>
                                     </tr>
                                 </table>
                             </div>
                         </ProgressTemplate>
                     </asp:UpdateProgress></td></tr>
                       </table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr align="left">
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="grdtradeentry" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="2px" ForeColor="#0000C0"
                                DataKeyNames="ExchangeTrades_Id" OnRowCommand="grdtradeentry_RowCommand" OnRowDeleting="grdtradeentry_RowDeleting" OnRowEditing="grdtradeentry_RowEditing">
                                <Columns>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lbName" runat="server" Text='<%# Eval("Name")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Instrument">
                                        <ItemTemplate>
                                            <asp:Label ID="lblinstrument" runat="server" Text='<%# Eval("instrument")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Flag">
                                        <ItemTemplate>
                                            <asp:Label ID="lblflag" runat="server" Text='<%# Eval("flag")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quantity">
                                    <ItemStyle Wrap="False"  HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblUnitPriceQuantity" runat="server" Text='<%# Eval("UnitPriceQuantity")%>'
                                                CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Market Rate">
                                    <ItemStyle Wrap="False"  HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblUnitPrice" runat="server" Text='<%# Eval("UnitPrice")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                        <ItemTemplate>
                                            <asp:Button ID="linkbtnedit" CssClass="btnUpdate" Height="20px" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# Eval("ExchangeTrades_Id")%>' />
                                            <asp:Button ID="linkbtndel" CssClass="btnUpdate" Height="20px" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("ExchangeTrades_Id")%>' />
                                           
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" />
                                        <HeaderTemplate>
                                           <%-- <a href="javascript:void(0);" onclick="OnAddButtonClick()"><span style="color: #000099;
                                                text-decoration: underline">Add New</span></a>--%>
                                                More Info...
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                    HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_Show" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
               
      
        
       
    </div>
    </form>
</body>
</html>

