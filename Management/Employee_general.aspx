<%@ page language="C#" autoeventwireup="true" inherits="management_Employee_general, App_Web_sggmuspu" debug="true" %>

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
    <title></title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
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
    <style type="text/css">
       a:hover {background:#ffffff; text-decoration:none;} /*BG color is a must for IE6*/
       a.tooltip span {display:none; padding:2px 3px; font-size:smaller; margin-left:1px; width:100px;}
       a.tooltip:hover span{display:inline; position:horizontal; background:#ffffff; border:1px solid #cccccc; color:#6c6c6c; width:100px}
    
    </style>
</head>
<body>

    <script language="javascript" type="text/javascript">
    
    function heightB()
    {
    alert("123");
    }
    
    function disp_prompt(name)
    {
         if ( name == "tab0")
        {
        //alert(name);
        document.location.href="Employee_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="Employee_Correspondence.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="Employee_BankDetails.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="Employee_DPDetails.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="Employee_Document.aspx"; 
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="Employee_FamilyMembers.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
        document.location.href="Employee_Registration.aspx"; 
        }
        else if ( name == "tab7")
        {
        //alert(name);
        document.location.href="Employee_GroupMember.aspx"; 
        }
        else if ( name == "tab8")
        {
        //alert(name);
        document.location.href="Employee_Employee.aspx"; 
        }
        else if ( name == "tab9")
        {
        //alert(name);
        document.location.href="Employee_EmployeeCTC.aspx"; 
        }
        else if ( name == "tab10")
        {
        //alert(name);
        document.location.href="Employee_Remarks.aspx"; 
        }
        else if ( name == "tab11")
        {
        //alert(name);
        document.location.href="Employee_Education.aspx"; 
        }
        else if ( name == "tab12")
        {
        //alert(name);
        document.location.href="Employee_Subscription.aspx"; 
        }
    }
    function FillValues(chk)
        {
           var sel = document.getElementById('ASPxPageControl1_LitSpokenLanguage');
           sel.value=chk;
        }
    function FillValues1(chk)
        {
           var sel = document.getElementById('ASPxPageControl1_LitWrittenLanguage');
           sel.value=chk;
        }    
   
    function CallList(obj1,obj2,obj3)
    {
        //alert('rrr');
        FieldName='ASPxPageControl1_cmbGender';
        var obj4=document.getElementById("ASPxPageControl1_cmbSource");
        var obj5=obj4.value;
        //alert(obj5);
        if(obj5 != '18')
        {
            ajax_showOptions(obj1,obj2,obj3,obj5);
        }
    }
    function AtTheTimePageLoad()
    {
        FieldName = 'ASPxPageControl1_cmbLegalStatus';
        //alert('22');
        document.getElementById("ASPxPageControl1_txtReferedBy_hidden").style.display='none';
    }
    function FreeHiddenField()
    {
        var hddn=document.getElementById("ASPxPageControl1_txtReferedBy_hidden");
        alert(hddn.value);
        hddn.value='';
        alert(hddn.value);
    }
    FieldName = 'ASPxPageControl1_cmbLegalStatus';
    </script>

    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="15px" ForeColor="Navy"
                            Width="819px" Height="18px"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="page"
                            Width="100%">
                            <TabPages>
                                <dxtc:TabPage Text="General" Name="General">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <table width="100%">
                                                <tr>
                                                    <td>
                                                        <table style="width: 100%; z-index: 101">
                                                            <tr>
                                                                <td class="Ecoheadtxt" style="width: 151px">
                                                                    Salutation
                                                                </td>
                                                                <td class="Ecoheadtxt" style="text-align: left; width: 214px;">
                                                                    <asp:DropDownList ID="CmbSalutation" runat="server" Width="170px" TabIndex="1">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="Ecoheadtxt" style="width: 100px">
                                                                    First Name
                                                                </td>
                                                                <td class="Ecoheadtxt" style="text-align: left; width: 197px;">
                                                                    <dxe:ASPxTextBox ID="txtFirstNmae" runat="server" Width="170px" TabIndex="2">
                                                                        <ValidationSettings ValidationGroup="a">
                                                                        </ValidationSettings>
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td class="Ecoheadtxt" style="width: 137px">
                                                                    Middle Name
                                                                </td>
                                                                <td class="Ecoheadtxt" style="text-align: left; width: 214px;">
                                                                    <dxe:ASPxTextBox ID="txtMiddleName" runat="server" Width="170px" TabIndex="3">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4" style="text-align: right; height: 1px">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstNmae"
                                                                        Display="Dynamic" ErrorMessage="Must Fill First Name" SetFocusOnError="True"
                                                                        ValidationGroup="a"></asp:RequiredFieldValidator>
                                                                </td>
                                                                <td colspan="2" style="text-align: right; height: 1px">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="Ecoheadtxt" style="width: 151px">
                                                                    Last Name
                                                                </td>
                                                                <td class="Ecoheadtxt" style="text-align: left; width: 214px;">
                                                                    <dxe:ASPxTextBox ID="txtLastName" runat="server" Width="170px" TabIndex="4">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td class="Ecoheadtxt" style="width: 100px">
                                                                    Employee ID
                                                                </td>
                                                                <td class="Ecoheadtxt" style="text-align: left; width: 197px;">
                                                                                                                                
                                                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                                                    <asp:UpdatePanel ID="UpdatePanel154" runat="server">
                                                                    <ContentTemplate>
                                                                  <dxe:ASPxTextBox ID="txtAliasName" runat="server" Width="170px" TabIndex="5">
                                                                    </dxe:ASPxTextBox>
                                                                      <asp:LinkButton ID="LinkButton1" runat="server"  OnClick="LinkButton1_Click"  style="color: #cc3300; text-decoration: underline; font-size: 8pt;">Make System Employee Code</asp:LinkButton>
                                                                    <br /><asp:Label ID="lblErr" Text="" runat="server"></asp:Label>
                                                                                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </td>
                                                                <td class="Ecoheadtxt" style="width: 137px">
                                                                    Branch
                                                                </td>
                                                                <td class="Ecoheadtxt" style="text-align: left; width: 214px;">
                                                                    <asp:DropDownList ID="cmbBranch" runat="server" Width="170px" TabIndex="6">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="Ecoheadtxt" style="width: 100px">
                                                                    Source
                                                                </td>
                                                                <td class="Ecoheadtxt" style="text-align: left; width: 214px;">
                                                                    <asp:DropDownList ID="cmbSource" runat="server" Width="170px" TabIndex="7">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="Ecoheadtxt" style="width: 143px">
                                                                    Refered By
                                                                </td>
                                                                <td class="Ecoheadtxt" style="text-align: left; width: 197px;">
                                                                    <asp:TextBox ID="txtReferedBy" runat="server" Width="165px" TabIndex="8"></asp:TextBox>
                                                                    <asp:TextBox ID="txtReferedBy_hidden" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td class="Ecoheadtxt" style="width: 137px">
                                                                    Marital Status
                                                                </td>
                                                                <td class="Ecoheadtxt" style="text-align: left; width: 214px;">
                                                                    <asp:DropDownList ID="cmbMaritalStatus" runat="server" Width="170px" TabIndex="9">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="Ecoheadtxt" style="width: 100px">
                                                                    Gender
                                                                </td>
                                                                <td class="Ecoheadtxt" style="text-align: left; width: 214px;">
                                                                    <asp:DropDownList ID="cmbGender" runat="server" Width="170px" TabIndex="10">
                                                                        <asp:ListItem Value="1">Male</asp:ListItem>
                                                                        <asp:ListItem Value="0">Female</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="Ecoheadtxt" style="width: 143px">
                                                                    D.O.B.
                                                                </td>
                                                                <td class="Ecoheadtxt" style="text-align: left; width: 197px;">
                                                                    <dxe:ASPxDateEdit ID="DOBDate" runat="server" DateOnError="Today" EditFormat="Custom"
                                                                        TabIndex="11">
                                                                    </dxe:ASPxDateEdit>
                                                                </td>
                                                                <td class="Ecoheadtxt" style="width: 137px">
                                                                    Anniversary Date
                                                                </td>
                                                                <td class="Ecoheadtxt" style="text-align: left; width: 214px;">
                                                                    <dxe:ASPxDateEdit ID="AnniversaryDate" runat="server" DateOnError="Today" EditFormat="Custom"
                                                                        TabIndex="12">
                                                                    </dxe:ASPxDateEdit>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="Ecoheadtxt" style="width: 100px">
                                                                    Legal Status
                                                                </td>
                                                                <td class="Ecoheadtxt" style="text-align: left; width: 214px;">
                                                                    <asp:DropDownList ID="cmbLegalStatus" runat="server" Width="170px" TabIndex="13">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 143px" class="Ecoheadtxt">
                                                                    Education
                                                                </td>
                                                                <td class="Ecoheadtxt" style="text-align: left; width: 197px;">
                                                                    <asp:DropDownList ID="cmbEducation" runat="server" Width="170px" TabIndex="14">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td id="Td1" class="Ecoheadtxt" runat="server" style="width: 137px">
                                                                    Profession
                                                                </td>
                                                                <td id="Td2" class="Ecoheadtxt" style="text-align: left; width: 214px;" runat="server">
                                                                    <asp:DropDownList ID="cmbProfession" runat="server" Width="170px" TabIndex="15">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr id="hide1" runat="server" visible="False">
                                                                <td id="Td3" class="Ecoheadtxt" runat="server" style="width: 100px">
                                                                    Organization
                                                                </td>
                                                                <td id="Td4" class="Ecoheadtxt" style="text-align: left; width: 214px;" runat="server">
                                                                    <dxe:ASPxTextBox ID="txtOrganization" runat="server" Width="170px" TabIndex="16">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td id="Td5" class="Ecoheadtxt" runat="server" style="width: 143px">
                                                                    Job Responsibility
                                                                </td>
                                                                <td id="Td6" class="Ecoheadtxt" style="text-align: left; width: 197px;" runat="server">
                                                                    <asp:DropDownList ID="cmbJobResponsibility" runat="server" Width="170px" TabIndex="17">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td id="Td7" class="Ecoheadtxt" runat="server" style="width: 137px">
                                                                    Designation
                                                                </td>
                                                                <td id="Td8" class="Ecoheadtxt" style="text-align: left; width: 214px;" runat="server">
                                                                    <asp:DropDownList ID="cmbDesignation" runat="server" Width="169px" TabIndex="18">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr id="hide2" runat="server" visible="False">
                                                                <td id="Td9" class="Ecoheadtxt" runat="server" style="width: 100px">
                                                                    Industry/Sector
                                                                </td>
                                                                <td id="Td10" class="Ecoheadtxt" runat="server" style="width: 214px; text-align: left;">
                                                                    <asp:DropDownList ID="cmbIndustry" runat="server" Width="170px" TabIndex="19">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td id="Td11" class="Ecoheadtxt" runat="server" style="width: 143px">
                                                                    Rating
                                                                </td>
                                                                <td id="Td12" class="Ecoheadtxt" style="text-align: left; width: 197px;" runat="server">
                                                                    <asp:DropDownList ID="cmbRating" runat="server" Width="170px" TabIndex="20">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr id="hide3" runat="server" visible="False">
                                                                <td id="Td13" class="Ecoheadtxt" runat="server" style="width: 151px">
                                                                    Contact Status
                                                                </td>
                                                                <td id="Td14" class="Ecoheadtxt" style="text-align: left; width: 214px;" runat="server">
                                                                    <asp:DropDownList ID="cmbContactStatus" runat="server" Width="170px" TabIndex="21">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td id="Td16" class="Ecoheadtxt" runat="server" style="width: 137px">
                                                                    Blood Group
                                                                </td>
                                                                <td id="Td17" class="Ecoheadtxt" style="text-align: left; width: 214px;" runat="server">
                                                                    <asp:DropDownList ID="cmbBloodgroup" runat="server" Width="54px" TabIndex="22">
                                                                        <asp:ListItem Value="N/A">N/A</asp:ListItem>
                                                                        <asp:ListItem Value="A+">A+</asp:ListItem>
                                                                        <asp:ListItem Value="A-">A-</asp:ListItem>
                                                                        <asp:ListItem Value="B+">B+</asp:ListItem>
                                                                        <asp:ListItem Value="B-">B-</asp:ListItem>
                                                                        <asp:ListItem Value="AB+">AB+</asp:ListItem>
                                                                        <asp:ListItem Value="AB-">AB-</asp:ListItem>
                                                                        <asp:ListItem Value="O+">O+</asp:ListItem>
                                                                        <asp:ListItem Value="O-">O-</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    &nbsp;&nbsp; Allow Web Login
                                                                    <asp:CheckBox ID="chkAllow" TextAlign="Left" runat="server" Width="17px" TabIndex="23" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr id="TrLang" runat="server">
                                                    <td id="Td15" runat="server" style="width: 845px">
                                                        <asp:Panel ID="Panel2" runat="server" Width="100%" BorderColor="White" BorderWidth="1px">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td>
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td colspan="2" style="text-align: center">
                                                                                    <span style="color: blue; font-size: medium">Language Proficiencies </span>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 50%; vertical-align: top">
                                                                                    <asp:Panel ID="PnlSpLAng" runat="server" Width="100%" BorderColor="White" BorderWidth="1px">
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td style="text-align: left; color: Blue; font-size: small">
                                                                                                    Can Speak
                                                                                                </td>
                                                                                                <td style="vertical-align: top" class="gridcellleft">
                                                                                                    <asp:TextBox ID="LitSpokenLanguage" runat="server" ForeColor="Maroon" BackColor="Transparent"
                                                                                                        BorderStyle="None" Width="309px" ReadOnly="True"></asp:TextBox>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td style="text-align: left; vertical-align: top; font-size: x-small; color: Red;">
                                                                                                    <a href="frmLanguages.aspx?id='<%=SpLanguage %>'&status=speak" onclick="window.open(this.href,'popupwindow','left=120,top=170,height=400,width=200,scrollbars=no,toolbar=no,location=center,menubar=no'); return false;"
                                                                                                        style="font-size: x-small; color: Red;" tabindex="24">click to add</a>
                                                                                                </td>
                                                                                                <td>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </asp:Panel>
                                                                                </td>
                                                                                <td style="width: 50%; vertical-align: top">
                                                                                    <asp:Panel ID="PnlWrLang" runat="server" Width="100%" BorderColor="White" BorderWidth="1px">
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td style="text-align: left; color: Blue; font-size: small">
                                                                                                    Can Write
                                                                                                </td>
                                                                                                <td style="vertical-align: top" class="gridcellleft">
                                                                                                    <asp:TextBox ID="LitWrittenLanguage" runat="server" ForeColor="Maroon" BackColor="Transparent"
                                                                                                        BorderStyle="None" Width="313px" ReadOnly="True"></asp:TextBox>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td style="text-align: left; vertical-align: top; font-size: x-small; color: Red;">
                                                                                                    <a href="frmLanguages.aspx?id='<%=WLanguage %>'&status=write" onclick="window.open(this.href,'popupwindow','left=120,top=170,height=400,width=200,scrollbars=no,toolbar=no,location=center,menubar=no'); return false;"
                                                                                                        style="color: Red; font-size: x-small;" tabindex="25">click to add</a>
                                                                                                </td>
                                                                                                <td>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </asp:Panel>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                        <asp:Label ID="lblmessage" runat="server" ForeColor="Red"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Text="CorresPondence" Name="CorresPondence">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="BankDetails" Text="Bank">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="DPDetails" Text="DP">
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
                                <dxtc:TabPage Name="FamilyMembers" Text="Family">
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
                                <dxtc:TabPage Name="GroupMember" Text="Group">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Employee" Text="Employee">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="EmployeeCTC" Text="CTC">
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
                                <dxtc:TabPage Name="Subscription" Text="Subscription">
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
	                                            var Tab9 = page.GetTab(9);
	                                            var Tab10 = page.GetTab(10);
	                                            var Tab11 = page.GetTab(11);
	                                            var Tab12 = page.GetTab(12);
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
                                    <asp:HiddenField ID="hdReferenceBy" runat="server" />
                                    <table>
                                        <tr>
                                            <td style="height: 43px">
                                                <dxe:ASPxButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="a"
                                                    TabIndex="26">
                                                </dxe:ASPxButton>
                                            </td>
                                            <td style="height: 43px">
                                            </td>
                                        </tr>
                                    </table>
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
