<%@ page language="C#" autoeventwireup="true" inherits="Reports_CashBankReport, App_Web_wttsrqio" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Cash Bank Report</title>
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
         function DateChangeForFrom()
        {
            var sessionVal ="<%=Session["LastFinYear"]%>";
            var objsession=sessionVal.split('-');
            var MonthDate=dtDate.GetDate().getMonth()+1;
            var DayDate=dtDate.GetDate().getDate();
            var YearDate=dtDate.GetDate().getYear();
            if(YearDate>=objsession[0])
            {
                if(MonthDate<4 && YearDate==objsession[0])
                {
                    alert('Enter Date Is Outside Of Financial Year !!');
                    var datePost=(4+'-'+1+'-'+objsession[0]);
                    dtDate.SetDate(new Date(datePost));
                }
                else if(MonthDate>3 && YearDate==objsession[1])
                {
                    alert('Enter Date Is Outside Of Financial Year !!');
                    var datePost=(4+'-'+1+'-'+objsession[0]);
                    dtDate.SetDate(new Date(datePost));
                }
                else if(YearDate!=objsession[0] && YearDate!=objsession[1])
                {
                    alert('Enter Date Is Outside Of Financial Year !!');
                    var datePost=(4+'-'+1+'-'+objsession[0]);
                    dtDate.SetDate(new Date(datePost));
                }
            }
            else
            {
                alert('Enter Date Is Outside Of Financial Year !!');
                var datePost=(4+'-'+1+'-'+objsession[0]);
                dtDate.SetDate(new Date(datePost));
            }
        }
        function DateChangeForTo()
        {
            var sessionVal ="<%=Session["LastFinYear"]%>";
            var objsession=sessionVal.split('-');
            var MonthDate=dtToDate.GetDate().getMonth()+1;
            var DayDate=dtToDate.GetDate().getDate();
            var YearDate=dtToDate.GetDate().getYear();
            
            if(YearDate<=objsession[1])
            {
                if(MonthDate<4 && YearDate==objsession[0])
                {
                    alert('Enter Date Is Outside Of Financial Year !!');
                    var datePost=(3+'-'+31+'-'+objsession[1]);
                    dtToDate.SetDate(new Date(datePost));
                }
                else if(MonthDate>3 && YearDate==objsession[1])
                {
                    alert('Enter Date Is Outside Of Financial Year !!');
                    var datePost=(3+'-'+31+'-'+objsession[1]);
                    dtToDate.SetDate(new Date(datePost));
                }
                else if(YearDate!=objsession[0] && YearDate!=objsession[1])
                {
                    alert('Enter Date Is Outside Of Financial Year !!');
                    var datePost=(3+'-'+31+'-'+objsession[1]);
                    dtToDate.SetDate(new Date(datePost));
                }
            }
            else
            {
                alert('Enter Date Is Outside Of Financial Year !!');
                var datePost=(3+'-'+31+'-'+objsession[1]);
                dtToDate.SetDate(new Date(datePost));
            }
        }
        function ShowBankName(obj1,obj2,obj3)
         {
            ajax_showOptions(obj1,obj2,obj3);
         }
        function GetAllCheck(obj)
        {
        if(obj==true)
            {
               document.getElementById('chkDebit').checked=true;
               document.getElementById('chkCredit').checked=true;
               document.getElementById('chkContra').checked=true;
               
                ForDisabled('chkDebit');
                ForDisabled('chkCredit');
                ForDisabled('chkContra');
            }
         else
            {
                
               ForEnabled('chkDebit');
               ForEnabled('chkCredit');
               ForEnabled('chkContra'); 
               document.getElementById('chkDebit').checked=false;
               document.getElementById('chkCredit').checked=false;
               document.getElementById('chkContra').checked=false;
            }
           
            
        }
        function ForEnabled(obj)
        {
            document.getElementById(obj).disabled=false;
        }
        function ForDisabled(obj)
        {
            document.getElementById(obj).disabled=true;
        }
        function Page_Load()
        {
            ForEnabled('chkAll');
            ForDisabled('chkDebit');
            ForDisabled('chkCredit');
            ForDisabled('chkContra');
            height();
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
        FieldName='btnReport';
        
        function Hide()
        {
            document.getElementById('tblPrint').style.display='none';
        }
        function Show()
        {
            document.getElementById('tblPrint').style.display='inline';
        }
        function CallBankAccount(obj1,obj2,obj3)
        {
           var CurrentSegment='<%=Session["usersegid"]%>'
           if(CurrentSegment.length==8)
            CurrentSegment=document.getElementById("hdn_NsdlCdslExchangeSegment").value;
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
        function OnAllCheckedChanged(s, e) {
            if (s.GetChecked())
                cgridCashBank.SelectRows();
            else
                cgridCashBank.UnselectRows();
        }
        function UnselectRow()
            {
                cgridCashBank.UnselectRows();
            
            }
        function CheckSelect()
            {
              var aa=cgridCashBank.GetSelectedKeysOnPage();
              alert(aa[0]);  
            
            }
        
    </script>	

    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <table border="1" class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="2" style="text-align: center;">
                        <strong><span style="color: #000099">Cash Bank Voucher Printing</span></strong>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="width: 89px">
                        Bank Name
                    </td>
                    <td>
                        <asp:TextBox ID="txtBankName" runat="server" Width="330px" onkeyup ="CallBankAccount(this,'GenericAjaxList',event)"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="width: 89px">
                        Type :
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td id="TdAll">
                                    <asp:CheckBox ID="chkAll" runat="server" Checked="true" onclick="GetAllCheck(this.checked);" />
                                </td>
                                <td>
                                    All
                                </td>
                                <td id="TdDebit">
                                    <asp:CheckBox ID="chkDebit" runat="server" Checked="true" />
                                </td>
                                <td>
                                    Payment
                                </td>
                                <td id="TdCredit">
                                    <asp:CheckBox ID="chkCredit" runat="server" Checked="true" />
                                </td>
                                <td>
                                    Receipt
                                </td>
                                <td id="TdContra">
                                    <asp:CheckBox ID="chkContra" runat="server" Checked="true" />
                                </td>
                                <td>
                                    Contra
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="width: 89px">
                        Print Option:</td>
                    <td>
                    <table>
                    <tr>
                    <td>
                        <asp:Label ID="lblSingleSide" runat="server" Text="Single Copy"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rbtnSingle" runat="server" Width="74px" Checked="True" GroupName="a" ValidationGroup="a" />
                    </td>
                    <td>
                        <asp:Label ID="lblDoubleSide" runat="server" Text="Double Copy"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rbtnDouble" runat="server" Width="74px" GroupName="a" ValidationGroup="a" />
                    </td>
                    <td style="display:none">
                        <asp:Label ID="lblTripleSide" runat="server" Text="Triple Copy"></asp:Label>
                    </td>
                    <td style="display:none">
                        <asp:RadioButton ID="rbtnTriple" runat="server" Width="74px" GroupName="a" ValidationGroup="a" />
                    </td>
                    </tr>
                    </table>
                     </td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="width: 89px">
                        Cheque Number</td>
                    <td>
                        From:
                        <asp:TextBox ID="txtFromCheque" runat="server"></asp:TextBox>
                        To:
                        <asp:TextBox ID="txtToCheque" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="width: 89px">
                        Print Mode:</td>
                    <td>
                        <asp:DropDownList ID="ddlPrintMode" runat="server" Width="93px">
                            <asp:ListItem Value="1">Lazer Print</asp:ListItem>
                            <asp:ListItem Value="2">Dos Print</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="width: 89px">
                        Date
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td style="width: 196px">
                                    <dxe:ASPxDateEdit ID="dtDate" runat="server" EditFormat="Custom" ClientInstanceName="dtDate"
                                        UseMaskBehavior="True">
                                        <DropDownButton Text="From ">
                                        </DropDownButton>
                                        <ClientSideEvents DateChanged="function(s,e){DateChangeForFrom();}" />
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td>
                                    <dxe:ASPxDateEdit ID="dtToDate" runat="server" EditFormat="Custom" ClientInstanceName="dtToDate"
                                        UseMaskBehavior="True">
                                        <DropDownButton Text="To">
                                        </DropDownButton>
                                        <ClientSideEvents DateChanged="function(s,e){DateChangeForTo();}" />
                                    </dxe:ASPxDateEdit>
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
                    <table border="1">
                        <tr>
                        <td style="width:148px">
                            <asp:Button ID="btnShow" runat="server" Text="Show" CssClass="btnUpdate" Height="27px" Width="146px" OnClientClick="UnselectRow()" OnClick="btnShow_Click" />
                        </td>
                            <td style="width:148px">
                                <asp:Button ID="btnReport" runat="server" Text="Print" CssClass="btnUpdate" Height="27px" Width="146px" OnClick="btnReport_Click" />
                            </td>
                            
                       </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                    <td colspan="2" style="display:none">
                        <asp:HiddenField ID="txtBankName_hidden" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    
                           <dxwgv:ASPxGridView ID="gridCashBank" runat="server" width="100%" AutoGenerateColumns="False"
                            ClientInstanceName="cgridCashBank" Font-Size="10px"  KeyFieldName="CashbankDetailsId"
                            >
                          
                            <Columns>
                            
                            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" Width="50px" VisibleIndex="0">
                                                <HeaderTemplate>
                                                    <dxe:ASPxCheckBox ID="cbAll" runat="server" ClientInstanceName="cbAll" ToolTip="Select all rows"
                                                        BackColor="White"  >
                                                         <ClientSideEvents CheckedChanged="OnAllCheckedChanged" />
                                                    </dxe:ASPxCheckBox>
                                               
                                                </HeaderTemplate>
                                            </dxwgv:GridViewCommandColumn>
                            
                             <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="TranRefID"
                                    Caption="Voucher No.">
                                  
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="TranDate" 
                                    Caption="Voucher Date">
                                   
                                </dxwgv:GridViewDataTextColumn>
                                
                                  <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="Narration1" 
                                    Caption="MainNarration">
                                  
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="totalReceipt"
                                     Caption="Receipt" CellStyle-HorizontalAlign="Right">
                                   
                                </dxwgv:GridViewDataTextColumn>
                                 <dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="totalPayment"
                                     Caption="Payment" CellStyle-HorizontalAlign="Right">
                                   
                                </dxwgv:GridViewDataTextColumn>
                               
                               <dxwgv:GridViewDataTextColumn VisibleIndex="6" FieldName="BranchName" 
                                    Caption="BranchName">
                                   
                                </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Visible="false" FieldName="CashbankDetailsId" 
                                    Caption="CashbankDetailsId">
                                   
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
            </table>
            <table id="tblPrint">
                <tr>
                    <td>
                    
                        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
                        ReportSourceID="CrystalReportSource1" PrintMode="Pdf" BestFitPage="False"  SeparatePages="False" Width="901px"/>
                    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                        <Report FileName="CashBank.rpt">
                        </Report>
                    </CR:CrystalReportSource>
                    </td>
                </tr>
                
            </table>
            <asp:HiddenField ID="hdnPrint" runat="server" />
            <asp:HiddenField ID="hdn_NsdlCdslExchangeSegment" runat="server" />
        </div>
    </form>
</body>
</html>
