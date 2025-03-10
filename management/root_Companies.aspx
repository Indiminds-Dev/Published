<%@ page language="C#" autoeventwireup="true" inherits="management_root_Companies, App_Web_n2fxndvz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }

    function NewPgae(cnt_id)
    {
        //alert('cnt_id');
    }
    function OnMoreInfoClick(keyValue) 
    {
         var url='rootcompany_general.aspx?id='+keyValue;
         parent.OnMoreInfoClick(url,"Modify Company Details",'940px','450px',"Y");
    }
   
    function OnAddButtonClick() 
    {
        var url='rootcompany_general.aspx?id=' + 'ADD';
        parent.OnMoreInfoClick(url,"Add Company Details",'940px','450px',"Y");
    }
    function ShowHideFilter(obj)
    {
       grid.PerformCallback(obj);
    }
    function callback()
    {
        grid.PerformCallback('All');
    } 
//-->
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Company Master</span></strong></td>
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
                                <%if (Session["PageAccess"].ToString().Trim() == "All")
                                  { %>
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
                                <%} %>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="CompanyGrid" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False"
                        DataSourceID="CompaniesDataSource" KeyFieldName="cmp_id" Width="100%" OnCellEditorInitialize="CompanyGrid_CellEditorInitialize"
                        OnCustomCallback="CompanyGrid_CustomCallback">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="cmp_id" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cmp_internalid" Visible="False" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn FieldName="cmp_parentid" Visible="False" VisibleIndex="0">
                                <PropertiesComboBox DataSourceID="SqlParentComp" ValueField="cmp_internalid" TextField="cmp_Name"
                                    EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String">
                                </PropertiesComboBox>
                                <EditFormSettings Caption="Parent Comp" Visible="True" VisibleIndex="0" />
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Company Name" FieldName="cmp_Name" VisibleIndex="0"
                                Width="30%">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesTextEdit Width="300px">
                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                        <RequiredField ErrorText="Please Enter Company Name" IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" VisibleIndex="0" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cmp_natureOfBusiness" Visible="False" VisibleIndex="1"
                                Caption="Nature Of Business">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesTextEdit Width="300px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="Nature Of Business" VisibleIndex="1" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Directors" FieldName="cmp_directors" VisibleIndex="1"
                                Width="20%">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesTextEdit Width="300px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" VisibleIndex="2" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Authorized Signatories" FieldName="cmp_authorizedSignatories"
                                VisibleIndex="2" Width="15%">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesTextEdit Width="300px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cmp_registrationNo" Visible="False" VisibleIndex="3"
                                Caption="Registration No.">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesTextEdit Width="300px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="Registration No." VisibleIndex="3" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="PAN No." FieldName="cmp_panNo" VisibleIndex="3">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesTextEdit Width="300px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" VisibleIndex="5" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cmp_serviceTaxNo" Visible="False" VisibleIndex="3"
                                Caption="Service Tax No.">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesTextEdit Width="300px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="Service Tax No." VisibleIndex="7" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cmp_salesTaxNo" Visible="False" VisibleIndex="3"
                                Caption="Sales Tax No.">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesTextEdit Width="300px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="Sales Tax No." VisibleIndex="8" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataDateColumn Visible="False" VisibleIndex="6" Caption="Date of Incorporation:"
                                FieldName="cmp_DateIncorporation">
                                <EditCellStyle Wrap="False" HorizontalAlign="Left">
                                </EditCellStyle>
                                <PropertiesDateEdit DisplayFormatString="" EditFormat="Custom" EditFormatString="dd MMMM yyyy"
                                    Width="300px" UseMaskBehavior="True">
                                </PropertiesDateEdit>
                                <EditFormSettings Caption="Date of Incorporation:" Visible="True" VisibleIndex="11" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cmp_CIN" Caption="CIN" VisibleIndex="4">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesTextEdit Width="300px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" VisibleIndex="9" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataDateColumn Caption="CIN Validity Date" FieldName="cmp_CINdt" Visible="False"
                                VisibleIndex="5">
                                <PropertiesDateEdit DisplayFormatString="" Width="300px" EditFormat="Custom" EditFormatString="dd MMMM yyyy"
                                    UseMaskBehavior="True">
                                </PropertiesDateEdit>
                                <EditFormSettings Visible="True" VisibleIndex="10" />
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn Caption="Registration No Validity Date" FieldName="cmp_VregisNo"
                                Visible="False" VisibleIndex="5">
                                <PropertiesDateEdit DisplayFormatString="" Width="300px" EditFormat="Custom" EditFormatString="dd MMMM yyyy"
                                    UseMaskBehavior="True">
                                </PropertiesDateEdit>
                                <EditFormSettings Visible="True" VisibleIndex="4" />
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn Caption="PanNo Validity Date" FieldName="cmp_VPanNo"
                                Visible="False" VisibleIndex="5">
                                <PropertiesDateEdit DisplayFormatString="" Width="300px" EditFormat="Custom" EditFormatString="dd MMMM yyyy"
                                    UseMaskBehavior="True">
                                </PropertiesDateEdit>
                                <EditFormSettings Visible="True" VisibleIndex="6" />
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="5">
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                        More Info...</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <HeaderStyle HorizontalAlign="Center" />
                                <HeaderTemplate>
                                    <a href="javascript:void(0);" onclick="OnAddButtonClick()"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                </HeaderTemplate>
                            </dxwgv:GridViewDataTextColumn>
                           
                        </Columns>
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
                        <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="300px" PopupEditFormHorizontalAlign="Center"
                            PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" />
                        <Styles>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <SettingsText PopupEditFormCaption="Add/Modify Company Name" ConfirmDelete="Are You Want To Delete This Record ???" />
                        <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <%--========================================================== Master Grid DataSource =================================================--%>
        <asp:SqlDataSource ID="CompaniesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>"
            InsertCommand="CompanyInsert" InsertCommandType="StoredProcedure" SelectCommand="CompanySelect"
            SelectCommandType="StoredProcedure" DeleteCommand="CompanyDelete" DeleteCommandType="StoredProcedure"
            UpdateCommand="CompanyUpdate" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="cmp_internalid" Type="string" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="cmp_internalid" Type="String" />
                <asp:Parameter Name="cmp_Name" Type="String" />
                <asp:Parameter Name="cmp_natureOfBusiness" Type="String" />
                <asp:Parameter Name="cmp_directors" Type="String" />
                <asp:Parameter Name="cmp_authorizedSignatories" Type="String" />
                <asp:Parameter Name="cmp_registrationNo" Type="String" />
                <asp:Parameter Name="cmp_panNo" Type="String" />
                <asp:Parameter Name="cmp_serviceTaxNo" Type="String" />
                <asp:Parameter Name="cmp_salesTaxNo" Type="String" />
                <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
                <asp:Parameter Name="cmp_CIN" Type="String" />
                <asp:Parameter Name="cmp_DateIncorporation" Type="datetime" />
                <asp:Parameter Name="cmp_CINdt" Type="datetime" />
                <asp:Parameter Name="cmp_VregisNo" Type="datetime" />
                <asp:Parameter Name="cmp_VPanNo" Type="datetime" />
                <asp:Parameter Name="cmp_parentid" Type="string" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="cmp_Name" Type="String" />
                <asp:Parameter Name="cmp_natureOfBusiness" Type="String" />
                <asp:Parameter Name="cmp_directors" Type="String" />
                <asp:Parameter Name="cmp_authorizedSignatories" Type="String" />
                <asp:Parameter Name="cmp_registrationNo" Type="String" />
                <asp:Parameter Name="cmp_panNo" Type="String" />
                <asp:Parameter Name="cmp_serviceTaxNo" Type="String" />
                <asp:Parameter Name="cmp_salesTaxNo" Type="String" />
                <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
                <asp:Parameter Name="cmp_CIN" Type="String" />
                <asp:Parameter Name="cmp_DateIncorporation" Type="datetime" />
                <asp:Parameter Name="cmp_CINdt" Type="datetime" />
                <asp:Parameter Name="cmp_VregisNo" Type="datetime" />
                <asp:Parameter Name="cmp_VPanNo" Type="datetime" />
                <asp:Parameter Name="cmp_parentid" Type="string" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlParentComp" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT [cmp_internalid], [cmp_Name] FROM [tbl_master_company]"></asp:SqlDataSource>
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
