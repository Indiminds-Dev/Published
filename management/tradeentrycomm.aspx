<%@ page language="C#" autoeventwireup="true" inherits="management_tradeentrycomm, App_Web_4andsqnv" %>
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
           document.getElementById('BtnADD').focus();
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
   
        function FnPopUp(obj,objType) 
        {
             var date2=null;
             d1=new Date(DtFor.GetDate());
             var date1 = DtFor.GetDate();
             if(date1 != null) 
             {
               date2 =parseInt(date1.getMonth()+1)+'-'+date1.getDate()+'-'+ date1.getFullYear();
             }
             
              
             var url=null;
             if(objType=='Edit')
             {
                url='tradeentrycommpopup.aspx?date='+date2 +'&type='+'info'+'&id='+obj ;
                parent.OnMoreInfoClick(url,"Modify Trade",'600px','350px',"Y");
             }
             if(objType=='Add')
             {
                url='tradeentrycommpopup.aspx?date='+date2 +'&type='+'Add';
                parent.OnMoreInfoClick(url,"Add Trade Entry",'600px','350px',"Y");
             }
             
             
        }
        
        function callback()
        {
             document.getElementById('BtnADD').focus();   
             document.getElementById('BtnShow').click();
        }
        function ChangeRowColor(rowID) 
        {
            var gridview = document.getElementById('GrdTradeEntry'); 
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
        function FnAlert(obj)
        {
            alert(obj);
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
     
      document.getElementById('BtnShow').disabled=true;
         
   } 
   function EndRequest(sender, args) 
   {
     $get('UpdateProgress1').style.display = 'none'; 
   
     document.getElementById('BtnShow').disabled=false;
        
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
                <td class="gridcellleft">
                    <table  border="10" cellpadding="1" cellspacing="1">
                        <tr valign="top">
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Date:
                            </td>
                            <td>
                                <dxe:ASPxDateEdit ID="DtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="DtFor">
                                    <dropdownbutton text="For">
                        </dropdownbutton>
                                </dxe:ASPxDateEdit>
                            </td>
                          
                        </tr>
                    </table>
                </td>
                <td class="gridcellleft">
                    <table  border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td>
                                <asp:Button ID="BtnShow" runat="server" Text="Show" CssClass="btnUpdate" Height="20px"
                                    Width="100px" OnClick="BtnShow_Click" />
                            </td>
                            <td>
                                <asp:Button ID="BtnExcel" runat="server" CssClass="btnUpdate" Height="20px" Text="Open To Excel"
                                    Width="101px" OnClick="BtnExcel_Click" /></td>
                            <td>
                                <asp:Button ID="BtnADD" runat="server" CssClass="btnUpdate" Height="20px" Text="Add New"
                                    Width="101px" OnClientClick="FnPopUp('0','Add');"/></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
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
                    </asp:UpdateProgress>
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr align="left">
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="GrdTradeEntry" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="2px" ForeColor="#0000C0"
                                DataKeyNames="ComExchangeTrades_Id" OnRowCommand="GrdTradeEntry_RowCommand" OnRowDeleting="GrdTradeEntry_RowDeleting" OnRowEditing="GrdTradeEntry_RowEditing">
                                <Columns>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Instrument">
                                        <ItemTemplate>
                                            <asp:Label ID="lblScripName" runat="server" Text='<%# Eval("ScripName")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Flag">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFlag" runat="server" Text='<%# Eval("Flag")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Lot">
                                    <ItemStyle Wrap="False"  HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblLots" runat="server" Text='<%# Eval("Lots")%>'
                                                CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Market Rate">
                                    <ItemStyle Wrap="False"  HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblMarketRate" runat="server" Text='<%# Eval("MarketRate")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                        <ItemTemplate>
                                            <asp:Button ID="BtnEdit" CssClass="btnUpdate" Height="20px" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# Eval("ComExchangeTrades_Id")%>' />
                                            <asp:Button ID="BtnDelete" CssClass="btnUpdate" Height="20px" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("ComExchangeTrades_Id")%>' />
                                           
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" />
                                        <HeaderTemplate>
                                                More Info...
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                    HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnShow" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
               
      
        
       
    </div>
    </form>
</body>
</html>

