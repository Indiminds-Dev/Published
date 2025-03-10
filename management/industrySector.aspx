<%@ page language="C#" autoeventwireup="true" inherits="management_industrySector, App_Web_alid8jfz" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Industry</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript">
        function ShowHideFilter(obj)
        {
            grid.PerformCallback(obj);
        }
        function height()
        {
            window.frameElement.height = document.body.scrollHeight;
            window.frameElement.widht = document.body.scrollWidht;
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center">
                    <strong><span style="color: #000099">IndustrySector</span></strong></td>
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
                    <dxwgv:ASPxGridView ID="Industrygrid" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False"
                        DataSourceID="IndustrySector" KeyFieldName="ind_id" Width="100%" OnHtmlEditFormCreated="Industrygrid_HtmlEditFormCreated"
                        OnHtmlRowCreated="Industrygrid_HtmlRowCreated" OnCustomCallback="Industrygrid_CustomCallback">
                        <Templates><EditForm>
                                <table style="width: 100%">
                                    <tr>
                                        <td>
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
                                    </tr>
                                </table>
                            
</EditForm>
</Templates>
                        <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" allowfocusedrow="True" />
                        <Styles>
<Header SortingImageSpacing="5px" BackColor="#95C9FD" ImageSpacing="5px"></Header>

<Cell CssClass="gridcellleft"></Cell>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>
</Styles>
                        <SettingsPager NumericButtonCount="20" PageSize="20" AlwaysShowPager="True" ShowSeparators="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
                        <Columns>
<dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="ind_id">
<EditCellStyle>
<Paddings PaddingTop="15px"></Paddings>
</EditCellStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="ind_industry" Width="40%" Caption="IndustrySector">
<EditCellStyle Wrap="False" HorizontalAlign="Left"></EditCellStyle>

<PropertiesTextEdit Width="300px">
<ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
<RequiredField IsRequired="True" ErrorText="Please Enter Industry Sector Name"></RequiredField>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Left"></EditFormCaptionStyle>

<EditFormSettings Caption="Indusrty/Sector Name" Visible="True"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataComboBoxColumn FieldName="ind_principalIndustry" Caption="Under" VisibleIndex="1">
<EditCellStyle Wrap="False" HorizontalAlign="Left"></EditCellStyle>

<PropertiesComboBox Width="300px" ValueType="System.String" TextField="ind_industry" ValueField="ind_industry" EnableIncrementalFiltering="True" EnableSynchronization="False" DataSourceID="PrincipalSelect"><Items>
<dxe:ListEditItem Value="N/A" Text="N/A"></dxe:ListEditItem>
</Items>
</PropertiesComboBox>

<CellStyle Wrap="False" CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Caption="Principal Sector" Visible="True"></EditFormSettings>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="2">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<DeleteButton Visible="True"></DeleteButton>
<HeaderTemplate>
                                    <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                      { %>
                                    <a href="javascript:void(0);" onclick="grid.AddNewRow()"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                    <%} %>
                                
</HeaderTemplate>

<EditButton Visible="True"></EditButton>
</dxwgv:GridViewCommandColumn>
</Columns>
                        <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center"
                            PopupEditFormModal="True" PopupEditFormVerticalAlign="BottomSides" PopupEditFormWidth="600px" />
                        <SettingsText PopupEditFormCaption="Add/Modify Industry" />
                        <Settings ShowStatusBar="Visible" ShowGroupPanel="True" />
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="IndustrySector" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" DeleteCommand="DELETE FROM [tbl_master_industry] WHERE [ind_id] = @original_ind_id"
            InsertCommand="INSERT INTO [tbl_master_industry] ([ind_industry], [ind_principalIndustry],[CreateDate],[CreateUser]) VALUES (@ind_industry, @ind_principalIndustry,getdate(),@CreateUser)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ind_id], [ind_industry], [ind_principalIndustry] FROM [tbl_master_industry]"
            UpdateCommand="UPDATE [tbl_master_industry] SET [ind_industry] = @ind_industry, [ind_principalIndustry] = @ind_principalIndustry, [LastModifyDate]=getdate(), [LastModifyUser]=@CreateUser WHERE [ind_id] = @original_ind_id">
            <DeleteParameters>
                <asp:Parameter Name="original_ind_id" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ind_industry" Type="String" />
                <asp:Parameter Name="ind_principalIndustry" Type="String" />
                <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="ind_industry" Type="String" />
                <asp:Parameter Name="ind_principalIndustry" Type="String" />
                <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
            </InsertParameters>
        </asp:SqlDataSource>
        <%--====================================================== PRINCIPAL SELECT =======================================================--%>
        <asp:SqlDataSource ID="PrincipalSelect" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString%>"
            SelectCommand="SELECT [ind_id], [ind_industry]  FROM  [tbl_master_industry] order by ind_industry">
        </asp:SqlDataSource>
        <%--==========================================================================================================================--%>
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
        <br />
    </form>
</body>
</html>
