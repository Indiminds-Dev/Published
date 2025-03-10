<%@ page language="C#" autoeventwireup="true" inherits="management_PledgeEntry, App_Web_v5pngf_u" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Pledged Portfolio Stocks</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
         <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
 <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	/* Never change this one */
		width:50px;	/* Width of box */
		height:auto;	/* Height of box */
		overflow:auto;	/* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:32767;
	}
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and .optionDivSelected */
		margin:1px;		
		padding:1px;
		cursor:pointer;
		font-size:0.9em;
	}
	#ajax_listOfOptions .optionDiv{	/* Div for each item in list */
		
	}
	#ajax_listOfOptions .optionDivSelected{ /* Selected item in the list */
		background-color:#DDECFE;
		color:Blue;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:3000;
	}
	
	form{
		display:inline;
	}
	
	</style>
</head>

<script language="javascript" type="text/javascript">
      function Page_Load()///Call Into Page Load
      { 
           document.getElementById('BtnAdd').focus();
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
     function FnAjaxlistCall(objID,objListFun,objEvent)
     {
        var ClientType=document.getElementById('ddlType').value;
        if(ClientType=="Pro")
           ClientType="ProClients";
        if(ClientType=="Retail")
           ClientType="Clients";
           
       ajax_showOptions(objID,objListFun,objEvent,ClientType);
     }
       function OnAddButtonClick() 
        {
            if(document.getElementById('txtClient').value!='')
            {
                 var url='PledgeEntryPopUp.aspx?Clientidid='+document.getElementById('txtClient_hidden').value +' &UserSelection='+'Add';
                 parent.OnMoreInfoClick(url,"Add Pledged Portfolio Stocks For " +document.getElementById('txtClient').value,'500px','350px',"Y");
            }
            else
            {
                alert('Please Select Client !!');
            }
            
        }
        function OnAddButtonClickMoreInfo(obj) 
        {
            if(document.getElementById('txtClient').value!='')
            {
                var url='PledgeEntryPopUp.aspx?Clientidid='+document.getElementById('txtClient_hidden').value +' &UserSelection='+'Edit'+' &PledgeId='+obj ;
                parent.OnMoreInfoClick(url,"Modify Pledged Portfolio Stocks " +document.getElementById('txtClient').value,'500px','350px',"Y");
            }
            else
            {
                alert('Please Select Client !!');
            }
             
        }
        
        function ChangeRowColor(rowID) 
        {
            var gridview = document.getElementById('GrdPledgedStocks'); 
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
        function callback()
        {
             document.getElementById('BtnAdd').focus();   
             document.getElementById('BtnScreen').click();
        }
        function AlertRecord(obj)
        {
            if(obj=="1")
                alert('No Reocrd Found !!');
            if(obj=="2")
                alert('Please Select Client !!');
            height();
        }
         FieldName='lstSlection'; 
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
     
      document.getElementById('BtnScreen').disabled=true;
         
   } 
   function EndRequest(sender, args) 
   {
     $get('UpdateProgress1').style.display = 'none'; 
   
     document.getElementById('BtnScreen').disabled=false;
        
   } 


   </script>
     <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;" colspan="2">
                    <strong><span style="color: #000099">Pledged Portfolio Stocks</span></strong>
                </td>
            
            </tr>
        </table>
        <table>
            <tr valign="top">
                <td>
                    <table border="10" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Type :</td>
                            <td>
                                <asp:DropDownList ID="ddlType" runat="server" Width="100px" Font-Size="10px" onchange="fnddlGroup(this.value)">
                                    <asp:ListItem Value="Pro">Pro Trading</asp:ListItem>
                                    <asp:ListItem Value="Retail">Clients</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                   
                </td>
                <td>
                    <table>
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Client:
                            </td>
                            <td>
                                <asp:TextBox ID="txtClient" runat="server" Width="200px" Font-Size="10px" onkeyup="FnAjaxlistCall(this,'ShowClientFORMarginStocks',event)"></asp:TextBox>
                            </td>
                            <td style="display:none;"> <asp:TextBox ID="txtClient_hidden" runat="server" Width="5px"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table border="10" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Button ID="BtnScreen" runat="server" Text="Show" CssClass="btnUpdate" Height="20px"
                                    Width="100px" OnClick="BtnScreen_Click" />
                            </td>
                            <td>
                                <asp:Button ID="BtnExcel" runat="server" CssClass="btnUpdate" Height="20px" Text="Open To Excel"
                                    Width="101px" OnClick="BtnExcel_Click" /></td>
                            <td>
                                <asp:Button ID="BtnAdd" runat="server" CssClass="btnUpdate" Height="20px" Text="Add New"
                                    Width="101px" OnClientClick="OnAddButtonClick();" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="5">
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
                            <asp:GridView ID="GrdPledgedStocks" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="2px" ForeColor="#0000C0"
                                DataKeyNames="PledgedStocks_ID" OnRowCommand="GrdPledgedStocks_RowCommand" OnRowEditing="GrdPledgedStocks_RowEditing" OnRowDeleting="GrdPledgedStocks_RowDeleting">
                                <Columns>
                                    <asp:TemplateField HeaderText="Segment">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSegmentName" runat="server" Text='<%# Eval("SegmentName")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblClientName" runat="server" Text='<%# Eval("ClientName")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Product Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Purchase Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPurchaseDate" runat="server" Text='<%# Eval("PurchaseDate")%>'
                                                CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quantity">
                                        <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Pledge Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPledgeDate" runat="server" Text='<%# Eval("PledgeDate")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="UnPledge Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUnPledgeDate" runat="server" Text='<%# Eval("UnPledgeDate")%>'
                                                CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Pledge With">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPledgee" runat="server" Text='<%# Eval("Pledgee")%>'
                                                CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                        <ItemTemplate>
                                            <asp:Button ID="LinkBtnEdit" CssClass="btnUpdate" Height="20px" runat="server" Text="Edit"
                                                CommandName="Edit" CommandArgument='<%# Eval("PledgedStocks_ID")%>' />
                                            <asp:Button ID="LinkBtnDelete" CssClass="btnUpdate" Height="20px" runat="server"
                                                Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("PledgedStocks_ID")%>' />
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
                            <asp:AsyncPostBackTrigger ControlID="BtnScreen" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
               
      
        
       
    </div>
    </form>
</body>
</html>