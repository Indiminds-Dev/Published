<%@ page language="C#" autoeventwireup="true" inherits="management_Lead_general, App_Web_6bj03ldo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
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
    function ul()
    {
    window.opener.document.getElementById('iFrmInformation').setAttribute('src','CallUserInformation.aspx')  
    }
    function disp_prompt(name)
    {
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
        document.location.href="Lead_BankDetails.aspx"; 
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
        var obj4=document.getElementById("ASPxPageControl1_cmbSource");
        var obj5=obj4.value;
        //alert(obj5);
        ajax_showOptions(obj1,obj2,obj3,obj5);
        //alert(obj5);
        FieldName='ASPxPageControl1_cmbGender';
    }
    function AtTheTimePageLoad()
    {
        FieldName = 'ASPxPageControl1_cmbLegalStatus';
        
        document.getElementById("ASPxPageControl1_txtReferedBy_hidden").style.display='none';
    }
    function ul()
{
       window.opener.document.getElementById('iFrmInformation').setAttribute('src','CallUserInformation.aspx')
}
</script> 
    <title></title>
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
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <!--___________________These files are for datetime calander___________________-->
    <link type="text/css" rel="stylesheet" href="../CSS/dhtmlgoodies_calendar.css?random=20051112" media="screen" />
    <script type="text/javascript" src="../JSFUNCTION/dhtmlgoodies_calendar.js?random=20060118"></script>
    <!--___________________________________________________________________________-->
    <!--___________________These files are for List Items__________________________-->
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
	<script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script> 	
    <!--___________________________________________________________________________-->
    
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
 
    <form id="form1" runat="server">
    <div>
    <table class="TableMain100">
        <tr>
            <td>
                <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="page"  Font-Size="10px">
                <TabPages>
                    <dxtc:TabPage Text="General" Name="General"><ContentCollection>
                        <dxw:ContentControl runat="server">
                            
                             <table style="width:90%">
                                <tr>
                                    <td class="Ecoheadtxt" >
                                        <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Salutation" ></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left">
                                 
                                        <asp:DropDownList ID="CmbSalutation" runat="server"  Width="170px" TabIndex="1" >
                                        </asp:DropDownList>
                                        
                                    </td>
                                    <td class="Ecoheadtxt">
                                        <dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="First Name"></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left">
                                        <dxe:ASPxTextBox ID="txtFirstNmae" runat="server" Width="170px" TabIndex="2">
                                        </dxe:ASPxTextBox>
                                    
                                    </td>
                                    <td class="Ecoheadtxt" style="width: 153px">
                                        <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Middle Name"></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left">
                                        <dxe:ASPxTextBox ID="txtMiddleName" runat="server" Width="175px" TabIndex="3">
                                        </dxe:ASPxTextBox>
                                    
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: right; height:1px">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstNmae"
                                            Display="Dynamic" ErrorMessage="Must Fill First Name" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                    <td colspan="2" style="text-align: right; height:1px"></td>
                                </tr>
                                <tr>
                                    <td class="Ecoheadtxt" >
                                        <dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="Last Name"></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left">
                                        <dxe:ASPxTextBox ID="txtLastName" runat="server" Width="170px" TabIndex="4">
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td class="Ecoheadtxt">
                                        <dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="Short Name (Alias)" Width="119px"></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left"><dxe:ASPxTextBox ID="txtAliasName" runat="server" Width="170px" TabIndex="5">
                                    </dxe:ASPxTextBox>
                                    </td>
                                    <td class="Ecoheadtxt" >
                                        <dxe:ASPxLabel ID="ASPxLabel6" runat="server" Text="Profession"></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left">
                                    
                                        <asp:DropDownList ID="cmbProfession" runat="server"  Width="175px" TabIndex="6">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Ecoheadtxt" >
                                        <dxe:ASPxLabel ID="ASPxLabel7" runat="server" Text="Organization"></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left"><dxe:ASPxTextBox ID="txtOrganization" runat="server" Width="170px" TabIndex="7">
                                    </dxe:ASPxTextBox>
                                    </td>
                                    <td class="Ecoheadtxt">
                                        <dxe:ASPxLabel ID="ASPxLabel8" runat="server" Text="Job Responsibility"></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left">
                                    
                                        <asp:DropDownList ID="cmbJobResponsibility" runat="server"  Width="170px" TabIndex="8">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="Ecoheadtxt" >
                                        <dxe:ASPxLabel ID="ASPxLabel9" runat="server" Text="Designation"></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left">
                                     
                                        <asp:DropDownList ID="cmbDesignation" runat="server"  Width="175px" TabIndex="9">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="Ecoheadtxt" >
                                        <dxe:ASPxLabel ID="ASPxLabel10" runat="server" Text="Branch" Width="59px"></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left">
                                        
                                        <asp:DropDownList ID="cmbBranch" runat="server"  Width="170px" TabIndex="10">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="Ecoheadtxt">
                                        <dxe:ASPxLabel ID="ASPxLabel11" runat="server" Text="Industry/Sector"></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt">
                                     
                                        <asp:DropDownList ID="cmbIndustry" runat="server"  Width="170px" TabIndex="11">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="Ecoheadtxt" style="width: 153px">
                                        <dxe:ASPxLabel ID="ASPxLabel12" runat="server" Text="Client Id (UCC)" Width="98px"></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left"><dxe:ASPxTextBox ID="txtClentUcc" runat="server" Width="175px" TabIndex="12">
                                    </dxe:ASPxTextBox>
                                    
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Ecoheadtxt" >
                                        <dxe:ASPxLabel ID="ASPxLabel13" runat="server" Text="Source"></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left">
                                        
                                        <asp:DropDownList ID="cmbSource" runat="server"  Width="170px" TabIndex="13">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="Ecoheadtxt" >
                                        <dxe:ASPxLabel ID="ASPxLabel17" runat="server" Text="Refered By"></dxe:ASPxLabel>
                                    </td >
                                    <td class="Ecoheadtxt" style=" text-align: left;">
                                        <asp:TextBox ID="txtReferedBy" runat="server" TabIndex="14" Width="165px"></asp:TextBox>
                                        <asp:TextBox ID="txtReferedBy_hidden" runat="server" TabIndex="14" ></asp:TextBox>
                                    </td>
                                    <td class="Ecoheadtxt" >
                                        <dxe:ASPxLabel ID="ASPxLabel15" runat="server" Text="Rating"></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left">
                                      
                                        <asp:DropDownList ID="cmbRating" runat="server"  Width="175px" TabIndex="15">
                                        </asp:DropDownList>
                                    </td >
                                </tr>
                                <tr>
                                    <td class="Ecoheadtxt" >
                                        <dxe:ASPxLabel ID="ASPxLabel16" runat="server" Text="Marital Status" Width="88px"></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style=" text-align: left;">
                                       
                                        <asp:DropDownList ID="cmbMaritalStatus" runat="server"  Width="170px" TabIndex="16">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="Ecoheadtxt">
                                        <dxe:ASPxLabel ID="ASPxLabel14" runat="server" Text="Gender"></dxe:ASPxLabel>
                                    </td >
                                    <td class="Ecoheadtxt" style="text-align: left">
                                    <asp:DropDownList ID="cmbGender" runat="server"  Width="170px" TabIndex="17">
                                        <asp:ListItem Value="1">Male</asp:ListItem>
                                        <asp:ListItem Value="0">Female</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                     <td class="Ecoheadtxt">
                                        <dxe:ASPxLabel ID="ASPxLabel20" runat="server" Text="Legal Status"></dxe:ASPxLabel>
                                    </td >
                                    <td class="Ecoheadtxt" style="text-align: left">
                                       
                                        <asp:DropDownList ID="cmbLegalStatus" runat="server"  Width="170px" TabIndex="18">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Ecoheadtxt" >
                                        <dxe:ASPxLabel ID="ASPxLabel19" runat="server" Text="Contact Status" Width="95px"></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left">
                                        
                                        <asp:DropDownList ID="cmbContactStatus" runat="server"  Width="170px" TabIndex="19">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="Ecoheadtxt" >
                                        <dxe:ASPxLabel ID="ASPxLabel18" runat="server" Text="D.O.B."></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style=" text-align: left;">
                                        <dxe:ASPxDateEdit ID="txtDOB" runat="server" EditFormat="Custom"  UseMaskBehavior="True" TabIndex="20">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                        </dxe:ASPxDateEdit>
                                    </td >
                                    <td class="Ecoheadtxt" >
                                        <dxe:ASPxLabel ID="ASPxLabel21" runat="server" Text="Anniversary Date" Width="111px"></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left">                                        
                                        <dxe:ASPxDateEdit ID="txtAnniversary" runat="server" EditFormat="Custom"  UseMaskBehavior="True"  TabIndex="21">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                        </dxe:ASPxDateEdit>
                                    </td >
                                </tr>
                                <tr>
                                    <td style="width: 79px" class="Ecoheadtxt"><dxe:ASPxLabel ID="ASPxLabel22" runat="server" Text="Education">
                                    </dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left">
                                      
                                        <asp:DropDownList ID="cmbEducation" runat="server"  Width="170px" TabIndex="22">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="Ecoheadtxt">
                                         <dxe:ASPxLabel ID="ASPxLabel28" runat="server" Text="Blood Group"></dxe:ASPxLabel>
                                    </td>
                                    <td class="Ecoheadtxt">
                                                       <asp:DropDownList ID="cmbBloodgroup" runat="server"  Width="170px" TabIndex="23">
                                                            <asp:ListItem Value="A+">A+</asp:ListItem>
                                                            <asp:ListItem Value="A-">A-</asp:ListItem>
                                                            <asp:ListItem Value="B+">B+</asp:ListItem>
                                                            <asp:ListItem Value="B-">B-</asp:ListItem>
                                                            <asp:ListItem Value="AB+">AB+</asp:ListItem>
                                                            <asp:ListItem Value="AB-">AB-</asp:ListItem>
                                                            <asp:ListItem Value="O+">O+</asp:ListItem>
                                                            <asp:ListItem Value="O-">O-</asp:ListItem>
                                                    </asp:DropDownList>
                                                    </td>  
                                    <td style="width: 100%"  class="Ecoheadtxt">
                                    </td>
                                    <td></td>
                                </tr>
                            </table>   
                                 
                        
                        </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Text="CorresPondence" Name="CorresPondence"><ContentCollection>
                        <dxw:ContentControl runat="server"></dxw:ContentControl>
                        </ContentCollection>
                        </dxtc:TabPage>
                    <dxtc:TabPage Name="BankDetails" Text="Bank Details">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
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
                    <dxtc:TabPage Name="FamilyMembers" Text="Family Members">
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
                    <dxtc:TabPage Name="GroupMember" Text="Group Member">
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
                    <ClientSideEvents  ActiveTabChanged="function(s, e) {
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
	                                            
	                                            }">
                    </ClientSideEvents>
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
                            
                <table style="width:100%;">
                    <tr>
                        <td align="right" style="width: 843px" >
                            <table>
                            <tr>
                            <td style="height: 43px"><dxe:ASPxButton ID="btnSave" runat="server" Text="Save"  OnClick="btnSave_Click"  TabIndex="26" ></dxe:ASPxButton>
                            </td>
                            <td style="height: 43px"><dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel"  OnClick="btnCancel_Click" TabIndex="27" Visible="false">
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
    
    </div>
    
    
    </form>
</body>
</html>
