<%@ page language="C#" autoeventwireup="true" inherits="management_frm_NEFTFile, App_Web_e158i_8t" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
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
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

    <script language="javascript" type="text/javascript">
        FieldName='btnGenerate';
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
   
      if(document.body.scrollHeight>=600)
          window.frameElement.height = document.body.scrollHeight+600;
      else
          window.frameElement.height = '600px';
          window.frameElement.Width = document.body.scrollWidth+100;
    }
    function PageLoad()
    {
      trSummary.style.display='none';
      MainFilter.style.display='inline';
      txtSelect.style.display='none';
      document.getElementById('tdIncludeHDFCAC').style.display='none';
    }
   function ShowBankName(obj1,obj2,obj3)
    {
       ajax_showOptions(obj1,obj2,obj3,'k','Main');
    }
  function OnDateChanged()
     {
           document.getElementById('<%=Button1.ClientID %>').click();
           trSummary.style.display='inline';
    }
   function CheckAccid()
   {
    trSummary.style.display='inline';
    return true;
       
   } 
   function RegenBatch(obj)
   {
     var selRow = eval(obj.id.substr(15,(obj.id.substr(15).indexOf('_'))));
     var grid = document.getElementById("<%= gridSummary.ClientID %>");
     var transaction = grid.rows[selRow-1].cells[1].innerText;
     var transfer = grid.rows[selRow-1].cells[2].innerText;            
    }
        
  function GenereteSlip(obj)
   {
     var selRow = eval(obj.id.substr(15,(obj.id.substr(15).indexOf('_'))));
     var grid = document.getElementById("<%= GridSelect.ClientID %>");
     var transaction = grid.rows[selRow-1].cells[1].innerText;
     var transfer = grid.rows[selRow-1].cells[2].innerText;            
    }
       
    function ForFilterOff()
    { 
        trSummary.style.display='none';
        MainFilter.style.display='none';
        txtSelect.style.display='inline';
        spanfltr.style.display='inline';
        SpanPrint.style.display='inline';
        height();
    } 
    function ShowHide()
    {
    
      trSummary.style.display='none';
      MainFilter.style.display='none';
      txtSelect.style.display='inline';
      spanfltr.style.display='inline';
      SpanPrint.style.display='inline';
    }
    function ForFilterOn()
    {
      OnDateChanged();
      trSummary.style.display='inline';
      MainFilter.style.display='inline';
      txtSelect.style.display='none';
      spanfltr.style.display='none';
      SpanPrint.style.display='none';
      if(cCmbTransferBank.GetValue()=='2') document.getElementById('tdIncludeHDFCAC').style.display='inline';
      else document.getElementById('tdIncludeHDFCAC').style.display='none';
    }
     function keyVal(obj)
     {
        OnDateChanged();
     }
    function CallBankAccount(obj1,obj2,obj3)
    {
       var CurrentSegment='<%=Session["usersegid"]%>'
       var strPutSegment = " and (MainAccount_ExchangeSegment=" + CurrentSegment + " or MainAccount_ExchangeSegment=0)";
       var strQuery_Table = "(Select MainAccount_AccountCode+\'-\'+MainAccount_Name+\' [ \'+MainAccount_BankAcNumber+\' ]\' as IntegrateMainAccount,MainAccount_AccountCode as MainAccount_AccountCode,MainAccount_Name,MainAccount_BankAcNumber from Master_MainAccount where (MainAccount_BankCashType=\'Bank\' or MainAccount_BankCashType=\'Cash\') and (MainAccount_BankCompany=\'" + '<%=Session["LastCompany"] %>' + "\' Or IsNull(MainAccount_BankCompany,'')='')" + strPutSegment + ") as t1";
       var strQuery_FieldName = " Top 10 * ";
       var strQuery_WhereClause = "MainAccount_AccountCode like (\'%RequestLetter%\') or MainAccount_Name like (\'%RequestLetter%\') or MainAccount_BankAcNumber like (\'%RequestLetter%\')";
       var strQuery_OrderBy='';
       var strQuery_GroupBy='';
       var CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
       ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');
    }
    function replaceChars(entry) {
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



    </script>

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

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <table style="width: 100%">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">NEFT/RTGS Files</span></strong>
                </td>
            </tr>
        </table>
        <div style="text-align:center;width:100%;">
            <table>
                <tr>
                    <td style="text-align: left;color:red;text-decoration:underline">
                        *Note : Please Check Below Points Before Creating Batch
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left;color:red">
                        1 : Beneficiary Bank Account Number Must Exist in The System.
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left;color:red">
                        2 : Beneficiary Bank IFSC Code Must Exist in The System. Length Must Be 11 (AlphaNumeric).
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left;color:red">
                        3 : Beneficiary Email ID Must Exist in The System of Type ('Official' or 'Personal')
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left;color:red">
                        4 : Narration Or Instrument No. Of Created Vouchers Must Contain The word 'NEFT' Or 'RTGS' Or 'E - Net'. Default is : 'NEFT'
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="TableMain100">
                <tr id="MainFilter" runat="server">
                    <td align="Center">
                        <table width="500px">
                            <tr>
                                <td bgcolor="#b7ceec" class="gridcellleft">
                                    Transfer Bank</td>
                                <td class="gridcellleft">
                                    <dxe:ASPxComboBox ID="CmbTransferBank" runat="server" ClientInstanceName="cCmbTransferBank"
                                        EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String" Tabindex="1"
                                        Width="250px">
                                        <items>
                                            <dxe:ListEditItem Text="HDFC BANK" Value="1" />
                                            <dxe:ListEditItem Text="OTHER BANK" Value="2" />
                                            <%--New Work 06/10/2023--%>
                                            <dxe:ListEditItem Text="ICICI BANK" Value="3" />
                                            <%--End of New Work 06/10/2023--%>
                                        </items>
                                        <clientsideevents selectedindexchanged="function(s,e){
                                            PageLoad();
                                            document.getElementById('txtSelect').style.display='none';
                                            document.getElementById('txtBankName').value='';
                                            if(cCmbTransferBank.GetValue()=='2') document.getElementById('tdIncludeHDFCAC').style.display='inline';
                                            else document.getElementById('tdIncludeHDFCAC').style.display='none';
                                            }"></clientsideevents>
                                    </dxe:ASPxComboBox>
                                </td>
                                <td id="tdIncludeHDFCAC">
                                     <asp:CheckBox ID="ChkIncludeHDFCAC" runat="server" /><span style="font-family: Arial; color: blue;"><b>Include HDFC A/C</b></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    Select Bank
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtBankName" runat="server" Font-Size="10px" Width="250px" TabIndex="2"
                                        onkeyup="CallBankAccount(this,'GenericAjaxList',event)"></asp:TextBox>
                                    <asp:HiddenField ID="txtBankName_hidden" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    Transaction Date
                                </td>
                                <td class="gridcellleft">
                                    <dxe:ASPxDateEdit ID="txtTranDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        TabIndex="3" Width="250px" ClientInstanceName="e1">
                                        <buttonstyle width="13px">
                                                    </buttonstyle>
                                        <clientsideevents datechanged="function(s, e) {OnDateChanged();}" />
                                    </dxe:ASPxDateEdit>
                                </td>
                            </tr>
                            <tr id="trSummary">
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    Select Transactions To Export :
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:GridView ID="gridSummary" runat="server" AutoGenerateColumns="False" DataKeyNames="PrintDate"
                                                BackColor="PeachPuff" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px"
                                                EmptyDataText="No Record Found." OnRowDataBound="gridSummary_RowDataBound" ForeColor="Black">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chb1" runat="server" onclick="RegenBatch(this);" />
                                                        </ItemTemplate>
                                                        <ControlStyle Width="10%" />
                                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Total Transaction">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCount" runat="server" Text='<%# Eval("TotalTran") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle ForeColor="Black" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Export DateTime">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("PrintDate") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle ForeColor="Black" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="CashBankDetailid" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblIBREF" runat="server" Text='<%# Eval("IBREF") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle ForeColor="Black" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="Button1" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td class="gridcellleft">
                                    <asp:Button ID="btnShow" Text="Go To Export" runat="server" CssClass="btnUpdate"
                                        OnClick="btnGenerate_Click" TabIndex="4" />
                                </td>
                                <td class="gridcellleft">
                                    <asp:Button ID="btnCancel" Text="Cancel Batch" runat="server" CssClass="btnUpdate"
                                        OnClick="btnCancel_Click" TabIndex="5" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="display: none">
                    <td colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="" OnClientClick="return CheckAccid();"
                            OnClick="Button1_Click" />
                        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table width="90%">
                <tr>
                    <td align="right">
                        <table width="100%" border="1">
                            <tr>
                                <td align="left">
                                    <span id="SpanPrint" style="display: none">
                                        <asp:Button ID="btnGenerate" Text="Export" runat="server" CssClass="btnUpdate" OnClick="btnShow_Click"
                                            TabIndex="6" /></span>
                                </td>
                                <td align="right">
                                    <span id="spanfltr" style="display: none"><a href="#" style="font-weight: bold; color: Blue"
                                        onclick="javascript:ForFilterOn();">Filter</a></span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="txtSelect">
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="GridSelect" runat="server" AutoGenerateColumns="False" BackColor="PeachPuff"
                                    BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" EmptyDataText="No Record Found."
                                    OnRowDataBound="GridSelect_RowDataBound" Width="100%">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Select" ControlStyle-Width="10%" ItemStyle-Width="10%"
                                            ItemStyle-HorizontalAlign="center">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chb2" runat="server" onclick="GenereteSlip(this);" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bank & Branch Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBankName" runat="server" Text='<%# Eval("BankName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="Black" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Account No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAccountNo" runat="server" Text='<%# Eval("AcNumber") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="Black" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAmonut" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                            <HeaderStyle ForeColor="Black" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Account Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("BenName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="Black" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CashBankDetailid" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCashBankID" runat="server" Text='<%# Eval("CashBankDetail_ID") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="Black" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Button1" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <ProgressTemplate>
                                <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                    top: 50%; background-color: white; layer-background-color: white; height: 80;
                                    width: 150;'>
                                    <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#c0d6e4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#ffffff' style="width: 21px">
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#ffffff'>
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
        </div>
    </form>
</body>
</html>
