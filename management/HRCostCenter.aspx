<%@ page language="C#" autoeventwireup="true" inherits="management_HRCostCenter, App_Web_xu-hjjp9" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cost center</title>
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
    function OnMoreInfoClick(keyValue) {
     var url='HRCost.aspx?id='+keyValue;
     parent.OnMoreInfoClick(url,"Modify Cost Center",'940px','450px',"Y");
     
    }
    function ShowHideFilter(obj)
    {
       grid.PerformCallback(obj);
    }
    function AddNewClick()
    {
        var url="HRAddNewCostDept.aspx"
        parent.OnMoreInfoClick(url,"Modify Cost Center",'940px','450px',"Y");
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center" colspan="2">
                    <strong><span style="color: #000099">Cost Centers/Departments</span></strong>
                </td>
            </tr>
            <tr>
                <td style="text-align: left; vertical-align: top; width: 536px;">
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
            <tr>
                <td colspan="2">
                    <dxwgv:ASPxGridView ID="CostDepartmentGrid" runat="server" ClientInstanceName="grid"
                        AutoGenerateColumns="False" DataSourceID="DepartmentSource" KeyFieldName="cost_id"
                        Width="100%" OnCustomCallback="CostDepartmentGrid_CustomCallback" OnRowUpdated="CostDepartmentGrid_RowUpdated">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="cost_id" ReadOnly="True" VisibleIndex="0"
                                Visible="False">
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="CostCenterType" FieldName="cost_costCenterType"
                                VisibleIndex="1" Width="40%">
                                <PropertiesComboBox ValueType="System.String" EnableIncrementalFiltering="True">
                                    <Items>
                                        <dxe:ListEditItem Text="Department" Value="Department">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Employee" Value="Employee">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Branch" Value="Branch">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                                <EditFormSettings Visible="True" />
                                <CellStyle CssClass="gridcellleft" HorizontalAlign="Left">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn Caption="CostCenter" FieldName="cost_description" VisibleIndex="0"
                                Width="40%">
                                <EditFormSettings Visible="True" />
                                <CellStyle CssClass="gridcellleft" HorizontalAlign="Left">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn FieldName="cost_costCenterHead" Visible="False"
                                VisibleIndex="2">
                                <PropertiesComboBox DataSourceID="HeadSource" TextField="cnt_firstName" ValueField="cnt_internalId"
                                    ValueType="System.String" EnableIncrementalFiltering="True">
                                </PropertiesComboBox>
                                <EditFormSettings Visible="True" Caption="Head Of department" />
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn FieldName="cost_principlalDepartment" Visible="False"
                                VisibleIndex="3">
                                <PropertiesComboBox DataSourceID="ParentSource" TextField="cost_description" ValueField="cost_id"
                                    ValueType="System.String" EnableIncrementalFiltering="True">
                                </PropertiesComboBox>
                                <EditFormSettings Visible="True" Caption="Parent Cost  Center/Dept." />
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataCheckColumn FieldName="cost_operationIn" Visible="False" VisibleIndex="5">
                                <EditFormSettings Visible="True" Caption="Mutual Fund" />
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataCheckColumn>
                            <dxwgv:GridViewDataCheckColumn FieldName="cost_operationIn1" Visible="False" VisibleIndex="6">
                                <EditFormSettings Visible="True" Caption="Broking" />
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataCheckColumn>
                            <dxwgv:GridViewDataCheckColumn FieldName="cost_operationIn2" Visible="False" VisibleIndex="7">
                                <EditFormSettings Visible="True" Caption="Insurance" />
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataCheckColumn>
                            <dxwgv:GridViewDataCheckColumn FieldName="cost_operationIn3" Visible="False" VisibleIndex="8">
                                <EditFormSettings Visible="True" Caption="Depository" />
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataCheckColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cost_email" Visible="False" VisibleIndex="4">
                                <EditFormSettings Visible="True" Caption="Email-Id" />
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="2">
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                        More Info...</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <HeaderTemplate>
                                    <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                      { %>
                                    <a href="javascript:void(0);" onclick="AddNewClick();"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                    <%} %>
                                </HeaderTemplate>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewCommandColumn VisibleIndex="3">
                                <DeleteButton Visible="True">
                                </DeleteButton>
                            </dxwgv:GridViewCommandColumn>
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
                        <Styles>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                        </Styles>
                        <Settings ShowTitlePanel="True" ShowFooter="True" ShowStatusBar="Visible" />
                        <SettingsText PopupEditFormCaption="Add/ Modify CostCenter" />
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                            PopupEditFormVerticalAlign="TopSides" PopupEditFormWidth="900px" EditFormColumnCount="1" />
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                        <SettingsPager AlwaysShowPager="True" PageSize="20" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
        <asp:SqlDataSource ID="DepartmentSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="HrCostCenterSelect" DeleteCommand="delete from tbl_master_costCenter where cost_id=@cost_id"
            SelectCommandType="StoredProcedure" InsertCommand="HrCostCenterInsert" InsertCommandType="StoredProcedure"
            UpdateCommand="HrCostCenterUpdate" UpdateCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="cost_costCenterType" Type="String" />
                <asp:Parameter Name="cost_description" Type="String" />
                <asp:Parameter Name="cost_costCenterHead" Type="String" />
                <asp:Parameter Name="cost_principlalDepartment" Type="String" />
                <asp:Parameter Name="cost_operationIn" Type="String" />
                <asp:Parameter Name="cost_operationIn1" Type="String" />
                <asp:Parameter Name="cost_operationIn2" Type="String" />
                <asp:Parameter Name="cost_operationIn3" Type="String" />
                <asp:Parameter Name="cost_email" Type="String" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="cost_id" Type="String" />
                <asp:Parameter Name="cost_costCenterType" Type="String" />
                <asp:Parameter Name="cost_description" Type="String" />
                <asp:Parameter Name="cost_costCenterHead" Type="String" />
                <asp:Parameter Name="cost_principlalDepartment" Type="String" />
                <asp:Parameter Name="cost_operationIn" Type="String" />
                <asp:Parameter Name="cost_operationIn1" Type="String" />
                <asp:Parameter Name="cost_operationIn2" Type="String" />
                <asp:Parameter Name="cost_operationIn3" Type="String" />
                <asp:Parameter Name="cost_email" Type="String" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="cost_id" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="ParentSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select cost_description,cost_id from tbl_master_costCenter where cost_costCenterType='Department' order by cost_description">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="HeadSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select cnt_firstName+' '+isnull(cnt_middleName,'')+' '+isnull(cnt_lastName,'')+' ['+isnull(rtrim(cnt_shortName),'')+']' as cnt_firstName, cnt_internalId from tbl_master_contact where cnt_internalId LIKE '%em_%' order by cnt_firstName">
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
