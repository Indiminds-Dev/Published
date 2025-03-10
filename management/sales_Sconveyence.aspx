<%@ page language="C#" autoeventwireup="true" inherits="management_sales_Sconveyence, App_Web_npkqnqtr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    <title>Convence</title>
<link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        function disp_prompt(name)
    {
         if ( name == "tab0")
        {
        //alert(name);
        document.location.href="sales_Stotal.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        //document.location.href="sales_Sconveyence.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="sales_Stravelling.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="sales_Slodging.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="sales_Sfooding.aspx"; 
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="sales_SbusinessP.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
        document.location.href="sales_Sother.aspx"; 
        }
        
    }
    function OnCityChanged(cmbState) 
    {
        grid.GetEditor("expnd_TArea1").PerformCallback(cmbState.GetValue().toString());
    }
    function OnCityChanged1(cmbState1) 
    {
        grid.GetEditor("expnd_TArea2").PerformCallback(cmbState1.GetValue().toString());
    }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="1" ClientInstanceName="page" Font-Size="10px">
                            <tabpages>
                    <dxtc:TabPage Text="Total Expenses" Name="Total"><ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Text="Conveyence" Name="Conveyence">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                                <dxwgv:ASPxGridView ID="GridConveyence" runat="server" KeyFieldName="expnd_internalId" ClientInstanceName="grid" DataSourceID="SqlConveyence"  Width="100%" AutoGenerateColumns="False" OnCellEditorInitialize="GridConveyence_CellEditorInitialize" OnInitNewRow="GridConveyence_InitNewRow">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn FieldName="expnd_internalId" Visible="False" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="expnd_empId" Visible="False" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="expnd_compId" Visible="False" VisibleIndex="1">
                                            <EditFormSettings Visible="False" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="expnd_branchId" Visible="False" VisibleIndex="2">
                                            <EditFormSettings Visible="False" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="expnd_activityId" Visible="False" VisibleIndex="3">
                                            <EditFormSettings Visible="False" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Expense Type" FieldName="expnd_expenceType"
                                            Visible="False" VisibleIndex="4">
                                            <EditFormSettings Visible="False" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataComboBoxColumn Caption="Currency Type" FieldName="expnd_currencyType"
                                            Visible="False" VisibleIndex="5">
                                            <PropertiesComboBox DataSourceID="SqlCurrency" TextField="curr_symbol" ValueField="curr_id"
                                                ValueType="System.String">
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" VisibleIndex="0" />
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                            </CellStyle>
                                        </dxwgv:GridViewDataComboBoxColumn>
                                        <dxwgv:GridViewDataComboBoxColumn Caption="Mode" FieldName="expnd_convenceMode" VisibleIndex="0">
                                            <PropertiesComboBox DisplayFormatString="d" ValueType="System.String">
                                                <Items>
                                                    <dxe:ListEditItem Text="Bus - Public " Value="Bus - Public">
                                                    </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Bus - Chartered" Value="Bus - Chartered">
                                                    </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Tram " Value="Tram">
                                                    </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Taxi " Value="Taxi">
                                                    </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Train - Local" Value="Train - Local">
                                                    </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Train – Long distance " Value="Train – Long distance">
                                                    </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Private Car" Value="Private Car">
                                                    </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Auto rickshaw" Value="Auto rickshaw">
                                                    </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Rickshaw " Value="Rickshaw">
                                                    </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Flight " Value="Flight">
                                                    </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Ferry " Value="Ferry">
                                                    </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="other" Value="other">
                                                    </dxe:ListEditItem>
                                                </Items>
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" VisibleIndex="0" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataComboBoxColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="From" FieldName="Scity" VisibleIndex="2">
                                            <EditFormSettings Visible="False" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="To" FieldName="Fcity" VisibleIndex="3">
                                            <EditFormSettings Visible="False" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataDateColumn Caption="Expenditure Date" FieldName="expnd_dateExpenditure"
                                             VisibleIndex="1">
                                            <PropertiesDateEdit DisplayFormatString="{0:dd MM yyyy}" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="true">
                                            </PropertiesDateEdit>
                                            <EditFormSettings Visible="True" VisibleIndex="0" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataDateColumn>
                                        <dxwgv:GridViewDataComboBoxColumn Caption="From City" FieldName="expnd_TCity1" Visible="False"
                                            VisibleIndex="2">
                                            <PropertiesComboBox DataSourceID="CitySelect" EnableIncrementalFiltering="True" EnableSynchronization="False"
                                                TextField="city_name" ValueField="city_id" ValueType="System.String">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCityChanged(s); }" />
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" VisibleIndex="1" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataComboBoxColumn>
                                        <dxwgv:GridViewDataComboBoxColumn Caption="From Area" FieldName="expnd_TArea1" Visible="False"
                                            VisibleIndex="3">
                                            <PropertiesComboBox DataSourceID="areaSelect" TextField="area_name" ValueField="area_id"
                                                ValueType="System.String">
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" VisibleIndex="2" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataComboBoxColumn>
                                        <dxwgv:GridViewDataComboBoxColumn Caption="To City" FieldName="expnd_TCity2" Visible="False"
                                            VisibleIndex="4">
                                            <PropertiesComboBox DataSourceID="CitySelect1" EnableIncrementalFiltering="True"
                                                EnableSynchronization="False" TextField="city_name" ValueField="city_id" ValueType="System.String">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCityChanged1(s); }" />
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" VisibleIndex="3" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataComboBoxColumn>
                                        <dxwgv:GridViewDataComboBoxColumn Caption="To Area" FieldName="expnd_TArea2" Visible="False"
                                            VisibleIndex="5">
                                            <PropertiesComboBox DataSourceID="areaSelect1" TextField="area_name" ValueField="area_id"
                                                ValueType="System.String">
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" VisibleIndex="4" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataComboBoxColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Amount" FieldName="expnd_travExpence" VisibleIndex="6">
                                            <EditFormSettings Visible="True" VisibleIndex="5" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                            <PropertiesTextEdit>
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                                    <RegularExpression ErrorText="Enter Valid Amount" ValidationExpression="^(\d{0,13}\.\d{0,5}|\d{0,13})$" />
                                                    <RequiredField ErrorText="Required" IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Reference No" FieldName="expnd_TravRefNo"
                                            VisibleIndex="7">
                                            <EditFormSettings Visible="True" VisibleIndex="6" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                            <PropertiesTextEdit>
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                                    <RequiredField ErrorText="Required" IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Start Journey" Visible="false" FieldName="expnd_dtJourney1" VisibleIndex="4">
                                            <EditFormSettings Visible="False" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataDateColumn Caption="Start Date" FieldName="expnd_dtJourney"
                                            Visible="False" VisibleIndex="1">
                                            <PropertiesDateEdit DisplayFormatString="" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                                            </PropertiesDateEdit>
                                            <EditFormSettings Visible="false" VisibleIndex="0" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataDateColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Return Journey" FieldName="expnd_dtRetJourney1" Visible="false" VisibleIndex="5">
                                            <EditFormSettings Visible="False" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataDateColumn Caption="Return Date" FieldName="expnd_dtRetJourney"
                                            Visible="False" VisibleIndex="1">
                                            <PropertiesDateEdit DisplayFormatString="" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                                            </PropertiesDateEdit>
                                            <EditFormSettings Visible="false" VisibleIndex="0" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataDateColumn>
                                        <dxwgv:GridViewCommandColumn VisibleIndex="8">
                                        <HeaderTemplate>
                                                <a href="javascript:void(0);" onclick="grid.AddNewRow();"><span style="color: #000099;
                                                 text-decoration: underline">Add New</span> </a>
                                            </HeaderTemplate>
                                            <EditButton Visible="True">
                                            </EditButton>
                                            <DeleteButton Visible="True">
                                            </DeleteButton>
                                        </dxwgv:GridViewCommandColumn>
                                    </Columns>
                                    
                                    <StylesEditors>
                                        <ProgressBar Height="25px">
                                        </ProgressBar>
                                    </StylesEditors>
                                    <Settings ShowFooter="True" ShowStatusBar="hidden"  ShowTitlePanel="True" />
                                     <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="350px" PopupEditFormHorizontalAlign="Center"
                                        PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="700px" EditFormColumnCount="1" />
                                    <Styles>
                                     <LoadingPanel ImageSpacing="10px">
                                     </LoadingPanel>
                                     <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                    </Header>
                                     </Styles>
                                    <SettingsText PopupEditFormCaption="Add/Modify Conveyence" ConfirmDelete="Are You Want To Delete This Record ???" />
                                    <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                    </SettingsPager>
                                    <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                    <Templates>
                                      <EditForm>
                                         <table style="width:100%">
                                           <tr><td style="width:25%"></td>
                                               <td style="width:50%">
                                                 <controls>
                                                   <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                                   </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                                                 </controls>
                                                 <div style="text-align:right; padding:2px 2px 2px 2px">
                                                   <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                                                   <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                                                 </div>
                                               </td>
                                               <td style="width:25%"></td>
                                           </tr>
                                        </table>
                                    </EditForm>
                                   
                               </Templates>
                                </dxwgv:ASPxGridView>
                            </dxw:ContentControl>
                        </ContentCollection>
                        </dxtc:TabPage>
                    <dxtc:TabPage Name="Travelling" Text="Travelling">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Lodging" Text="Lodging">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Fooding" Text="Fooding">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Business Processing" Text="Business Processing">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Others" Text="Others">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    </tabpages>
                            <clientsideevents activetabchanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                            var Tab2 = page.GetTab(2);
	                                            var Tab3 = page.GetTab(3);
	                                            var Tab4 = page.GetTab(4);
	                                            var Tab5 = page.GetTab(5);
	                                            var Tab6 = page.GetTab(6);
	                                            if(activeTab == Tab0)
	                                            {
	                                                disp_prompt('tab0');
	                                            }
	                                            if(activeTab == Tab1)
	                                            {
	                                                disp_prompt('tab1');
	                                            }
	                                            else if(activeTab == Tab2)
	                                            {
	                                                disp_prompt('tab2');
	                                            }
	                                            else if(activeTab == Tab3)
	                                            {
	                                                disp_prompt('tab3');
	                                            }
	                                            else if(activeTab == Tab4)
	                                            {
	                                                disp_prompt('tab4');
	                                            }
	                                            else if(activeTab == Tab5)
	                                            {
	                                                disp_prompt('tab5');
	                                            }
	                                            else if(activeTab == Tab6)
	                                            {
	                                                disp_prompt('tab6');
	                                            }
	                                            }">
                    </clientsideevents>
                            <contentstyle>
                        <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                    </contentstyle>
                            <loadingpanelstyle imagespacing="6px">
                    </loadingpanelstyle>
                        </dxtc:ASPxPageControl>
                    </td>
                </tr>
                <tr>
                    <td >
                        <table style="width: 100%;">
                            <tr>
                                <td align="right" >
                                    <asp:SqlDataSource ID="SqlConveyence" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                        DeleteCommand="DELETE FROM [tbl_trans_SExpenditure] WHERE [expnd_internalId] = @expnd_internalId"
                                        InsertCommand="Expnd_SConvenyence_Insert" InsertCommandType="StoredProcedure"
                                        SelectCommand="SELECT [expnd_internalId], [expnd_empId], [expnd_compId], [expnd_branchId], [expnd_activityId], [expnd_expenceType], [expnd_currencyType],expnd_dateExpenditure, convert(varchar(11),expnd_dateExpenditure,113) as expnd_dateExpenditure1, [expnd_TCity1], [expnd_TArea1],((select city_name from tbl_master_city where city_id=tbl_trans_SExpenditure.expnd_TCity1)+'-'+(select area_name from tbl_master_area where area_id=tbl_trans_SExpenditure.expnd_TArea1)) as Scity,((select city_name from tbl_master_city where city_id=tbl_trans_SExpenditure.expnd_TCity2)+'-'+isnull((select area_name from tbl_master_area where area_id=tbl_trans_SExpenditure.expnd_TArea2),' ')) as Fcity,[expnd_TCity2], [expnd_TArea2],[expnd_travExpence], [expnd_TravRefNo],[expnd_convenceMode],expnd_dtJourney,convert(varchar(11),expnd_dtJourney,113) as expnd_dtJourney1,expnd_dtRetJourney,convert(varchar(11),expnd_dtRetJourney,113) as expnd_dtRetJourney1, [CreateDate],[CreateUser], [LastModifyUser], [LastModifyDate] FROM [tbl_trans_SExpenditure] where expnd_expenceType='Convenyence' and expnd_empId=@expnd_empId"
                                        UpdateCommand="Expnd_SConvenyence_Update" UpdateCommandType="StoredProcedure">
                                        <DeleteParameters>
                                            <asp:Parameter Name="expnd_internalId" Type="Int32" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:SessionParameter Name="expnd_empId" Type="string" SessionField="SalesID" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="expnd_internalId" Type="Int32" />
                                            <asp:SessionParameter Name="expnd_empId" Type="string" SessionField="SalesID" />
                                            <asp:Parameter Name="expnd_compId" Type="String" />
                                            <asp:SessionParameter Name="expnd_branchId" Type="string" SessionField="userbranchID" />
                                            <asp:Parameter Name="expnd_activityId" Type="String" />
                                            <asp:Parameter Name="expnd_currencyType" Type="String" />
                                            <asp:Parameter Name="expnd_dateExpenditure" Type="datetime" />
                                            <asp:Parameter Name="expnd_TCity1" Type="int32" />
                                            <asp:Parameter Name="expnd_TArea1" Type="int32" />
                                            <asp:Parameter Name="expnd_TCity2" Type="int32" />
                                            <asp:Parameter Name="expnd_TArea2" Type="int32" />
                                            <asp:Parameter Name="expnd_travExpence" Type="Double" />
                                            <asp:Parameter Name="expnd_TravRefNo" Type="String" />
                                            <asp:Parameter Name="expnd_convenceMode" Type="String" />
                                            <asp:Parameter Name="expnd_dtJourney" Type="datetime" />
                                            <asp:Parameter Name="expnd_dtRetJourney" Type="datetime" />
                                            <asp:SessionParameter Name="LastModifyUser" Type="string" SessionField="userid" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:SessionParameter Name="expnd_empId" Type="string" SessionField="SalesID" />
                                            <%-- <asp:Parameter Name="expnd_compId" Type="String" />--%>
                                            <asp:SessionParameter Name="expnd_branchId" Type="string" SessionField="userbranchID" />
                                            <%--   <asp:Parameter Name="expnd_activityId" Type="String" />--%>
                                            <asp:Parameter Name="expnd_currencyType" Type="String" />
                                            <asp:Parameter Name="expnd_dateExpenditure" Type="datetime" />
                                            <asp:Parameter Name="expnd_TCity1" Type="int32" />
                                            <asp:Parameter Name="expnd_TArea1" Type="int32" />
                                            <asp:Parameter Name="expnd_TCity2" Type="int32" />
                                            <asp:Parameter Name="expnd_TArea2" Type="int32" />
                                            <asp:Parameter Name="expnd_travExpence" Type="Double" />
                                            <asp:Parameter Name="expnd_TravRefNo" Type="String" />
                                            <asp:Parameter Name="expnd_convenceMode" Type="String" />
                                            <asp:Parameter Name="expnd_dtJourney" Type="datetime" />
                                            <asp:Parameter Name="expnd_dtRetJourney" Type="datetime" />
                                            <asp:SessionParameter Name="CreateUser" Type="string" SessionField="userid" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="CitySelect" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                        SelectCommand="SELECT [city_id], [city_name] FROM [tbl_master_city]"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="areaSelect" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                        SelectCommand="SELECT [area_id], [area_name] FROM [tbl_master_area] where city_id=@cityid">
                                        <SelectParameters>
                                            <asp:Parameter Name="cityid" Type="string" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="CitySelect1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                        SelectCommand="SELECT [city_id], [city_name] FROM [tbl_master_city]"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="areaSelect1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                        SelectCommand="SELECT [area_id], [area_name] FROM [tbl_master_area] where city_id=@cityid">
                                        <SelectParameters>
                                            <asp:Parameter Name="cityid" Type="string" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlCurrency" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                        SelectCommand="SELECT [curr_id], [curr_symbol] FROM [tbl_currency]"></asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
