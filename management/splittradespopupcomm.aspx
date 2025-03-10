<%@ page language="C#" autoeventwireup="true" inherits="management_splittradespopupcomm, App_Web_ptes6n28" %>


<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
  
    <title>Split Trades</title>    
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
     <script language="javascript" type="text/javascript">
      function Page_Load()///Call Into Page Load
            {   
                height();
            }
      function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
  function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
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
    function FunClient(objID,objListFun,objEvent,ObjType)
        {
            var obj=document.getElementById('lblclientall_hidden').value;
            if(document.getElementById('lblclientall_hidden').value=='')
            {
                ObjType='Clients';
            }
            else
            {
                ObjType='ClientsNotIn';
            }
            ajax_showOptions(objID,objListFun,objEvent,ObjType+'~'+obj);
        }
    function DISPLAY(obj)
    {
         var s=document.getElementById(obj);
         s.focus();
         s.select();
       
    }
  function btnchk(obj)
  {
 
        if(obj=='0')
        {
            document.getElementById('btnSave').disabled=true;
        }
        else
        {
             document.getElementById('btnSave').disabled=false;
        }
  }
    function fncheckLot(obj,obj2)
    {
        var obj1=obj.split('.');
        if(parseInt(obj1[0])>parseInt(document.getElementById('lblLot_hidden').value))
        {
            alert('Qty Cant Be Greater Than '+document.getElementById('lblLot_hidden').value+'');
            document.getElementById(obj2).focus();
            document.getElementById(obj2).select();
            document.getElementById(obj2).innerText=document.getElementById('lblLot_hidden').value;
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
     function ForDiscard()
     {
    
         parent.editwin.close();
     }
   function alertsameclient()
     {
        btnchk('0');
        alert('This Client Already Exists !');
         
     }
        FieldName='txtclient_hidden';
        </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form2" runat="server" autocomplete="off">
  <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000">
            </asp:ScriptManager>
    <div>
        <table width="100%">
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="grdsplit" runat="server" DataKeyNames="comcustomertrades_id" CssClass="gridcellleft"
                                CellPadding="4" ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px"  BorderColor="#507CD1"
                                Width="100%" AutoGenerateColumns="False"  ShowFooter="True" OnRowDataBound="grdsplit_RowDataBound" OnRowCommand="grdsplit_RowCommand">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#EFF3FB" BorderWidth="1px" />
                                <EditRowStyle BackColor="#E59930" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle Font-Bold="False" ForeColor="Black" CssClass="EHEADER" BorderColor="AliceBlue"
                                    BorderWidth="1px" />
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="ClientName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblClientName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtclient" Font-Size="10px" Text='<%# Eval("Name") %>' Width="180px" 
                                                onkeyup="FunClient(this,'ShowClientFORMarginStocks',event,'ClientsNotIn')" runat="server"  ></asp:TextBox>
                                            <asp:HiddenField ID="txtclient_hidden" runat="server" Value='<%# Eval("comCustomerTrades_CustomerID") %>' />
                                            <asp:Label ID="lblID" Visible="false" runat="server" Text='<%# Eval("comcustomertrades_id") %>'></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Scrip">
                                        <ItemTemplate>
                                            <asp:Label ID="lblScripName" runat="server" Text='<%# Eval("productname") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblScripFooterName" runat="server" Text='<%# Eval("productname") %>'></asp:Label>
                                            <asp:Label ID="lblScripID" Visible="false" runat="server" Text='<%# Eval("comCustomerTrades_ProductSeriesID") %>'></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Flag">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFlag" runat="server" Text='<%# Eval("Flag") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblFlagFooterName" runat="server" Text='<%# Eval("Flag") %>'></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Lot">
                                        <ItemStyle HorizontalAlign="Right" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblLot" runat="server" Text='<%# Eval("Lot") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtLot" Onkeypress="return isNumberKey(event)" Width="120px" Text='<%# Eval("Lot")%>'
                                                runat="server" AutoPostBack="true" OnTextChanged="txtLot_TextChanged" Style="text-align: right;"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                  
                                      <asp:TemplateField HeaderText="Qty">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblFooterQty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Rate">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRate" runat="server" Text='<%# Eval("MktRate") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblRateFotterName" runat="server" Text='<%# Eval("MktRate") %>'></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Unit Brkg">
                                        <ItemStyle HorizontalAlign="Right" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblUnitBrokerage" runat="server" Text='<%# Eval("UNITBRKG") %>'></asp:Label>
                                        </ItemTemplate>
                                       
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtUnitBrokerage" Onkeypress="return isNumberKey(event)" AutoPostBack="True"
                                                Width="100px" Text='<%# Eval("UNITBRKG")%>' runat="server" OnTextChanged="txtUnitBrokerage_TextChanged" ></asp:TextBox>
                                        </FooterTemplate>
                                       
                                    </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Net Rate">
                                         <ItemStyle HorizontalAlign="Right" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblNetRatePerUnit" runat="server" Text='<%# Eval("NETRATE") %>'></asp:Label>
                                        </ItemTemplate>
                                       
                                        <FooterTemplate><asp:TextBox ID="txtNetRatePerUnit" Width="100px" Enabled="false" runat="server"
                                                Text='<%# Eval("NETRATE")%>' TabIndex="2"></asp:TextBox>
                                                <asp:Label ID="lblActualQty" runat="server" Visible="false"  Text='<%# Eval("Qty") %>'></asp:Label>
                                                <asp:Label ID="lblActualLot" runat="server" Visible="false"  Text='<%# Eval("Lot") %>'></asp:Label>
                                                </FooterTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                
                                    </asp:TemplateField>
                                   <asp:TemplateField >
                                        <ItemTemplate>
                                        

                                        </ItemTemplate>
                                         <FooterTemplate>
                                                <asp:Button ID="btnsplit" runat="server" Text="Split" CommandName="split" />
                                                                                        </FooterTemplate>
                                    </asp:TemplateField>
                                     
                                
                                </Columns>
                            </asp:GridView>
                            <asp:HiddenField ID="lblLot_hidden" runat="server" />
                            <asp:HiddenField ID="lblclientall_hidden" runat="server" />
                             
                        </ContentTemplate>
                        <Triggers>
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Button ID="btnSave" CssClass="btnUpdate" Height="20px" runat="server" Text="Save" OnClick="btnSave_Click" />
                     <asp:Button ID="btnDiscard" CssClass="btnUpdate" Height="20px" runat="server" Text="Discard" OnClick="btnDiscard_Click" />
                </td>
           
            </tr>
            
        </table>
    </div>
    </form>
</body>
</html>
