<%@ page language="C#" autoeventwireup="true" inherits="management_InsuranceRiders, App_Web_lgnajdkn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Insurence Riders</title>
        <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
     <script type="text/javascript">
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
    //function is called on changing country
    function Show() {

        var url = "frmAddDocuments.aspx?id=InsuranceLife.aspx&id1=Products Insurance";

        popup.SetContentUrl(url);

        popup.Show();

    }
     function Getvalue()
     {
        gridasset.PerformCallback();
     }
    function OnNameOfCompany(cmbCountry) {
        grid.GetEditor("insu_nameOfCompany").PerformCallback(cmbCountry.GetValue().toString());
    }
    function OnDescription(cmbCountry) {
        grid.GetEditor("insu_description").PerformCallback(cmbCountry.GetValue().toString());
    }

    function ShowHideFilter(obj)
    {
       grid.PerformCallback(obj);
    }
    function FocusQuantity(obj)
        {   //alert(obj);
            if(obj!=null)
            {
                if(obj=='n')
                {
                    grid.FocusEditor('Description');
                }
                else if(obj=='Y')
                {
                    grid.PerformCallback('Cancel');
                }
                else
                {
                   tabs.SetActiveTab(tabs.GetTab(1));
                   gridasset.PerformCallback();
                }
            }
            height();
        }
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <table class="TableMain100">
        <tr>
            <td class="EHEADER" style="text-align:center;">
                <strong><span style="color: #000099">Insurance RiderPlans</span></strong></td>
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
                <dxwgv:ASPxGridView ID="InsuranceRiderGrid" runat="server" ClientInstanceName="grid"
                    DataSourceID="RiderMain" AutoGenerateColumns="False" KeyFieldName="PID" Width="100%"
                     
                    OnCustomCallback="InsuranceRiderGrid_CustomCallback" OnRowValidating="InsuranceRiderGrid_RowValidating"
                    OnCustomJSProperties="InsuranceRiderGrid_CustomJSProperties">
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="False" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="PID" Visible="False" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="PType" Visible="False" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="PPcode" Visible="False" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Product Name" FieldName="Description" VisibleIndex="0"
                            Width="30%">
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormSettings Visible="True" />
                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                            </EditFormCaptionStyle>
                            <PropertiesTextEdit>
                                <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True" Display="Dynamic">
                                    <RequiredField ErrorText="Required" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="CreateDate" Visible="False" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="CreateUser" Visible="False" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataComboBoxColumn Caption="Insurance Company" FieldName="NameOfCompany"
                            VisibleIndex="1" Width="30%">
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <PropertiesComboBox DataSourceID="RiderName" TextField="insu_nameOfCompany" ValueField="insu_internalId"
                                ValueType="System.String" EnableIncrementalFiltering="True">
                                <ClientSideEvents SelectedIndexChanged="function(s,e){OnNameOfCompany(s);}" />
                            </PropertiesComboBox>
                            <EditFormSettings Visible="True" />
                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                            </EditFormCaptionStyle>
                        </dxwgv:GridViewDataComboBoxColumn>
                        <dxwgv:GridViewDataComboBoxColumn Caption="Insurance Plan Type" FieldName="IPlanType"
                            VisibleIndex="2" Width="30%">
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <PropertiesComboBox DataSourceID="RiderPlanType" EnableIncrementalFiltering="True"
                                EnableSynchronization="False" TextField="insu_description" ValueField="insu_description"
                                ValueType="System.String">
                                <ClientSideEvents SelectedIndexChanged="function(s,e){OnDescription(s);}" />
                            </PropertiesComboBox>
                            <EditFormSettings Visible="True" />
                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                            </EditFormCaptionStyle>
                        </dxwgv:GridViewDataComboBoxColumn>
                        <dxwgv:GridViewDataTextColumn Caption="IRDA Product UIN" FieldName="IRDAUIN" Visible="False"
                            VisibleIndex="1">
                            <EditFormSettings Visible="True" />
                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                            </EditFormCaptionStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataDateColumn Caption="In Operation From" FieldName="OTillDate" Visible="False"
                            VisibleIndex="1">
                            <PropertiesDateEdit DisplayFormatString="" EditFormat="Custom" EditFormatString="dd MMMM yyyy"
                                UseMaskBehavior="True">
                            </PropertiesDateEdit>
                            <Settings GroupInterval="DateYear" />
                            <EditFormSettings Visible="True" />
                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                            </EditFormCaptionStyle>
                        </dxwgv:GridViewDataDateColumn>
                        <dxwgv:GridViewDataDateColumn Caption="In Operation Till" FieldName="Tilldate" Visible="False"
                            VisibleIndex="1">
                            <PropertiesDateEdit DisplayFormatString="" EditFormat="Custom" EditFormatString="dd MMMM yyyy"
                                UseMaskBehavior="True">
                            </PropertiesDateEdit>
                            <Settings GroupInterval="DateYear" />
                            <EditFormSettings Visible="True" />
                            <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                            </EditFormCaptionStyle>
                        </dxwgv:GridViewDataDateColumn>
                        <dxwgv:GridViewCommandColumn VisibleIndex="3">
                            <DeleteButton Visible="True">
                            </DeleteButton>
                            <EditButton Visible="True">
                            </EditButton>
                            <HeaderStyle HorizontalAlign="Center" />
                            <HeaderTemplate>
                               <%-- <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                      { %>--%>
                                <a href="javascript:void(0);" onclick="grid.AddNewRow()"><span style="color: #000099;
                                   text-decoration: underline">Add New</span> </a>
                                <%-- <%} %>--%>
                            </HeaderTemplate>
                        </dxwgv:GridViewCommandColumn>
                    </Columns>
                    <ClientSideEvents EndCallback="function(s, e) { FocusQuantity(s.cpInsert);}" />
                    <Styles  >
                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                        </Header>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                    </Styles>
                    <SettingsText PopupEditFormCaption="Add/Modify RiderPlans" ConfirmDelete="Are You Want To Delete This Record ???" />
                    <SettingsBehavior ColumnResizeMode="NextColumn" AllowFocusedRow="True" ConfirmDelete="True" />
                    <SettingsPager NumericButtonCount="20" PageSize="20" AlwaysShowPager="True" ShowSeparators="True">
                        <FirstPageButton Visible="True">
                        </FirstPageButton>
                        <LastPageButton Visible="True">
                        </LastPageButton>
                    </SettingsPager>
                    <Settings ShowStatusBar="Visible" ShowGroupPanel="true" />
                    <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormHeight="350px"
                        PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter"
                        PopupEditFormWidth="700px" />
                    <Templates>
                        <EditForm>
                            <div style="padding: 4px 4px 3px 4px">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 99%">
                                            <dxtc:ASPxPageControl runat="server" ClientInstanceName="tabs" ID="pageControl" Width="100%" ActiveTabIndex="0"
                                                TabIndex="1"  
                                                ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                                <TabPages>
                                                    <dxtc:TabPage Text="Details">
                                                        <ContentCollection>
                                                            <dxw:contentcontrol runat="server">
                                                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors"
                                                                    ColumnID="" ID="Editors">
                                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                                                <dxwgv:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement1" ReplacementType="EditFormUpdateButton"
                                                                    runat="server" ColumnID="">
                                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                                            </dxw:contentcontrol>
                                                        </ContentCollection>
                                                    </dxtc:TabPage>
                                                    <dxtc:TabPage Text="Documents">
                                                        <ContentCollection>
                                                            <dxw:contentcontrol runat="server">
                                                                <dxwgv:ASPxGridView runat="server" ID="AssetsGrid" KeyFieldName="Id" ClientInstanceName="gridasset"
                                                                    AutoGenerateColumns="False" Width="100%" OnBeforePerformDataSelect="AvailableRidersGrid_D"
                                                                    TabIndex="2"  OnCustomCallback="AssetsGrid_CustomCallback" OnRowDeleting="AssetsGrid_RowDeleting">
                                                                    <Columns>
                                                                        <dxwgv:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0" Visible="False">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dxwgv:GridViewDataTextColumn>
                                                                        <dxwgv:GridViewDataTextColumn FieldName="Type" VisibleIndex="0" Caption="DocumentType"
                                                                            Width="25%">
                                                                        </dxwgv:GridViewDataTextColumn>
                                                                        <dxwgv:GridViewDataTextColumn FieldName="FileName" VisibleIndex="1" Caption="DocumentName"
                                                                            Width="25%">
                                                                        </dxwgv:GridViewDataTextColumn>
                                                                        <dxwgv:GridViewDataTextColumn FieldName="Src" VisibleIndex="2" Visible="False">
                                                                        </dxwgv:GridViewDataTextColumn>
                                                                        <dxwgv:GridViewDataTextColumn FieldName="FilePath" ReadOnly="True" VisibleIndex="2"
                                                                            Caption="Document Physical Location" Width="25%">
                                                                        </dxwgv:GridViewDataTextColumn>
                                                                        <dxwgv:GridViewDataHyperLinkColumn Caption="View" FieldName="Src" VisibleIndex="3"
                                                                            Width="15%">
                                                                            <DataItemTemplate>
                                                                                <a href='viewImage.aspx?id=<%#Eval("Src") %>' target="_blank">View</a>
                                                                            </DataItemTemplate>
                                                                        </dxwgv:GridViewDataHyperLinkColumn>
                                                                        <dxwgv:GridViewCommandColumn VisibleIndex="4">
                                                                            <DeleteButton Visible="True">
                                                                            </DeleteButton>
                                                                            <HeaderTemplate>
                                                                                <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                                                                  { %>
                                                                                <a href="javascript:void(0);" onclick="javascript:Show();"><span style="color: #000099;
                                                                                    text-decoration: underline">Add New</span> </a>
                                                                                <%} %>
                                                                            </HeaderTemplate>
                                                                        </dxwgv:GridViewCommandColumn>
                                                                    </Columns>
                                                                    <Settings ShowFooter="True" ShowStatusBar="Visible" ShowTitlePanel="True" />
                                                                    <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="200px" PopupEditFormHorizontalAlign="Center"
                                                                        PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px"
                                                                        EditFormColumnCount="1" />
                                                                    <Styles >
                                                                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                        </Header>
                                                                        <LoadingPanel ImageSpacing="10px">
                                                                        </LoadingPanel>
                                                                    </Styles>
                                                                    <SettingsText PopupEditFormCaption="Add/Modify Assets" ConfirmDelete="Are You Want To Delete This Record ???" />
                                                                    <SettingsPager NumericButtonCount="20" PageSize="20">
                                                                    </SettingsPager>
                                                                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                                                                </dxwgv:ASPxGridView>
                                                                <dxpc:ASPxPopupControl ID="ASPXPopupControl" runat="server" ContentUrl="frmAddDocuments.aspx"
                                                                    CloseAction="CloseButton" Top="100" Left="400" ClientInstanceName="popup" Height="310px"
                                                                    Width="430px" HeaderText="Add Document">
                                                                    <ContentCollection>
                                                                        <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                                                                        </dxpc:PopupControlContentControl>
                                                                    </ContentCollection>
                                                                </dxpc:ASPxPopupControl>
                                                            </dxw:contentcontrol>
                                                        </ContentCollection>
                                                    </dxtc:TabPage>
                                                </TabPages>
                                                <ContentStyle>
                                                    <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                                                </ContentStyle>
                                                <LoadingPanelStyle ImageSpacing="6px">
                                                </LoadingPanelStyle>
                                            </dxtc:ASPxPageControl>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dxe:ASPxHyperLink ID="ASPxHyperLink2" runat="server" Text="Cancel" Cursor="pointer">
                                                <ClientSideEvents Click="function(s,e){grid.PerformCallback('Cancel');}" />
                                            </dxe:ASPxHyperLink>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            
                        </EditForm>
                    </Templates>

                </dxwgv:ASPxGridView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="RiderPlanType" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
        SelectCommand="SELECT insu_id, insu_description FROM tbl_master_insurancePlanType order by insu_description">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="RiderName" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
        SelectCommand="SELECT insu_internalId, insu_nameOfCompany FROM tbl_master_insurerName order by insu_nameOfCompany">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="RiderMain" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
        InsertCommand="RiderInsert" InsertCommandType="StoredProcedure" SelectCommand="RiderSelect"
        SelectCommandType="StoredProcedure" UpdateCommand="RiderUpdate" UpdateCommandType="StoredProcedure"
        DeleteCommand="InsuLifeDelete" DeleteCommandType="StoredProcedure">
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="NameOfCompany" Type="String" />
            <asp:Parameter Name="IPlanType" Type="String" />
            <asp:Parameter Name="IRDAUIN" Type="String" />
            <asp:Parameter Name="OTillDate" Type="DateTime" />
            <asp:Parameter Name="Tilldate" Type="DateTime" />
            <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
            <asp:Parameter Name="PID" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="NameOfCompany" Type="String" />
            <asp:Parameter Name="IPlanType" Type="String" />
            <asp:Parameter Name="IRDAUIN" Type="String" />
            <asp:Parameter Name="OTillDate" Type="DateTime" />
            <asp:Parameter Name="Tilldate" Type="DateTime" />
            <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="PID" Type="String" />
        </DeleteParameters>
    </asp:SqlDataSource>
    
    <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
    </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
