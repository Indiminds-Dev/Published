<%@ page language="C#" autoeventwireup="true" inherits="management_Lead_BankDetails, App_Web_mzqu16me" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <script language="javascript" type="text/javascript">
             function SignOff()
            {
            window.parent.SignOff()
            }
           function height()
            {
                window.frameElement.height = document.body.scrollHeight;
                window.frameElement.widht = document.body.scrollWidht;
            }
    </script>

    <title>Bank Details</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
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
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

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
        //var ID = document.getElementById(txtID);
        if ( name == "tab0")
        {
        //alert(name);
        document.location.href="Lead_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="Lead_Correspondence.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        //document.location.href="Lead_BankDetails.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="Lead_DPDetails.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="Lead_Document.aspx"; 
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="Lead_FamilyMembers.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
        document.location.href="Lead_Registration.aspx"; 
        }
        else if ( name == "tab7")
        {
        //alert(name);
        document.location.href="Lead_GroupMember.aspx"; 
        }
        else if ( name == "tab8")
        {
        //alert(name);
        document.location.href="Lead_Remarks.aspx"; 
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

    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="2" ClientInstanceName="page">
                            <TabPages>
                                <dxtc:TabPage Name="General" Text="General">
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
                                <dxtc:TabPage Name="Bank Details" Text="Bank Details">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <asp:Label runat="server" Font-Bold="True" ForeColor="Red" ID="lblmessage"></asp:Label>
                                            <dxwgv:ASPxGridView runat="server" ClientInstanceName="gridBank" KeyFieldName="Id"
                                                AutoGenerateColumns="False" DataSourceID="BankDetails" Width="100%" Font-Size="10px"
                                                ID="BankDetailsGrid" OnRowUpdating="BankDetailsGrid_RowUpdating" OnRowValidating="BankDetailsGrid_RowValidating"
                                                OnRowInserting="BankDetailsGrid_RowInserting" OnHtmlEditFormCreated="BankDetailsGrid_HtmlEditFormCreated">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Id" Caption="Type" Visible="False" VisibleIndex="0">
                                                        <EditFormSettings Visible="False" Caption="ID"></EditFormSettings>
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Category" Width="12%" Caption="Category"
                                                        VisibleIndex="0">
                                                        <EditFormSettings Visible="False" Caption="Category"></EditFormSettings>
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="AccountType" Width="12%" Caption="AccountType"
                                                        VisibleIndex="1">
                                                        <EditFormSettings Visible="False" Caption="AccountType"></EditFormSettings>
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="BankName" Width="12%" Caption="BankName"
                                                        VisibleIndex="2">
                                                        <EditFormSettings Visible="False" Caption="BankName"></EditFormSettings>
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Branch" Width="12%" Caption="Branch" VisibleIndex="3">
                                                        <EditFormSettings Visible="False" Caption="Branch"></EditFormSettings>
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="MICR" Width="12%" Caption="MICR" VisibleIndex="4">
                                                        <EditFormSettings Visible="False" Caption="MICR"></EditFormSettings>
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="Category" Caption="Category" Visible="False"
                                                        VisibleIndex="0">
                                                        <PropertiesComboBox ValueType="System.String">
                                                            <Items>
                                                                <dxe:ListEditItem Text="Default" Value="Default">
                                                                </dxe:ListEditItem>
                                                                <dxe:ListEditItem Text="Secondary" Value="Secondary">
                                                                </dxe:ListEditItem>
                                                            </Items>
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True"></EditFormSettings>
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="AccountType" Caption="Account Type"
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
                                                        <EditFormSettings Visible="True"></EditFormSettings>
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="AccountNumber" Width="12%" Caption="AccountNumber"
                                                        VisibleIndex="5">
                                                        <EditFormSettings Visible="True" Caption="AccountNumber"></EditFormSettings>
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="AccountName" Width="12%" Caption="AccountName"
                                                        VisibleIndex="6">
                                                        <EditFormSettings Visible="True" Caption="AccountName"></EditFormSettings>
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="BankName" Caption="BankName" Visible="False"
                                                        VisibleIndex="0">
                                                        <EditFormSettings Visible="True" Caption="BankName"></EditFormSettings>
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewCommandColumn VisibleIndex="7">
                                                        <EditButton Visible="True">
                                                        </EditButton>
                                                        <DeleteButton Visible="True">
                                                        </DeleteButton>
                                                        <HeaderTemplate>
                                                            <a href="javascript:void(0);" onclick="gridBank.AddNewRow();"><span style="color: #000099;
                                                                text-decoration: underline">Add New</span> </a>
                                                        </HeaderTemplate>
                                                    </dxwgv:GridViewCommandColumn>
                                                </Columns>
                                                <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True"></SettingsBehavior>
                                                <SettingsPager PageSize="20" NumericButtonCount="20">
                                                    <FirstPageButton Visible="True">
                                                    </FirstPageButton>
                                                    <LastPageButton Visible="True">
                                                    </LastPageButton>
                                                </SettingsPager>
                                                <SettingsEditing PopupEditFormWidth="600px" PopupEditFormHeight="250px" PopupEditFormHorizontalAlign="Center"
                                                    PopupEditFormVerticalAlign="WindowCenter" PopupEditFormModal="True" EditFormColumnCount="1">
                                                </SettingsEditing>
                                                <Settings ShowStatusBar="Visible"></Settings>
                                                <SettingsText ConfirmDelete="Are You Want To Delete This Record ???" PopupEditFormCaption="Add/Modify Bank Details">
                                                </SettingsText>
                                                <Styles>
                                                    <Header SortingImageSpacing="5px" ImageSpacing="5px">
                                                    </Header>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                </Styles>
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
                                                                                    Value='<%#Bind("Category") %>' SelectedIndex="0" EnableIncrementalFiltering="true">
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
                                                                                    Width="203px" SelectedIndex="0"  EnableIncrementalFiltering="true">
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
                                                                                    ClientInstanceName="combo" Width="100px" EnableIncrementalFiltering="true">
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
                                                                                    Height="18px" Width="88px"  AutoPostBack="False">
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
                                                </Templates>
                                            </dxwgv:ASPxGridView>
                                            <br />
                                            <asp:Panel runat="server" Width="100%" ID="BankDetailsPanel">
                                                <table border="1"  width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td style="background-color: #a9d4fa; text-align: center" colspan="2">
                                                                <span style="font-size: 7.5pt"><strong>Investment</strong></span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" width="50%" align="left">
                                                                <table>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                <span style="font-size: 7.5pt">Gross Annual Salary </span>
                                                                            </td>
                                                                            <td>
                                                                                :</td>
                                                                            <td style="color: blue; text-align: left" class="Ecoheadtxt">
                                                                                <span style="font-size: 7.5pt">Rs.</span><asp:TextBox runat="server" Font-Size="10px"
                                                                                    ForeColor="Blue" Width="50px" ID="txtgrossannualsalary"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                <span style="font-size: 7.5pt">Annual Trunover </span>
                                                                            </td>
                                                                            <td>
                                                                                :</td>
                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                <span style="font-size: 7.5pt">Rs.</span><asp:TextBox runat="server" Font-Size="10px"
                                                                                    ForeColor="Blue" Width="50px" ID="txtannualTrunover"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                <span style="font-size: 7.5pt">Gross Profit </span>
                                                                            </td>
                                                                            <td>
                                                                                :</td>
                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                <span style="font-size: 7.5pt">Rs.</span><asp:TextBox runat="server" Font-Size="10px"
                                                                                    ForeColor="Blue" Width="50px" ID="txtGrossProfit"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                <span style="font-size: 7.5pt">Approx. Expenses (PM) </span>
                                                                            </td>
                                                                            <td>
                                                                                :</td>
                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                <span style="font-size: 7.5pt">Rs.</span><asp:TextBox runat="server" Font-Size="10px"
                                                                                    ForeColor="Blue" Width="50px" ID="txtPMExpenses"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                <span style="font-size: 7.5pt">Approx. Saving (PM) </span>
                                                                            </td>
                                                                            <td>
                                                                                :</td>
                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                <span style="font-size: 7.5pt">Rs.</span><asp:TextBox runat="server" Font-Size="10px"
                                                                                    ForeColor="Blue" Width="50px" ID="txtPMSaving"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                            <td style="width: 60%">
                                                                <table>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td style="width: 50%">
                                                                                <table>
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Equity</span></td>
                                                                                            <td>
                                                                                                :</td>
                                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Rs.</span><asp:TextBox runat="server" Font-Size="10px"
                                                                                                    ForeColor="Blue" Width="50px" ID="txtequity"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Mutal Fund</span></td>
                                                                                            <td>
                                                                                                :</td>
                                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Rs.</span><asp:TextBox runat="server" Font-Size="10px"
                                                                                                    ForeColor="Blue" Width="50px" ID="txtMutalFund"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Bank FD's</span></td>
                                                                                            <td>
                                                                                                :</td>
                                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Rs.</span><asp:TextBox runat="server" Font-Size="10px"
                                                                                                    ForeColor="Blue" Width="50px" ID="txtBankFD"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Debt's Instruments</span></td>
                                                                                            <td>
                                                                                                :</td>
                                                                                            <td style=" color: blue" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Rs.</span><asp:TextBox runat="server" Font-Size="10px"
                                                                                                    ForeColor="Blue" Width="50px" ID="txtDebtsInstruments"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">NSS's</span></td>
                                                                                            <td>
                                                                                                :</td>
                                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Rs.</span><asp:TextBox runat="server" Font-Size="10px"
                                                                                                    ForeColor="Blue" Width="50px" ID="txtNSS"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                            <td style="width: 50%">
                                                                                <table>
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Life Insurance</span></td>
                                                                                            <td>
                                                                                                :</td>
                                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Rs.</span><asp:TextBox runat="server" Font-Size="10px"
                                                                                                    ForeColor="Blue" Width="50px" ID="txtLifeInsurance"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Health Insurance</span></td>
                                                                                            <td>
                                                                                                :</td>
                                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Rs.</span><asp:TextBox runat="server" Font-Size="10px"
                                                                                                    ForeColor="Blue" Width="50px" ID="txtHealthInsurance"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Real Estate</span></td>
                                                                                            <td>
                                                                                                :</td>
                                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Rs.</span><asp:TextBox runat="server" Font-Size="10px"
                                                                                                    ForeColor="Blue" Width="50px" ID="txtRealEstate"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Precious Metals/Stones</span></td>
                                                                                            <td>
                                                                                                :</td>
                                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Rs.</span><asp:TextBox runat="server" Font-Size="10px"
                                                                                                    ForeColor="Blue" Width="50px" ID="txtPreciousMetals"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Other's</span></td>
                                                                                            <td>
                                                                                                :</td>
                                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Rs.</span><asp:TextBox runat="server" Font-Size="10px"
                                                                                                    ForeColor="Blue" Width="50px" ID="txtOthers"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td style="color: blue; text-align: right;" class="Ecoheadtxt">
                                                                                <span style="font-size: 7.5pt">Has Fund For Investment </span>
                                                                            </td>
                                                                            <td style="width: 11px">
                                                                                :</td>
                                                                            <td style="color: blue;" class="Ecoheadtxt">
                                                                                <asp:CheckBox runat="server" Font-Size="10px" ForeColor="Blue" ID="chkHasFundInvestment"
                                                                                    OnCheckedChanged="chkHasFundInvestment_CheckedChanged"></asp:CheckBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                <span style="font-size: 7.5pt">If Yes Then Availabe Funds </span>
                                                                            </td>
                                                                            <td style="width: 11px">
                                                                                :</td>
                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                <asp:TextBox runat="server" Font-Size="10px" ForeColor="Blue" Width="50px" ID="txtAvailableFund"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                <span style="font-size: 7.5pt">If Yes Then Investment Horizon </span>
                                                                            </td>
                                                                            <td style="width: 11px">
                                                                                :</td>
                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                <asp:TextBox runat="server" Font-Size="10px" ForeColor="Blue" Width="50px" ID="txtInvestmentHorizon"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                            <td>
                                                                <table>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>
                                                                                <table>
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">Ready to Transfer Existing Portfoilio </span>
                                                                                            </td>
                                                                                            <td>
                                                                                                :</td>
                                                                                            <td style="color: blue" class="Ecoheadtxt" align="left">
                                                                                                <asp:CheckBox runat="server" Font-Size="10px" ForeColor="Blue" ID="chkPortFoilio"
                                                                                                    OnCheckedChanged="chkPortFoilio_CheckedChanged"></asp:CheckBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">If Yes Then Amount </span>
                                                                                            </td>
                                                                                            <td>
                                                                                                :</td>
                                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                                <asp:TextBox runat="server" Font-Size="10px" ForeColor="Blue" Width="50px" ID="TxtPortFoilioAmount"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                            <td>
                                                                                <table>
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; Own House </span>
                                                                                            </td>
                                                                                            <td>
                                                                                                :</td>
                                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                                <asp:CheckBox runat="server" Font-Size="10px" ForeColor="Blue" ID="chkhouse"></asp:CheckBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="color: blue; text-align: right" class="Ecoheadtxt">
                                                                                                <span style="font-size: 7.5pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Own Vehicle
                                                                                                </span>
                                                                                            </td>
                                                                                            <td>
                                                                                                :</td>
                                                                                            <td style="color: blue" class="Ecoheadtxt">
                                                                                                <asp:CheckBox runat="server" Font-Size="10px" ForeColor="Blue" ID="chkVehicle"></asp:CheckBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right" align="center" colspan="2">
                                                                <asp:Button runat="server" Text="Save" ID="btn_Finance_Save" OnClick="btn_Finance_Save_Click">
                                                                </asp:Button>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </asp:Panel>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="DP Details" Text="DP Details">
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
                                <dxtc:TabPage Name="Family Members" Text="Family Members">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Registration" Text="Registration">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Group Member" Text="Group Member">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Remarks" Text="Remarks">
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
	                                            var Tab7 = page.GetTab(7);
	                                            var Tab8 = page.GetTab(8);
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
	                                            else if(activeTab == Tab7)
	                                            {
	                                                disp_prompt('tab7');
	                                            }
	                                            else if(activeTab == Tab8)
	                                            {
	                                                disp_prompt('tab8');
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
                    <td style="width: 3px">
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
