<%@ page language="C#" autoeventwireup="true" inherits="management_PoolToPoolTransfer, App_Web_6_wayyot" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Pool-To-Pool Transferes</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

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
 <script language="javascript" type="text/javascript">

  
    function Page_Load()///Call Into Page Load
            {
               
                 Show('Tab_Selection');
                 Hide('TdFilter');
                 Hide('TabGrid');
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
    
    function ChangeRowColor(rowID,rowNumber) 
        { 
            var gridview = document.getElementById('GrdPoolToPool'); 
            var rCount = gridview.rows.length; 
            var rowIndex=1;
            var rowCount=0;
            if(rCount==28)
                 rowCount=25;
            else    
               rowCount=rCount-2;
            if(rowNumber>25 && rCount<28)
                rowCount=rCount-3;
            for (rowIndex; rowIndex<=rowCount; rowIndex++) 
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
          function FnChk(obj)
          {
            if(obj=="SourceExchange" || obj=="TargetExchange")
            {
                document.getElementById('txtSourceSettNo').value="";
                document.getElementById('txtSourceSettNo_hidden').value="";
                document.getElementById('txtTargetSettNo').value="";
                document.getElementById('txtTargetSettNo_hidden').value="";
            }
            
            document.getElementById('HiddenField_Chk').value=obj
            document.getElementById('BtnChk').click();
                
          }
        function FunCallAjaxList(objID,objEvent,ObjType)
        {
           var strQuery_Table = '';
           var strQuery_FieldName = '';
           var strQuery_WhereClause = '';
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery='';
            var finyear='<%=Session["LastFinYear"]%>';
            var valyr= finyear.split('-');
             strQuery_Table = "Master_Settlements";
             strQuery_FieldName = "distinct top 10 RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)+'  ' + REPLACE(CONVERT(VARCHAR(9), settlements_StartDateTime, 6), ' ', '-') AS [DD-Mon-YY],RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)";
             
             //alert(document.getElementById("<%=DdlSourceExchange.ClientID%>").options[document.getElementById("<%=DdlSourceExchange.ClientID%>").selectedIndex].text)
             
             var Exchange=null;
             if(ObjType=="Source")
             {
                Exchange=document.getElementById("<%=DdlSourceExchange.ClientID%>").options[document.getElementById("<%=DdlSourceExchange.ClientID%>").selectedIndex].text;
             }
             if(ObjType=="Target")
             {
                Exchange=document.getElementById("<%=DdlTargetExchange.ClientID%>").options[document.getElementById("<%=DdlTargetExchange.ClientID%>").selectedIndex].text;
             }
             if(Exchange=="NSE")
               Exchange="1"
             else if(Exchange=="BSE")
               Exchange="4" 
             else if(Exchange=="CSE")
               Exchange="15" 
               
             strQuery_WhereClause = " settlements_exchangesegmentid="+Exchange+" and  ((RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)) like (\'%RequestLetter%')  and ((settlements_StartDateTime between '" + valyr[0]+"-04-01 00:00:00' and '"+ valyr[1]+"-03-31 11:59:59') or (Settlements_FundsPayin between '"+ valyr[0]+"-04-01 00:00:00' and '"+ valyr[1]+"-03-31 11:59:59'))) ";

             CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
             ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery));
           
        }

       function replaceChars(entry) 
       {
            out = "+"; // replace this
            add = "--"; // with this
            temp = "" + entry; // temporary holder

            while (temp.indexOf(out)>-1) {
            pos= temp.indexOf(out);
            temp = "" + (temp.substring(0, pos) + add + 
            temp.substring((pos + out.length), temp.length));
            }
            return temp;
        } 
        
        function FnAlert(obj)
        {
            if(obj=="2")
            {
                Hide('Tab_Selection');
                Show('TdFilter');
                Show('TabGrid');
            }
            else
            {
                Show('Tab_Selection');
                Hide('TdFilter');
                Hide('TabGrid');
                if(obj=='1')
                 alert('No Record Found !!');
                if(obj=='4')
                 alert('Generate Succfully !!');
            }
            height();
        }
      function FnTransfer(Txtid,OutQty,TxtVal,TransferQty,Stocks)
      {
            if(parseInt(TxtVal)>parseInt(OutQty) || parseInt(TxtVal)>parseInt(Stocks))
            {
               alert('You Can Deliver Maximum '+TransferQty+' Share');
                    
               Txtid.value=TransferQty;
               Txtid.focus();
               Txtid.select();
            }
      }
        FieldName='lstSlection';
        </script>

   <script type="text/javascript">
 function SelectAllCheckboxes(chk) 
  {
    $('#<%=GrdPoolToPool.ClientID %>').find("input:checkbox").each(function() 
    {
        if (this != chk) {
            this.checked = chk.checked;
        }
    });
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
                    <strong><span id="SpanHeader" style="color: #000099">Pool-To-Pool Transferes</span></strong></td>

              <td class="EHEADER" width="15%" id="TdFilter" style="height: 22px">
                    <a href="javascript:void(0);" onclick="FnAlert(3);"><span style="color: Blue; text-decoration: underline;
                        font-size: 8pt; font-weight: bold">Filter</span></a>
                
                </td>
            </tr>
        </table>
        <table id="Tab_Selection" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <td>
                    <table>
                        <tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr style="background-color: #E3E4FA">
                                        <td colspan="2" align="center">
                                            <b>Source Pool Account</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr valign="top">
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Exchange :
                                                    </td>
                                                    <td>
                                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:DropDownList ID="DdlSourceExchange" Font-Size="10px" runat="server" Width="100px"
                                                                    onchange="FnChk('SourceExchange')">
                                                                </asp:DropDownList>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="BtnChk" EventName="Click"></asp:AsyncPostBackTrigger>
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td valign="top">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr valign="top">
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Settlement No :
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtSourceSettNo" runat="server" Font-Size="10px" onkeyup="FunCallAjaxList(this,event,'Source')"
                                                            Width="200Px"></asp:TextBox>
                                                    </td>
                                                    <td style="display: none;">
                                                        <asp:TextBox ID="txtSourceSettNo_hidden" runat="server" Font-Size="10px" Width="200Px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" colspan="2">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr valign="top">
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Pool A/c :
                                                    </td>
                                                    <td>
                                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:DropDownList ID="DdlSourcePoolAc" Font-Size="10px" runat="server">
                                                                </asp:DropDownList>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="BtnChk" EventName="Click"></asp:AsyncPostBackTrigger>
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr style="background-color: #E3E4FA">
                                        <td colspan="2" align="center">
                                            <b>Target Pool Account</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr valign="top">
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Exchange :
                                                    </td>
                                                    <td>
                                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:DropDownList ID="DdlTargetExchange" Font-Size="10px" runat="server" Width="100px"
                                                                    onchange="FnChk('TargetExchange')">
                                                                </asp:DropDownList>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="BtnChk" EventName="Click"></asp:AsyncPostBackTrigger>
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td valign="top">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr valign="top">
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Settlement No :
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtTargetSettNo" runat="server" Font-Size="10px" onkeyup="FunCallAjaxList(this,event,'Target')"
                                                            Width="200Px"></asp:TextBox>
                                                    </td>
                                                    <td style="display: none;">
                                                        <asp:TextBox ID="txtTargetSettNo_hidden" runat="server" Font-Size="10px" Width="200Px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" colspan="2">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr valign="top">
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Pool A/c :
                                                    </td>
                                                    <td>
                                                        <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:DropDownList ID="DdlTargetPoolAc" Font-Size="10px" runat="server">
                                                                </asp:DropDownList>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="BtnChk" EventName="Click"></asp:AsyncPostBackTrigger>
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                        <td colspan="2" class="gridcellleft"><table><tr><td>
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr valign="top">
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Transfer Date :</td>
                                        <td id="td_dtto" class="gridcellleft">
                                            <dxe:ASPxDateEdit ID="DtTransferDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="10px" Width="108px" ClientInstanceName="DtTransferDate">
                                                <DropDownButton Text="For">
                                                </DropDownButton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                    </tr>
                                </table>
                            </td><td >
                                <table border="10" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Remarks :</td>
                                        <td>
                                            <asp:TextBox ID="txtRemarks" runat="server" Text="" MaxLength="500" Font-Size="10px"
                                                TextMode="MultiLine" Width="300px" Height="20px" Font-Names="Verdana"></asp:TextBox></td>
                                    </tr>
                                </table>
                            </td></tr></table></td>
                            
                            
                        </tr>
                        <tr>
                            <td class="gridcellleft">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="BtnScreen" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                                                Width="101px" OnClick="BtnScreen_Click" /></td>
                                    </tr>
                                    
                                </table>
                            </td>
                        </tr>
                    </table>
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
            <tr style="display: none;">
                <td>
                    <asp:Button ID="BtnChk" runat="server" Text="BtnChk" OnClick="BtnChk_Click" />
                    <asp:HiddenField ID="HiddenField_Chk" runat="server" />
                </td>
                
            </tr>
             
        </table>
        <table id="TabGrid">
          <tr>
                <td>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel5">
                        <ContentTemplate>
                            <div id="divdisplay" runat="server">
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnScreen" EventName="Click"></asp:AsyncPostBackTrigger>
                        </Triggers>
                    </asp:UpdatePanel>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnProcessing1" runat="server" Text="Generate Transfers" CssClass="btnUpdate"
                                            Height="25px" OnClientClick="javascript:selecttion();" Width="147px" OnClick="btnProcessing1_Click" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnProcessing1" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="GrdPoolToPool" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="2px" OnRowCreated="GrdPoolToPool_RowCreated" OnRowDataBound="GrdPoolToPool_RowDataBound" >
                                <Columns>
                                   
                                    <asp:TemplateField HeaderText="Client [Code]">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblClientName" runat="server" Text='<%# Eval("ClientName")%>' CssClass="gridstyleheight1"></asp:Label>
                                            <asp:Label ID="lblClientid" runat="server" Text='<%# Eval("Clientid")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 
                                    <asp:TemplateField HeaderText="Source Scrip">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblSourceScripName" runat="server" Text='<%# Eval("SourceScripName")%>' CssClass="gridstyleheight1"></asp:Label>
                                            <asp:Label ID="lblSourceProductid" runat="server" Text='<%# Eval("SourceProductid")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Out Qty">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblOutQty" runat="server" Text='<%# Eval("OutQty")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Stocks">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                             <asp:Label ID="lblStockQty" runat="server" Text='<%# Eval("StockQty")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Isin">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblIsin" runat="server" Text='<%# Eval("Isin")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Target Scrip">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblTargetScripName" runat="server" Text='<%# Eval("TargetScripName")%>' CssClass="gridstyleheight1"></asp:Label>
                                            <asp:Label ID="lblTargetProductid" runat="server" Text='<%# Eval("TargetProductid")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="In Qty">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblInQty" runat="server" Text='<%# Eval("InQty")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Transfer">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtTrasferQty" Font-Size="10px" Width="60px" runat="server" Onkeypress="return isNumberKey(event)"
                                                Text='<%# Eval("TrasferQty") %>' Style="text-align: right;"></asp:TextBox>
                                          <asp:Label ID="lblTrasferQty" Visible="false" runat="server" Text='<%# Eval("TrasferQty")%>' CssClass="gridstyleheight1"></asp:Label>
                                         
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelected" runat="server" />
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkAll" runat="server" onclick="javascript:SelectAllCheckboxes(this);" />
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle BackColor="White" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                    BorderWidth="1px"></RowStyle>
                                <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                    Font-Bold="True" Wrap="False"></HeaderStyle>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnScreen" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnProcessing2" runat="server" Text="Generate Transfers" CssClass="btnUpdate"
                                            Height="25px" OnClientClick="javascript:selecttion();" Width="147px" OnClick="btnProcessing2_Click" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnProcessing2" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>