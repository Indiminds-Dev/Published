<%@ page language="C#" autoeventwireup="true" inherits="management_OutsourcingComp_general, App_Web_njtlujlb" %>

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
    <title>General</title>

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

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

    <script language="javascript" type="text/javascript">
   
    function disp_prompt(name)
    {
        if ( name == "tab0")
        {
        //alert(name);
        document.location.href="OutsourcingComp_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="OutsourcingComp_ContactPerson.aspx";         
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="OutsourcingComp_Correspondence.aspx";         
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="OutsourcingComp_BankDetails.aspx";         
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="OutsourcingComp_DPDetails.aspx";         
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="OutsourcingComp_Document.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
        document.location.href="OutsourcingComp_GroupMember.aspx"; 
        }
        
    }
        function CallList(obj1,obj2,obj3)
        {
            //alert('rrr');
            
            var obj4=document.getElementById("ASPxPageControl1_cmbSource");
            var obj5=obj4.value;
            //alert(obj5);
            ajax_showOptions(obj1,obj2,obj3,obj5);
        }
        FieldName = 'ASPxPageControl1_cmbLegalStatus';
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
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
                            Font-Size="10px">
                            <TabPages>
                                <dxtc:TabPage Text="General" Name="General">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <table class="TableMain100">
                                                <tr>
                                                    <td class="Ecoheadtxt">
                                                        <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Salutation">
                                                        </dxe:ASPxLabel>
                                                    </td>
                                                    <td class="Ecoheadtxt" style="text-align: left">
                                                        <asp:DropDownList ID="CmbSalutation" runat="server" Width="170px" TabIndex="1">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="Ecoheadtxt">
                                                        <dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="Name">
                                                        </dxe:ASPxLabel>
                                                    </td>
                                                    <td class="Ecoheadtxt" style="text-align: left">
                                                        <dxe:ASPxTextBox ID="txtFirstName" runat="server" Width="170px" TabIndex="2">
                                                            <ValidationSettings ValidationGroup="a">
                                                            </ValidationSettings>
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td class="Ecoheadtxt" style="width: 158px">
                                                        <dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="Code" Width="35px">
                                                        </dxe:ASPxLabel>
                                                    </td>
                                                    <td class="Ecoheadtxt" style="text-align: left">
                                                        <dxe:ASPxTextBox ID="txtCode" runat="server" Width="170px" TabIndex="3">
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" style="text-align: right; height: 1px">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName"
                                                            Display="Dynamic" ErrorMessage="Must Fill Name" SetFocusOnError="True" ValidationGroup="a"
                                                            Font-Bold="True"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td colspan="2" style="text-align: right; height: 1px">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCode"
                                                            Display="Dynamic" ErrorMessage="Code Required" Font-Bold="True" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Ecoheadtxt">
                                                        &nbsp;<dxe:ASPxLabel ID="ASPxLabel10" runat="server" Text="Branch" Width="59px">
                                                        </dxe:ASPxLabel>
                                                    </td>
                                                    <td class="Ecoheadtxt" style="text-align: left">
                                                        <asp:DropDownList ID="cmbBranch" runat="server" Width="170px" TabIndex="4">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="Ecoheadtxt">
                                                        &nbsp;<dxe:ASPxLabel ID="ASPxLabel13" runat="server" Text="Source">
                                                        </dxe:ASPxLabel>
                                                    </td>
                                                    <td class="Ecoheadtxt" style="text-align: left">
                                                        <asp:DropDownList ID="cmbSource" runat="server" Width="170px" TabIndex="5">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="Ecoheadtxt" style="width: 158px">
                                                        &nbsp;<dxe:ASPxLabel ID="ASPxLabel17" runat="server" Text="Refered By" Width="73px">
                                                        </dxe:ASPxLabel>
                                                    </td>
                                                    <td class="Ecoheadtxt" style="text-align: left">
                                                        <asp:TextBox ID="txtReferedBy" runat="server" TabIndex="6" Width="165px"></asp:TextBox><asp:TextBox
                                                            ID="txtReferedBy_hidden" runat="server" Visible="False"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Ecoheadtxt">
                                                        &nbsp;<dxe:ASPxLabel ID="ASPxLabel19" runat="server" Text="Contact Status" Width="95px">
                                                        </dxe:ASPxLabel>
                                                    </td>
                                                    <td class="Ecoheadtxt" style="text-align: left">
                                                        <asp:DropDownList ID="cmbContactStatus" runat="server" Width="170px" TabIndex="7">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="Ecoheadtxt">
                                                        <dxe:ASPxLabel ID="ASPxLabel20" runat="server" Text="Legal Status" Width="70px">
                                                        </dxe:ASPxLabel>
                                                    </td>
                                                    <td class="Ecoheadtxt">
                                                        <asp:DropDownList ID="cmbLegalStatus" runat="server" Width="170px" TabIndex="8">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="Ecoheadtxt" style="width: 158px">
                                                        <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Date Of Incoorporation" Width="140px">
                                                        </dxe:ASPxLabel>
                                                    </td>
                                                    <td class="Ecoheadtxt" style="text-align: left">
                                                        <dxe:ASPxDateEdit ID="DateOfIncoorporation" runat="server" EditFormat="Custom" DateOnError="Null"
                                                            TabIndex="9" UseMaskBehavior="True">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Ecoheadtxt">
                                                        &nbsp;</td>
                                                    <td class="Ecoheadtxt" style="text-align: left">
                                                        &nbsp;</td>
                                                    <td class="Ecoheadtxt">
                                                        &nbsp;</td>
                                                    <td class="Ecoheadtxt" style="text-align: left;">
                                                        &nbsp;
                                                    </td>
                                                    <td class="Ecoheadtxt" style="width: 158px">
                                                    </td>
                                                    <td class="Ecoheadtxt" style="text-align: right">
                                                        <table>
                                                            <tr>
                                                                <td style="height: 43px">
                                                                    <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                                              { %>
                                                                    <dxe:ASPxButton ID="btnSave" runat="server" Text="Save" ValidationGroup="a" TabIndex="10"
                                                                        OnClick="btnSave_Click">
                                                                    </dxe:ASPxButton>
                                                                    <%} %>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Text="Contact Person" Name="ContactPreson">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Text="CorresPondence" Name="CorresPondence">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
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
	                                            var Tab7 = page.GetTab(7);
	                                            
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
