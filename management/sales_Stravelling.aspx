<%@ page language="C#" autoeventwireup="true" inherits="management_sales_Stravelling, App_Web_snhbal_j" %>

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
<head id="Head1" runat="server">
    <title>Untitled Page</title>

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
        document.location.href="sales_Sconveyence.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        //document.location.href="sales_Stravelling.aspx"; 
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
        grid.GetEditor("expnd_TTravArea1").PerformCallback(cmbState.GetValue().toString());
    }
    function OnCityChanged1(cmbState1) 
    {
        grid.GetEditor("expnd_TTravArea2").PerformCallback(cmbState1.GetValue().toString());
    }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="2" ClientInstanceName="page"
                            Font-Size="10px">
                            <TabPages>
                                <dxtc:TabPage Text="Total Expenses" Name="Total">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Text="Conveyence" Name="Conveyence">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Travelling" Text="Travelling">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <dxwgv:ASPxGridView ID="GridConveyence" runat="server" KeyFieldName="expnd_internalId"
                                                ClientInstanceName="grid" DataSourceID="SqlConveyence" Width="100%" AutoGenerateColumns="False"
                                                OnCellEditorInitialize="GridConveyence_CellEditorInitialize" OnInitNewRow="GridConveyence_InitNewRow">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn FieldName="expnd_internalId" VisibleIndex="0" Visible="False">
                                                        <EditFormSettings Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="expnd_empId" VisibleIndex="0" Visible="False">
                                                        <EditFormSettings Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="expnd_compId" VisibleIndex="1" Visible="False">
                                                        <EditFormSettings Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="expnd_branchId" VisibleIndex="2" Visible="False">
                                                        <EditFormSettings Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="expnd_activityId" VisibleIndex="3" Visible="False">
                                                        <EditFormSettings Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="expnd_expenceType" Caption="Expense Type"
                                                        VisibleIndex="4" Visible="False">
                                                        <EditFormSettings Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn Caption="Currency Type" FieldName="expnd_currencyType"
                                                        Visible="False" VisibleIndex="5">
                                                        <PropertiesComboBox DataSourceID="SqlCurrency" ValueField="curr_id" TextField="curr_symbol"
                                                            ValueType="System.String">
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True" VisibleIndex="0" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormCaptionStyle Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn Caption="Mode" FieldName="expnd_convenceTravMode"
                                                        VisibleIndex="0">
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
                                                                <dxe:ListEditItem Text="Train � Long distance " Value="Train � Long distance">
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
                                                            <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                                                <RequiredField ErrorText="Required" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True" VisibleIndex="0" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormCaptionStyle Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Scity" Caption="From" VisibleIndex="2">
                                                        <EditFormSettings Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Fcity" Caption="To" VisibleIndex="3">
                                                        <EditFormSettings Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataDateColumn Caption="Date" FieldName="expnd_dateTravExpenditure"
                                                        VisibleIndex="1">
                                                        <PropertiesDateEdit DisplayFormatString="{0:dd MM yyyy}" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                                            UseMaskBehavior="true">
                                                        </PropertiesDateEdit>
                                                        <EditFormSettings Caption="Expenditure Date" Visible="True" VisibleIndex="0" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormCaptionStyle Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataDateColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn Caption="From City" FieldName="expnd_TTravCity1"
                                                        Visible="False" VisibleIndex="2">
                                                        <PropertiesComboBox DataSourceID="CitySelect" ValueField="city_id" TextField="city_name"
                                                            EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String">
                                                            <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCityChanged(s); }"></ClientSideEvents>
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Caption="From City" Visible="True" VisibleIndex="1" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormCaptionStyle Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn Caption="From Area" Visible="False" FieldName="expnd_TTravArea1"
                                                        VisibleIndex="3">
                                                        <PropertiesComboBox DataSourceID="areaSelect" ValueField="area_id" TextField="area_name"
                                                            ValueType="System.String">
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Caption="From Area" Visible="True" VisibleIndex="2" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormCaptionStyle Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn Caption="To City" FieldName="expnd_TTravCity2"
                                                        Visible="False" VisibleIndex="4">
                                                        <PropertiesComboBox DataSourceID="CitySelect1" ValueField="city_id" TextField="city_name"
                                                            EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String">
                                                            <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCityChanged1(s); }"></ClientSideEvents>
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Caption="To City" Visible="True" VisibleIndex="3" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormCaptionStyle Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn Caption="To Area" FieldName="expnd_TTravArea2"
                                                        Visible="False" VisibleIndex="5">
                                                        <PropertiesComboBox DataSourceID="areaSelect1" ValueField="area_id" TextField="area_name"
                                                            ValueType="System.String">
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Caption="To Area" Visible="True" VisibleIndex="4" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormCaptionStyle Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="expnd_travTravExpence" Caption="Amount"
                                                        VisibleIndex="6">
                                                        <EditFormSettings Visible="True" Caption="Conveyence Expenses" VisibleIndex="5" />
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
                                                    <dxwgv:GridViewDataTextColumn FieldName="expnd_TravTravRefNo" Caption="Reference No"
                                                        VisibleIndex="7">
                                                        <EditFormSettings Visible="True" Caption="Reference No" VisibleIndex="6" />
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
                                                    
                                                    <dxwgv:GridViewDataDateColumn Caption="Start Journing" FieldName="expnd_dtTravJourney"
                                                        VisibleIndex="1">
                                                        <PropertiesDateEdit DisplayFormatString="{0:dd MM yyyy}" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                                            UseMaskBehavior="true">
                                                        </PropertiesDateEdit>
                                                        <EditFormSettings Caption="Travelling Date" Visible="True" VisibleIndex="0" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormCaptionStyle Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataDateColumn>
                                                    <dxwgv:GridViewDataDateColumn Caption="Return Date" FieldName="expnd_dtTravRetJourney"
                                                        Visible="False">
                                                        <PropertiesDateEdit DisplayFormatString="{0:dd MM yyyy}" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                                            UseMaskBehavior="true">
                                                        </PropertiesDateEdit>
                                                        <EditFormSettings Caption="Return Date" Visible="True" VisibleIndex="0" />
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
                                                <Settings ShowFooter="True" ShowStatusBar="hidden" ShowTitlePanel="True" />
                                                <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="350px" PopupEditFormHorizontalAlign="Center"
                                                    PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="700px"
                                                    EditFormColumnCount="1" />
                                                <Styles>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                    </Header>
                                                </Styles>
                                                <SettingsText PopupEditFormCaption="Add/Modify Travelling" ConfirmDelete="Are You Want To Delete This Record ???" />
                                                <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                                </SettingsPager>
                                                <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
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
                            </TabPages>
                            <ClientSideEvents ActiveTabChanged="function(s, e) {
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
	                                            }"></ClientSideEvents>
                            <ContentStyle>
                                <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                            </ContentStyle>
                            <LoadingPanelStyle ImageSpacing="6px">
                            </LoadingPanelStyle>
                        </dxtc:ASPxPageControl>
                    </td>
                </tr>
                <tr>
                    <td style="height: 8px">
                        <table style="width: 100%;">
                            <tr>
                                <td align="right" style="width: 843px">
                                    <asp:SqlDataSource ID="SqlConveyence" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                        DeleteCommand="DELETE FROM [tbl_trans_SExpenditure] WHERE [expnd_internalId] = @expnd_internalId"
                                        InsertCommand="Expnd_STravelling_Insert" InsertCommandType="StoredProcedure"
                                        SelectCommand="SELECT [expnd_internalId], [expnd_empId], [expnd_compId], [expnd_branchId], [expnd_activityId],  [expnd_currencyType],expnd_dateTravExpenditure, convert(varchar(11),expnd_dateTravExpenditure,113) as expnd_dateTravExpenditure1, expnd_TTravCity1, expnd_TTravArea1,((select city_name from tbl_master_city where city_id=tbl_trans_SExpenditure.expnd_TTravCity1)+'-'+(select area_name from tbl_master_area where area_id=tbl_trans_SExpenditure.expnd_TTravArea1)) as Scity,((select city_name from tbl_master_city where city_id=tbl_trans_SExpenditure.expnd_TTravCity2)+'-'+(select area_name from tbl_master_area where area_id=tbl_trans_SExpenditure.expnd_TTravArea2)) as Fcity,expnd_TTravCity2, expnd_TTravArea2,expnd_travTravExpence, expnd_TravTravRefNo,expnd_convenceTravMode,expnd_dtTravJourney,convert(varchar(11),expnd_dtTravJourney,113) as expnd_dtTravJourney1,expnd_dtTravRetJourney,convert(varchar(11),expnd_dtTravRetJourney,113) as expnd_dtTravRetJourney1, [CreateDate],[CreateUser], [LastModifyUser], [LastModifyDate] FROM [tbl_trans_SExpenditure] where expnd_expenceType='Trav' and expnd_empId=@expnd_empId"
                                        UpdateCommand="Expnd_STravelling_Update" UpdateCommandType="StoredProcedure">
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
                                            <asp:Parameter Name="expnd_dateTravExpenditure" Type="datetime" />
                                            <asp:Parameter Name="expnd_TTravCity1" Type="int32" />
                                            <asp:Parameter Name="expnd_TTravArea1" Type="int32" />
                                            <asp:Parameter Name="expnd_TTravCity2" Type="int32" />
                                            <asp:Parameter Name="expnd_TTravArea2" Type="int32" />
                                            <asp:Parameter Name="expnd_travTravExpence" Type="Double" />
                                            <asp:Parameter Name="expnd_TravTravRefNo" Type="String" />
                                            <asp:Parameter Name="expnd_convenceTravMode" Type="String" />
                                            <asp:Parameter Name="expnd_dtTravJourney" Type="datetime" />
                                            <asp:Parameter Name="expnd_dtTravRetJourney" Type="datetime" />
                                            <asp:SessionParameter Name="LastModifyUser" Type="string" SessionField="userid" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:SessionParameter Name="expnd_empId" Type="string" SessionField="SalesID" />
                                            <%-- <asp:Parameter Name="expnd_compId" Type="String" />--%>
                                            <asp:SessionParameter Name="expnd_branchId" Type="string" SessionField="userbranchID" />
                                            <%--   <asp:Parameter Name="expnd_activityId" Type="String" />--%>
                                            <asp:Parameter Name="expnd_currencyType" Type="String" />
                                            <asp:Parameter Name="expnd_dateTravExpenditure" Type="datetime" />
                                            <asp:Parameter Name="expnd_TTravCity1" Type="int32" />
                                            <asp:Parameter Name="expnd_TTravArea1" Type="int32" />
                                            <asp:Parameter Name="expnd_TTravCity2" Type="int32" />
                                            <asp:Parameter Name="expnd_TTravArea2" Type="int32" />
                                            <asp:Parameter Name="expnd_travTravExpence" Type="Double" />
                                            <asp:Parameter Name="expnd_TravTravRefNo" Type="String" />
                                            <asp:Parameter Name="expnd_convenceTravMode" Type="String" />
                                            <asp:Parameter Name="expnd_dtTravJourney" Type="datetime" />
                                            <asp:Parameter Name="expnd_dtTravRetJourney" Type="datetime" />
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
