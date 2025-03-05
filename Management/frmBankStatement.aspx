<%@ page language="C#" autoeventwireup="true" inherits="management_frmBankStatement_, App_Web_im-ehkhh" %>

<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1">
<link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <title>Untitled Page</title>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
         <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
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
	
	.grid_scroll
     {
		    overflow-y: no;  
            overflow-x: scroll; 
            width:55%;
            scrollbar-base-color: #C0C0C0;
        
	}
	
	</style>
 <script language="javascript" type="text/javascript">
 groupvalue="";
       function ShowHideFilter(obj1,obj2)
        {
           if(obj1 == 'sum')
               gridMatched.PerformCallback(obj1+'~'+obj2);
           else 
               gridUnMatched.PerformCallback(obj1+'~'+obj2);
               
        }
        
        function OnMoreInfoClick(obj1)
        {               
                      var url='frmBankStatementIndividual.aspx?Id='+obj1+'&TransactionDate='+obj2+'&ValueDate='+obj3+'&InstrumentNumber='+obj4+'&Transactionamount='+obj5+'&Description='+obj6+'&RunningAmount='+obj7+'&Receipt='+obj8;
              parent.OnMoreInfoClick(url,"Rectify Summary",'940px','450px',"Y");
        }
      
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=400)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '400px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function callback()
    {
        gridUnMatched.PerformCallback();
    }
    function gridrefresh(obj)
    {
        alert(obj);
        gridUnMatched.PerformCallback(obj);
    }
    function CallAjax(obj1,obj2,obj3)
    { 
        ajax_showOptions(obj1,obj2,obj3);
    }
    function showOptions(obj1,obj2,obj3)
    {
        FieldName='ddlBankList';   
        ajax_showOptions(obj1,obj2,obj3);
    }
     FieldName='ddlBankList';
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
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div align="center">
      <asp:Panel ID="Panelmain" runat="server" Visible="true" style="text-align: center">
        <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
            <tbody>
                <tr>
                    <td class="lt1">
                        <h5>
                            Imports Bank Statement
                        </h5>
                    </td>
                </tr>
                <tr>
                    <td class="lt brdr">
                        <table cellspacing="0" cellpadding="0" align="center">
                            <tbody>
                                <tr>
                                    <td class="lt">
                                        <table class="width100per" cellspacing="12" cellpadding="0">
                                            <tbody>
                                            
                                                 <tr>
                                                    
                                                    <td class="lt">
                                                       <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtBank" runat="server" Width="220px" Font-Size="11px" Height="15px" TabIndex="3"
                                                                    onkeyup ="CallBankAccount(this,'GenericAjaxList',event)"></asp:TextBox>                                                                                                             
                                                                </td>
                                                            </tr>
                                                             <tr>
                                                                <td  colspan="2"><table><tr><td>
                                                                    File Format&nbsp; :</td><td>
                                                                    <asp:DropDownList ID="ddlBankList" runat="server" Width="96px" Font-Size="Smaller">
                                                                        <asp:ListItem Value="HDFC BANK">HDFC-Enet</asp:ListItem>
                                                                        <asp:ListItem Value="HDFC BANK EASY VIEW">HDFC-EasyView</asp:ListItem>
                                                                        <asp:ListItem Value="HDFC-EasyView(txt)">HDFC-EasyView(txt)</asp:ListItem>
                                                                        <asp:ListItem Value="ICICI">ICICI-Bank</asp:ListItem>
                                                                        <asp:ListItem Value="Axis Bank CSV">Axis Bank</asp:ListItem>
                                                                     </asp:DropDownList></td></tr></table> 
                                                                </td>
                                                            </tr>
                                                         <tr>
                                                       <td>
                                                                <asp:FileUpload ID="OFDBankSelect" runat="server" Width="272px" />
                                                        </td>
                                                       </tr>
                                                       <tr>
                                                            <td>
                                                                <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" OnClick="BtnSave_Click"
                                                                            Width="84px" />
                                                            </td>
                                                      </tr>
                                                        </table>
                                                         
                                                    </td>
                                                    

                                                </tr>
                                                <tr style="display: none">
                                                        
                                                    <td>
                                                        <asp:TextBox ID="txtBank_hidden" runat="server" Width="14px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
        <div id="divSummary">
     <tr style="text-align: right">
     <td style="text-align: right">
         Export:<asp:DropDownList ID="ddlExport" AutoPostBack="true" runat="server" Width="71px" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged">
             <asp:ListItem Value="0">Select</asp:ListItem>
             <asp:ListItem Value="1">Excel</asp:ListItem>
             <asp:ListItem Value="2">PDF</asp:ListItem>
         </asp:DropDownList></td>
    </tr>
    <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server"
                            ActiveTabIndex="1" ClientInstanceName="page"
                            Font-Size="10px" Width="100%" BackColor="#DDECFE">
                            <ClientSideEvents ActiveTabChanged="function(s, e) {
	height();
}" />
                            <TabPages>
