<%@ page language="C#" autoeventwireup="true" inherits="management_AuctionProcessing, App_Web_s3wzohpw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Auction Processing</title>
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
                 Hide('TabGrid');
                 Hide('Tab_DisplayNoAction');
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
    function FnFetchSettlement(objID,objEvent,ObjType)
    {
       var strQuery_Table = '';
       var strQuery_FieldName = '';
       var strQuery_WhereClause = '';
       var strQuery_OrderBy='';
       var strQuery_GroupBy='';
       var CombinedQuery='';
            
       var exchangesegmnet="<%=Session["ExchangeSegmentID"]%>";
	   var TypeSuffix=new String("<%=Session["LastSettNo"]%>");       
       
        
       var pp=document.getElementById('txtPendingPostion').value;
       if(pp!=TypeSuffix && pp.length>8)
       {
        TypeSuffix=pp.substring(7,8);
       }
       else
       {
        TypeSuffix=TypeSuffix.substring(7,8);
       }
       
    
       
         var finyear='<%=Session["LastFinYear"]%>';
         var valyr= finyear.split('-');
         
         
         
         strQuery_Table = "Master_Settlements";
         strQuery_FieldName = "distinct top 10 RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)+'  ' + REPLACE(CONVERT(VARCHAR(9), settlements_StartDateTime, 6), ' ', '-') AS [DD-Mon-YY],RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)";
         strQuery_WhereClause = " settlements_exchangesegmentid='<%=Session["ExchangeSegmentID"]%>' and  ((RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)) like (\'%RequestLetter%') and /*((settlements_StartDateTime between '" + valyr[0]+"-04-01 00:00:00' and '"+ valyr[1]+"-03-31 11:59:59') or */(Settlements_FundsPayin between '"+ valyr[0]+"-04-01 00:00:00' and '"+ valyr[1]+"-03-31 11:59:59')/*)*/) ";
             
        if(ObjType=="TransferTo")
        {
            if(exchangesegmnet=="1")
            {
                if(TypeSuffix=="W" | TypeSuffix=="Z")
                    strQuery_WhereClause = " settlements_TypeSuffix='X' and " + strQuery_WhereClause;
                else if(TypeSuffix=="F")
                    strQuery_WhereClause = " settlements_TypeSuffix='D' and " + strQuery_WhereClause;
                else
                    strQuery_WhereClause = " settlements_TypeSuffix='A' and " + strQuery_WhereClause;
            }
            if(exchangesegmnet=="4")
            {
                if(TypeSuffix=="Z")
                    strQuery_WhereClause = " settlements_TypeSuffix='Y' and " + strQuery_WhereClause;
                else
                    strQuery_WhereClause = " settlements_TypeSuffix='D' and " + strQuery_WhereClause;
            }
                    
        }
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
    function RecordDisplay(obj)
    {

        if(obj=="1")
        {
            alert('No Record Found');
            Hide('TabGrid');
            Hide('Tab_DisplayNoAction');
        }
       else if(obj=="3")
        {
            alert('Please Select Settlement Number !! ');
            Hide('TabGrid');
            Hide('Tab_DisplayNoAction');
        }
       else if(obj=="4")
        {
            Hide('TabGrid');
            Hide('Tab_DisplayNoAction');
            alert('Generate Successfully !!');
        }
      else  if(obj=="5")
        {
            Hide('TabGrid');
            Show('Tab_DisplayNoAction');
            alert('Generate Successfully !!');
        }
        else
        {
            Show('TabGrid');
            Hide('Tab_DisplayNoAction');
        }
       
        height();
        
    }
  
         function SelectAllCheckboxes(chk) 
          {
            $('#<%=grdAuctionProcessing.ClientID %>').find("input:checkbox").each(function() 
            {
                if (this != chk) {
                    this.checked = chk.checked;
                }
            });
          }
        function ChangeRowColor(rowID,rowNumber,ForColorId) 
        {

                var gridview = document.getElementById('grdAuctionProcessing'); 
                var rowIndex=1;
             
               if(document.getElementById(rowID).style.backgroundColor!='lightgrey')
               {
               
                    for (rowIndex; rowIndex<=gridview.rows.length-1; rowIndex++) 
                    { 
                        var rowElement = gridview.rows[rowIndex]; 
                        if(rowElement.style.backgroundColor!='lightgrey')
                        {
                            rowElement.style.backgroundColor='#FFFFFF'
                        }
                        
                    }
                    var color = document.getElementById(rowID).style.backgroundColor;
                    if(color != '#ffe1ac') 
                    {
                        if(document.getElementById(rowID).style.backgroundColor!='lightgrey')
                        {
                            oldColor = color;
                        }
                    }
                    
                    if(color == '#ffe1ac') 
                    {
                        if(document.getElementById(rowID).style.backgroundColor!='lightgrey')
                        {
                            document.getElementById(rowID).style.backgroundColor = oldColor;
                        }
                    }
                    else 
                        document.getElementById(rowID).style.backgroundColor = '#ffe1ac';            
              
                }
                

        }
        function isNumberKey(e)      
        {         
            var keynum
            var keychar
            var numcheck
            if(window.event)//IE
            {
                keynum = e.keyCode 
                if(keynum>=48 && keynum<=57 || keynum==46)
                   {
                      return true;
                   }
                else
                    {
                     alert("Please Insert Numeric Only");
                     return false;
                    }
             } 
         
         else if(e.which) // Netscape/Firefox/Opera
           {
               keynum = e.which  
               if(keynum>=48 && keynum<=57 || keynum==46)
                     {
                      return true;
                     }
                     else
                     {
                     alert("Please Insert Numeric Only");
                     return false;
                     }     
                }
        }
      function fn_Qty(textid,qty,txtqty)
      {
        if(parseInt(txtqty)>parseInt(qty))
        {
           alert('You Can Deliver Maximum '+qty+' Share');
           textid.value=qty;
           textid.focus();
           textid.select();
        }
        
      }
     FieldName='lstSlection';
     </script>
 

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="36000">
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
                    <strong><span id="SpanHeader" style="color: #000099">Auction Processing</span></strong></td>

           
            </tr>
        </table>
            <table class="TableMain100">
                <tr>
                    <td>
                        <table >
                            <tr>
                                <td>
                                    <table  border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Pending Position Of :
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPendingPostion" runat="server" Font-Size="10px" onkeyup="FnFetchSettlement(this,event,'PendingPosition')"
                                                    Width="200Px"></asp:TextBox></td>
                                            <td style="display: none;">
                                                <asp:TextBox ID="txtPendingPostion_hidden" runat="server" Font-Size="10px" onkeyup="FnFetchSettlement(this,event,'PendingPosition')"
                                                    Width="200Px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table  border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Transfer To :
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtTransferTo" runat="server" Font-Size="10px" onkeyup="FnFetchSettlement(this,event,'TransferTo')" Width="200Px"></asp:TextBox></td>
                                                  <td style="display: none;">
                                                <asp:TextBox ID="txtTransferTo_hidden" runat="server" Font-Size="10px" onkeyup="FnFetchSettlement(this,event,'PendingPosition')"
                                                    Width="200Px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td valign="top">
                                    <asp:Button ID="btnScreen" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                                        Width="101px" OnClick="btnScreen_Click" />
                                </td>
                                <td valign="top">
                                    <asp:Button ID="btnexcelopen" runat="server" CssClass="btnUpdate" Height="20px" Text="Open To Excel"
                                        Width="101px" OnClick="btnexcelopen_Click" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
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
                <tr id="TabGrid">
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="btnGenerate1" runat="server" Text="Generate" CssClass="btnUpdate"
                                                            Height="25px" OnClientClick="javascript:selecttion();" Width="147px" OnClick="btnGenerate1_Click"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnGenerate1" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:GridView ID="grdAuctionProcessing" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                                AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="2px" ForeColor="#0000C0"
                                                OnRowDataBound="grdAuctionProcessing_RowDataBound" OnRowCreated="grdAuctionProcessing_RowCreated">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Client/Exch">
                                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblClientName" runat="server" Text='<%# Eval("ClientName")%>' CssClass="gridstyleheight1"
                                                                ForeColor='<%# (System.Convert.ToInt32(DataBinder.Eval(Container.DataItem, "ForColorUserStatus"))==1 ? System.Drawing.Color.Blue : System.Drawing.Color.Black) %>'></asp:Label>
                                                            <asp:Label ID="lblProdcutId" runat="server" Text='<%# Eval("ProdcutId")%>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblISINNo" runat="server" Text='<%# Eval("ISINNo")%>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblChkSelection" runat="server" Text='<%# Eval("ChkSelection")%>'
                                                                Visible="false"></asp:Label>
                                                            <asp:Label ID="lblForColorUserStatus" runat="server" Text='<%# Eval("ForColorUserStatus")%>'
                                                                Visible="false"></asp:Label>
                                                            <asp:Label ID="lblClientId" runat="server" Text='<%# Eval("ClientId")%>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblScripName" runat="server" Text='<%# Eval("ScripName")%>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Pending Incoming">
                                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPendingInComing" runat="server" Text='<%# Eval("PendingInComing")%>'
                                                                CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Pending OutGoing">
                                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPendingOutGoing" runat="server" Text='<%# Eval("PendingOutGoing")%>'
                                                                CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Auct Buy Qty">
                                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtAucBuyQty" Style="text-align: right;" Onkeypress="return isNumberKey(event)"
                                                                runat="server" Text='<%# Eval("AucBuyQty")%>' CssClass="gridstyleheight1"></asp:TextBox>
                                                            <asp:Label ID="lblAucBuyQty" runat="server" Text='<%# Eval("AucBuyQty")%>' CssClass="gridstyleheight1"></asp:Label>
                                                            <asp:Label ID="lblChkSelectionBuy" runat="server" Text='<%# Eval("ChkSelectionBuy")%>'
                                                                Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Auct Sell Qty">
                                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtAucSellQty" Style="text-align: right;" runat="server" Text='<%# Eval("AucSellQty")%>'
                                                                CssClass="gridstyleheight1" Onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                            <asp:Label ID="lblAucSellQty" runat="server" 
                                                                Text='<%# Eval("AucSellQty")%>' CssClass="gridstyleheight1"></asp:Label>
                                                            <asp:Label ID="lblChkSelectionSell" runat="server" Text='<%# Eval("ChkSelectionSell")%>'
                                                                Visible="false"></asp:Label>
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
                                            <asp:AsyncPostBackTrigger ControlID="btnScreen" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="btnGenerate2" runat="server" Text="Generate" CssClass="btnUpdate"
                                                            Height="25px" OnClientClick="javascript:selecttion();" Width="147px" OnClick="btnGenerate2_Click"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnGenerate2" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
              
            </table>
            <table style="display: none;" id="Tab_DisplayNoAction">
                <tr>
                    <td>
                       <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                <ContentTemplate>
                                    <table width="100%" border="1">
                                        <tr>
                                            <td>
                                                <div id="DivHeader" runat="server">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div id="Divdisplay" runat="server">
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                               </ContentTemplate>
                             <Triggers>
                             
                               <asp:AsyncPostBackTrigger ControlID="btnScreen" EventName="Click"></asp:AsyncPostBackTrigger>
                                     
                                </Triggers>
                            </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
