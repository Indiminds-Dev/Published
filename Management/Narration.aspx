<%@ page language="C#" autoeventwireup="true" inherits="management_Narration, App_Web_sggmuspu" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Narration</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
        <script type="text/javascript">
        function ShowHideFilter(obj)
        {
            grid.PerformCallback(obj);
        }  
    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function SignOff()
    {
        window.parent.SignOff()
    }
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
    <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center">
                    <strong><span style="color: #000099">Narration List</span></strong></td>
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
                            <td class="gridcellright">
                                
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="GrdNarration" runat="server" AutoGenerateColumns="False" DataSourceID="Narration"
                        KeyFieldName="Narration_id" ClientInstanceName="grid" Width="100%" OnCustomCallback="GrdNarration_CustomCallback">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="Narration_id">
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataMemoColumn Caption="Narration" FieldName="Narration_Description" Width="80%"
                                VisibleIndex="0">
                                <PropertiesMemoEdit Width="390px" Height="70px">
                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                        <RequiredField ErrorText="Please Enter Designation" IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesMemoEdit>
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                    <Paddings PaddingTop="15px" />
                                </EditCellStyle>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataMemoColumn>
                            <dxwgv:GridViewCommandColumn VisibleIndex="1">
                                <DeleteButton Visible="True">
                                </DeleteButton>
                                <EditButton Visible="True">
                                </EditButton>
                                 <HeaderTemplate>
                                   <a href="javascript:void(0);" onclick="grid.AddNewRow();"><span style="color: #000099;
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
                        <SettingsText PopupEditFormCaption="Add/Modify Narration" />
                        <SettingsPager NumericButtonCount="20" PageSize="20" AlwaysShowPager="True" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                        <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormHeight="200px"
                            PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True" PopupEditFormVerticalAlign="TopSides"
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
        <asp:SqlDataSource ID="Narration" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" DeleteCommand="DELETE FROM [Master_Narration] WHERE [Narration_id] = @original_Narration_id"
            InsertCommand="INSERT INTO [Master_Narration] ([Narration_Description], [Narration_CreateDateTime], [Narration_CreateUser]) VALUES (@Narration_Description, getdate(), @CreateUser)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Narration_id],[Narration_Description] FROM [Master_Narration]"
            UpdateCommand="UPDATE [Master_Narration] SET [Narration_Description] = @Narration_Description,[Narration_ModifyDateTime]=getdate(),[Narration_ModifyUser]=@CreateUser WHERE [Narration_id] = @original_Narration_id">
            <DeleteParameters>
                <asp:Parameter Name="original_Narration_id" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Narration_Description" Type="String" />
                <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Narration_Description" Type="String" />
                <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
