<%@ page language="C#" autoeventwireup="true" inherits="Reports_JournalVoucherPrint, App_Web_u73waeqe" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

    <%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Journal Voucher Print</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

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
        function ForSpecific(obj)
        {
            if(obj=='A')
                Hide('TdSpecific');
            else
                Show('TdSpecific');
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
         function height()
        {
            if(document.body.scrollHeight>=300)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '300px';
            window.frameElement.Width = document.body.scrollWidth;
        }
        
        function updateEditorText() 
         {
            var code=txtAccountCode.GetText().toUpperCase();
            if(code=='X' || code=='Y' || code=='Z')
            {
                alert('You Can not Enter This Code');
                txtAccountCode.SetText('');
            }
         }
         function OnAllCheckedChanged(s, e) {
            if (s.GetChecked())
                cgridJournalVouchar.SelectRows();
            else
                cgridJournalVouchar.UnselectRows();
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="gridcellleft" style="width: 77px">
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
                    <td class="gridcellleft" style="width: 77px">
                        Voucher Type
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
                                        runat="server" Width="124px" MaxLength="2">
                                        <ValidationSettings>
                                            <RequiredField IsRequired="True" ErrorText="Select Account Code" />
                                        </ValidationSettings>
                                        <ClientSideEvents KeyPress="function(s,e){window.setTimeout('updateEditorText()', 10);}" />
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
                        <asp:Button ID="btnShow" runat="server" Text="Show" CssClass="btnUpdate" Height="26px"
                            Width="105px" OnClick="btnShow_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                         <dxwgv:ASPxGridView ID="gridJournalVouchar" runat="server" width="100%" AutoGenerateColumns="False"
                            ClientInstanceName="cgridJournalVouchar" Font-Size="10px"  KeyFieldName="AccountsLedger_TransactionReferenceID"
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
                            
                             <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="AccountsLedger_TransactionReferenceID"
                                    Caption="Voucher No.">
                                  
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="TranDate" 
                                    Caption="Voucher Date">
                                   
                                </dxwgv:GridViewDataTextColumn>
                                
                                 
                              
                              
                                <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="MainNarration" 
                                    Caption="Narration">
                                  
                                </dxwgv:GridViewDataTextColumn>
                                  <dxwgv:GridViewDataTextColumn VisibleIndex="4" CellStyle-HorizontalAlign="Right" FieldName="TotAmtDr"
                                     Caption="Amount">
                                   
                                </dxwgv:GridViewDataTextColumn>
                               <dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="BranchName" 
                                    Caption="BranchName">
                                   
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
                    <td colspan="2">
                         <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="btnUpdate" Height="26px"
                            Width="105px" OnClick="btnPrint_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
