<%@ page language="C#" autoeventwireup="true" inherits="management_Contact_Deposit, App_Web_nidspgif" %>

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
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <!--___________________________________________________________________________-->
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
    function SignOff()
    {
    window.parent.SignOff()
    }
    function IssuingBank(obj)
    {
        if(obj=='2')
        {
            document.getElementById("TrBankName").style.display = 'none';
            document.getElementById("TrBranchName").style.display = 'inline';
            document.getElementById("TrIDate").style.display = 'inline';
            document.getElementById("TrRDate").style.display = 'inline';
            document.getElementById("TrChequeNo").style.display = 'inline';
            document.getElementById("TdDD").style.display = 'inline';
            document.getElementById("TdBank").style.display = 'none';
            document.getElementById("TrAcountName").style.display = 'none';
        }
        else
        {
            if(obj=='1')
            {
                document.getElementById("TrBankName").style.display = 'none';
                document.getElementById("TrBranchName").style.display = 'none';
                document.getElementById("TrIDate").style.display = 'none';
                document.getElementById("TrRDate").style.display = 'inline';
                document.getElementById("TrChequeNo").style.display = 'none';
                document.getElementById("TdDD").style.display = 'none';
                document.getElementById("TdBank").style.display = 'inline';
                document.getElementById("TrAcountName").style.display = 'none';
            }
            else
            {
                if(obj=='3')
                {
                    document.getElementById("TrBankName").style.display = 'none';
                    document.getElementById("TrBranchName").style.display = 'inline';
                    document.getElementById("TrIDate").style.display = 'inline';
                    document.getElementById("TrRDate").style.display = 'inline';
                    document.getElementById("TrChequeNo").style.display = 'inline';
                    document.getElementById("TdDD").style.display = 'inline';
                    document.getElementById("TdBank").style.display = 'none';
                    document.getElementById("TrAcountName").style.display = 'inline';
                }
                else    
                {
                    document.getElementById("TrBankName").style.display = 'inline';
                    document.getElementById("TrBranchName").style.display = 'none';
                    document.getElementById("TrIDate").style.display = 'inline';
                    document.getElementById("TrRDate").style.display = 'inline';
                    document.getElementById("TrChequeNo").style.display = 'inline';
                    document.getElementById("TdDD").style.display = 'none';
                    document.getElementById("TdBank").style.display = 'inline';
                    document.getElementById("TrAcountName").style.display = 'none';
               }
            }
        }
    }
    function PageLoad()
    {
        document.getElementById("TrBankName").style.display = 'inline';
        document.getElementById("TrBranchName").style.display = 'none';
        document.getElementById("TdDD").style.display = 'none';
        document.getElementById("TdBank").style.display = 'inline';
    }
    function disp_prompt(name)
    {
         if ( name == "tab0")
        {
        //alert(name);
        document.location.href="Contact_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="Contact_Correspondence.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="Contact_BankDetails.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="Contact_DPDetails.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="Contact_Document.aspx"; 
        }
        else if ( name == "tab12")
        {
        //alert(name);
        document.location.href="Contact_FamilyMembers.aspx"; 
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="Contact_Registration.aspx"; 
        }
        else if ( name == "tab7")
        {
        //alert(name);
        document.location.href="Contact_GroupMember.aspx"; 
        }
        else if ( name == "tab8")
        {
        //alert(name);
        //document.location.href="Contact_Deposit.aspx"; 
        }
        else if ( name == "tab9")
        {
        //alert(name);
        document.location.href="Contact_Remarks.aspx"; 
        }
        else if ( name == "tab10")
        {
        //alert(name);
        document.location.href="Contact_Education.aspx"; 
        }
        else if ( name == "tab11")
        {
        //alert(name);
        document.location.href="contact_brokerage.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
            document.location.href="contact_other.aspx"; 
        }
        else if(name=="tab13")
        {
             document.location.href="contact_Subscription.aspx";
        }
        //New Work 30-12-2021
        else if(name=="tab14")
        {
             document.location.href="Contact_Nominee.aspx";
        }
        //End of New Work 30-12-2021
    }
    function FocusEditor(obj)
    {
        alert(obj);
    }
    function InitialShow(obj)
    {
        if(obj=="a")
        {
            IssuingBank(dlAccountType.GetSelectedIndex());
        }
    }
    FieldName='ASPxPageControl1_ASPxLabel3';
    </script>

    <form id="form1" runat="server">
        <div>
            <table width="100%">
                <tr>
                    <td class="EHEADER" style="text-align: center">
                        <asp:Label ID="lblName" runat="server" Font-Size="12px" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
            </table>
            <table class="TableMain100">
                <tr>
                    <td width="100%">
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="8" ClientInstanceName="page"
                            Width="100%" Font-Size="10px">
                            <TabPages>
                                <dxtc:TabPage Name="General">
                                <TabTemplate ><span style="font-size:x-small">General</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage  Name="CorresPondence">
                                <TabTemplate ><span style="font-size:x-small">CorresPondence</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="BankDetails">
                                <TabTemplate ><span style="font-size:x-small">Bank</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="DPDetails">
                                <TabTemplate ><span style="font-size:x-small">DP</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Documents">
                                <TabTemplate ><span style="font-size:x-small">Documents</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                               
                               
                                <dxtc:TabPage Name="Registration">
                                <TabTemplate ><span style="font-size:x-small">Registration</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Other">
                                <TabTemplate ><span style="font-size:x-small">Other</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="GroupMember" Text="Group">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Deposit" Text="Deposit">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <table width="100%">
                                                <tr>
                                                    <td colspan="3">
                                                        <dxwgv:ASPxGridView ID="gridDeposit" runat="server" DataSourceID="SqlBpDeposit" ClientInstanceName="gridDeposit"
                                                            KeyFieldName="id" Width="100%" AutoGenerateColumns="False" OnHtmlEditFormCreated="gridDeposit_HtmlEditFormCreated"
                                                            OnRowInserting="gridDeposit_RowInserting" OnInitNewRow="gridDeposit_InitNewRow"
                                                            OnRowUpdating="gridDeposit_RowUpdating" OnCustomJSProperties="gridDeposit_CustomJSProperties" OnStartRowEditing="gridDeposit_StartRowEditing">
                                                            <Styles>
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                            </Styles>
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn Caption="Amount" FieldName="Amount" VisibleIndex="1">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Mode" FieldName="Mode" VisibleIndex="4">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="BankName" FieldName="BankName" VisibleIndex="8"
                                                                    Visible="False">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="BranchName" FieldName="BranchName" VisibleIndex="8">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Instrument No" FieldName="CheckNo" VisibleIndex="6">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="BankName" FieldName="BkName" VisibleIndex="7">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Receipt Number" FieldName="RNumber" VisibleIndex="2">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Deposit Status" Visible="False" FieldName="status"
                                                                    VisibleIndex="3">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Deposit Status" FieldName="Status1" VisibleIndex="3">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Acount Name And No" FieldName="AcNoName" Visible="False"
                                                                    VisibleIndex="3">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataDateColumn Caption="Receive Date" FieldName="Receive1" VisibleIndex="0">
                                                                    <PropertiesDateEdit DisplayFormatString="{0:dd MMM yyyy}" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                                                        UseMaskBehavior="True">
                                                                    </PropertiesDateEdit>
                                                                    <EditFormSettings Caption="Receive Date" Visible="True" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False" ForeColor="Blue">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft" ForeColor="Blue">
                                                                    </CellStyle>
                                                                    <EditCellStyle ForeColor="Blue">
                                                                    </EditCellStyle>
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataDateColumn Caption="Instrumental Date" FieldName="DOI1" VisibleIndex="5">
                                                                    <PropertiesDateEdit DisplayFormatString="{0:dd MMM yyyy}" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                                                        UseMaskBehavior="True">
                                                                    </PropertiesDateEdit>
                                                                    <EditFormSettings Caption="Instrumental Date" Visible="True" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False" ForeColor="Blue">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewCommandColumn VisibleIndex="9">
                                                                    <EditButton Visible="True">
                                                                    </EditButton>
                                                                    <DeleteButton Visible="True">
                                                                    </DeleteButton>
                                                                    <HeaderTemplate>
                                                                        <a href="javascript:void(0);" onclick="gridDeposit.AddNewRow();"><span style="color: #000099;
                                                                            text-decoration: underline">Add New</span> </a>
                                                                    </HeaderTemplate>
                                                                </dxwgv:GridViewCommandColumn>
                                                            </Columns>
                                                            <SettingsText ConfirmDelete="Are You Want To Delete This Record ???" />
                                                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                                                <FirstPageButton Visible="True">
                                                                </FirstPageButton>
                                                                <LastPageButton Visible="True">
                                                                </LastPageButton>
                                                            </SettingsPager>
                                                            <SettingsBehavior ConfirmDelete="True" />
                                                            <Templates>
                                                                <EditForm>
                                                                    <table style="width: 100%">
                                                                        <tr>
                                                                            <td style="text-align: center;">
                                                                                <table>
                                                                                    <tr>
                                                                                        <td class="Ecoheadtxt" style="width: 36%">
                                                                                            <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Mode">
                                                                                            </dxe:ASPxLabel>
                                                                                        </td>
                                                                                        <td class="Ecoheadtxt" style="text-align: left">
                                                                                            <dxe:ASPxComboBox ID="drpAccountType" runat="server" EnableIncrementalFiltering="true"
                                                                                                ValueType="System.String" Value='<%# Bind("Mode") %>' Width="302px" ClientInstanceName="dlAccountType" SelectedIndex="0">
                                                                                                <Items>
                                                                                                    <dxe:ListEditItem Text="Cheque" Value="Cheque" />
                                                                                                    <dxe:ListEditItem Text="Cash" Value="Cash" />
                                                                                                    <dxe:ListEditItem Text="DD" Value="DD" />
                                                                                                    <dxe:ListEditItem Text="Third Party" Value="Third Party" />
                                                                                                </Items>
                                                                                                <ClientSideEvents ValueChanged="function(s,e){
                                                                                                                    var indexr = s.GetSelectedIndex();
                                                                                                                    IssuingBank(indexr)
                                                                                                                    }" />
                                                                                                <ValidationSettings CausesValidation="True" SetFocusOnError="True">
                                                                                                    <RequiredField IsRequired="True" ErrorText="Select Account Type" />
                                                                                                </ValidationSettings>
                                                                                                <ButtonStyle Width="13px">
                                                                                                </ButtonStyle>
                                                                                            </dxe:ASPxComboBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <%--<tr>
                                                                            <td colspan="3" style="text-align:center">
                                                                                <table width="420">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <dxwgv:ASPxGridViewTemplateReplacement ID="Editors" runat="server" ColumnID="" ReplacementType="EditFormEditors">
                                                                                            </dxwgv:ASPxGridViewTemplateReplacement>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            
                                                                            </td>
                                                                             
                                                                        </tr>--%>
                                                                                    <tr id="TrRDate">
                                                                                        <td class="Ecoheadtxt" style="width: 36%">
                                                                                            <dxe:ASPxLabel ID="ASPxLabel8" runat="server" Text="Receive Date">
                                                                                            </dxe:ASPxLabel>
                                                                                        </td>
                                                                                        <td class="Ecoheadtxt" style="text-align: left">
                                                                                            <dxe:ASPxDateEdit ID="dtReceive" runat="server" Value='<%# Bind("Receive1") %>'
                                                                                                EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="300px">
                                                                                                <ButtonStyle Width="13px">
                                                                                                </ButtonStyle>
                                                                                            </dxe:ASPxDateEdit>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr id="TrIDate">
                                                                                        <td class="Ecoheadtxt" style="width: 36%">
                                                                                            <dxe:ASPxLabel ID="ASPxLabel11" runat="server" Text="Instrumental Date">
                                                                                            </dxe:ASPxLabel>
                                                                                        </td>
                                                                                        <td class="Ecoheadtxt" style="text-align: left">
                                                                                            <dxe:ASPxDateEdit ID="dtInstrumental" runat="server" Value='<%# Bind("DOI1") %>'
                                                                                                EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="300px">
                                                                                                <ButtonStyle Width="13px">
                                                                                                </ButtonStyle>
                                                                                            </dxe:ASPxDateEdit>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="Ecoheadtxt" style="width: 36%">
                                                                                            <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Amount">
                                                                                            </dxe:ASPxLabel>
                                                                                        </td>
                                                                                        <td class="Ecoheadtxt" style="text-align: left">
                                                                                            <asp:TextBox ID="TxtAmount" runat="server" Width="300px" Text='<%#Bind("Amount") %>'></asp:TextBox>
                                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TxtAmount"
                                                                                                runat="server" ErrorMessage="RegularExpressionValidator" ValidationExpression="^(\d{0,13}\.\d{0,5}|\d{0,13})$"></asp:RegularExpressionValidator>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="Ecoheadtxt" style="width: 36%">
                                                                                            <dxe:ASPxLabel ID="ASPxLabel9" runat="server" Text="Payment Receipt Number">
                                                                                            </dxe:ASPxLabel>
                                                                                        </td>
                                                                                        <td class="Ecoheadtxt" style="text-align: left">
                                                                                            <asp:TextBox ID="txtPaymentReceiptNumber" runat="server" Width="300px" Text='<%#Bind("RNumber") %>'></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr id="TrBankName">
                                                                                        <td class="Ecoheadtxt" style="width: 36%" id="TdBank">
                                                                                            <dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="Bank Name">
                                                                                            </dxe:ASPxLabel>
                                                                                        </td>
                                                                                        <td class="Ecoheadtxt" style="display: none" id="TdDD">
                                                                                            <dxe:ASPxLabel ID="ASPxLabel7" runat="server" Text="DD Issuing Bank Name">
                                                                                            </dxe:ASPxLabel>
                                                                                        </td>
                                                                                        <td class="Ecoheadtxt" style="text-align: left">
                                                                                            <asp:TextBox ID="txtBankName" runat="server" Width="300px" Text='<%#Bind("BkName") %>'></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr id="TrBranchName" style="display: none">
                                                                                        <td class="Ecoheadtxt" style="width: 36%">
                                                                                            <dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="Bank/Branch Name">
                                                                                            </dxe:ASPxLabel>
                                                                                        </td>
                                                                                        <td class="Ecoheadtxt" style="text-align: left">
                                                                                            <asp:TextBox ID="txtBranchName" runat="server" Width="300px" Text='<%#Bind("BranchName") %>'></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr id="TrAcountName" style="display: none">
                                                                                        <td class="Ecoheadtxt" style="width: 36%">
                                                                                            <dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="Acount Name & Acount Number">
                                                                                            </dxe:ASPxLabel>
                                                                                        </td>
                                                                                        <td class="Ecoheadtxt" style="text-align: left">
                                                                                            <asp:TextBox ID="txtAcountNoName" runat="server" Width="300px" Text='<%#Bind("AcNoName") %>'></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr id="TrChequeNo">
                                                                                        <td class="Ecoheadtxt" style="width: 36%">
                                                                                            <dxe:ASPxLabel ID="ASPxLabel6" runat="server" Text="Instrument No">
                                                                                            </dxe:ASPxLabel>
                                                                                        </td>
                                                                                        <td class="Ecoheadtxt" style="text-align: left">
                                                                                            <asp:TextBox ID="txtChequeNo" runat="server" Width="300px" Text='<%#Bind("CheckNo") %>'> </asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="Ecoheadtxt" style="width: 36%">
                                                                                            <dxe:ASPxLabel ID="ASPxLabel10" runat="server" Text="Deposit Status">
                                                                                            </dxe:ASPxLabel>
                                                                                        </td>
                                                                                        <td class="Ecoheadtxt" style="text-align: left">
                                                                                            <dxe:ASPxComboBox ID="RdDStatus" runat="server" ValueType="System.String" Value='<%# Bind("status") %>'
                                                                                                Width="302px" SelectedIndex="0">
                                                                                                <Items>
                                                                                                    <dxe:ListEditItem Text="Cleared" Value="0" />
                                                                                                    <dxe:ListEditItem Text="Not Cleared" Value="1" />
                                                                                                </Items>
                                                                                                <ButtonStyle Width="13px">
                                                                                                </ButtonStyle>
                                                                                            </dxe:ASPxComboBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="text-align: right;">
                                                                                            <dxe:ASPxButton ID="btnUpdate" runat="server" Text="Update" ToolTip="Update data"
                                                                                                Height="18px" Width="88px" AutoPostBack="False">
                                                                                                <ClientSideEvents Click="function(s, e) {gridDeposit.UpdateEdit();}" />
                                                                                            </dxe:ASPxButton>
                                                                                        </td>
                                                                                        <td style="text-align: left;" colspan="2">
                                                                                            <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel data"
                                                                                                Height="18px" Width="88px" AutoPostBack="False">
                                                                                                <ClientSideEvents Click="function(s, e) {gridDeposit.CancelEdit();}" />
                                                                                            </dxe:ASPxButton>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td colspan="3" style="display: none">
                                                                                            <asp:TextBox ID="txtBankName_hidden" Text='<%#Bind("bankName") %>' runat="server"
                                                                                                BackColor="#DDECFE" BorderColor="#DDECFE" BorderStyle="None" ForeColor="#DDECFE"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </EditForm>
                                                            </Templates>
                                                            <SettingsEditing EditFormColumnCount="1" />
                                                            <ClientSideEvents EndCallback="function(s,e){InitialShow(s.cpSelect);}" />
                                                        </dxwgv:ASPxGridView>
                                                    </td>
                                                </tr>
                                            </table>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Remarks" Text="Remarks">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Education" Text="Education">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Trad. Prof." Text="Trad.Prof">
                                <%--<TabTemplate ><span style="font-size:x-small">Trad.Prof</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>--%>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="FamilyMembers" Text="Family">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                 <dxtc:TabPage Name="Subscription" Text="Subscription">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <%--New Work 30-12-2021--%>
                                <dxtc:TabPage Name="Nominee">
                                    <TabTemplate>
                                        <span style="font-size: x-small;color:Blue;font-weight:bold">Nominee</span>&nbsp;<span style="color: Red;">*</span>
                                    </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <%--End of New Work 30-12-2021--%>
                            </TabPages>
                            <%--New work Contact_Nominee(Tab14) added 30-12-2021--%>
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
	                                            var Tab9 = page.GetTab(9);
	                                            var Tab10 = page.GetTab(10);
	                                            var Tab11 = page.GetTab(11);
	                                            var Tab12 = page.GetTab(12);
	                                            var Tab13=page.GetTab(13);
	                                            var Tab14=page.GetTab(14);
	                                            
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
	                                            else if(activeTab == Tab9)
	                                            {
	                                                disp_prompt('tab9');
	                                            }
	                                            else if(activeTab == Tab10)
	                                            {
	                                                disp_prompt('tab10');
	                                            }
	                                            else if(activeTab == Tab11)
	                                            {
	                                                disp_prompt('tab11');
	                                            }
	                                            else if(activeTab == Tab12)
	                                            {
	                                                disp_prompt('tab12');
	                                            }                                         
                                                else if(activeTab == Tab13)
	                                            {
	                                               disp_prompt('tab13');
	                                            }
	                                            else if(activeTab == Tab14)
	                                            {
	                                               disp_prompt('tab14');
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
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlBpDeposit" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>"
                DeleteCommand="delete from tbl_trans_BPDeposit where id=@id" SelectCommand="select id,payment_R_Number as RNumber,cast(ReceiveDate as datetime) as Receive1,cast(DOI as datetime) as DOI1,deposit_status as status,case deposit_status when '0' then 'Cleared' else 'Not Cleared' end as Status1,case ReceiveDate when '01/01/1900 12:00:00 AM' then 'N/A' else convert(varchar(12),ReceiveDate,113) end as ReceiveDate ,amount as Amount,mode as Mode,branchname as BranchName,case DOI when '01/01/1900 12:00:00 AM' then 'N/A' else convert(varchar(12),DOI,113) end as DOI,chkNo as CheckNo,bankName,case bankName when null then 'N/A' else (select bnk_bankName from tbl_master_Bank where bnk_internalid=tbl_trans_BPDeposit.bankName)  end as BkName,AcNoName from tbl_trans_BPDeposit where cnt_internalId=@KeyVal_InternalID"
                InsertCommand="insert into tbl_trans_BPDeposit(cnt_internalId,amount,mode,bankName,branchname,DOI,ReceiveDate,chkNo,deposit_status,payment_R_Number,AcNoName,CreateDate,CreateUser) values(@cnt_internalId,@Amount,@Mode,@BkName,@BranchName,@DOI1,@Receive1,@CheckNo,@status,@RNumber,@AcNoName,getdate(),@userid)"
                UpdateCommand="update tbl_trans_BPDeposit set amount=@Amount,mode=@Mode,bankName=@BkName,branchname=@BranchName,DOI=@DOI1,ReceiveDate=@Receive1,chkNo=@CheckNo,deposit_status=@status,payment_R_Number=@RNumber,AcNoName=@AcNoName,LastModifyDate=getdate(),LastModifyUser=@userid where id=@id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="string" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="KeyVal_InternalID" SessionField="KeyVal_InternalID" Type="string" />
                </SelectParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="cnt_internalId" SessionField="KeyVal_InternalID" Type="string" />
                    <asp:Parameter Name="Amount" Type="string" />
                    <asp:Parameter Name="Mode" Type="string" />
                    <asp:Parameter Name="BkName" Type="string" />
                    <asp:Parameter Name="BranchName" Type="string" />
                    <asp:Parameter Name="DOI1" Type="datetime" />
                    <asp:Parameter Name="Receive1" Type="string" />
                    <asp:Parameter Name="CheckNo" Type="string" />
                    <asp:Parameter Name="status" Type="string" />
                    <asp:Parameter Name="RNumber" Type="string" />
                    <asp:Parameter Name="AcNoName" Type="string" />
                    <asp:SessionParameter Name="userid" SessionField="userid" Type="string" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Amount" Type="string" />
                    <asp:Parameter Name="Mode" Type="string" />
                    <asp:Parameter Name="BkName" Type="string" />
                    <asp:Parameter Name="BranchName" Type="string" />
                    <asp:Parameter Name="DOI1" Type="string" />
                    <asp:Parameter Name="Receive1" Type="string" />
                    <asp:Parameter Name="CheckNo" Type="string" />
                    <asp:Parameter Name="status" Type="string" />
                    <asp:Parameter Name="RNumber" Type="string" />
                    <asp:Parameter Name="AcNoName" Type="string" />
                    <asp:SessionParameter Name="userid" SessionField="userid" Type="string" />
                    <asp:Parameter Name="id" Type="string" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
