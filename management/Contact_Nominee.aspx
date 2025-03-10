<%@ page language="C#" autoeventwireup="true" inherits="management_Contact_Nominee, App_Web_ptes6n28" %>
    
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
    
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
        Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Contact_Nominee</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js">
   
    </script>

    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

    <script language="javascript" type="text/javascript">
    
    function SignOff()
    {
    window.parent.SignOff()
    }
    
    function PageLoad()
    {
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
        document.location.href="Contact_Deposit.aspx"; 
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
         else if(name=="tab14")
        {
             document.location.href="Contact_Nominee.aspx";
        }
    }

    </script>

    <!--___________________________________________________________________________-->
    <!--___________________These files are for List Items__________________________-->

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <%--<script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>--%>

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
    <form id="form1" runat="server" autocomplete="off">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="14" ClientInstanceName="page"
                        Font-Size="10px" OnActiveTabChanged="ASPxPageControl1_ActiveTabChanged">
                        <TabPages>
                            <dxtc:TabPage Name="General">
                                <TabTemplate>
                                    <span style="font-size: x-small">General</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="CorresPondence">
                                <TabTemplate>
                                    <span style="font-size: x-small">CorresPondence</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="BankDetails">
                                <TabTemplate>
                                    <span style="font-size: x-small">Bank</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="DPDetails">
                                <TabTemplate>
                                    <span style="font-size: x-small">DP</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Documents">
                                <TabTemplate>
                                    <span style="font-size: x-small">Documents</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Registration">
                                <TabTemplate>
                                    <span style="font-size: x-small">Registration</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Other">
                                <TabTemplate>
                                    <span style="font-size: x-small">Other</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
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
                            <dxtc:TabPage Name="Deposit">
                                <TabTemplate>
                                    <span style="font-size: x-small">Deposit</span>
                                </TabTemplate>
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
                            <dxtc:TabPage Name="Education" Text="Education">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Trad. Prof." Text="Trad.Prof">
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
                            <dxtc:TabPage Name="Nominee">
                                <TabTemplate>
                                    <span style="font-size: x-small;color:Blue;font-weight:bold">Nominee</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                        <table class="TableMain100">
                                            <tr>
                                                <td style="width: 961px">
                                                    <asp:Panel ID="Panel1" runat="server" BorderColor="White" BorderWidth="2px" Width="100%">
                                                        <table class="TableMain100">
                                                            <%--New work 16/05/2024--%>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="                         " Font-Size="10px" ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="color:Blue">
                                                                    <asp:CheckBox runat="server" ID="chkOptOutNominee" Checked="false" TabIndex="1" AutoPostBack="true" OnCheckedChanged="ChckedChangedOptOutNominee" />
                                                                    <asp:Label ID="lblOptOutNominee" runat="server" Text="Opted Out of Nomination ?" Font-Size="10px" ForeColor="Blue" Width="150px"></asp:Label>                                                                    
                                                                </td>
                                                            </tr>
                                                            <%--End of New work 16/05/2024--%>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="lblOptNominee" runat="server" Text="Nomination Opted for: " Font-Size="10px" ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <%--<td style="width: 64px">--%>
                                                                    <%--<dxe:ASPxLabel ID="lblNominee1" runat="server" Text="Details of 1st Nominee" Font-Size="10px"
                                                                        ForeColor="Blue" Width="190px">
                                                                    </dxe:ASPxLabel>--%>
                                                                    <%--<asp:Label ID="lblNominee1" runat="server" Text="Details of 1st Nominee" ForeColor="Blue" Font-Size="10px" Width="190px"></asp:Label>
                                                                    <asp:CheckBox runat="server" ID="chkNominee1" Checked="false" Text="Details of 1st Nominee" ForeColor="Blue" Font-Size="10px" TabIndex="37" AutoPostBack="true" OnCheckedChanged="ChckedChangedNominee1" />
                                                                </td>--%>                                                                
                                                                <td style="color:Blue">
                                                                    <asp:CheckBox runat="server" ID="chkNominee1" Checked="false" TabIndex="1" AutoPostBack="true" OnCheckedChanged="ChckedChangedNominee1" />
                                                                    <asp:Label ID="lblNominee1" runat="server" Text="Details of 1st Nominee" ForeColor="Blue"></asp:Label>
                                                                </td>
                                                                <td style="color:Blue">
                                                                    <asp:CheckBox runat="server" ID="chkNominee2" Checked="false" TabIndex="27" AutoPostBack="true" OnCheckedChanged="ChckedChangedNominee2" />
                                                                    <asp:Label ID="lblNominee2" runat="server" Text="Details of 2nd Nominee" ForeColor="Blue"></asp:Label>
                                                                </td>
                                                                <td style="color:Blue">
                                                                    <asp:CheckBox runat="server" ID="chkNominee3" Checked="false" TabIndex="53" AutoPostBack="true" OnCheckedChanged="ChckedChangedNominee3" />
                                                                    <asp:Label ID="lblNominee3" runat="server" Text="Details of 3rd Nominee" ForeColor="Blue"></asp:Label>
                                                                </td>
                                                             </tr>
                                                             <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="lblNomineeName" runat="server" Text="Name of the nominee(s) (Mr./Ms.)" Font-Size="10px"
                                                                        ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 164px;">
                                                                    <dxe:ASPxTextBox ID="txtNomenee1" runat="server" TabIndex="2" ClientEnabled="false" Width="160px" MaxLength="200">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 164px;">
                                                                    <dxe:ASPxTextBox ID="txtNomenee2" runat="server" TabIndex="28" ClientEnabled="false" Width="160px" MaxLength="200">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 166px;">
                                                                    <dxe:ASPxTextBox ID="txtNomenee3" runat="server" Width="160px" TabIndex="54" ClientEnabled="false" MaxLength="200">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="lblShareNominee" runat="server" Text="Share of each Nominee(Equally [If not equally, please specify percentage])" Font-Size="10px"
                                                                        Width="200px" ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtShareNominee1" runat="server" TabIndex="3" ClientEnabled="false" Width="160px" MaxLength="6" ClientInstanceName="CtxtShareNominee1">
                                                                        <MaskSettings Mask="&lt;0..999&gt;.&lt;00..99&gt;" />
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtShareNominee2" runat="server" TabIndex="29" ClientEnabled="false" Width="160px" MaxLength="100" ClientInstanceName="CtxtShareNominee2">
                                                                        <MaskSettings Mask="&lt;0..999&gt;.&lt;00..99&gt;" />
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtShareNominee3" runat="server" TabIndex="55" ClientEnabled="false" Width="160px" MaxLength="100" ClientInstanceName="CtxtShareNominee3">
                                                                        <MaskSettings Mask="&lt;0..999&gt;.&lt;00..99&gt;" />
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 76px">
                                                                    <dxe:ASPxLabel ID="lblNomineeRelation" runat="server" Text="Relationship With the Applicant ( If Any)" Font-Size="10px"
                                                                        ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="CmbNomineeRelation1" runat="server" TabIndex="4" Enabled="false" Width="160px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="CmbNomineeRelation2" runat="server" TabIndex="30" Enabled="false" Width="160px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="CmbNomineeRelation3" runat="server" TabIndex="56" Enabled="false" Width="160px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>  
                                                                <td style="width: 76px">
                                                                    <dxe:ASPxLabel ID="lblNomineeAddress" runat="server" Text="Address of Nominee(s)" Font-Size="10px"
                                                                        ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeAddress1" runat="server" TabIndex="5" ClientEnabled="false" Width="160px" MaxLength="120">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeAddress2" runat="server" TabIndex="31" ClientEnabled="false" Width="160px" MaxLength="120">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeAddress3" runat="server" TabIndex="57" ClientEnabled="false" Width="160px" MaxLength="120">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <td style="width: 68px">
                                                                    <dxe:ASPxLabel ID="lblNomineeCountry" runat="server" Text="Country" Font-Size="10px" ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 166px;">
                                                                    <asp:DropDownList ID="CmbNomineeCountry1" runat="server" AutoPostBack="true" Enabled="false" DataTextField="Country" DataValueField="cou_id" AppendDataBoundItems="true" 
                                                                        OnSelectedIndexChanged="CmbNomineeCountry1_SelectedIndexChanged" TabIndex="6" Width="160px">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                    <%--<asp:DropDownList ID="CmbNomineeCountry1" runat="server" DataTextField="Country" DataValueField="cou_id"
                                                                        BackColor="White" Font-Bold="false" ForeColor="Black" Font-Size="10px" Width="160px" Height="24px"
                                                                        AppendDataBoundItems="true">
                                                                    </asp:DropDownList>--%>
                                                                    <%--<dxcp:ASPxCallbackPanel runat="server" ID="CmbNomineeCountry1CallbackPanel" ClientInstanceName="cCmbNomineeCountry1" OnCallback="CmbNomineeCountry1_Callback">
                                                                        <ClientSideEvents                                                                        
                                                                         EndCallback="CmbNomineeCountry1_EndCallback">
                                                                        </ClientSideEvents>
                                                                    </dxcp:ASPxCallbackPanel>--%>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="CmbNomineeCountry2" runat="server" AutoPostBack="true" Enabled="false" DataTextField="Country" DataValueField="cou_id" AppendDataBoundItems="true" 
                                                                        OnSelectedIndexChanged="CmbNomineeCountry2_SelectedIndexChanged" TabIndex="32" Width="160px">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="CmbNomineeCountry3" runat="server" AutoPostBack="true" Enabled="false" DataTextField="Country" DataValueField="cou_id" AppendDataBoundItems="true" 
                                                                        OnSelectedIndexChanged="CmbNomineeCountry3_SelectedIndexChanged" TabIndex="58" Width="160px">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <td style="width: 61px">
                                                                    <dxe:ASPxLabel ID="lblNomineeState" runat="server" Text="State" Font-Size="10px" Width="200px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 166px;">
                                                                    <asp:DropDownList ID="cmbNomineeState1" runat="server" AutoPostBack="true" Enabled="false" DataTextField="state" 
                                                                        DataValueField="id" AppendDataBoundItems="true" 
                                                                        OnSelectedIndexChanged="cmbNomineeState1_SelectedIndexChanged" TabIndex="7" Width="160px">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="cmbNomineeState2" runat="server" AutoPostBack="true" Enabled="false" DataTextField="state" 
                                                                        DataValueField="id" AppendDataBoundItems="true" 
                                                                        OnSelectedIndexChanged="cmbNomineeState2_SelectedIndexChanged" TabIndex="33" Width="160px">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="cmbNomineeState3" runat="server" AutoPostBack="true" Enabled="false" DataTextField="state" 
                                                                        DataValueField="id" AppendDataBoundItems="true" 
                                                                        OnSelectedIndexChanged="cmbNomineeState3_SelectedIndexChanged" TabIndex="59" Width="160px">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="lblNomineeCity" runat="server" Text="City" Font-Size="10px" Width="200px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 166px;">
                                                                    <asp:DropDownList ID="cmbNomineeCity1" runat="server" DataTextField="City" Enabled="false" 
                                                                        DataValueField="city_id" AppendDataBoundItems="true" TabIndex="8" Width="160px">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="cmbNomineeCity2" runat="server" DataTextField="City" Enabled="false" 
                                                                        DataValueField="city_id" AppendDataBoundItems="true" TabIndex="34" Width="160px">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="cmbNomineeCity3" runat="server" DataTextField="City" Enabled="false" 
                                                                        DataValueField="city_id" AppendDataBoundItems="true" TabIndex="60" Width="160px">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="lblNomineePIN" runat="server" Text="PIN Code" Font-Size="10px" ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineePIN1" runat="server" TabIndex="9" ClientEnabled="false" Width="160px" MaxLength="12">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineePIN2" runat="server" TabIndex="35" ClientEnabled="false" Width="160px" MaxLength="12">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineePIN3" runat="server" TabIndex="61" ClientEnabled="false" Width="160px" MaxLength="12">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="lblNomineeMobPh" runat="server" Text="Mobile / Telephone No. of nominee(s)" Font-Size="10px" ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMobPh1" runat="server" TabIndex="10" ClientEnabled="false" Width="160px" MaxLength="20">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMobPh2" runat="server" TabIndex="36" ClientEnabled="false" Width="160px" MaxLength="20">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMobPh3" runat="server" TabIndex="62" ClientEnabled="false" Width="160px" MaxLength="20">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="lblNomineeEmail" runat="server" Text="Email ID of nominee(s)" Font-Size="10px" ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeEmail1" runat="server" TabIndex="11" ClientEnabled="false" Width="160px" MaxLength="100">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeEmail2" runat="server" TabIndex="37" ClientEnabled="false" Width="160px" MaxLength="100">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeEmail3" runat="server" TabIndex="63" ClientEnabled="false" Width="160px" MaxLength="100">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="lblNomineeID" runat="server" Text="Nominee Identification details – [Please tick any one of following and provide details of same]" Font-Size="10px" ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="CmbNomineeID1" runat="server" TabIndex="12" Enabled="false" Width="160px">
                                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                        <asp:ListItem Value="1">Photograph & Signature</asp:ListItem>
                                                                        <asp:ListItem Value="2">PAN</asp:ListItem>
                                                                        <asp:ListItem Value="3">Aadhaar</asp:ListItem>
                                                                        <asp:ListItem Value="4">Saving Bank account no.</asp:ListItem>
                                                                        <asp:ListItem Value="5">Proof of Identity</asp:ListItem>
                                                                        <asp:ListItem Value="6">Demat Account ID</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="CmbNomineeID2" runat="server" TabIndex="38" Enabled="false" Width="160px">
                                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                        <asp:ListItem Value="1">Photograph & Signature</asp:ListItem>
                                                                        <asp:ListItem Value="2">PAN</asp:ListItem>
                                                                        <asp:ListItem Value="3">Aadhaar</asp:ListItem>
                                                                        <asp:ListItem Value="4">Saving Bank account no.</asp:ListItem>
                                                                        <asp:ListItem Value="5">Proof of Identity</asp:ListItem>
                                                                        <asp:ListItem Value="6">Demat Account ID</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="CmbNomineeID3" runat="server" TabIndex="64" Enabled="false" Width="160px">
                                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                        <asp:ListItem Value="1">Photograph & Signature</asp:ListItem>
                                                                        <asp:ListItem Value="2">PAN</asp:ListItem>
                                                                        <asp:ListItem Value="3">Aadhaar</asp:ListItem>
                                                                        <asp:ListItem Value="4">Saving Bank account no.</asp:ListItem>
                                                                        <asp:ListItem Value="5">Proof of Identity</asp:ListItem>
                                                                        <asp:ListItem Value="6">Demat Account ID</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="lblBlank1" runat="server" Text="" Font-Size="10px" ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeID1" runat="server" TabIndex="13" ClientEnabled="false" Width="160px" MaxLength="50">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeID2" runat="server" TabIndex="39" ClientEnabled="false" Width="160px" MaxLength="50">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeID3" runat="server" TabIndex="65" ClientEnabled="false" Width="160px" MaxLength="50">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="lblNomineeMinor" runat="server" Text="To be filled only if nominee(s) is a minor:" Font-Size="10px" ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="color:Blue">
                                                                    <%--<dxe:ASPxLabel ID="lblNomineeMinor1" runat="server" Text="1st Minor" ForeColor="Blue"></dxe:ASPxLabel>
                                                                    <asp:CheckBox ID="chkNomineeMinor1" runat="server" TabIndex="37" />--%>
                                                                    <%--<dxe:ASPxCheckBox runat="server" ID="chkNomineeMinor1" Checked="false" AutoPostBack="true" ClientEnabled="true" Text="1st Minor" TabIndex="37">
                                                                        <ClientSideEvents CheckedChanged="CheckNomineeMinor1" />
                                                                    </dxe:ASPxCheckBox>--%>
                                                                    <asp:Label ID="lblNomineeMinor1" runat="server" Text="1st Minor" ForeColor="Blue"></asp:Label>
                                                                    <asp:CheckBox runat="server" ID="chkNomineeMinor1" Checked="false" TabIndex="14" AutoPostBack="true" OnCheckedChanged="ChckedChangedNomineeMinor1" />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblNomineeMinor2" runat="server" Text="2nd Minor" ForeColor="Blue"></asp:Label>
                                                                    <asp:CheckBox runat="server" ID="chkNomineeMinor2" Checked="false" TabIndex="40" AutoPostBack="true" OnCheckedChanged="ChckedChangedNomineeMinor2" />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblNomineeMinor3" runat="server" Text="3rd Minor" ForeColor="Blue"></asp:Label>
                                                                    <asp:CheckBox runat="server" ID="chkNomineeMinor3" Checked="false" TabIndex="66" AutoPostBack="true" OnCheckedChanged="ChckedChangedNomineeMinor3" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 76px">
                                                                    <dxe:ASPxLabel ID="lblNomineeMinorDOB" runat="server" Text="Date of Birth {in case of minor nominee(s)}" Font-Size="10px" ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 164px;">
                                                                    <dxe:ASPxDateEdit ID="txtNomineeMinorDOB1" runat="server" ClientEnabled="false" Width="156px" EditFormat="Custom" EditFormatString="dd-MM-yyyy" ClientInstanceName="CtxtNomineeMinorDOB1"
                                                                        UseMaskBehavior="True" TabIndex="15">
                                                                        <ButtonStyle Width="13px">
                                                                        </ButtonStyle>
                                                                    </dxe:ASPxDateEdit>
                                                                </td>
                                                                <td style="text-align: left; width: 164px;">
                                                                    <dxe:ASPxDateEdit ID="txtNomineeMinorDOB2" runat="server" ClientEnabled="false" Width="156px" EditFormat="Custom" EditFormatString="dd-MM-yyyy" ClientInstanceName="CtxtNomineeMinorDOB2"
                                                                        UseMaskBehavior="True" TabIndex="41">
                                                                        <ButtonStyle Width="13px">
                                                                        </ButtonStyle>
                                                                    </dxe:ASPxDateEdit>
                                                                </td>
                                                                <td style="text-align: left; width: 164px;">
                                                                    <dxe:ASPxDateEdit ID="txtNomineeMinorDOB3" runat="server" ClientEnabled="false" Width="156px" EditFormat="Custom" EditFormatString="dd-MM-yyyy" ClientInstanceName="CtxtNomineeMinorDOB3"
                                                                        UseMaskBehavior="True" TabIndex="67">
                                                                        <ButtonStyle Width="13px">
                                                                        </ButtonStyle>
                                                                    </dxe:ASPxDateEdit>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 76px">
                                                                    <dxe:ASPxLabel ID="lblNomineeMinorGurdianName" runat="server" Text="Name of Guardian (Mr./Ms.) {in case of minor nominee(s) }" Font-Size="10px" ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorGurdianName1" runat="server" ClientEnabled="false" TabIndex="16" Width="160px" MaxLength="200" ClientInstanceName="CtxtNomineeMinorGurdianName1">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorGurdianName2" runat="server" ClientEnabled="false" TabIndex="42" Width="160px" MaxLength="200" ClientInstanceName="CtxtNomineeMinorGurdianName2">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorGurdianName3" runat="server" ClientEnabled="false" TabIndex="68" Width="160px" MaxLength="200" ClientInstanceName="CtxtNomineeMinorGurdianName3">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>  
                                                                <td style="width: 76px">
                                                                    <dxe:ASPxLabel ID="lblNomineeMinorAddress" runat="server" Text="Address of Guardian(s)" Font-Size="10px"
                                                                        ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorAddress1" runat="server" ClientEnabled="false" TabIndex="17" Width="160px" MaxLength="120">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorAddress2" runat="server" ClientEnabled="false" TabIndex="43" Width="160px" MaxLength="120">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorAddress3" runat="server" ClientEnabled="false" TabIndex="69" Width="160px" MaxLength="120">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <td style="width: 68px">
                                                                    <dxe:ASPxLabel ID="lblNomineeMinorCountry" runat="server" Text="Country" Font-Size="10px" ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 166px;">
                                                                    <asp:DropDownList ID="cmbNomineeMinorCountry1" runat="server" AutoPostBack="true" DataTextField="Country" DataValueField="cou_id" AppendDataBoundItems="true" 
                                                                        OnSelectedIndexChanged="cmbNomineeMinorCountry1_SelectedIndexChanged" TabIndex="18" Width="160px" Enabled="false">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="cmbNomineeMinorCountry2" runat="server" AutoPostBack="true" DataTextField="Country" DataValueField="cou_id" AppendDataBoundItems="true" 
                                                                        OnSelectedIndexChanged="cmbNomineeMinorCountry2_SelectedIndexChanged" TabIndex="44" Width="160px" Enabled="false">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="cmbNomineeMinorCountry3" runat="server" AutoPostBack="true" DataTextField="Country" DataValueField="cou_id" AppendDataBoundItems="true" 
                                                                        OnSelectedIndexChanged="cmbNomineeMinorCountry3_SelectedIndexChanged" TabIndex="70" Width="160px" Enabled="false">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <td style="width: 61px">
                                                                    <dxe:ASPxLabel ID="lblNomineeMinorState" runat="server" Text="State" Font-Size="10px" Width="200px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 166px;">
                                                                    <asp:DropDownList ID="cmbNomineeMinorState1" runat="server" AutoPostBack="true" DataTextField="state" DataValueField="id" AppendDataBoundItems="true" Enabled="false"
                                                                        OnSelectedIndexChanged="cmbNomineeMinorState1_SelectedIndexChanged" TabIndex="19" Width="160px">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="cmbNomineeMinorState2" runat="server" AutoPostBack="true" DataTextField="state" DataValueField="id" AppendDataBoundItems="true" Enabled="false"
                                                                        OnSelectedIndexChanged="cmbNomineeMinorState2_SelectedIndexChanged" TabIndex="45" Width="160px">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="cmbNomineeMinorState3" runat="server" AutoPostBack="true" DataTextField="state" DataValueField="id" AppendDataBoundItems="true" Enabled="false"
                                                                        OnSelectedIndexChanged="cmbNomineeMinorState3_SelectedIndexChanged" TabIndex="71" Width="160px">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="lblNomineeMinorCity" runat="server" Text="City" Font-Size="10px" Width="200px"
                                                                        ForeColor="Blue">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 166px;">
                                                                    <asp:DropDownList ID="cmbNomineeMinorCity1" runat="server" DataTextField="City" DataValueField="city_id" AppendDataBoundItems="true" TabIndex="20" Width="160px" Enabled="false">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="cmbNomineeMinorCity2" runat="server" DataTextField="City" DataValueField="city_id" AppendDataBoundItems="true" TabIndex="46" Width="160px" Enabled="false">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="cmbNomineeMinorCity3" runat="server" DataTextField="City" DataValueField="city_id" AppendDataBoundItems="true" TabIndex="72" Width="160px" Enabled="false">
                                                                        <%--<asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="lblNomineeMinorPIN" runat="server" Text="PIN Code" Font-Size="10px" ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorPIN1" runat="server" TabIndex="21" Width="160px" ClientEnabled="False" MaxLength="20">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorPIN2" runat="server" TabIndex="47" Width="160px" ClientEnabled="False" MaxLength="20">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorPIN3" runat="server" TabIndex="73" Width="160px" ClientEnabled="False" MaxLength="20">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="lblNomineeMinorMobPh" runat="server" Text="Mobile / Telephone No. of Guardian(s)" Font-Size="10px" ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorMobPh1" runat="server" TabIndex="22" Width="160px" ClientEnabled="False" MaxLength="20">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorMobPh2" runat="server" TabIndex="48" Width="160px" ClientEnabled="False" MaxLength="20">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorMobPh3" runat="server" TabIndex="74" Width="160px" ClientEnabled="False" MaxLength="20">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="lblNomineeMinorEmail" runat="server" Text="Email ID of Guardian(s)" Font-Size="10px" ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorEmail1" runat="server" TabIndex="23" Width="160px" ClientEnabled="False" MaxLength="100">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorEmail2" runat="server" TabIndex="49" Width="160px" ClientEnabled="False" MaxLength="100">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorEmail3" runat="server" TabIndex="75" Width="160px" ClientEnabled="False" MaxLength="100">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 76px">
                                                                    <dxe:ASPxLabel ID="lblNomineeMinorRelation" runat="server" Text="Relationship of Guardian with nominee" Font-Size="10px"
                                                                        ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="CmbNomineeMinorRelation1" runat="server" TabIndex="24" Width="160px" Enabled="false">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="CmbNomineeMinorRelation2" runat="server" TabIndex="50" Width="160px" Enabled="false">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="CmbNomineeMinorRelation3" runat="server" TabIndex="76" Width="160px" Enabled="false">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="lblNomineeMinorGurdianID" runat="server" Text="Guardian Identification details – [Please tick any one of following and provide details of same]" Font-Size="10px" ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="CmbNomineeMinorGurdianID1" runat="server" TabIndex="25" Width="160px" Enabled="false">
                                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                        <asp:ListItem Value="1">Photograph & Signature</asp:ListItem>
                                                                        <asp:ListItem Value="2">PAN</asp:ListItem>
                                                                        <asp:ListItem Value="3">Aadhaar</asp:ListItem>
                                                                        <asp:ListItem Value="4">Saving Bank account no.</asp:ListItem>
                                                                        <asp:ListItem Value="5">Proof of Identity</asp:ListItem>
                                                                        <asp:ListItem Value="6">Demat Account ID</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="CmbNomineeMinorGurdianID2" runat="server" TabIndex="51" Width="160px" Enabled="false">
                                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                        <asp:ListItem Value="1">Photograph & Signature</asp:ListItem>
                                                                        <asp:ListItem Value="2">PAN</asp:ListItem>
                                                                        <asp:ListItem Value="3">Aadhaar</asp:ListItem>
                                                                        <asp:ListItem Value="4">Saving Bank account no.</asp:ListItem>
                                                                        <asp:ListItem Value="5">Proof of Identity</asp:ListItem>
                                                                        <asp:ListItem Value="6">Demat Account ID</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <asp:DropDownList ID="CmbNomineeMinorGurdianID3" runat="server" TabIndex="77" Width="160px" Enabled="false">
                                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                        <asp:ListItem Value="1">Photograph & Signature</asp:ListItem>
                                                                        <asp:ListItem Value="2">PAN</asp:ListItem>
                                                                        <asp:ListItem Value="3">Aadhaar</asp:ListItem>
                                                                        <asp:ListItem Value="4">Saving Bank account no.</asp:ListItem>
                                                                        <asp:ListItem Value="5">Proof of Identity</asp:ListItem>
                                                                        <asp:ListItem Value="6">Demat Account ID</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 64px">
                                                                    <dxe:ASPxLabel ID="lblBlank2" runat="server" Text="" Font-Size="10px" ForeColor="Blue" Width="200px">
                                                                    </dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorGurdianID1" runat="server" TabIndex="26" Width="160px" MaxLength="50" ClientEnabled="False">
                                                                    <%--<ValidationSettings RequiredField-IsRequired="false" Display="None"></ValidationSettings>--%>
                                                                    <%--<ValidationSettings ValidationGroup="a"></ValidationSettings>--%>
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorGurdianID2" runat="server" TabIndex="52" Width="160px" MaxLength="50" ClientEnabled="False">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="text-align: left; width: 163px;">
                                                                    <dxe:ASPxTextBox ID="txtNomineeMinorGurdianID3" runat="server" TabIndex="78" Width="160px" MaxLength="50" ClientEnabled="False">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <%--<tr>
                                                                <td colspan="5" style="text-align: right;">--%>
                                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNomineeMinorGurdianID1"
                                                                        Display="Dynamic" ErrorMessage="Must Fill First Name" SetFocusOnError="True"
                                                                        ValidationGroup="a"></asp:RequiredFieldValidator>
                                                                </td>--%>
                                                                <%--<td colspan="4" style="text-align: right;">--%>
                                                                <%--</td>--%>
                                                            <%--</tr>--%>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
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
                <td>
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:HiddenField ID="hdReferenceBy" runat="server" />
                                <table>
                                    <tr>
                                        <td style="padding-right: 20px;">
                                            <dxe:ASPxButton ID="btnSave" runat="server" Text="Save" Width="80px" ClientInstanceName="cbtnSave" OnClick="btnSave_Click"
                                                ValidationGroup="a" TabIndex="79">
                                                 <%--<ClientSideEvents Click="function (s, e) {fn_btnValidate();}" />--%>
                                            </dxe:ASPxButton>
                                        </td>
                                        <td>
                                            <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" Width="80px" OnClick="btnCancel_Click"
                                                TabIndex="80">
                                            </dxe:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hdnRights" runat="server" />
        <asp:SqlDataSource ID="CountrySelect" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT cou_id, cou_country as Country FROM tbl_master_country order by cou_country">
        </asp:SqlDataSource>
    </form>
</body>
</html>
