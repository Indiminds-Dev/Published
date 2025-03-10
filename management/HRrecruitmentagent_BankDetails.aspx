<%@ page language="C#" autoeventwireup="true" inherits="management_HRrecruitmentagent_BankDetails, App_Web_6_wayyot" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bank Details</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <!--___________________These files are for List Items__________________________-->

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <!--___________________________________________________________________________-->
    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	    /* Never change this one */
		width:50px;	        /* Width of box */
		height:auto;	        /* Height of box */
		overflow:auto;	        /* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:100;
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
		z-index:900;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:10;
	}
	
	form{
		display:inline;
	}
	
	</style>

    <script language="javascript" type="text/javascript">
       function callAjax(obj,obj1,obj2,obj3)
        {
            var o = document.getElementById("SearchCombo")
            ajax_showOptions(obj,obj1,obj2,o.value)
        } 
       function chkAct(str12,str)
        {
            var str = document.getElementById(str)
            str.value = str12;
        }   
        
    function disp_prompt(name)
    {
         if ( name == "tab0")
        {
        //alert(name);
        document.location.href="HRrecruitmentagent_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="HRrecruitmentagent_ContactPerson.aspx";         
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="HRrecruitmentagent_Correspondence.aspx";         
        }
        else if ( name == "tab3")
        {
        //alert(name);
        //document.location.href="HRrecruitmentagent_BankDetails.aspx";         
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="HRrecruitmentagent_DPDetails.aspx";         
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="HRrecruitmentagent_Document.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
        document.location.href="HRrecruitmentagent_GroupMember.aspx"; 
        }
    }
    function CallList(obj1,obj2,obj3)
    {
        var obj4='';
        //alert(valuse);
        if(valuse==0)
            obj4='bnk_bankName';
        if(valuse==1)
            obj4='bnk_Micrno';
        if(valuse==2)
            obj4='bnk_branchName';
        //alert(obj4);
        ajax_showOptions(obj1,obj2,obj3,obj4);
    }
    function setvaluetovariable(obj1)
    {
        valuse=obj1;
    }
    valuse='0';
    FieldName='ASPxPageControl1_txtequity';
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="15px" ForeColor="Navy"
                            Width="819px" Height="18px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="3" ClientInstanceName="page">
                            <TabPages>
                                <dxtc:TabPage Text="General" Name="General">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Text="Contact Person" Name="Contact Person">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="CorresPondence" Text="CorresPondence">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="BankDetails" Text="Bank Details">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <asp:Label ID="lblmessage" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>
                                            <dxwgv:ASPxGridView ID="BankDetailsGrid" runat="server" ClientInstanceName="gridBank"
                                                DataSourceID="BankDetails" KeyFieldName="Id" AutoGenerateColumns="False" Width="90%"
                                                Font-Size="10px" OnHtmlEditFormCreated="BankDetailsGrid_HtmlEditFormCreated"
                                                OnRowInserting="BankDetailsGrid_RowInserting" OnRowValidating="BankDetailsGrid_RowValidating"
                                                OnRowUpdating="BankDetailsGrid_RowUpdating">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" Visible="False" Caption="Type">
                                                        <EditFormSettings Caption="ID" Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Category" Caption="Category" VisibleIndex="0"
                                                        Width="12%">
                                                        <EditFormSettings Caption="Category" Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="AccountType" Caption="AccountType" VisibleIndex="1"
                                                        Width="12%">
                                                        <EditFormSettings Caption="AccountType" Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="BankName" Caption="BankName" VisibleIndex="2"
                                                        Width="12%">
                                                        <EditFormSettings Caption="BankName" Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="BankName1" Caption="BankName1" VisibleIndex="2"
                                                        Width="12%" Visible="false">
                                                        <EditFormSettings Caption="BankName1" Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Branch" Caption="Branch" VisibleIndex="3"
                                                        Width="12%">
                                                        <EditFormSettings Caption="Branch" Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="MICR" Caption="MICR" VisibleIndex="4" Width="12%">
                                                        <EditFormSettings Caption="MICR" Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn Caption="Category" FieldName="Category" Visible="False"
                                                        VisibleIndex="0">
                                                        <PropertiesComboBox ValueType="System.String">
                                                            <Items>
                                                                <dxe:ListEditItem Text="Default" Value="Default">
                                                                </dxe:ListEditItem>
                                                                <dxe:ListEditItem Text="Secondary" Value="Secondary">
                                                                </dxe:ListEditItem>
                                                            </Items>
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True" />
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn Caption="Account Type" FieldName="AccountType"
                                                        Visible="False" VisibleIndex="0">
                                                        <PropertiesComboBox ValueType="System.String">
                                                            <Items>
                                                                <dxe:ListEditItem Text="Saving" Value="Saving">
                                                                </dxe:ListEditItem>
                                                                <dxe:ListEditItem Text="Current" Value="Current">
                                                                </dxe:ListEditItem>
                                                                <dxe:ListEditItem Text="Joint" Value="Joint">
                                                                </dxe:ListEditItem>
                                                            </Items>
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True" />
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="AccountNumber" Caption="AccountNumber" VisibleIndex="5"
                                                        Width="12%">
                                                        <EditFormSettings Caption="AccountNumber" Visible="True" />
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="AccountName" Caption="AccountName" VisibleIndex="6"
                                                        Width="12%">
                                                        <EditFormSettings Caption="AccountName" Visible="True" />
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="BankName" Caption="BankName" VisibleIndex="0"
                                                        Visible="False">
                                                        <EditFormSettings Caption="BankName" Visible="True" />
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewCommandColumn VisibleIndex="7">
                                                        <DeleteButton Visible="True">
                                                        </DeleteButton>
                                                        <EditButton Visible="True">
                                                        </EditButton>
                                                        <HeaderTemplate>
                                                            <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                                              { %>
                                                            <a href="javascript:void(0);" onclick="gridBank.AddNewRow();"><span style="color: #000099;
                                                                text-decoration: underline">Add New</span> </a>
                                                            <%} %>
                                                        </HeaderTemplate>
                                                    </dxwgv:GridViewCommandColumn>
                                                </Columns>
                                                <Settings ShowTitlePanel="True" />
                                                <SettingsEditing PopupEditFormHeight="250px" PopupEditFormHorizontalAlign="Center"
                                                    PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px"
                                                    EditFormColumnCount="1" />
                                                <Styles>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                    </Header>
                                                </Styles>
                                                <SettingsText PopupEditFormCaption="Add/Modify Bank Details" ConfirmDelete="Are You Want To Delete This Record ???" />
                                                <SettingsPager NumericButtonCount="20" PageSize="20">
                                                </SettingsPager>
                                                <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                <Templates>
                                                    <EditForm>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="text-align: center;">
                                                                    <table>
                                                                        <tr>
                                                                            <td style="text-align: right;">
                                                                                Category:</td>
                                                                            <td style="text-align: left;" colspan="2">
                                                                                <dxe:ASPxComboBox ID="drpCategory" runat="server" ValueType="System.String" Width="203px"
                                                                                    Value='<%#Bind("Category") %>' SelectedIndex="0">
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="Default" Value="Default" />
                                                                                        <dxe:ListEditItem Text="Secondary" Value="Secondary" />
                                                                                    </Items>
                                                                                    <ValidationSettings CausesValidation="True" SetFocusOnError="True">
                                                                                        <RequiredField IsRequired="True" ErrorText="Select category" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxComboBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right;">
                                                                                Account Type:</td>
                                                                            <td style="text-align: left;" colspan="2">
                                                                                <dxe:ASPxComboBox ID="drpAccountType" runat="server" ValueType="System.String" Value='<%#Bind("AccountType") %>'
                                                                                    Width="203px" SelectedIndex="0">
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="Saving" Value="Saving" />
                                                                                        <dxe:ListEditItem Text="Current" Value="Current" />
                                                                                        <dxe:ListEditItem Text="Joint" Value="Joint" />
                                                                                    </Items>
                                                                                    <ValidationSettings CausesValidation="True" SetFocusOnError="True">
                                                                                        <RequiredField IsRequired="True" ErrorText="Select Account Type" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxComboBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right;">
                                                                                Bank Name:</td>
                                                                            <td style="text-align: left;">
                                                                                <asp:TextBox ID="txtbankname" runat="server" Width="200px" Text='<%#Bind("BankName1") %>'></asp:TextBox>
                                                                                <asp:TextBox ID="txtbankname_hidden" runat="server" Visible="false"></asp:TextBox>
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                Search By:</td>
                                                                            <td>
                                                                                <dxe:ASPxComboBox ID="drpSearchBank" runat="server" ValueType="System.String" SelectedIndex="0"
                                                                                    ClientInstanceName="combo" Width="100px">
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="BankName" Value="bnk_bankName" />
                                                                                        <dxe:ListEditItem Text="MICR No" Value="bnk_Micrno" />
                                                                                        <dxe:ListEditItem Text="Branch Name" Value="bnk_branchName" />
                                                                                    </Items>
                                                                                    <ClientSideEvents ValueChanged="function(s,e){
                                                                                                    var indexr = s.GetSelectedIndex();
                                                                                                    setvaluetovariable(indexr)
                                                                                                    }" />
                                                                                </dxe:ASPxComboBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right;">
                                                                                Account Number:</td>
                                                                            <td style="text-align: left;" colspan="2">
                                                                                <asp:TextBox ID="txtAccountNo" runat="server" Text='<%#Bind("AccountNumber") %>'
                                                                                    Width="200px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right;">
                                                                                Account Name:</td>
                                                                            <td style="text-align: left;" colspan="2">
                                                                                <asp:TextBox ID="txtAnccountName" runat="server" Text='<%#Bind("AccountName") %>'
                                                                                    Width="200px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right;" colspan="2">
                                                                                <dxe:ASPxButton ID="btnUpdate" runat="server" Text="Update" ToolTip="Update data"
                                                                                    Height="18px" Width="88px" AutoPostBack="False">
                                                                                    <ClientSideEvents Click="function(s, e) {gridBank.UpdateEdit();}" />
                                                                                </dxe:ASPxButton>
                                                                            </td>
                                                                            <td style="text-align: left;" colspan="2">
                                                                                <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel data"
                                                                                    Height="18px" Width="88px" AutoPostBack="False">
                                                                                    <ClientSideEvents Click="function(s, e) {gridBank.CancelEdit();}" />
                                                                                </dxe:ASPxButton>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </EditForm>
                                                    <TitlePanel>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td align="center">
                                                                    <span class="Ecoheadtxt">Bank Details.</span>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </TitlePanel>
                                                </Templates>
                                            </dxwgv:ASPxGridView>
                                            <br />
                                            <asp:Panel ID="BankDetailsPanel" runat="server" Width="90%" Visible="false">
                                                <table border="1" width="100%">
                                                    <tr>
                                                        <td colspan="2" style="background-color: #A9D4FA; text-align: center; height: 18px;">
                                                            <span style="font-size: 7.5pt"><strong>Investment</strong></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 40%" valign="top">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td class="Ecoheadtxt" style="color: Blue; text-align: right; width: 154px;">
                                                                        <span style="font-size: 7.5pt">Gross Annual Salary </span>
                                                                    </td>
                                                                    <td>
                                                                        :</td>
                                                                    <td class="Ecoheadtxt" style="color: Blue; text-align: left;">
                                                                        <span style="font-size: 7.5pt">Rs.</span><asp:TextBox ID='txtgrossannualsalary' runat="server"
                                                                            Width="50px" Font-Size="10px" ForeColor="Blue"></asp:TextBox></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="Ecoheadtxt" style="color: Blue; width: 154px; text-align: right;">
                                                                        <span style="font-size: 7.5pt">Annual Trunover </span>
                                                                    </td>
                                                                    <td>
                                                                        :</td>
                                                                    <td class="Ecoheadtxt" style="color: Blue">
                                                                        <span style="font-size: 7.5pt">Rs.</span><asp:TextBox ID='txtannualTrunover' runat="server"
                                                                            Width="50px" Font-Size="10px" ForeColor="Blue"></asp:TextBox></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="Ecoheadtxt" style="color: Blue; width: 154px; text-align: right;">
                                                                        <span style="font-size: 7.5pt">Gross Profit </span>
                                                                    </td>
                                                                    <td>
                                                                        :</td>
                                                                    <td class="Ecoheadtxt" style="color: Blue">
                                                                        <span style="font-size: 7.5pt">Rs.</span><asp:TextBox ID='txtGrossProfit' runat="server"
                                                                            Width="50px" Font-Size="10px" ForeColor="Blue"></asp:TextBox></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="Ecoheadtxt" style="color: Blue; width: 154px; text-align: right;">
                                                                        <span style="font-size: 7.5pt">Approx. Expenses (PM) </span>
                                                                    </td>
                                                                    <td>
                                                                        :</td>
                                                                    <td class="Ecoheadtxt" style="color: Blue">
                                                                        <span style="font-size: 7.5pt">Rs.</span><asp:TextBox ID='txtPMExpenses' runat="server"
                                                                            Width="50px" Font-Size="10px" ForeColor="Blue"></asp:TextBox></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="Ecoheadtxt" style="color: Blue; width: 154px; text-align: right;">
                                                                        <span style="font-size: 7.5pt">Approx. Saving (PM) </span>
                                                                    </td>
                                                                    <td>
                                                                        :</td>
                                                                    <td class="Ecoheadtxt" style="color: Blue">
                                                                        <span style="font-size: 7.5pt">Rs.</span><asp:TextBox ID='txtPMSaving' runat="server"
                                                                            Width="50px" Font-Size="10px" ForeColor="Blue"></asp:TextBox></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td style="width: 60%">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td style="width: 225px">
                                                                        <table>
                                                                            <tr>
                                                                                <td class="Ecoheadtxt" style="color: Blue; width: 118px; text-align: right;">
                                                                                    <span style="font-size: 7.5pt">Equity</span></td>
                                                                                <td>
                                                                                    :</td>
                                                                                <td class="Ecoheadtxt" style="color: Blue">
                                                                                    <span style="font-size: 7.5pt">Rs.</span><asp:TextBox ID="txtequity" runat="server"
                                                                                        Width="50px" Font-Size="10px" ForeColor="Blue"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="Ecoheadtxt" style="color: Blue; width: 118px; text-align: right;">
                                                                                    <span style="font-size: 7.5pt">Mutal Fund</span></td>
                                                                                <td>
                                                                                    :</td>
                                                                                <td class="Ecoheadtxt" style="color: Blue">
                                                                                    <span style="font-size: 7.5pt">Rs.</span><asp:TextBox ID="txtMutalFund" runat="server"
                                                                                        Width="50px" Font-Size="10px" ForeColor="Blue"></asp:TextBox></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="Ecoheadtxt" style="color: Blue; width: 118px; text-align: right;">
                                                                                    <span style="font-size: 7.5pt">Bank FD's</span></td>
                                                                                <td>
                                                                                    :</td>
                                                                                <td class="Ecoheadtxt" style="color: Blue">
                                                                                    <span style="font-size: 7.5pt">Rs.</span><asp:TextBox ID="txtBankFD" runat="server"
                                                                                        Width="50px" Font-Size="10px" ForeColor="Blue"></asp:TextBox></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="Ecoheadtxt" style="color: Blue; width: 118px; text-align: right;">
                                                                                    <span style="font-size: 7.5pt">Debt's Instruments</span></td>
                                                                                <td>
                                                                                    :</td>
                                                                                <td class="Ecoheadtxt" style="color: Blue">
                                                                                    <span style="font-size: 7.5pt">Rs.</span><asp:TextBox ID="txtDebtsInstruments" runat="server"
                                                                                        Width="50px" Font-Size="10px" ForeColor="Blue"></asp:TextBox></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="Ecoheadtxt" style="color: Blue; width: 118px; text-align: right;">
                                                                                    <span style="font-size: 7.5pt">NSS's</span></td>
                                                                                <td>
                                                                                    :</td>
                                                                                <td class="Ecoheadtxt" style="color: Blue">
                                                                                    <span style="font-size: 7.5pt">Rs.</span><asp:TextBox ID="txtNSS" runat="server"
                                                                                        Width="50px" Font-Size="10px" ForeColor="Blue"></asp:TextBox></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td class="Ecoheadtxt" style="color: Blue; text-align: right;">
                                                                                    <span style="font-size: 7.5pt">Life Insurance</span></td>
                                                                                <td>
                                                                                    :</td>
                                                                                <td class="Ecoheadtxt" style="color: Blue">
                                                                                    <span style="font-size: 7.5pt">Rs.</span><asp:TextBox ID="txtLifeInsurance" runat="server"
                                                                                        Width="50px" Font-Size="10px" ForeColor="Blue"></asp:TextBox></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="Ecoheadtxt" style="color: Blue; text-align: right;">
                                                                                    <span style="font-size: 7.5pt">Health Insurance</span></td>
                                                                                <td>
                                                                                    :</td>
                                                                                <td class="Ecoheadtxt" style="color: Blue">
                                                                                    <span style="font-size: 7.5pt">Rs.</span><asp:TextBox ID="txtHealthInsurance" runat="server"
                                                                                        Width="50px" Font-Size="10px" ForeColor="Blue"></asp:TextBox></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="Ecoheadtxt" style="color: Blue; text-align: right;">
                                                                                    <span style="font-size: 7.5pt">Real Estate</span></td>
                                                                                <td>
                                                                                    :</td>
                                                                                <td class="Ecoheadtxt" style="color: Blue">
                                                                                    <span style="font-size: 7.5pt">Rs.</span><asp:TextBox ID="txtRealEstate" runat="server"
                                                                                        Width="50px" Font-Size="10px" ForeColor="Blue"></asp:TextBox></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="Ecoheadtxt" style="color: Blue; text-align: right;">
                                                                                    <span style="font-size: 7.5pt">Precious Metals/Stones</span></td>
                                                                                <td>
                                                                                    :</td>
                                                                                <td class="Ecoheadtxt" style="color: Blue">
                                                                                    <span style="font-size: 7.5pt">Rs.</span><asp:TextBox ID="txtPreciousMetals" runat="server"
                                                                                        Width="50px" Font-Size="10px" ForeColor="Blue"></asp:TextBox></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="Ecoheadtxt" style="color: Blue; text-align: right;">
                                                                                    <span style="font-size: 7.5pt">Other's</span></td>
                                                                                <td>
                                                                                    :</td>
                                                                                <td class="Ecoheadtxt" style="color: Blue">
                                                                                    <span style="font-size: 7.5pt">Rs.</span><asp:TextBox ID="txtOthers" runat="server"
                                                                                        Width="50px" Font-Size="10px" ForeColor="Blue"></asp:TextBox></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table>
                                                                <tr>
                                                                    <td class="Ecoheadtxt" style="color: Blue; text-align: right;">
                                                                        <span style="font-size: 7.5pt">Has Fund For Investment </span>
                                                                    </td>
                                                                    <td>
                                                                        :</td>
                                                                    <td class="Ecoheadtxt" style="color: Blue">
                                                                        <asp:CheckBox ID="chkHasFundInvestment" runat="server" Font-Size="10px" ForeColor="Blue" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="Ecoheadtxt" style="color: Blue; text-align: right;">
                                                                        <span style="font-size: 7.5pt">If Yes Then Availabe Funds </span>
                                                                    </td>
                                                                    <td>
                                                                        :</td>
                                                                    <td class="Ecoheadtxt" style="color: Blue">
                                                                        <asp:TextBox ID="txtAvailableFund" runat="server" Width="50px" Font-Size="10px" ForeColor="Blue" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="Ecoheadtxt" style="color: Blue; text-align: right;">
                                                                        <span style="font-size: 7.5pt">If Yes Then Investment Horizon </span>
                                                                    </td>
                                                                    <td>
                                                                        :</td>
                                                                    <td class="Ecoheadtxt" style="color: Blue">
                                                                        <asp:TextBox ID="txtInvestmentHorizon" runat="server" Width="50px" Font-Size="10px"
                                                                            ForeColor="Blue" /></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td class="Ecoheadtxt" style="color: Blue; width: 119px; text-align: right;">
                                                                                    <span style="font-size: 7.5pt">Ready to Transfer Existing Portfoilio </span>
                                                                                </td>
                                                                                <td>
                                                                                    :</td>
                                                                                <td class="Ecoheadtxt" style="color: Blue">
                                                                                    <asp:CheckBox ID="chkPortFoilio" runat="server" OnCheckedChanged="chkPortFoilio_CheckedChanged"
                                                                                        Font-Size="10px" ForeColor="Blue" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="Ecoheadtxt" style="color: Blue; width: 119px; text-align: right;">
                                                                                    <span style="font-size: 7.5pt">If Yes Then Amount </span>
                                                                                </td>
                                                                                <td>
                                                                                    :</td>
                                                                                <td class="Ecoheadtxt" style="color: Blue">
                                                                                    <asp:TextBox ID="TxtPortFoilioAmount" runat="server" Width="50px" Font-Size="10px"
                                                                                        ForeColor="Blue" /></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td class="Ecoheadtxt" style="color: Blue; width: 138px; text-align: right;">
                                                                                    <span style="font-size: 7.5pt">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; Own House </span>
                                                                                </td>
                                                                                <td style="width: 3px">
                                                                                    :</td>
                                                                                <td class="Ecoheadtxt" style="color: Blue">
                                                                                    <asp:CheckBox ID="chkhouse" runat="server" Font-Size="10px" ForeColor="Blue" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="Ecoheadtxt" style="color: Blue; width: 138px; text-align: right;">
                                                                                    <span style="font-size: 7.5pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Own Vehicle
                                                                                    </span>
                                                                                </td>
                                                                                <td style="width: 3px">
                                                                                    :</td>
                                                                                <td class="Ecoheadtxt" style="color: Blue">
                                                                                    <asp:CheckBox ID="chkVehicle" runat="server" Font-Size="10px" ForeColor="Blue" /></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="center" style="text-align: right">
                                                            <asp:Button ID="btn_Finance_Save" runat="server" Text="Save" OnClick="btn_Finance_Save_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="DPDetails" Text="DP Details">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Documents" Text="Documents">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="GroupMember" Text="Group Member">
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
                            <TabStyle Font-Size="10px">
                            </TabStyle>
                        </dxtc:ASPxPageControl>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtID" runat="server" Visible="false"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="BankDetails" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="BankDetailsSelect" InsertCommand="BankDetailsInsert" InsertCommandType="StoredProcedure"
            SelectCommandType="StoredProcedure" UpdateCommand="BankDetailsUpdate" UpdateCommandType="StoredProcedure"
            DeleteCommand="delete from tbl_trans_contactBankDetails where cbd_id=@Id">
            <SelectParameters>
                <asp:SessionParameter Name="insuId" SessionField="KeyVal_InternalID" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="Category" Type="String" />
                <asp:SessionParameter Name="insuId" SessionField="KeyVal_InternalID" Type="String" />
                <asp:Parameter Name="BankName1" Type="String" />
                <asp:Parameter Name="AccountNumber" Type="String" />
                <asp:Parameter Name="AccountType" Type="String" />
                <asp:Parameter Name="AccountName" Type="String" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="BankName1" Type="String" />
                <asp:Parameter Name="AccountNumber" Type="String" />
                <asp:Parameter Name="AccountType" Type="String" />
                <asp:Parameter Name="AccountName" Type="String" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="String" />
                <asp:Parameter Name="Id" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
