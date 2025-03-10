<%@ page language="C#" autoeventwireup="true" inherits="management_contactStatus, App_Web_e158i_8t" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript" language="javascript">
    function SignOff()
    {
        window.parent.SignOff()
    }
    function height()
    {
        if(document.body.scrollHeight<=500)
            window.frameElement.height = '500px';
        else         
            window.frameElement.height = document.body.scrollHeight;
        window.frameElement.widht = document.body.scrollWidht;
    }
function ShowHideFilter(obj)
{
    grid.PerformCallback(obj);
}  
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" align="center">
                        <strong><span style="color: #000099">Contact Status</span></strong></td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td style="text-align: left; vertical-align: top">
                                    <table>
                                        <tr>
                                            <td id="ShowFilter">
                                                <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                                    Show Filter</span></a>
                                            </td>
                                            <td id="Td1">
                                                <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                                    All Records</span></a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                </td>
                                <td class="gridcellright" align="right">
                                    <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                        Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                        ValueType="System.Int32" Width="130px">
                                        <Items>
                                            <dxe:ListEditItem Text="Select" Value="0" />
                                            <dxe:ListEditItem Text="PDF" Value="1" />
                                            <dxe:ListEditItem Text="XLS" Value="2" />
                                            <dxe:ListEditItem Text="RTF" Value="3" />
                                            <dxe:ListEditItem Text="CSV" Value="4" />
                                        </Items>
                                        <ButtonStyle BackColor="#C0C0FF" ForeColor="Black">
                                        </ButtonStyle>
                                        <ItemStyle BackColor="Navy" ForeColor="White">
                                            <HoverStyle BackColor="#8080FF" ForeColor="White">
                                            </HoverStyle>
                                        </ItemStyle>
                                        <Border BorderColor="White" />
                                        <DropDownButton Text="Export">
                                        </DropDownButton>
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="ContactstatusGrid" runat="server" AutoGenerateColumns="False"
                            DataSourceID="contactStatus" KeyFieldName="cntstu_id" ClientInstanceName="grid"
                            Width="100%" OnHtmlEditFormCreated="ContactstatusGrid_HtmlEditFormCreated" OnHtmlRowCreated="ContactstatusGrid_HtmlRowCreated"
                            OnCustomCallback="ContactstatusGrid_CustomCallback">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn FieldName="cntstu_id" ReadOnly="True" Visible="False"
                                    VisibleIndex="0">
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Contact Status" FieldName="cntstu_contactStatus"
                                    VisibleIndex="0" Width="80%">
                                    <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                        <Paddings PaddingTop="15px" />
                                    </EditCellStyle>
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <PropertiesTextEdit Width="300px">
                                        <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                            <RequiredField ErrorText="Please Enter Contact Status" IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesTextEdit>
                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="CreateDate" Visible="False" VisibleIndex="1">
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="CreateUser" Visible="False" VisibleIndex="1">
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="LastModifyDate" Visible="False" VisibleIndex="1">
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="LastModifyUser" Visible="False" VisibleIndex="1">
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewCommandColumn VisibleIndex="1">
                                    <DeleteButton Visible="True">
                                    </DeleteButton>
                                    <EditButton Visible="True">
                                    </EditButton>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="grid.AddNewRow()"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                    </HeaderTemplate>
                                </dxwgv:GridViewCommandColumn>
                            </Columns>
                            <Settings ShowStatusBar="Visible"></Settings>
                            <Styles>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <Cell CssClass="gridcellleft">
                                </Cell>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                            </Styles>
                            <SettingsText PopupEditFormCaption="Add/Modify Contact Status" />
                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                            <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormHeight="200px"
                                PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter"
                                PopupEditFormWidth="600px" />
                            <Templates>
                                <EditForm>
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 25%">
                                            </td>
                                            <td style="width: 50%">
                                                <controls>
                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                            </controls>
                                                <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                        runat="server">
                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                        runat="server">
                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                </div>
                                            </td>
                                            <td style="width: 25%">
                                            </td>
                                        </tr>
                                    </table>
                                </EditForm>
                            </Templates>
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="contactStatus" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" DeleteCommand="DELETE FROM [tbl_master_contactStatus] WHERE [cntstu_id] = @original_cntstu_id"
                InsertCommand="INSERT INTO [tbl_master_contactStatus] ([cntstu_contactStatus], [CreateDate], [CreateUser]) VALUES (@cntstu_contactStatus, getdate(), @CreateUser)"
                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [cntstu_id],[cntstu_contactStatus] FROM [tbl_master_contactStatus]"
                UpdateCommand="UPDATE [tbl_master_contactStatus] SET [cntstu_contactStatus] = @cntstu_contactStatus,[LastModifyDate]=getdate(),[LastModifyUser]= @CreateUser WHERE [cntstu_id] = @original_cntstu_id">
                <DeleteParameters>
                    <asp:Parameter Name="original_cntstu_id" Type="Decimal" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="cntstu_contactStatus" Type="String" />
                    <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="cntstu_contactStatus" Type="String" />
                    <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
                </InsertParameters>
            </asp:SqlDataSource>
            <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
            </dxwgv:ASPxGridViewExporter>
        </div>
    </form>
</body>
</html>
