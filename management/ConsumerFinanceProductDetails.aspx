<%@ page language="C#" autoeventwireup="true" inherits="management_ConsumerFinanceProductDetails, App_Web_d3reltht" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Consumer Finance Product Details</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
  function SignOff()
    {
    window.parent.SignOff()
    }
      function height()
        {
           
           if(document.body.scrollHeight>=550)
                {
                    window.frameElement.height = document.body.scrollHeight;
                }
           else
                {
                    window.frameElement.height = '550px';
                }
                window.frameElement.widht = document.body.scrollWidht;
           
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="GridConsumerFinance" runat="server" Width="100%" ClientInstanceName="grid"
                        AutoGenerateColumns="False" DataSourceID="SqlConsumerFinance" KeyFieldName="cf_pcode"
                        OnRowValidating="GridConsumerFinance_RowValidating" OnHtmlEditFormCreated="GridConsumerFinance_HtmlEditFormCreated"
                        OnHtmlRowCreated="GridConsumerFinance_HtmlRowCreated" OnCancelRowEditing="GridConsumerFinance_CancelRowEditing">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_pcode" ReadOnly="True" VisibleIndex="0"
                                Visible="False">
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Product Type" FieldName="cf_ptype" VisibleIndex="0">
                                <PropertiesComboBox EnableSynchronization="False" EnableIncrementalFiltering="True"
                                    ValueType="System.String">
                                    <Items>
                                        <dxe:ListEditItem Text="Housing Loan" Value="Housing Loan">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Loan Against Property" Value="Loan Against Property">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Personal Loan" Value="Personal Loan">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Travel Loan" Value="Travel Loan">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Business Loan" Value="Business Loan">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Auto Loan" Value="Auto Loan">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="SME Loan" Value="SME Loan">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Loan Against Securities" Value="Loan Against Securities">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Credit Cards" Value="Credit Cards">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Caption="Product Type" VisibleIndex="0" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_pname" VisibleIndex="1" Caption="Product Name">
                                <EditFormSettings Visible="True" VisibleIndex="1" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn FieldName="cf_conCode" VisibleIndex="2" Caption="Company name">
                                <PropertiesComboBox DataSourceID="SqlConsumer" ValueField="Id" TextField="Name" EnableSynchronization="False"
                                    EnableIncrementalFiltering="True" ValueType="System.String">
                                </PropertiesComboBox>
                                <EditFormSettings Caption="Consumer Finance Co. Code" Visible="True" VisibleIndex="2" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataMemoColumn Caption="Feature" FieldName="cf_proFeature" VisibleIndex="2"
                                Visible="False">
                                <EditFormSettings Caption="Feature" Visible="True" VisibleIndex="3" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataMemoColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Loan Currency" FieldName="cf_loanCurrency"
                                VisibleIndex="2" Visible="False">
                                <PropertiesComboBox DataSourceID="SqlCurrency" ValueField="curr_id" TextField="curr_name"
                                    EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String">
                                </PropertiesComboBox>
                                <EditFormSettings Caption="Loan Currency" Visible="True" VisibleIndex="4" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_appliMinAge_Sal" VisibleIndex="4" Visible="False">
                                <EditFormSettings Caption="Applicant's Min Age Eligibility(Salaried)" Visible="True"
                                    VisibleIndex="6" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                        <RegularExpression ErrorText="Invalid Age" ValidationExpression="[0-9]{2}" />
                                        <RequiredField ErrorText="Required" IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_appliMaxAge_Sal" VisibleIndex="4" Visible="False">
                                <EditFormSettings Caption="Applicant's Max Age Eligibility(Salaried)" Visible="True"
                                    VisibleIndex="7" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                        <RegularExpression ErrorText="Invalid Age" ValidationExpression="[0-9]{2}" />
                                        <RequiredField ErrorText="Required" IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_appliMinAge_Self" VisibleIndex="4" Visible="False">
                                <EditFormSettings Caption="Applicant's Min Age Eligibility(Self Employed)" Visible="True"
                                    VisibleIndex="8" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                        <RegularExpression ErrorText="Invalid Age" ValidationExpression="[0-9]{2}" />
                                        <RequiredField ErrorText="Required" IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_appliMaxAge_Self" VisibleIndex="4" Visible="False">
                                <EditFormSettings Caption="Applicant's Max Age Eligibility(Self Employed)" Visible="True"
                                    VisibleIndex="9" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                        <RegularExpression ErrorText="Invalid Age" ValidationExpression="[0-9]{2}" />
                                        <RequiredField ErrorText="Required" IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_annualIncome_Sal" VisibleIndex="4" Visible="False">
                                <EditFormSettings Caption="Annual Income(Salaried)" Visible="True" VisibleIndex="5" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                        <RegularExpression ErrorText="Invalid Amount" ValidationExpression="^(\d{0,13}\.\d{0,5}|\d{0,13})$" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_annualIncome_Self" VisibleIndex="4" Visible="False">
                                <EditFormSettings Caption="Annual Income(Self Employed)" Visible="True" VisibleIndex="10" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                        <RegularExpression ErrorText="Invalid Amount" ValidationExpression="^(\d{0,13}\.\d{0,5}|\d{0,13})$" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_MinloanAmount" VisibleIndex="3" Caption="Minimun Loan Amount">
                                <EditFormSettings Caption="Minimum Loan Amount" Visible="True" VisibleIndex="11" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                        <RegularExpression ErrorText="Invalid Amount" ValidationExpression="^(\d{0,13}\.\d{0,5}|\d{0,13})$" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_MaxLoanAmount" VisibleIndex="4" Caption="Maximum Loan Amount">
                                <EditFormSettings Caption="Maximun Loan Amount" Visible="True" VisibleIndex="12" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                        <RegularExpression ErrorText="Invalid Amount" ValidationExpression="^(\d{0,13}\.\d{0,5}|\d{0,13})$" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_Minloantenuare" VisibleIndex="4" Visible="False">
                                <EditFormSettings Caption="Minimum Loan Tenure(Years)" Visible="True" VisibleIndex="13" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                        <RegularExpression ErrorText="Invalid Tenure" ValidationExpression="[0-9]+" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_Maxloantenure" VisibleIndex="4" Visible="False">
                                <EditFormSettings Caption="Maximum Loan Tenure(Years)" Visible="True" VisibleIndex="14" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                        <RegularExpression ErrorText="Invalid Tenure" ValidationExpression="[0-9]+" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_serviceContinuity" VisibleIndex="4" Visible="False">
                                <EditFormSettings Caption="Service Continuity" Visible="True" VisibleIndex="15" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                        <RegularExpression ErrorText="Invalid Service" ValidationExpression="^(\d{0,13}\.\d{0,5}|\d{0,13})$" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_residenceStab" VisibleIndex="4" Visible="False">
                                <EditFormSettings Caption="Residence Stability" Visible="True" VisibleIndex="16" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                        <RegularExpression ErrorText="Invalid Stability" ValidationExpression="^(\d{0,13}\.\d{0,5}|\d{0,13})$" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_loanValue" VisibleIndex="4" Visible="False">
                                <EditFormSettings Caption="Loan To Value Ratio" Visible="True" VisibleIndex="17" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                        <RegularExpression ErrorText="Invalid Loan Value" ValidationExpression="^(\d{0,13}\.\d{0,5}|\d{0,13})$" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_validitySanction" VisibleIndex="4" Visible="False">
                                <EditFormSettings Caption="Validity Of Sanction(Days)" Visible="True" VisibleIndex="18" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                        <RegularExpression ErrorText="Invalid Sanction Days" ValidationExpression="[0-9]+" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn FieldName="cf_moderepayment" Visible="False" VisibleIndex="4">
                                <PropertiesComboBox EnableSynchronization="False" EnableIncrementalFiltering="True"
                                    ValueType="System.String">
                                    <Items>
                                        <dxe:ListEditItem Text="PDCs" Value="PDCs">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="EMI" Value="EMI">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="ECS" Value="ECS">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Direct Debit" Value="Direct Debit">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                                <EditFormSettings Caption="Mode Of Repayment" Visible="True" VisibleIndex="19" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataMemoColumn FieldName="cf_partrepayment" Visible="False" VisibleIndex="4">
                                <EditFormSettings Caption="Part Re-Payment Restriction" Visible="True" VisibleIndex="20" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataMemoColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_noReference" VisibleIndex="4" Visible="False">
                                <EditFormSettings Caption="No of Reference Required" Visible="True" VisibleIndex="21" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                        <RegularExpression ErrorText="Invalid References" ValidationExpression="^(\d{0,13}\.\d{0,5}|\d{0,13})$" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cf_fixedIncomeRatio" VisibleIndex="4" Visible="False">
                                <EditFormSettings Caption="Fixed Obligation To Income Ratio " Visible="True" VisibleIndex="22" />
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="CreateUser" VisibleIndex="4" Visible="False">
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataDateColumn FieldName="CreateDate" VisibleIndex="4" Visible="False">
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="LastModifyUser" VisibleIndex="4" Visible="False">
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataDateColumn FieldName="LastModifyDate" VisibleIndex="4" Visible="False">
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewCommandColumn VisibleIndex="5">
                                <EditButton Visible="True">
                                </EditButton>
                                <DeleteButton Visible="True">
                                </DeleteButton>
                                <HeaderTemplate>
                                    <a href="javascript:void(0);" onclick="grid.AddNewRow();"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                </HeaderTemplate>
                            </dxwgv:GridViewCommandColumn>
                        </Columns>
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="520px" PopupEditFormHorizontalAlign="Center"
                            PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="850px" />
                        <Styles>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <Settings ShowStatusBar="Visible" />
                        <SettingsText PopupEditFormCaption="Add/Modify Consumer Finance Product Details"
                            ConfirmDelete="Are You Want To Delete This Record ???" />
                        <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsBehavior ColumnResizeMode="NextColumn" AllowFocusedRow="True" ConfirmDelete="True" />
                        <Templates>
                            <EditForm>
                                <div style="padding: 4px 4px 3px 4px">
                                    <table class="TableMain100">
                                        <tr>
                                            <td>
                                                <dxtc:ASPxPageControl runat="server" ID="pageControl" Width="100%" ActiveTabIndex="0"
                                                    TabIndex="1">
                                                    <TabPages>
                                                        <dxtc:TabPage Text="Details">
                                                            <ContentCollection>
                                                                <dxw:contentcontrol runat="server">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td>
                                                                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors"
                                                                                    ColumnID="" ID="Editors">
                                                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right">
                                                                                <%--<dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>--%>
                                                                                <dxe:ASPxButton ID="btnUpdate" runat="server" Text="Update" ToolTip="Update data"
                                                                                    Height="18px" Width="88px" AutoPostBack="False">
                                                                                    <ClientSideEvents Click="function(s, e) {grid.UpdateEdit();}" />
                                                                                </dxe:ASPxButton>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </dxw:contentcontrol>
                                                            </ContentCollection>
                                                        </dxtc:TabPage>
                                                        <dxtc:TabPage Text="Document Required">
                                                            <ContentCollection>
                                                                <dxw:contentcontrol runat="server">
                                                                    <dxwgv:ASPxGridView ID="gridProductRequired" runat="server" Width="100%" ClientInstanceName="grid1"
                                                                        AutoGenerateColumns="False" DataSourceID="SqlproductRequired" KeyFieldName="cfd_internalId"
                                                                        OnBeforePerformDataSelect="gridProductRequired_BeforePerformDataSelect">
                                                                        <Styles>
                                                                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                            </Header>
                                                                            <LoadingPanel ImageSpacing="10px">
                                                                            </LoadingPanel>
                                                                        </Styles>
                                                                        <Columns>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="cfd_internalId" ReadOnly="True" VisibleIndex="0"
                                                                                Visible="False">
                                                                                <EditFormSettings Visible="False" />
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataComboBoxColumn Caption="Product Name" FieldName="cfd_productCode"
                                                                                Visible="true" VisibleIndex="0">
                                                                                <PropertiesComboBox DataSourceID="SqlPName" ValueField="cf_pcode" TextField="cf_pname"
                                                                                    EnableIncrementalFiltering="True" EnableSynchronization="False" ValueType="System.String">
                                                                                </PropertiesComboBox>
                                                                                <EditFormSettings Caption="Product Name" Visible="False" VisibleIndex="0" />
                                                                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                                </EditFormCaptionStyle>
                                                                                <CellStyle CssClass="gridcellleft">
                                                                                </CellStyle>
                                                                            </dxwgv:GridViewDataComboBoxColumn>
                                                                            <dxwgv:GridViewDataMemoColumn FieldName="cfd_docName" Visible="False" VisibleIndex="1">
                                                                                <EditFormSettings Caption="Document Name" Visible="True" VisibleIndex="1" />
                                                                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                                </EditFormCaptionStyle>
                                                                                <CellStyle CssClass="gridcellleft">
                                                                                </CellStyle>
                                                                            </dxwgv:GridViewDataMemoColumn>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="cfd_copied" VisibleIndex="1" Caption="Number Of Copied">
                                                                                <PropertiesTextEdit>
                                                                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text">
                                                                                        <RegularExpression ErrorText="Invalid Number" ValidationExpression="[0-9]+" />
                                                                                    </ValidationSettings>
                                                                                </PropertiesTextEdit>
                                                                                <EditFormSettings Caption="Number Of Copied" Visible="True" VisibleIndex="2" />
                                                                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                                </EditFormCaptionStyle>
                                                                                <CellStyle CssClass="gridcellleft">
                                                                                </CellStyle>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="cfd_mandatory1" VisibleIndex="2" Caption="Is Mandatory ?">
                                                                                <EditFormSettings Visible="False" />
                                                                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                                </EditFormCaptionStyle>
                                                                                <CellStyle CssClass="gridcellleft">
                                                                                </CellStyle>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataCheckColumn FieldName="cfd_mandatory" Visible="False" VisibleIndex="3">
                                                                                <PropertiesCheckEdit ValueChecked="1" ValueType="System.Int32" ValueUnchecked="0">
                                                                                    <Style HorizontalAlign="Left"></Style>
                                                                                </PropertiesCheckEdit>
                                                                                <EditFormSettings Visible="True" Caption="Is this a mandatory document ?" VisibleIndex="3" />
                                                                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False" ForeColor="Red">
                                                                                </EditFormCaptionStyle>
                                                                                <CellStyle ForeColor="Red">
                                                                                </CellStyle>
                                                                            </dxwgv:GridViewDataCheckColumn>
                                                                            <dxwgv:GridViewDataComboBoxColumn Caption="Applicable For" FieldName="cfd_applicableFor"
                                                                                VisibleIndex="3">
                                                                                <PropertiesComboBox EnableIncrementalFiltering="True" EnableSynchronization="False"
                                                                                    ValueType="System.String">
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="Salaried" Value="Salaried">
                                                                                        </dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Self Employed" Value="Self Employed">
                                                                                        </dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Both" Value="Both">
                                                                                        </dxe:ListEditItem>
                                                                                    </Items>
                                                                                </PropertiesComboBox>
                                                                                <EditFormSettings Caption="Applicable For" Visible="True" VisibleIndex="4" />
                                                                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                                </EditFormCaptionStyle>
                                                                                <CellStyle CssClass="gridcellleft">
                                                                                </CellStyle>
                                                                            </dxwgv:GridViewDataComboBoxColumn>
                                                                            <dxwgv:GridViewDataDateColumn FieldName="CreateDate" VisibleIndex="4" Visible="False">
                                                                                <EditFormSettings Visible="False" />
                                                                            </dxwgv:GridViewDataDateColumn>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="CreateUser" VisibleIndex="4" Visible="False">
                                                                                <EditFormSettings Visible="False" />
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataDateColumn FieldName="LastModifyDate" VisibleIndex="4" Visible="False">
                                                                                <EditFormSettings Visible="False" />
                                                                            </dxwgv:GridViewDataDateColumn>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="LastModifyUser" VisibleIndex="4" Visible="False">
                                                                                <EditFormSettings Visible="False" />
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewCommandColumn VisibleIndex="4">
                                                                                <EditButton Visible="True">
                                                                                </EditButton>
                                                                                <DeleteButton Visible="True">
                                                                                </DeleteButton>
                                                                                <HeaderTemplate>
                                                                                    <a href="javascript:void(0);" onclick="grid1.AddNewRow();"><span style="color: #000099;
                                                                                        text-decoration: underline">Add New</span> </a>
                                                                                </HeaderTemplate>
                                                                            </dxwgv:GridViewCommandColumn>
                                                                        </Columns>
                                                                        <StylesEditors>
                                                                            <ProgressBar Height="25px">
                                                                            </ProgressBar>
                                                                        </StylesEditors>
                                                                        <Settings ShowStatusBar="Visible" ShowTitlePanel="True" ShowGroupPanel="True" />
                                                                        <SettingsText PopupEditFormCaption="Add/Modify Products" />
                                                                        <SettingsPager NumericButtonCount="20" PageSize="20" AlwaysShowPager="True" ShowSeparators="True">
                                                                            <FirstPageButton Visible="True">
                                                                            </FirstPageButton>
                                                                            <LastPageButton Visible="True">
                                                                            </LastPageButton>
                                                                        </SettingsPager>
                                                                        <SettingsBehavior ColumnResizeMode="NextColumn" AllowFocusedRow="true" ConfirmDelete="True" />
                                                                        <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center"
                                                                            PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px" />
                                                                        <Templates>
                                                                            <%-- <TitlePanel>
                                            <table style="width:100%">
                                            <tr>
                                                 <td align="right">
                                                    <table width="200">
                                                        <tr>
                                                            
                                                            <td>
                                                                </td>
                                                            <td>
                                                                 <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"   Height="18px" Width="88px"   AutoPostBack="False">
                                                                    <clientsideevents click="function(s, e) {grid1.AddNewRow();}" />
                                                                </dxe:ASPxButton>
                                                                </td>
                                                                                                
                                                             
                                                          </tr>
                                                      </table>
                                                  </td>   
                                             </tr>
                                        </table>
                                        </TitlePanel>--%>
                                                                            <EditForm>
                                                                                <table style="width: 100%">
                                                                                    <tr>
                                                                                        <td style="width: 10%">
                                                                                        </td>
                                                                                        <td style="width: 80%">
                                                                                            <controls></controls>
                                                                                            <dxwgv:ASPxGridViewTemplateReplacement ID="Editors" runat="server" ColumnID="" ReplacementType="EditFormEditors">
                                                                                            </dxwgv:ASPxGridViewTemplateReplacement>
                                                                                            <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                                                                <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                                                    runat="server">
                                                                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                                                                                <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                                                                    runat="server">
                                                                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                                                                            </div>
                                                                                        </td>
                                                                                        <td style="width: 10%">
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </EditForm>
                                                                        </Templates>
                                                                    </dxwgv:ASPxGridView>
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
                                    </table>
                                </div>
                                <div style="text-align: right; padding: 2px 20px 2px 2px">
                                    <%--<dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>--%>
                                    <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel data"
                                        Height="18px" Width="88px" AutoPostBack="False">
                                        <ClientSideEvents Click="function(s, e) {grid.CancelEdit();}" />
                                    </dxe:ASPxButton>
                                </div>
                            </EditForm>
                        </Templates>
                        <ClientSideEvents Init="function(s, e) {
	height();
}" />
                    </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="SqlConsumerFinance" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                        DeleteCommand="DELETE FROM [tbl_master_CFProducts] WHERE [cf_pcode] = @cf_pcode"
                        SelectCommand="SELECT * FROM [tbl_master_CFProducts]" UpdateCommand="update Table1 set temp123='123'"
                        InsertCommand="">
                        <DeleteParameters>
                            <asp:Parameter Name="cf_pcode" Type="string" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlConsumer" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                        SelectCommand="SELECT tbl_master_contact.cnt_internalId AS Id, ISNULL(tbl_master_contact.cnt_firstName, '') + ' ' + ISNULL(tbl_master_contact.cnt_middleName, '') + ' ' + ISNULL(tbl_master_contact.cnt_lastName, '') AS Name FROM tbl_master_contact INNER JOIN tbl_master_branch ON tbl_master_contact.cnt_branchid = tbl_master_branch.branch_id WHERE (tbl_master_contact.cnt_contactType = 'CF')">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlCurrency" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                        SelectCommand="SELECT [curr_id], [curr_name] FROM [tbl_currency]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlproductRequired" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                        DeleteCommand="DELETE FROM [tbl_master_CFProductsDocuments] WHERE [cfd_internalId] = @cfd_internalId"
                        InsertCommand="INSERT INTO [tbl_master_CFProductsDocuments] ([cfd_productCode], [cfd_docName], [cfd_copied], [cfd_mandatory], [cfd_applicableFor], [CreateDate], [CreateUser]) VALUES (@cfd_productCode, @cfd_docName, @cfd_copied, @cfd_mandatory, @cfd_applicableFor, getdate(), @CreateUser)"
                        SelectCommand="SELECT *,case cfd_mandatory when '1' then 'Yes' else 'No' end as cfd_mandatory1 FROM [tbl_master_CFProductsDocuments] where cfd_productCode=@cfd_productCode"
                        UpdateCommand="UPDATE [tbl_master_CFProductsDocuments] SET [cfd_productCode] = @cfd_productCode, [cfd_docName] = @cfd_docName, [cfd_copied] = @cfd_copied, [cfd_mandatory] = @cfd_mandatory, [cfd_applicableFor] = @cfd_applicableFor, [LastModifyDate] = getdate(), [LastModifyUser] = @LastModifyUser WHERE [cfd_internalId] = @cfd_internalId">
                        <DeleteParameters>
                            <asp:Parameter Name="cfd_internalId" Type="Int32" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="cfd_productCode" SessionField="KeyVal" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:SessionParameter Name="cfd_productCode" SessionField="KeyVal" Type="String" />
                            <asp:Parameter Name="cfd_docName" Type="String" />
                            <asp:Parameter Name="cfd_copied" Type="Decimal" />
                            <asp:Parameter Name="cfd_mandatory" Type="Int32" />
                            <asp:Parameter Name="cfd_applicableFor" Type="String" />
                            <asp:SessionParameter Name="LastModifyUser" Type="Decimal" SessionField="userid" />
                            <asp:Parameter Name="cfd_internalId" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:SessionParameter Name="cfd_productCode" SessionField="KeyVal" Type="String" />
                            <asp:Parameter Name="cfd_docName" Type="String" />
                            <asp:Parameter Name="cfd_copied" Type="Decimal" />
                            <asp:Parameter Name="cfd_mandatory" Type="Int32" />
                            <asp:Parameter Name="cfd_applicableFor" Type="String" />
                            <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlPName" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                        SelectCommand="SELECT [cf_pcode], [cf_pname] FROM [tbl_master_CFProducts]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
