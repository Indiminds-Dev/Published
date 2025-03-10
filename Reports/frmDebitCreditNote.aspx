<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmDebitCreditNote, App_Web_cnvbs8pk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

    <%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1">
<title>Print Debit/Credit Notes</title>
<link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
     <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>

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
    <%--<script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>--%>
      <script language="javascript" type="text/javascript">
      function height()
        {
            if(document.body.scrollHeight>=300)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '300px';
            window.frameElement.Width = document.body.scrollWidth;
        }
        
          function Show(obj)
        {
            document.getElementById(obj).style.display='inline';
        }
        function Hide(obj)
        {
            document.getElementById(obj).style.display='none';
        }
        function Page_Load()
        {
            Hide('TdSpecific');
            height();
        }
         function OnAllCheckedChanged(s, e) {
            if (s.GetChecked())
                cgridJournalVouchar.SelectRows();
            else
                cgridJournalVouchar.UnselectRows();
        }
        function ForSpecific(obj)
        {
            if(obj=='A')
                Hide('TdSpecific');
            else
                Show('TdSpecific');
        }
        
        function DateChange(DateObj)
{
    //var Lck ='<%=Session["LCKBNK"] %>';
    var FYS ='<%=Session["FinYearStart"]%>';
    var FYE ='<%=Session["FinYearEnd"]%>'; 
    var LFY ='<%=Session["LastFinYear"]%>';
    //DevE_CheckForLockDate(DateObj,Lck);
    DevE_CheckForFinYear(DateObj,FYS,FYE,LFY);
//    DevE_CompareDateAndAddDay(DateObj,cDatepayinedit,2)
//    DevE_CompareDateAndAddDay(DateObj,cDatepayoutedit,2)
//    DevE_CompareDateAndAddDay(DateObj,cDatedelpayinedit,2)
//    DevE_CompareDateAndAddDay(DateObj,cDatedelpayoutedit,2)
//    DevE_CompareDateAndAddDay(DateObj,cDateconfedit,2)
//    DevE_CompareDateAndAddDay(DateObj,cDateendedit,0)
}
      
      function DateCompare(DateobjFrm,DateobjTo)
{
    var Msg="To Date Can Not Be Less Than From Date!!!";
    DevE_CompareDateForMin(DateobjFrm,DateobjTo,Msg);
}
 function updateEditorText() 
         {
            var code=txtAccountCode.GetText().toUpperCase();
            if(code=='X' || code=='Y' || code=='Z' || code=='V' || code=='U' || code=='T')
            {
                alert('{T,U,V,W,X,Y,Z} are Reserved Key');
                txtAccountCode.SetText('JV');
            }
         }
      </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <table class="TableMain100">
             <tr>
                    <td class="EHEADER" colspan="2" style="text-align: center;">
                        <strong><span style="color: #000099">Debit / Credit Notes</span></strong>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="width: 77px">
                        Date :
                    </td>
                    <td>
                        <table>
                        
                            <tr>
                                <td style="width: 196px">
                         
                                    <dxe:ASPxDateEdit ID="dtDate" runat="server" EditFormat="Custom" ClientInstanceName="dtDate"
                                        UseMaskBehavior="True">
                                        <DropDownButton Text="From ">
                                        </DropDownButton>
                                        
                                        <clientsideevents datechanged="function(s,e){DateChange(dtDate);}"></clientsideevents>
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td>
                                    <dxe:ASPxDateEdit ID="dtToDate" runat="server" EditFormat="Custom" ClientInstanceName="dtToDate"
                                        UseMaskBehavior="True">
                                        <DropDownButton Text="To">
                                        </DropDownButton>
                                        <clientsideevents datechanged="function(s,e){DateCompare(dtDate,dtToDate);}"></clientsideevents>
                                    </dxe:ASPxDateEdit>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="width: 77px">
                        Voucher Type : 
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="radAll" Checked="true" runat="server" GroupName="a" onclick="ForSpecific('A')" />
                                </td>
                                <td>
                                    All
                                </td>
                                <td>
                                    <asp:RadioButton ID="radSpecific" runat="server" GroupName="a" onclick="ForSpecific('B')" />
                                </td>
                                <td>
                                    Specific
                                </td>
                                <td id="TdSpecific">
                                    <dxe:ASPxTextBox ID="txtAccountCode" ClientInstanceName="txtAccountCode"
                                        runat="server" Width="50px" MaxLength="2">
                                        <ValidationSettings>
                                            <RequiredField IsRequired="True" ErrorText="Select Account Code" />
                                        </ValidationSettings>
                                        <%--<ClientSideEvents KeyPress="function(s,e){window.setTimeout('updateEditorText()', 10);}" />--%>
                                    </dxe:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                 <tr>
                    <td class="gridcellleft" style="width: 89px">
                        Print Option :
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td id="td_user">
                                    <asp:CheckBox ID="user" runat="server"   />
                                </td>
                                <td>
                                    Print Entered By User
                                </td>
                                <td id="Td1">
                                    <asp:CheckBox ID="time" runat="server"  />
                                </td>
                                <td>
                                    Print Entry Date Time
                                </td>
                                
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="BtnSave" runat="server" Text="Show Notes" CssClass="btn" OnClick="BtnSave_Click"
                         Height="26px" Width="105px" />
                            
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                          <dxwgv:ASPxGridView ID="gridJournalVouchar" runat="server" width="100%" AutoGenerateColumns="False"
                            ClientInstanceName="cgridJournalVouchar" Font-Size="5px"  KeyFieldName="JournalVoucherDetail_ID"
                            >
                          
                          
                            <Columns>
                            
                            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" Width="50px" VisibleIndex="0">
                                                <HeaderTemplate>
                                                    <dxe:ASPxCheckBox ID="cbAll" runat="server" ClientInstanceName="cbAll" ToolTip="Select all rows"
                                                        BackColor="White"  >
                                                         <ClientSideEvents CheckedChanged="OnAllCheckedChanged" />
                                                    </dxe:ASPxCheckBox>
                                                 <%--<dxe:ASPxCheckBox ID="cbPage" runat="server" ClientInstanceName="cbPage" ToolTip="Select all rows within the page"
                                                        OnInit="cbPage_Init">
                                                        <ClientSideEvents CheckedChanged="OnPageCheckedChanged" />
                                                    </dxe:ASPxCheckBox>--%>
                                                </HeaderTemplate>
                                            </dxwgv:GridViewCommandColumn>
                                            
                                             <dxwgv:GridViewDataDateColumn VisibleIndex="1" PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy" FieldName="JournalVoucherDetail_TransactionDate"   
                                    Caption="Voucher Date" >
                                   
                                </dxwgv:GridViewDataDateColumn>
                            
                             <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="JournalVoucherDetail_VoucherNumber"
                                    Caption="Voucher No.">
                                  
                                </dxwgv:GridViewDataTextColumn>
                               
                                
                                 
                                <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="JournalVoucher_Narration"
                                     Caption="Main Narration">
                                   
                                </dxwgv:GridViewDataTextColumn>
                              
                                <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="JournalVoucherDetail_Narration" 
                                    Caption="Sub Narration">
                                  
                                </dxwgv:GridViewDataTextColumn>
                               <dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="JournalVoucherDetail_AmountDr" PropertiesTextEdit-DisplayFormatString="0.00"
                                    Caption="Debit Note">
                                   
                                </dxwgv:GridViewDataTextColumn>
                                
                                 <dxwgv:GridViewDataTextColumn VisibleIndex="6" FieldName="JournalVoucherDetail_AmountCr" PropertiesTextEdit-DisplayFormatString="0.00"
                                    Caption="Credit Note">
                                   
                                </dxwgv:GridViewDataTextColumn>
                                                            
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                            <SettingsPager NumericButtonCount="30" ShowSeparators="True" Mode="ShowAllRecords"
                                PageSize="20">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            
                            <Styles>
                                <FocusedRow BackColor="#FFC080" Font-Bold="False">
                                </FocusedRow>
                                <Header BackColor="ControlLight" Font-Bold="True" ForeColor="Black" HorizontalAlign="Center">
                                </Header>
                            </Styles>
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
                <tr>
                   <td colspan="2" id="td_print" runat="server">
                         <asp:Button ID="btnPrint" runat="server" Text="Print Notes" CssClass="btn" Height="26px"
                            Width="105px" OnClick="btnPrint_Click" />
                         </td>   
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
