<%@ page language="C#" autoeventwireup="true" inherits="management_frm_insurancecommissionslab, App_Web_6yanuau_" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
  
    function OnMoreInfoClick(keyValue)
    {
        var url='frm_insurancecommissionslab_Add.aspx?id='+keyValue;
        parent.OnMoreInfoClick(url,"Edit insurance commission slab Details",'900px','450px',"Y");
    }
    
    function OnAddButtonClick() 
    {
         var url='frm_insurancecommissionslab_Add.aspx?id=ADD';
         parent.OnMoreInfoClick(url,"Add insurance commission slab Details",'900px','450px',"Y");
    }
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
    function callback()
    {
        grid.PerformCallback();
    }
    function EndCall(obj)
    {
        height();
    }
    function ShowHideFilter(obj)
    {
        grid.PerformCallback(obj);
    }
    function OnDeleteClick(obj)
    {
        if(confirm('Are you sure want to delete this slab?'))
        {
            grid.PerformCallback('Delete~'+obj);
        }
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100" cellpadding="0px" cellspacing="0px">
            <tr>
                <td class="EHEADER" align="center">
                    <strong><span style="color: #000099">Insurance Commission  <asp:Label ID="lblHeader" runat="server" Text=""></asp:Label> Slab</span></strong></td>
                    
            </tr>
            <tr>
                <td class="gridcellright">
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
                <td class="gridcellcenter">
                    <dxwgv:ASPxGridView ID="BrokerageSlabGrid" runat="server" KeyFieldName="InsCommissionSlab_ID"
                        AutoGenerateColumns="False" DataSourceID="BrokerageSlabDataSource" Width="100%"
                        ClientInstanceName="grid" OnCustomCallback="BrokerageSlabGrid_CustomCallback"
                        OnCustomJSProperties="BrokerageSlabGrid_CustomJSProperties" OnDataBound="BrokerageSlabGrid_DataBound">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="InsCommissionSlab_ID" Caption="ID" VisibleIndex="0"
                                Visible="False">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="InsCommissionSlab_Code" Caption="Code" VisibleIndex="1">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            
                              <dxwgv:GridViewDataTextColumn FieldName="Company" Caption="Insurance Company" VisibleIndex="2">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            
                              <dxwgv:GridViewDataTextColumn FieldName="PlanName" Caption="PlanName" VisibleIndex="3">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            
                            
                            <dxwgv:GridViewDataTextColumn FieldName="InsCommissionSlab_Type" Caption="Type" VisibleIndex="4">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="PPT" FieldName="PPT" VisibleIndex="5">
                                <EditFormSettings Visible="False" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Min" FieldName="min" VisibleIndex="6">
                                <EditFormSettings Visible="False" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="max" Caption="Max" VisibleIndex="7">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Flat Rate" FieldName="InsCommissionSlab_FixedAmount"
                                VisibleIndex="8">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="InsCommissionSlab_Rate" Caption=" Min.Charge"
                                VisibleIndex="9">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="InsCommissionSlab_ORC" Caption="ORC(%)"
                                VisibleIndex="10">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn FieldName="Mode" Caption="Mode"
                                VisibleIndex="11">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="InsCommissionSlab_Notes" Caption="Slab Name"
                                VisibleIndex="12">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="13" Width="10%">
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                        Edit</a>&nbsp;|&nbsp;
                                    <a href="javascript:void(0);" onclick="OnDeleteClick('<%# Container.KeyValue %>')">
                                        Delete</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <HeaderStyle HorizontalAlign="Center" />
                                <HeaderTemplate>
                                    <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                      { %>
                                    <a href="javascript:void(0);" onclick="OnAddButtonClick( )"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                    <%} %>
                                </HeaderTemplate>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Styles>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                        </Styles>
                        <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                        <SettingsText PopupEditFormCaption="Add/ Modify Employee" />
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="3" />
                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" AllowSort="False" />
                        <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="20"
                            PageSize="20">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <ClientSideEvents EndCallback="function(s, e) {
	  EndCall(s.cpEND);
}" />
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="BrokerageSlabDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            DeleteCommand="delete from [Master_InsCommissionSlab] where InsCommissionSlab_Code=(select A.InsCommissionSlab_Code from Master_InsCommissionSlab A where A.InsCommissionSlab_ID=@InsCommissionSlab_ID) and InsCommissionSlab_Type=(select B.InsCommissionSlab_Type from Master_InsCommissionSlab B where B.InsCommissionSlab_ID=@InsCommissionSlab_ID)">
            <DeleteParameters>
                <asp:Parameter Name="InsCommissionSlab_ID" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <br />
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
