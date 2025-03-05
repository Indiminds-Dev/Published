<%@ page language="C#" autoeventwireup="true" inherits="management_DividendPosting, App_Web_bfdn6hbr" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dividend Posting</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
    
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
        function InterSettlementFunc(objID,objListFun,objEvent,ObjType)
        {
            ajax_showOptions(objID,objListFun,objEvent,ObjType,'Main');
        }
        function InterSettlementFunc1(objID,objListFun,objEvent,ObjType)
        {
            ajax_showOptions(objID,objListFun,objEvent,ObjType,'Sub');
        }
        function keyVal(obj) {            
            var SegAccid=obj.split('~');
            document.getElementById('TxtAccount_hidden').value=SegAccid[0];
            document.getElementById('txtSegment_hidden').value=SegAccid[1];
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
        function height()
        {
            if(document.body.scrollHeight>=500)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '500';
            }
            window.frameElement.widht = document.body.scrollWidht;
        }
        function Page_Load()
        {
            document.getElementById('TrGenerate').style.display='none';
            height();
        }
        function Display(obj)
        {
            if(obj=='1')
            {
                document.getElementById('TrGenerate').style.display='inline';
                document.getElementById('TrShow').style.display='inline';
            }
            else
            {
                document.getElementById('TrGenerate').style.display='none';
                document.getElementById('TrShow').style.display='none';
            }
            height();
        }
        function AfterProcess(obj)
        {
            if(obj=='G')
                alert('Processing Successfully !!!');
            else  if(obj=='D')
                alert('Delete Successfully !!!');
            document.getElementById('TrGenerate').style.display='none';
            document.getElementById('TrShow').style.display='none';
        }
        function SelectAll(id) 
        {
            var frm = document.forms[0];
            for (i=0;i<frm.elements.length;i++) 
            {
                if (frm.elements[i].type == "checkbox") 
                {  
                    frm.elements[i].checked = document.getElementById(id).checked;
                }
            }
        }


        //        ------------ For Auto Complete Start -----------------

        function FunCallAjaxList(objID, objEvent, ObjType) {

            var strQuery_Table = '';
            var strQuery_FieldName = '';
            var strQuery_WhereClause = '';
            var strQuery_OrderBy = '';
            var strQuery_GroupBy = '';
            var CombinedQuery = '';

            if (ObjType == 'InterSettlementForISINAccounts') {

                document.getElementById('TxtAccount_hidden').value = '';

               
                strQuery_Table = "Master_DPAccounts";
                //                strQuery_FieldName = "distinct top 10  DPAccounts_ShortName AS loginid, cast(DPAccounts_ID as varchar)+'~'+cast(DPAccounts_ExchangeSegmentID as varchar) as user_id ";
                strQuery_FieldName = "distinct top 10  DPAccounts_ShortName AS loginid, cast(DPAccounts_ID as varchar) as user_id ";
                strQuery_WhereClause = "  DPAccounts_ShortName like (\'%RequestLetter%') ";


            }



            CombinedQuery = new String(strQuery_Table + "$" + strQuery_FieldName + "$" + strQuery_WhereClause + "$" + strQuery_OrderBy + "$" + strQuery_GroupBy);


            ajax_showOptions(objID, 'GenericAjaxList', objEvent, replaceChars(CombinedQuery));
            //  alert (CombinedQuery);
        }

        function replaceChars(entry) {
            out = "+"; // replace this
            add = "--"; // with this
            temp = "" + entry; // temporary holder

            while (temp.indexOf(out) > -1) {
                pos = temp.indexOf(out);
                temp = "" + (temp.substring(0, pos) + add +
            temp.substring((pos + out.length), temp.length));
            }
            return temp;
        }

        //----------------------- end   
        
        
        
        
        
       FieldName='txtShare_hidden';
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
                    <td class="EHEADER" style="text-align: center;" colspan="6">
                        <strong><span style="color: #000099">Dividend Posting</span></strong>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Share :
                    </td>
                    <td>
                        <asp:TextBox ID="txtShare" runat="server" Font-Size="10px" onkeyup="InterSettlementFunc1(this,'InterSettlementForISINAccounts',event,'Product')"></asp:TextBox>
                    </td>
                    <td class="gridcellleft">
                        Record Date :
                    </td>
                    <td>
                        <dxe:ASPxDateEdit ID="DtRecordDate" runat="server" Font-Size="10px" UseMaskBehavior="True"
                            EditFormat="Custom" Width="150px">
                        </dxe:ASPxDateEdit>
                    </td>
                    <td class="gridcellleft">
                        Select Account :
                    </td>
                    <td>
                        <asp:TextBox ID="TxtAccount" runat="server" Font-Size="10px" onkeyup="InterSettlementFunc(this,'InterSettlementForISINAccounts',event,'AccountNameE')" Width="221px"></asp:TextBox>
                        
                      <%--    <asp:TextBox ID="TxtAccount" runat="server" Font-Size="10px" onkeyup="FunCallAjaxList(this,event,'InterSettlementForISINAccounts')"  Width="221px"   ></asp:TextBox>--%>
                        
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Dividend Amount :
                    </td>
                    <td>
                        <asp:TextBox ID="txtBonusAmount" runat="server" Font-Size="10px"  Onkeypress="javascript:return isNumberKey(event);"></asp:TextBox>
                    </td>
                    <td class="gridcellleft">
                        Generate Date :
                    </td>
                    <td>
                        <dxe:ASPxDateEdit ID="DtGenerateDate" runat="server" Font-Size="10px" UseMaskBehavior="True"
                            EditFormat="Custom" Width="150px">
                        </dxe:ASPxDateEdit>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlGenerateDelete" runat="server" Width="92px">
                            <asp:ListItem Value="G">Generate</asp:ListItem>
                            <asp:ListItem Value="D">Delete</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Button ID="btnShow" runat="server" Text="Show" CssClass="btnUpdate" Width="113px" OnClick="btnShow_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <asp:HiddenField ID="txtShare_hidden" runat="server" />
                        <asp:HiddenField ID="TxtAccount_hidden" runat="server" />
                        <asp:HiddenField ID="txtSegment_hidden" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <ProgressTemplate>
                                <div id='Div2' style='position: absolute; font-family: arial; font-size: 30; background-color: white;
                                    layer-background-color: white;'>
                                    <table border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
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
                    <td colspan="5">
                    </td>
                </tr>
                <tr id="TrShow">
                    <td colspan="6">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:GridView ID="grdDividendPosting" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                    ShowFooter="True" AutoGenerateColumns="false" BorderStyle="Solid" BorderWidth="2px"
                                    CellPadding="4" ForeColor="#0000C0" OnRowDataBound="grdDividendPosting_RowDataBound">
                                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                    <Columns>
                                        <asp:TemplateField Visible="False">
                                            <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("clientid")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Client">
                                            <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblClient" runat="server" Text='<%# Eval("clientname")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Qty">
                                            <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="right"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblsumqty" runat="server" Text='<%# Eval("sumqty")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Dividend Amount">
                                            <ItemStyle Font-Size="10px" BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtAdj" Font-Size="10px" Width="60px" runat="server" Text='<%# Eval("Adj") %>'
                                                    Onkeypress="javascript:return isNumberKey(event);" onfocusout="SelectSingle()"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="False">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblBranch" runat="server" Text='<%# Eval("Branch")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="False">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblSettlementNumber" runat="server" Text='<%# Eval("SettlementNumber")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="False">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblSettlementType" runat="server" Text='<%# Eval("SettlementType")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="ChkDelivery" runat="server" />
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="cbSelectAll" runat="server" />
                                            </HeaderTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle BackColor="White" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                        BorderWidth="1px"></RowStyle>
                                    <EditRowStyle BackColor="#E59930"></EditRowStyle>
                                    <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                    <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                    <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                        Font-Bold="False"></HeaderStyle>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                               <asp:AsyncPostBackTrigger ControlID="btnShow" EventName="Click" />
                               <asp:AsyncPostBackTrigger ControlID="btnGenerate" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr id="TrGenerate">
                    <td colspan="5">
                        <asp:Button ID="btnGenerate" runat="server" Text="Generate/Delete" CssClass="btnUpdate"
                            Height="25px" Width="165px" OnClick="btnGenerate_Click"  />
                    </td>
                    <td style="display: none">
                       <%-- <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />--%>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
