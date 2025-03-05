<%@ page language="C#" autoeventwireup="true" inherits="management_frm_TransInsuranceDetail, App_Web_amufh4kc" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ShowDetail</title>
    <link type="text/css" rel="Stylesheet" href="../CSS/style.css" />
    
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="gridcellleft">
                    <table>
                        <tr>
                            <td class="gridcellleft">
                                <strong><span style="color: #000099">Policy No.:</span></strong>
                            </td>
                            <td class="gridcellleft">
                                <asp:Label ID="lblPolicy" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="gridcellleft">
                                <strong><span style="color: #000099">Client Name:</span></strong>
                            </td>
                            <td class="gridcellleft">
                                <asp:Label ID="lblClient" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="gridcellleft">
                                <strong><span style="color: #000099">Product Name:</span></strong>
                            </td>
                            <td class="gridcellleft">
                                <asp:Label ID="lblProduct" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="gridcellleft">
                                <strong><span style="color: #000099">Sum Assured Amt.:</span></strong>
                            </td>
                            <td class="gridcellleft">
                                <asp:Label ID="lblSumAssAmnt" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="gridcellcenter">
                    <dxwgv:ASPxGridView ID="grdDetail" ClientInstanceName="grdDetail" runat="server"
                        Width="100%" KeyFieldName="trn_Id" AutoGenerateColumns="False" DataSourceID="TransactionDetail" OnRowUpdating="grdDetail_RowUpdating" OnHtmlDataCellPrepared="grdDetail_HtmlDataCellPrepared">
                        <Styles >
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        
                        <Columns>
                            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                                <EditButton Visible="True">
                                </EditButton>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataDateColumn FieldName="DueDate" VisibleIndex="1" Caption="Due Date">
                                <PropertiesDateEdit DisplayFormatString="{0:dd MMM yyyy}" EditFormat="Custom" UseMaskBehavior="True"
                                    EditFormatString="dd-MM-yyyy">
                                </PropertiesDateEdit>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Visible="False" />
                                <EditFormCaptionStyle CssClass="gridcellleft">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn Caption="Inst. Date" FieldName="trn_ChequeDate" VisibleIndex="2">
                                <PropertiesDateEdit DisplayFormatString="{0:dd MMM yyyy}" EditFormat="Custom" UseMaskBehavior="True"
                                    EditFormatString="dd-MM-yyyy">
                                </PropertiesDateEdit>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Caption="Cheque Date" Visible="True" />
                                <EditFormCaptionStyle Wrap="False" CssClass="gridcellleft">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn FieldName="ValueDate" VisibleIndex="3">
                                <PropertiesDateEdit DisplayFormatString="{0:dd MMM yyyy}" EditFormat="Custom" UseMaskBehavior="True"
                                    EditFormatString="dd-MM-yyyy">
                                </PropertiesDateEdit>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Caption="Value Date" Visible="True" />
                                <EditFormCaptionStyle Wrap="False" CssClass="gridcellleft">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Status" FieldName="status" VisibleIndex="4">
                                <PropertiesComboBox ValueType="System.String" EnableIncrementalFiltering="True">
                                    <Items>
                                        <dxe:ListEditItem Text="Business in Hand" Value="0">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Cancelled" Value="1">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Canclled from inception" Value="2">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Cheque Bounced" Value="3">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Issued" Value="4">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Lapsed" Value="5">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Login" Value="6">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Caption="Status" Visible="True" />
                                <EditFormCaptionStyle Wrap="False" CssClass="gridcellleft">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Penalty" VisibleIndex="5">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Visible="True" />
                                <EditFormCaptionStyle Wrap="False" CssClass="gridcellleft">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="trn_PreminumAmt" Caption="Premium Amount"
                                VisibleIndex="6">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="trn_PaymentAmt" Caption="Cheque Amount"
                                VisibleIndex="7">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Caption="Cheque Amount" Visible="True" />
                                <EditFormCaptionStyle Wrap="False" CssClass="gridcellleft">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataDateColumn Caption="Rec. Date" Visible="False" FieldName="RecDate"
                                VisibleIndex="8">
                                <EditFormSettings Caption="Cheque Rec. Date" Visible="True" />
                                <PropertiesDateEdit DisplayFormatString="{0:dd MMM yyyy}" EditFormat="Custom" UseMaskBehavior="True"
                                    EditFormatString="dd-MM-yyyy">
                                </PropertiesDateEdit>
                                <EditFormCaptionStyle Wrap="False" CssClass="gridcellleft">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Payment Mode" Visible="False" VisibleIndex="8"
                                FieldName="trn_PayMode">
                                <PropertiesComboBox EnableIncrementalFiltering="True" ValueType="System.String">
                                    <Items>
                                        <dxe:ListEditItem Text="Cheque" Value="0">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Draft" Value="1">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Credit Card" Value="2">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="ECS" Value="3">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Direct Debit" Value="4">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Cash" Value="5">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                                <EditFormSettings Caption="Payment Mode" Visible="True" />
                                <EditFormCaptionStyle Wrap="False" CssClass="gridcellleft">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Bank" Visible="False" VisibleIndex="8"
                                FieldName="trn_Bank">
                                <PropertiesComboBox DataSourceID="dsgrdClientbank" ValueField="cbd_id" ValueType="System.String"
                                    TextFormatString="{0} -- {3}" EnableIncrementalFiltering="True" CallbackPageSize="30">
                                    <Columns>
                                        <dxe:ListBoxColumn FieldName="bnk_bankName" Caption="Bank Name" Width="150px" ToolTip="Bank Name" />
                                        <dxe:ListBoxColumn FieldName="cbd_accountName" Caption="Account Holder Name" Width="200px"
                                            ToolTip="Account Holder Name" />
                                        <dxe:ListBoxColumn FieldName="cbd_accountNumber" Caption="Account Number" Width="120px"
                                            ToolTip="Account Number" />
                                        <dxe:ListBoxColumn FieldName="bnk_micrno" Caption="MICR Number" Width="80px" ToolTip="MICR Number" />
                                        <dxe:ListBoxColumn FieldName="cbd_Accountcategory" Caption="Account Type" Width="80px"
                                            ToolTip="MICR Number" />
                                        <dxe:ListBoxColumn FieldName="cbd_id" Caption="test" Width="80px" ToolTip="cbd_id" />
                                    </Columns>
                                </PropertiesComboBox>
                                <EditFormSettings Caption="Bank " Visible="True" />
                                <EditFormCaptionStyle Wrap="False" CssClass="gridcellleft">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Cheque No." Visible="False" VisibleIndex="8"
                                FieldName="trn_ChequeNo">
                                <EditFormSettings Caption="Cheque Number" Visible="True" />
                                <EditFormCaptionStyle Wrap="False" CssClass="gridcellleft">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            
                        </Columns>
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                        <SettingsPager AlwaysShowPager="True" PageSize="18" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                    </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="dsgrdClientbank" runat="server" ConflictDetection="CompareAllValues"
                        ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" InsertCommand="insert into table1 (temp123) values('11')"
                        SelectCommand="select A.* , MB.bnk_id,MB.bnk_bankName,MB.bnk_BranchName,MB.bnk_micrno from (Select cast(TCBD.cbd_id as varchar) as cbd_id,TCBD.cbd_cntId,TCBD.cbd_bankCode, TCBD.cbd_Accountcategory,TCBD.cbd_Accountcategory as AccountType,TCBD.cbd_accountNumber,TCBD.cbd_accountType,cbd_accountName from tbl_trans_contactBankDetails as  TCBD where TCBD.cbd_cntId=@SubAccountCode) as A inner  join tbl_master_Bank as MB on MB.bnk_id=a.cbd_bankCode">
                        <SelectParameters>
                            <asp:Parameter Name="SubAccountCode" Type="string" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="TransactionDetail" runat="server" ConflictDetection="CompareAllValues"
                        ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" OldValuesParameterFormatString="original_{0}"
                        SelectCommand="SELECT trn_Id,cast(trn_PaymentDate as datetime) AS DueDate, cast(trn_payRecDate as datetime) AS RecDate,   trn_Status AS status, trn_Penalty as Penalty, trn_PreminumAmt, trn_PaymentAmt,cast(trn_ValueDate as datetime) as ValueDate,cast(trn_ChequeDate as datetime) as trn_ChequeDate,trn_Bank,trn_PayMode,trn_ChequeNo from tbl_trans_InsDetail where trn_transno=@ID order by trn_Id"
                        UpdateCommand="update table1 set temp123='1'">
                        <UpdateParameters>
                            <asp:Parameter Name="trn_ChequeDate" Type="datetime" />
                            <asp:Parameter Name="ValueDate" Type="datetime" />
                            <asp:Parameter Name="status" Type="string" />
                            <asp:Parameter Name="Penalty" Type="Decimal" />
                            <asp:Parameter Name="trn_PaymentAmt" Type="Decimal" />
                            <asp:Parameter Name="RecDate" Type="datetime" />
                            <asp:Parameter Name="trn_PayMode" Type="string" />
                            <asp:Parameter Name="trn_Bank" Type="string" />
                            <asp:Parameter Name="trn_ChequeNo" Type="string" />
                            <asp:Parameter Name="trn_Id" Type="int32" />
                            <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="id" Name="ID" Type="string" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
