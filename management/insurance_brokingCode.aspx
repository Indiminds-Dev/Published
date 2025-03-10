<%@ page language="C#" autoeventwireup="true" inherits="management_insurance_brokingCode, App_Web_cvaj-tqf" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Insurance Broking Code</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="GridBrokerageCode" ClientInstanceName="GridBrokerageCode"
                            KeyFieldName="InsBrokingCode_ID" runat="server" AutoGenerateColumns="False" DataSourceID="sqlBrokerageCode"
                            Width="100%" OnRowValidating="GridBrokerageCode_RowValidating" OnRowInserting="GridBrokerageCode_RowInserting" OnCellEditorInitialize="GridBrokerageCode_CellEditorInitialize" OnRowUpdating="GridBrokerageCode_RowUpdating">
                            <Styles>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                            </Styles>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn FieldName="InsBrokingCode_ID" Visible="False" ReadOnly="True"
                                    VisibleIndex="0">
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="InsBrokingCode_CompanyID1" Caption="Company Name"
                                    VisibleIndex="0">
                                    <EditFormSettings Visible="False" />
                                    <EditCellStyle HorizontalAlign="Right">
                                    </EditCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Visible="False" FieldName="InsBrokingCode_InsuranceCompanyID"
                                    VisibleIndex="2">
                                    <EditFormSettings Visible="False" />
                                    <EditCellStyle HorizontalAlign="Right">
                                    </EditCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="InsBrokingCode_Code" Caption="Broking Code"
                                    VisibleIndex="1">
                                    <EditFormCaptionStyle CssClass="gridcellright">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings CaptionLocation="Near" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataComboBoxColumn FieldName="ParentBranch" Width="35%" Caption="Branch"
                                    VisibleIndex="2">
                                    <PropertiesComboBox EnableIncrementalFiltering="True" EnableSynchronization="False"
                                        DataSourceID="DataSourceParentBranch" TextField="ParentBranch" ValueField="parentId"
                                        ValueType="System.Int32">
                                    </PropertiesComboBox>
                                    <Settings FilterMode="DisplayText"></Settings>
                                    <EditFormSettings Visible="True" VisibleIndex="2"></EditFormSettings>
                                    <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                    </EditFormCaptionStyle>
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataComboBoxColumn>
                                <dxwgv:GridViewCommandColumn VisibleIndex="2" Width="10%">
                                    <ClearFilterButton Visible="True">
                                    </ClearFilterButton>
                                    <DeleteButton Visible="True">
                                    </DeleteButton>
                                    <EditButton Visible="True">
                                    </EditButton>
                                    <HeaderCaptionTemplate>
                                        <dxe:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Add New" ClientSideEvents-Click="function(s, e) {GridBrokerageCode.AddNewRow();}"
                                            Font-Size="10px" Font-Underline="true">
                                        </dxe:ASPxHyperLink>
                                    </HeaderCaptionTemplate>
                                    <HeaderStyle Font-Underline="True" HorizontalAlign="Center" />
                                </dxwgv:GridViewCommandColumn>
                            </Columns>
                            <SettingsBehavior ConfirmDelete="True" />
                            <SettingsPager ShowSeparators="True">
                            </SettingsPager>
                        </dxwgv:ASPxGridView>
                        <br />
                        <asp:SqlDataSource ID="sqlBrokerageCode" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            DeleteCommand="DELETE FROM [Master_InsBrokingCode] WHERE [InsBrokingCode_ID] = @InsBrokingCode_ID"
                            InsertCommand="INSERT INTO [Master_InsBrokingCode] ([InsBrokingCode_CompanyID], [InsBrokingCode_InsuranceCompanyID], [InsBrokingCode_Code], [InsBrokingCode_CreateUser], [InsBrokingCode_CreateDateTime] ,[InsBrokingCode_BranchID]) VALUES (@InsBrokingCode_CompanyID, @InsBrokingCode_InsuranceCompanyID, @InsBrokingCode_Code, @InsBrokingCode_CreateUser, getdate(),@ParentBranch)"
                            SelectCommand="SELECT InsBrokingCode_ID,InsBrokingCode_CompanyID,InsBrokingCode_InsuranceCompanyID,InsBrokingCode_Code,InsBrokingCode_CreateUser,InsBrokingCode_ModifyUser,InsBrokingCode_ModifyDateTime,case when cast(InsBrokingCode_BranchID as varchar(10))=0 then 'All' else cast(InsBrokingCode_BranchID as varchar(10)) end  as ParentBranch,(select cmp_name from tbl_master_company where ltrim(rtrim(cmp_internalid))=ltrim(rtrim(Master_InsBrokingCode.InsBrokingCode_CompanyID))) as InsBrokingCode_CompanyID1 FROM [Master_InsBrokingCode] where InsBrokingCode_InsuranceCompanyID=@InsBrokingCode_InsuranceCompanyID and InsBrokingCode_CompanyID=@InsBrokingCode_CompanyID"
                            UpdateCommand="UPDATE [Master_InsBrokingCode] SET [InsBrokingCode_CompanyID] = @InsBrokingCode_CompanyID, [InsBrokingCode_InsuranceCompanyID] = @InsBrokingCode_InsuranceCompanyID, [InsBrokingCode_Code] = @InsBrokingCode_Code, [InsBrokingCode_ModifyUser] = @InsBrokingCode_ModifyUser, [InsBrokingCode_ModifyDateTime] = getdate(),[InsBrokingCode_BranchID]=@ParentBranch WHERE [InsBrokingCode_ID] = @InsBrokingCode_ID">
                            <%-- InsertCommand="INSERT INTO [Master_InsBrokingCode] ([InsBrokingCode_CompanyID], [InsBrokingCode_InsuranceCompanyID], [InsBrokingCode_Code], [InsBrokingCode_CreateUser], [InsBrokingCode_CreateDateTime]) VALUES (@InsBrokingCode_CompanyID, @InsBrokingCode_InsuranceCompanyID, @InsBrokingCode_Code, @InsBrokingCode_CreateUser, getdate())"--%>
                            <InsertParameters>
                                <asp:SessionParameter Name="InsBrokingCode_CompanyID" SessionField="LastCompany"
                                    Type="String" />
                                <asp:SessionParameter Name="InsBrokingCode_InsuranceCompanyID" SessionField="KeyVal_InternalID"
                                    Type="String" />
                                <asp:Parameter Name="InsBrokingCode_Code" Type="String" />
                                <asp:Parameter Name="ParentBranch" Type="String" />
                                <asp:SessionParameter Name="InsBrokingCode_CreateUser" SessionField="userid" Type="Int32" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:SessionParameter Name="InsBrokingCode_CompanyID" SessionField="LastCompany"
                                    Type="String" />
                                <asp:SessionParameter Name="InsBrokingCode_InsuranceCompanyID" SessionField="KeyVal_InternalID"
                                    Type="String" />
                                <asp:Parameter Name="InsBrokingCode_Code" Type="String" />
                                <asp:SessionParameter Name="InsBrokingCode_ModifyUser" SessionField="userid" Type="Int32" />
                                <asp:Parameter Name="InsBrokingCode_ID" Type="Int32" />
                                 <asp:Parameter Name="ParentBranch" Type="String" />
                            </UpdateParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="InsBrokingCode_ID" Type="Int32" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="InsBrokingCode_InsuranceCompanyID" SessionField="KeyVal_InternalID"
                                    Type="String" />
                                <asp:SessionParameter Name="InsBrokingCode_CompanyID" SessionField="LastCompany"
                                    Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlCompany" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="select ltrim(rtrim(cmp_internalid)) as cmp_internalid,ltrim(rtrim(cmp_name)) as cmp_name from tbl_master_company">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="DataSourceParentBranch" ConflictDetection="CompareAllValues"
                            runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>"
                            SelectCommand="SELECT branch_id as parentId, (rtrim(ltrim(branch_description))+' ['+rtrim(ltrim(branch_code))+']') as ParentBranch  FROM tbl_master_branch order by branch_description">
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
