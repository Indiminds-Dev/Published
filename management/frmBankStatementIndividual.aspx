<%@ page language="C#" autoeventwireup="true" inherits="management_frmBankStatementIndividual, App_Web_yf04ozfw" %>
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
<head runat="server">
    <title>Untitled Page</title>
    <script language="javascript" type="text/javascript">
    
    
    function OnMoreInfoClick(obj1)
        {
        
                        alert(obj1);
//                       document.getElementById('HiddenField1').value=obj1;
//                        document.getElementById('Button1').click;
                        var hdnID=document.getElementById('hdnID').value;
                        var hdnbankdate=document.getElementById('hdnbankdate').value;
                        var hdnValueDate=document.getElementById('hdnValueDate').value;
                        grid.PerformCallback(obj1+'~'+hdnbankdate+'~'+hdnValueDate+'~'+hdnID);
                        
//                      var url='frmBankStatementIndividual.aspx?Id='+obj1+'&TransactionDate='+obj2+'&ValueDate='+obj3+'&InstrumentNumber='+obj4+'&Transactionamount='+obj5+'&Description='+obj6+'&RunningAmount='+obj7+'&Receipt='+obj8;
////              parent.OnMoreInfoClick(url,"Rectify Summary",'940px','450px',"Y");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="TableMain100"  style="width: 191px; text-align: center;" >
            <tr>
                <td style="text-align: center">
                    <asp:Label ID="Label1" runat="server" Text="Label" style="text-align: center; vertical-align: middle;" Width="663px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Label ID="lbltag" runat="server" Text="Transaction Amount"  Width="139px"></asp:Label>
                    <asp:Label ID="lblAmount" runat="server" Style="text-align: center" Text="Label"
                        Width="242px"></asp:Label>
                </td>
            </tr>
                <tr>
                    <td style="text-align: center">
                        <%--OnCustomCallback="grid_CustomCallback"--%>
                                        <dxwgv:aspxgridview id="gridSummary" runat="server" width="100%" ClientInstanceName="grid"
                                              KeyFieldName="CASHBANKDETAIL_ID" autogeneratecolumns="False" OnCustomCallback="gridSummary_CustomCallback">
                                            <Columns>
                                                <dxwgv:GridViewDataTextColumn Caption="Instrument Date" FieldName="CashBankDetail_InstrumentDate" VisibleIndex="0">
                                                    <Settings AutoFilterCondition="Contains"></Settings>
                                                </dxwgv:GridViewDataTextColumn>
                                                 <dxwgv:GridViewDataTextColumn Caption="Main Account" FieldName="CashBankDetail_MainAccountId" VisibleIndex="1">
                                                    <Settings AutoFilterCondition="Contains"></Settings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Sub Account" FieldName="CashBankDetail_SubAccountId" VisibleIndex="2">
                                                    <Settings AutoFilterCondition="Contains"></Settings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Payment Amount" FieldName="CashBankDetail_PaymentAmount" VisibleIndex="3">
                                                    <Settings AutoFilterCondition="Contains"></Settings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Receipt Amount" FieldName="CashBankDetail_ReceiptAmount" VisibleIndex="4">
                                                    <Settings AutoFilterCondition="Contains"></Settings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Instrument Number" FieldName="CashBankDetail_InstrumentNumber" VisibleIndex="5">
                                                    <Settings AutoFilterCondition="Contains"></Settings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption=" " VisibleIndex="6">
                                                    <DataItemTemplate>
                                                        <asp:CheckBox ID="CheckBox1" runat="server" />    
                                                    </DataItemTemplate>
                                                    
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption=" " VisibleIndex="7">
                                                 <DataItemTemplate>
                                                        <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                                           <span style="color: blue;
                                                            text-decoration: underline">update</span></a>
                                                    </DataItemTemplate>
                                               </dxwgv:GridViewDataTextColumn>
                                            </Columns>
                                            <ClientSideEvents EndCallback="function(s, e) {seek(grid.cpseek);

}" />
                                        </dxwgv:aspxgridview>
                                         
                        
                        <asp:HiddenField ID="HiddenField1" runat="server"></asp:HiddenField>
                        <asp:HiddenField ID="hdnbankdate" runat="server" />
                        <asp:HiddenField ID="hdnValueDate" runat="server" />
                        <asp:HiddenField ID="hdnID" runat="server" />
                    </td>
                </tr>
            </table>
    </div>
    </form>
</body>
</html>