<dxtc:TabPage Text="Matched Records">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server"><TABLE><TBODY><TR><TD><A href="javascript:ShowHideFilter('sum','s');"><SPAN style="COLOR: #000099; TEXT-DECORATION: underline">Show Filter</SPAN></A> </TD><TD><A href="javascript:ShowHideFilter('sum','All');"><SPAN style="COLOR: #000099; TEXT-DECORATION: underline">All Records</SPAN></A> </TD></TR></TBODY></TABLE><dxwgv:ASPxGridView runat="server" Width="100%" ID="gridMatchedSummary" KeyFieldName="BANKSTATEMENT_ID" AutoGenerateColumns="False" ClientInstanceName="gridMatched" __designer:wfdid="w9" OnPageIndexChanged="gridMatchedSummary_PageIndexChanged" OnCustomCallback="grid_CustomCallback">
<SettingsPager Mode="ShowAllRecords" Visible="False"></SettingsPager>
<Columns>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="DebitCredit" Caption="Type">
<Settings AutoFilterCondition="Contains"></Settings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="BANKSTATEMENT_TransactionDate" Caption="Transaction Date">
<Settings AutoFilterCondition="Contains"></Settings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="BANKSTATEMENT_ValueDate" Caption="Value Date">
<Settings AutoFilterCondition="Contains"></Settings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="BANKSTATEMENT_ReferenceNo" Caption="Instrument Number">
<Settings AutoFilterCondition="Contains"></Settings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="BANKSTATEMENT_TransactionAmount" Caption="Transaction Amount">
<Settings AutoFilterCondition="Contains"></Settings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="BANKSTATEMENT_TransactionDescription" Caption="Transaction Description">
<Settings AutoFilterCondition="Contains"></Settings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="6" FieldName="BANKSTATEMENT_RunningBalance" Caption="Transaction RunningBalance">
<Settings AutoFilterCondition="Contains"></Settings>
</dxwgv:GridViewDataTextColumn>
</Columns>
</dxwgv:ASPxGridView>
 </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Text="Unmatched/Already Tagged Records">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server"><TABLE><TBODY><TR><TD><A href="javascript:ShowHideFilter('usum','s');"><SPAN style="COLOR: #000099; TEXT-DECORATION: underline">Show Filter</SPAN></A> </TD><TD><A href="javascript:ShowHideFilter('usum','All');"><SPAN style="COLOR: #000099; TEXT-DECORATION: underline">All Records</SPAN></A> </TD></TR></TBODY></TABLE><dxwgv:ASPxGridView runat="server" Width="100%" ID="gridUnMatchedSummary" KeyFieldName="BANKSTATEMENT_ID" AutoGenerateColumns="False" ClientInstanceName="gridUnMatched" __designer:wfdid="w10" OnCustomCallback="grid_CustomCallback">
<SettingsPager Mode="ShowAllRecords" Visible="False"></SettingsPager>
<Columns>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="DebitCredit" Caption="Type">
<Settings AutoFilterCondition="Contains"></Settings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="BANKSTATEMENT_TransactionDate" Caption="Transaction Date">
<Settings AutoFilterCondition="Contains"></Settings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="BANKSTATEMENT_ValueDate" Caption="Value Date">
<Settings AutoFilterCondition="Contains"></Settings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="BANKSTATEMENT_ReferenceNo" Caption="Instrument Number">
<Settings AutoFilterCondition="Contains"></Settings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="BANKSTATEMENT_TransactionAmount" Caption="Transaction Amount">
<Settings AutoFilterCondition="Contains"></Settings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="BANKSTATEMENT_TransactionDescription" Caption="Transaction Description">
<Settings AutoFilterCondition="Contains"></Settings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="6" FieldName="BANKSTATEMENT_RunningBalance" Caption="Transaction RunningBalance">
<Settings AutoFilterCondition="Contains"></Settings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="6" FieldName="ShowStatus" Caption="Status">
<Settings AutoFilterCondition="Contains"></Settings>
</dxwgv:GridViewDataTextColumn>
</Columns>
</dxwgv:ASPxGridView>
 </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
</TabPages>
                    </dxtc:ASPxPageControl>
                    </td>
                </tr>
    </div>
          </asp:Panel>
    </div>
    </form>
</body>
</html>
