<%@ page language="C#" autoeventwireup="true" inherits="management_AssetDetail, App_Web_yr9d06qo" title="Untitled Page" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<%--MasterPageFile="~/MasterPage.master"--%>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Src="Headermain.ascx" TagName="Headermain" TagPrefix="uc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js" ></script>
    
    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />
    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>
    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />
    <script type="text/javascript" src="../modalfiles/modal.js"></script>

    <script type="text/javascript">
    function CallList(obj,obj1,obj2)
    {
        ajax_showOptions(obj,obj1,obj2);
    }
    FieldName='cmbSegment'; 
     
     
     
     function ShowHideFilter(obj)
     {
       grid.PerformCallback(obj);
     }
       
   </script>
   <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	/* Never change this one */
		width:50px;	/* Width of box */
		height:auto;	/* Height of box */
		overflow:auto;	/* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:32767;
	}
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and .optionDivSelected */
		margin:1px;		
		padding:1px;
		cursor:pointer;
		font-size:0.9em;
	}
	#ajax_listOfOptions .optionDiv{	/* Div for each item in list */
		
	}
	#ajax_listOfOptions .optionDivSelected{ /* Selected item in the list */
		background-color:#DDECFE;
		color:Blue;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:3000;
	}
	
	form{
		display:inline;
	}
	
	</style>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
               <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td  style="text-align: left; vertical-align: top;">
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
                                <td style="text-align: right; vertical-align: top; height: 37px;">
                                    <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                        Font-Bold="False" ForeColor="White" ValueType="System.Int32" Width="130px">
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
                    <td style="height: 181px">
                        <dxwgv:ASPxGridView ID="AssetDetailGrid" runat="server" AutoGenerateColumns="False"
                            DataSourceID="AssetDetaildata" KeyFieldName="AssetDetail_ID" ClientInstanceName="grid"
                             
                            Width="100%" Font-Size="10px"
                            OnHtmlEditFormCreated="AssetDetailGrid_HtmlEditFormCreated" OnHtmlRowCreated="AssetDetailGrid_HtmlRowCreated"
                            OnRowInserting="AssetDetailGrid_RowInserting" OnRowUpdating="AssetDetailGrid_RowUpdating"
                            OnRowValidating="AssetDetailGrid_RowValidating" OnStartRowEditing="AssetDetailGrid_StartRowEditing" OnCustomCallback="AssetDetailGrid_CustomCallback">
                           
                            <Templates>
                                <EditForm>
                                    <table style="width: 100%; background-color: #ffdead;" border="0" id="main">
           
                                        <tr>
                                        
                                             <td style="text-align: left; width: 30%">
                                                <span class="Ecoheadtxt" style="text-align: left;color: Black">Company :</span>
                                            </td>
                                            <td>
                                            <dxe:ASPxComboBox ID="cmbCompany" ClientInstanceName="combCompany"  Enabled="false" EnableIncrementalFiltering="True"
                                                    DataSourceID="Company" TextField="CompanyName" ValueField="ID" Value='<%#Bind("AssetDetail_CompanyID") %>'
                                                    runat="server" ValueType="System.String" 
                                                     SelectedIndex="0" 
                                                    Width="285px" TabIndex="1">
                                                    <ButtonStyle Width="13px">
                                                    </ButtonStyle>
                                                </dxe:ASPxComboBox>
                                            </td>

                                            
                                            <td class="Ecoheadtxt" style="text-align:left; width: 30%">
                                                <span style="text-align: left;color: Black">Vendor :</span>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:TextBox ID="txtVendor" CssClass="EcoheadCon" Text='<%#Bind("AssetDetail_Vendor") %>'
                                                    runat="server" Width="279px" Height="17px" TabIndex="10"></asp:TextBox>
                                                <%--<asp:TextBox ID="txtVendor_hidden" runat="server" Visible="true" ></asp:TextBox>--%>
                                                <%--<asp:HiddenField ID="HiddenField1" runat="server" />--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left; width: 30%">
                                                <span class="Ecoheadtxt" style="text-align: left;color: Black">Asset Category :</span>
                                            </td>
                                            <td style="text-align: left">
                                                <%--<asp:TextBox ID="txtDPName" CssClass="EcoheadCon" Text='<%#Bind("DP") %>' runat="server" Width="279px"></asp:TextBox>--%>
                                                <dxe:ASPxComboBox ID="cmbAssetCategory" ClientInstanceName="combAssetCategory"  EnableIncrementalFiltering="True"
                                                    EnableSynchronization="False" ValueType="System.String" Value='<%#Bind("AssetDetail_Category") %>'
                                                    runat="server"  
                                                     Width="285px" TabIndex="2">
                                                    <Items>
                                                        <dxe:ListEditItem Text="Movable" Value="M" />
                                                        <dxe:ListEditItem Text="Immovable" Value="I" />
                                                        <dxe:ListEditItem Text="Work-In-Progress" Value="W" />
                                                    </Items>
                                                    <ButtonStyle Width="13px">
                                                    </ButtonStyle>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td  class="Ecoheadtxt" style="text-align: left; width: 50%">
                                                <span style="text-align: left;color: Black">Service Provider :</span>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:TextBox ID="txtServiceProvider" CssClass="EcoheadCon" Text='<%#Bind("AssetDetail_ServiceProvider") %>'
                                                    runat="server" Width="279px" Height="17px" TabIndex="11"></asp:TextBox>
                                                <%--<asp:TextBox ID="txtServiceProvider_hidden" runat="server" Visible="true" ></asp:TextBox>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left; width: 30%">
                                                <span class="Ecoheadtxt" style="text-align: left;color: Black">Financial Year :</span>
                                            </td>
                                            <td style="text-align: left">
                                                <%--<asp:TextBox ID="txtClientID" CssClass="EcoheadCon" Text='<%#Bind("ClientId") %>' runat="server" Width="279px"></asp:TextBox>--%>
                                                <dxe:ASPxComboBox ID="cmbFinYear" EnableIncrementalFiltering="True" EnableSynchronization="False"
                                                    DataSourceID="FinYear" TextField="FinancialYear" ValueField="FinancialYear" Value='<%#Bind("AssetDetail_FinYear") %>'
                                                    runat="server" ValueType="System.String" 
                                                     SelectedIndex="0" 
                                                    Width="285px" TabIndex="3">
                                                    <ButtonStyle Width="13px">
                                                    </ButtonStyle>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 50%">
                                                <span  style="text-align: left;color: Black">AMC Expiry :</span>
                                            </td>
                                            <td style="text-align: left">
                                                <dxe:ASPxDateEdit ID="dtpExpiryDate" runat="server" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy"
                                                    EditFormat="Custom" Value='<%#Bind("AssetDetail_AMCExpiryDate") %>' Width="203px"
                                                     
                                                     TabIndex="12">
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 50%">
                                                <span class="Ecoheadtxt" style="text-align: left;color: Black">Date Of Purchase :</span>
                                            </td>
                                            <td style="text-align: left">
                                                <dxe:ASPxDateEdit ID="dtpPurchaseDate" runat="server" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy"
                                                    EditFormat="Custom" Value='<%#Bind("AssetDetail_PurchaseDate") %>' Width="203px"
                                                     
                                                     TabIndex="4">
                                                </dxe:ASPxDateEdit>
                                                
                                            </td>
                                            <td style="text-align: left; width: 30%">
                                                <span class="Ecoheadtxt" style="text-align: left;color: Black">Insurer :</span>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:TextBox ID="txtInsurer" CssClass="EcoheadCon" Text='<%#Bind("AssetDetail_Insurer") %>'
                                                    runat="server" Width="279px" Height="17px" TabIndex="13"></asp:TextBox>
                                             </td>
                                        </tr>
                                        <tr id="TrCostPrice">
                                            <td style="text-align: left; width: 30%">
                                                <span class="Ecoheadtxt" style="text-align: left;color: Black">Cost Price :</span>
                                            </td>
                                            <td style="text-align: left">
                                                <%--<asp:TextBox ID="txtCostPrice" CssClass="EcoheadCon" Text='<%#Bind("AssetDetail_CostPrice") %>' runat="server" Width="279px" Height="17px"></asp:TextBox>--%>
                                                <dxe:ASPxTextBox ID="txtCostPrice" ClientInstanceName="txtCostPrice" runat="server"
                                                    Text='<%#Bind("AssetDetail_CostPrice") %>' Width="279px" TabIndex="5">
                                                    <MaskSettings Mask="<0..999999999999999999999999999999g>.<00..99>" ErrorText="None"
                                                        IncludeLiterals="DecimalSymbol" />
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td style="text-align: left; width: 30%">
                                                <span class="Ecoheadtxt" style="text-align: left;color: Black">Policy Expiry :</span>
                                            </td>
                                            <td style="text-align: left">
                                                <dxe:ASPxDateEdit Width="203px" ID="dtpPolicyExpiry" runat="server" 
                                                     EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                                    Value='<%#Bind("AssetDetail_PolicyExpiryDate") %>' 
                                                    UseMaskBehavior="True" TabIndex="14">
                                                    <ButtonStyle Width="13px">
                                                    </ButtonStyle>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr id="TrAddition">
                                            <td style="text-align: left; width: 30%">
                                                <span class="Ecoheadtxt" style="text-align: left;color: Black">Additions :</span>
                                            </td>
                                            <td style="text-align: left">
                                                <%--<td style="color:Blue">--%>
                                                <%--<span style="font-size: 7.5pt">Rs.</span>--%>
                                                <%-- <asp:TextBox ID="txtAddition" CssClass="EcoheadCon" Text='<%#Bind("AssetDetail_Additions") %>' runat="server" Width="279px" Height="17px"></asp:TextBox>--%>
                                                <dxe:ASPxTextBox ID="txtAddition" ClientInstanceName="txtCostPrice" runat="server"
                                                    Text='<%#Bind("AssetDetail_Additions") %>' Width="279px" TabIndex="6">
                                                    <MaskSettings Mask="<0..999999999999999999999999999999g>.<00..99>" ErrorText="None"
                                                        IncludeLiterals="DecimalSymbol" />
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td style="text-align: left; width: 30%">
                                                <span class="Ecoheadtxt" style="text-align: left;color: Black">Premium Due :</span>
                                            </td>
                                            <td style="text-align: left">
                                                <dxe:ASPxDateEdit ID="dtpPremiumDue" runat="server" UseMaskBehavior="True" EditFormat="Custom"
                                                    EditFormatString="dd-MM-yyyy" Width="203px" Value='<%#Bind("AssetDetail_PremiumDueDate") %>'
                                                     
                                                     TabIndex="15">
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr id="TrDisposals">
                                            <td style="text-align: left; width: 30%">
                                                <span class="Ecoheadtxt" style="text-align: left;color: Black">Disposals :</span>
                                            </td>
                                            <td style="text-align: left">
                                                <%--<asp:TextBox ID="txtDisposals" CssClass="EcoheadCon" Text='<%#Bind("AssetDetail_Disposals") %>' runat="server" Width="279px" Height="17px"></asp:TextBox>--%>
                                                <dxe:ASPxTextBox ID="txtDisposals" ClientInstanceName="txtDisposals" runat="server"
                                                    Text='<%#Bind("AssetDetail_Disposals") %>' Width="279px" TabIndex="7">
                                                    <MaskSettings Mask="<0..999999999999999999999999999999g>.<00..99>" ErrorText="None"
                                                        IncludeLiterals="DecimalSymbol" />
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td style="text-align: left; width: 30%">
                                                <span class="Ecoheadtxt" style="text-align: left;color: Black">Location :</span>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:TextBox ID="txtLocation" CssClass="EcoheadCon" runat="server" Width="279px"
                                                    Height="17px" TabIndex="16"></asp:TextBox>
                                                <%--<asp:TextBox ID="txtLocation_hidden" runat="server" Visible="true" ></asp:TextBox>--%>
                                                <%--Text='<%#Bind("AssetDetail_Location") %>'--%>
                                            </td>
                                        </tr>
                                        <tr id="TrDepreciation">
                                            <td style="text-align: left; width: 30%">
                                                <span class="Ecoheadtxt" style="text-align: left;color: Black">Depreciation :</span>
                                            </td>
                                            <td style="text-align: left">
                                                <%--<asp:TextBox ID="txtDepreciation" CssClass="EcoheadCon" Text='<%#Bind("AssetDetail_Depreciation") %>' runat="server" Width="279px" Height="17px"></asp:TextBox>--%>
                                                <dxe:ASPxTextBox ID="txtDepreciation" ClientInstanceName="txtDepreciation" runat="server"
                                                    Text='<%#Bind("AssetDetail_Depreciation") %>' Width="279px" TabIndex="8">
                                                    <MaskSettings Mask="<0..999999999999999999999999999999g>.<00..99>" ErrorText="None"
                                                        IncludeLiterals="DecimalSymbol" />
                                                </dxe:ASPxTextBox>
                                            </td>
                                            
                                            <td class="Ecoheadtxt" style="text-align: left; width: 50%">
                                                <span class="Ecoheadtxt" style="text-align: left;color: Black">Brought Forward :</span>
                                            </td>
                                            <td style="text-align:left">
                                                <dxe:ASPxTextBox ID="txtBroughtForward" ClientInstanceName="txtBroughtForward" runat="server"
                                                    Text='<%#Bind("AssetDetail_BroughtForward") %>' Width="279px" TabIndex="17">
                                                    <MaskSettings Mask="<0..999999999999999999999999999999g>.<00..99>" ErrorText="None"
                                                        IncludeLiterals="DecimalSymbol" />
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr id="TrUsedBy">
                                        
                                            <td style="text-align: left; width: 30%">
                                                <span class="Ecoheadtxt" style="text-align: left;color: Black">DepreciationIT :</span>
                                            </td>
                                            <td style="text-align: left">
                                                <dxe:ASPxTextBox ID="txtDepreciationIT" ClientInstanceName="txtDepreciationIT" runat="server"
                                                    Text='<%#Bind("AssetDetail_DepreciationIT") %>' Width="279px" TabIndex="9">
                                                    <MaskSettings Mask="<0..999999999999999999999999999999g>.<00..99>" ErrorText="None"
                                                        IncludeLiterals="DecimalSymbol" />
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td style="text-align: left; width: 30%">
                                                <span class="Ecoheadtxt" style="text-align: left;color: Black">UsedBy :</span>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:TextBox ID="txtUsedBy" CssClass="EcoheadCon" runat="server" Width="279px" Height="17px"
                                                    TabIndex="18"></asp:TextBox>
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align: center">
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
                                        <tr>
                                            <td style="display: none">
                                                <asp:TextBox ID="txtVendor_hidden" runat="server"></asp:TextBox>
                                                <asp:TextBox ID="txtServiceProvider_hidden" runat="server"></asp:TextBox>
                                                <asp:TextBox ID="txtInsurer_hidden" runat="server"></asp:TextBox>
                                                <asp:TextBox ID="txtLocation_hidden" runat="server"></asp:TextBox>
                                                <asp:TextBox ID="txtUsedBy_hidden" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </EditForm>
                                <TitlePanel>
                                    <table style="width: 100%">
                                        <tr>
                                            <td align="right">
                                                <table width="200">
                                                    <tr>
                                                        <td>
                                                            <%-- <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data" Height="18px" Width="88px"   Font-Size="10px" AutoPostBack="False">
                                                           <clientsideevents click="function(s, e) {gridDp.AddNewRow();}" />
                                                        </dxe:ASPxButton>--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </TitlePanel>
                            </Templates>
                            <SettingsText PopupEditFormCaption="Add/Modify DP Details" ConfirmDelete="Are You Want To Delete This Record ???" />
                            <Styles  >
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <FocusedGroupRow CssClass="gridselectrow">
                                </FocusedGroupRow>
                                <FocusedRow CssClass="gridselectrow">
                                </FocusedRow>
                            </Styles>
                            <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                            <SettingsPager NumericButtonCount="20" PageSize="20">
                            </SettingsPager>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="AssetDetail ID" FieldName="AssetDetail_ID"
                                    Visible="False" VisibleIndex="0">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataComboBoxColumn Caption="Company Name" FieldName="AssetDetail_CompanyID"
                                    VisibleIndex="0" Visible="False">
                                    <PropertiesComboBox DataSourceID="Company" EnableIncrementalFiltering="True" TextField="CompanyName"
                                        ValueField="ID" ValueType="System.String">
                                    </PropertiesComboBox>
                                    <Settings FilterMode="DisplayText" />
                                    <EditFormSettings Visible="False" VisibleIndex="5" />
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataComboBoxColumn>
                                <dxwgv:GridViewDataComboBoxColumn Caption="Asset Category" FieldName="AssetDetail_Category"
                                    VisibleIndex="0" Visible="False">
                                    <PropertiesComboBox DataSourceID="AssetDetaildata" TextField="AssetDetail_Category"
                                        ValueField="AssetDetail_Category" ValueType="System.String">
                                        <Items>
                                            <dxe:ListEditItem Text="Movable" Value="M">
                                            </dxe:ListEditItem>
                                            <dxe:ListEditItem Text="Immovable" Value="I">
                                            </dxe:ListEditItem>
                                            <dxe:ListEditItem Text="Work-In-Progress" Value="W">
                                            </dxe:ListEditItem>
                                        </Items>
                                    </PropertiesComboBox>
                                </dxwgv:GridViewDataComboBoxColumn>
                                <dxwgv:GridViewDataTextColumn Caption="MainAccountCode" FieldName="AssetDetail_MainAccountCode"
                                    UnboundType="String" Visible="False">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="SubAccountCode" FieldName="AssetDetail_SubAccountCode"
                                    UnboundType="String" Visible="False">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataComboBoxColumn Caption="Financial Year" FieldName="AssetDetail_FinYear"
                                    VisibleIndex="0">
                                    <PropertiesComboBox DataSourceID="FinYear" TextField="FinancialYear" ValueField="ID"
                                        ValueType="System.String">
                                    </PropertiesComboBox>
                                    <Settings FilterMode="DisplayText" />
                                    <EditFormSettings Visible="False" VisibleIndex="6" />
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataComboBoxColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Brought Forward" FieldName="AssetDetail_BroughtForward"
                                    UnboundType="Decimal" VisibleIndex="1">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <PropertiesTextEdit DisplayFormatString="{0:N2}" Width="90px">
                                        <MaskSettings Mask="0,00,000..9,99,999" />
                                    </PropertiesTextEdit>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataDateColumn Caption="Date Of Purchase" FieldName="AssetDetail_PurchaseDate"
                                    UnboundType="DateTime" VisibleIndex="1" Visible="False">
                                    <PropertiesDateEdit DateOnError="Today" DisplayFormatString="dd MMMM yyyy" EditFormatString="dd-MM-yyyy"
                                        UseMaskBehavior="True">
                                    </PropertiesDateEdit>
                                </dxwgv:GridViewDataDateColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Cost Price" FieldName="AssetDetail_CostPrice"
                                    UnboundType="Decimal" VisibleIndex="2">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <PropertiesTextEdit DisplayFormatString="{0:N2}" Width="90px">
                                        <MaskSettings Mask="0,00,000..9,99,999" />
                                    </PropertiesTextEdit>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Addition" FieldName="AssetDetail_Additions"
                                    UnboundType="Decimal" VisibleIndex="3">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <PropertiesTextEdit DisplayFormatString="{0:N2}" Width="90px">
                                        <MaskSettings Mask="0,00,000..9,99,999" />
                                    </PropertiesTextEdit>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Disposals" FieldName="AssetDetail_Disposals"
                                    UnboundType="Decimal" VisibleIndex="4">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <PropertiesTextEdit DisplayFormatString="{0:N2}" Width="90px">
                                        <MaskSettings Mask="0,00,000..9,99,999" />
                                    </PropertiesTextEdit>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Depreciation" FieldName="AssetDetail_Depreciation"
                                    UnboundType="Decimal" VisibleIndex="5">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <PropertiesTextEdit DisplayFormatString="{0:N2}" Width="90px">
                                        <MaskSettings Mask="0,00,000..9,99,999" />
                                    </PropertiesTextEdit>
                                    <EditFormSettings ColumnSpan="2" Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Net Value" FieldName="NetValue" VisibleIndex="6">
                                <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <PropertiesTextEdit DisplayFormatString="{0:N2}" Width="90px">
                                        <MaskSettings Mask="0,00,000..9,99,999" />
                                    </PropertiesTextEdit>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Vendor" FieldName="AssetDetail_Vendor" UnboundType="Decimal"
                                    VisibleIndex="4" Visible="False">
                                    <EditFormSettings ColumnSpan="2" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Service Provider" FieldName="AssetDetail_ServiceProvider"
                                    VisibleIndex="4" Visible="False">
                                    <EditFormSettings ColumnSpan="2" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataDateColumn Caption="AMC Expiry" FieldName="AssetDetail_AMCExpiryDate"
                                    UnboundType="DateTime" VisibleIndex="4" Visible="False">
                                    <PropertiesDateEdit DisplayFormatString="dd MMMM yyyy" UseMaskBehavior="True" DateOnError="Today"
                                        EditFormatString="dd-MM-yyyy">
                                    </PropertiesDateEdit>
                                    <EditFormSettings ColumnSpan="2" />
                                </dxwgv:GridViewDataDateColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Insurer" FieldName="AssetDetail_Insurer" VisibleIndex="4"
                                    Visible="False">
                                    <EditFormSettings ColumnSpan="2" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataDateColumn Caption="Policy Expiry" FieldName="AssetDetail_PolicyExpiryDate"
                                    VisibleIndex="4" Visible="False" UnboundType="DateTime">
                                    <PropertiesDateEdit DisplayFormatString="dd MMMM yyyy" EditFormatString="dd-MM-yyyy"
                                        DateOnError="Today" UseMaskBehavior="True">
                                    </PropertiesDateEdit>
                                    <EditFormSettings ColumnSpan="2" />
                                </dxwgv:GridViewDataDateColumn>
                                <dxwgv:GridViewDataDateColumn Caption="Premium Due" FieldName="AssetDetail_PremiumDueDate"
                                    VisibleIndex="4" Visible="False" UnboundType="DateTime">
                                    <PropertiesDateEdit DisplayFormatString="dd MMMM yyyy" DateOnError="Today" EditFormatString="dd-MM-yyyy"
                                        UseMaskBehavior="True">
                                    </PropertiesDateEdit>
                                    <EditFormSettings ColumnSpan="2" />
                                </dxwgv:GridViewDataDateColumn>
                                <dxwgv:GridViewCommandColumn VisibleIndex="7">
                                    <EditButton Visible="True">
                                    </EditButton>
                                    <DeleteButton Visible="True">
                                    </DeleteButton>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <%--<%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd"){ %>--%>
                                        <a href="javascript:void(0);" onclick="grid.AddNewRow()"><span style="color: #000099;
                                            text-decoration: underline">Add Detail</span> </a>
                                        <%--<%} %>--%>
                                    </HeaderTemplate>
                                </dxwgv:GridViewCommandColumn>
                            </Columns>
                            <SettingsEditing PopupEditFormHeight="400px" PopupEditFormHorizontalAlign="Center"
                                PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="500px" />
                        </dxwgv:ASPxGridView>
                        <%--SelectCommand="select AssetDetail_ID,AssetDetailCompany_ID,case ltrim(rtrim(dpd_accountType)) when ltrim(rtrim('Primary')) then ltrim(rtrim('Default')) else ltrim(rtrim(dpd_accountType)) end AS Category,dpd_dpCode AS DPName,dpd_ClientId AS ClientId, CASE dpd_POA WHEN 1 THEN 'Yes' ELSE 'No' END AS POA,dpd_POAName AS POAName,CreateUser,(select DP_Name+' ['+DP_DepositoryID+']' from Master_DP where DP_DepositoryID=replace(tbl_master_contactDPDetails.dpd_dpCode,char(160),'')) as DP from tbl_master_contactDPDetails where dpd_cntId=@CntId"--%>
                        <asp:SqlDataSource ID="AssetDetaildata" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="" 
                            InsertCommand="INSERT INTO Master_AssetDetail(AssetDetail_CompanyID, AssetDetail_FinYear,AssetDetail_MainAccountCode,AssetDetail_BroughtForward,AssetDetail_SubAccountCode,AssetDetail_PurchaseDate, AssetDetail_Category, AssetDetail_Vendor, AssetDetail_CostPrice, AssetDetail_Additions, AssetDetail_Disposals, AssetDetail_Depreciation,AssetDetail_DepreciationIT, AssetDetail_Location, AssetDetail_User, AssetDetail_Insurer, AssetDetail_Premium, AssetDetail_PolicyExpiryDate, AssetDetail_PremiumDueDate, AssetDetail_ServiceProvider, AssetDetail_AMCExpiryDate) VALUES (@AssetDetail_CompanyID,@AssetDetail_FinYear,@AssetDetail_MainAccountCode,@AssetDetail_BroughtForward,@AssetDetail_SubAccountCode,@AssetDetail_PurchaseDate,@AssetDetail_Category,@AssetDetail_Vendor,@AssetDetail_CostPrice,@AssetDetail_Additions,@AssetDetail_Disposals,@AssetDetail_Depreciation,@AssetDetail_DepreciationIT,@AssetDetail_Location,@AssetDetail_User,@AssetDetail_Insurer,@AssetDetail_Premium,@AssetDetail_PolicyExpiryDate,@AssetDetail_PremiumDueDate,@AssetDetail_ServiceProvider,@AssetDetail_AMCExpiryDate)"
                            UpdateCommand="UPDATE [Master_AssetDetail] SET AssetDetail_CompanyID=@AssetDetail_CompanyID,[AssetDetail_FinYear]=@AssetDetail_FinYear,[AssetDetail_MainAccountCode]=@AssetDetail_MainAccountCode,[AssetDetail_BroughtForward]=@AssetDetail_BroughtForward,[AssetDetail_Category]=@AssetDetail_Category,[AssetDetail_PurchaseDate]=@AssetDetail_PurchaseDate,[AssetDetail_Vendor]=@AssetDetail_Vendor,AssetDetail_CostPrice=@AssetDetail_CostPrice,[AssetDetail_Additions]=@AssetDetail_Additions,[AssetDetail_Disposals]=@AssetDetail_Disposals,[AssetDetail_Depreciation]=@AssetDetail_Depreciation,[AssetDetail_DepreciationIT]=@AssetDetail_DepreciationIT,[AssetDetail_Location]=@AssetDetail_Location,[AssetDetail_User]=@AssetDetail_User,[AssetDetail_Insurer]=@AssetDetail_Insurer,[AssetDetail_Premium]=@AssetDetail_Premium,[AssetDetail_PolicyExpiryDate]=@AssetDetail_PolicyExpiryDate,[AssetDetail_PremiumDueDate]=@AssetDetail_PremiumDueDate,[AssetDetail_ServiceProvider]=@AssetDetail_ServiceProvider,[AssetDetail_AMCExpiryDate]=@AssetDetail_AMCExpiryDate where AssetDetail_ID=@AssetDetail_ID"
                            DeleteCommand="DELETE FROM [Master_AssetDetail] WHERE AssetDetail_ID=@AssetDetail_ID">
                            <InsertParameters>
                                <asp:Parameter Name="AssetDetail_CompanyID" Type="string" />
                                <asp:Parameter Name="AssetDetail_FinYear" Type="string"/>
                                <asp:Parameter Name="AssetDetail_MainAccountCode" Type="string" />
                                <asp:Parameter Name="AssetDetail_BroughtForward" Type="string" />
                                <%--<asp:Parameter Name="AssetDetail_SubAccountCode" Type="string" />--%>
                                <asp:SessionParameter SessionField="KeyVal" Type="string" Name="AssetDetail_SubAccountCode" />
                                <asp:Parameter Name="AssetDetail_PurchaseDate" Type="datetime" />
                                <asp:Parameter Name="AssetDetail_Category" Type="string" />
                                <asp:Parameter Name="AssetDetail_Vendor" Type="string" />
                                <asp:Parameter Name="AssetDetail_CostPrice" Type="Decimal"/>
                                <asp:Parameter Name="AssetDetail_Additions" Type="Decimal" />
                                <asp:Parameter Name="AssetDetail_Disposals" Type="Decimal"/>
                                <asp:Parameter Name="AssetDetail_Depreciation" Type="Decimal"/>
                                <asp:Parameter Name="AssetDetail_DepreciationIT" Type="Decimal"/>
                                <asp:Parameter Name="AssetDetail_Location" Type="Int32" />
                                <asp:Parameter Name="AssetDetail_User" Type="String" />
                                <asp:Parameter Name="AssetDetail_Insurer" Type="string" />
                                <asp:Parameter Name="AssetDetail_Premium" Type="Decimal" />
                                <asp:Parameter Name="AssetDetail_PolicyExpiryDate" Type="datetime"/>
                                <asp:Parameter Name="AssetDetail_PremiumDueDate" Type="datetime" />
                                <asp:Parameter Name="AssetDetail_ServiceProvider" Type="string" />
                                <asp:Parameter Name="AssetDetail_AMCExpiryDate" Type="datetime"/>
                            </InsertParameters>
                            <UpdateParameters>
                                <%--asp:Parameter Name="AssetDetail_ID" Type="Int32" />--%>
                                <asp:Parameter Name="AssetDetail_CompanyID" Type="String"/>
                                <asp:Parameter Name="AssetDetail_FinYear"/>
                                <asp:Parameter Name="AssetDetail_MainAccountCode"/>
                                <asp:Parameter Name="AssetDetail_BroughtForward" Type="string" />
                                <asp:Parameter Name="AssetDetail_SubAccountCode"/>
                                <asp:Parameter Name="AssetDetail_Category"/>
                                <asp:Parameter Name="AssetDetail_PurchaseDate"/>
                                <asp:Parameter Name="AssetDetail_Vendor"/>
                                <asp:Parameter Name="AssetDetail_CostPrice" Type="Decimal"/>
                                <asp:Parameter Name="AssetDetail_Additions"/>
                                <asp:Parameter Name="AssetDetail_Disposals"/>
                                <asp:Parameter Name="AssetDetail_Depreciation"/>
                                <asp:Parameter Name="AssetDetail_DepreciationIT" Type="Decimal"/>
                                <asp:Parameter Name="AssetDetail_Location" Type="Int32"/>
                                <asp:Parameter Name="AssetDetail_User" Type="String"/>
                                <asp:Parameter Name="AssetDetail_Insurer"/>
                                <asp:Parameter Name="AssetDetail_Premium"/>
                                <asp:Parameter Name="AssetDetail_PolicyExpiryDate"/>
                                <asp:Parameter Name="AssetDetail_PremiumDueDate"/>
                                <asp:Parameter Name="AssetDetail_ServiceProvider"/>
                                <asp:Parameter Name="AssetDetail_AMCExpiryDate"/>
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="Company" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="Select cmp_Name as CompanyName,cmp_internalid as ID from tbl_master_company Order By cmp_Name">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="FinYear" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="Select FinYear_ID as ID,FinYear_Code as FinancialYear from Master_FinYear Order By FinYear_Code Desc">
                        </asp:SqlDataSource>
                       <asp:HiddenField ID="hdnMainAccountCode" runat="server"></asp:HiddenField>
                       <asp:HiddenField ID="hdnSubAccountCode" runat="server"></asp:HiddenField>
                    </td>
                </tr>
            </table>
         </div>
    </form>
</body>
</html>
