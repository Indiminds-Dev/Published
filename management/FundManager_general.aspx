<%@ page language="C#" autoeventwireup="true" inherits="management_FundManager_general, App_Web__yen2upk" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Fund Manager</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script language="javascript" type="text/javascript">
        function SignOff()
        {
            window.parent.SignOff();
        }
        function disp_prompt(name)
        {
            if ( name == "tab0")
            {
                //document.location.href="FundManager_general.aspx"; 
            }
            if ( name == "tab1")
            {
                document.location.href="FundManager_Correspondence.aspx"; 
            }
        }
        function Validate()
        {
            var name=document.getElementById('ASPxPageControl1$txtFirstname').value;
            if(name=='')
            {
                alert('First Name Required !');
                return false;
            }
        }
    </script>
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="100%" ClientInstanceName="page"
                             
                             Font-Size="10px">
                            <TabPages>
                                <dxtc:TabPage Text="General" Name="General">
                                    <ContentCollection>
                                        <dxw:contentcontrol runat="server">
                                            <table style="width: 90%">
                                                <tr>
                                                    <td>
                                                        <table>
                                                            <tr>
                                                                <td class="EcoheadCon_" style="width: 76px">
                                                                    Salutation :
                                                                </td>
                                                                <td style="text-align: left; width: 225px;">
                                                                    <asp:DropDownList ID="drpSalutation" runat="server" Width="164px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 83px" class="EcoheadCon_">
                                                                    Name :
                                                                </td>
                                                                <td style="text-align: left; width: 202px;">
                                                                     <asp:TextBox ID="txtFirstname" runat="server" Width="160px" Font-Size="10px"></asp:TextBox>
                                                                </td>
                                                                <td style="width: 84px" class="EcoheadCon_">
                                                                    Short Name :
                                                                </td>
                                                                <td>
                                                                     <asp:TextBox ID="txtMiddleName" runat="server" Width="160px" Font-Size="10px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="EcoheadCon_" style="width: 76px">
                                                                    STEADY Code :
                                                                </td>
                                                                <td style="text-align: left; width: 225px;">
                                                                     <asp:TextBox ID="txtLastName" runat="server" Width="160px" Font-Size="10px"></asp:TextBox>
                                                                </td>
                                                                <td style="width: 83px" class="EcoheadCon_">
                                                                    Gender :
                                                                </td>
                                                                <td style="text-align: left; width: 202px;">
                                                                     <asp:DropDownList ID="drpGender" runat="server" Width="164px">
                                                                         <asp:ListItem Value="0">Male</asp:ListItem>
                                                                         <asp:ListItem Value="1">FeMale</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 84px" class="EcoheadCon_">
                                                                    Nationality :
                                                                </td>
                                                                <td style="text-align: left">
                                                                    <asp:DropDownList ID="drpNationality" runat="server" Width="164px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr> 
                                                            <tr>
                                                                <td class="EcoheadCon_" style="width: 76px">
                                                                    Legal Status :
                                                                </td>
                                                                <td style="text-align: left; width: 225px;">
                                                                     <asp:DropDownList ID="drpLegalStatus" runat="server" Width="164px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 83px" class="EcoheadCon_">
                                                                    DOB :
                                                                </td>
                                                                <td style="text-align: left; width: 202px;">
                                                                     <dxe:ASPxDateEdit ID="DOBDate" runat="server" EditFormat="Custom" UseMaskBehavior="true" Width="165px">
                                                                        <ButtonStyle Width="13px">
                                                                        </ButtonStyle>
                                                                    </dxe:ASPxDateEdit>
                                                                </td>
                                                                <td style="width: 84px" class="EcoheadCon_">
                                                                    
                                                                </td>
                                                                <td style="text-align: left">
                                                                    
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="6" style="text-align:center">
                                                                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnUpdate" Height="24px" Width="59px" OnClick="btnSave_Click" />
                                                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnUpdate"  Height="24px" Width="59px"/>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </dxw:contentcontrol>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Text="CorresPondence" Name="CorresPondence">
                                    <ContentCollection>
                                        <dxw:contentcontrol runat="server">
                                        </dxw:contentcontrol>
                                    </ContentCollection>
                                </dxtc:TabPage>
                            </TabPages>
                            <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                            if(activeTab == Tab0)
	                                            {
	                                                disp_prompt('tab0');
	                                            }
	                                            if(activeTab == Tab1)
	                                            {
	                                                disp_prompt('tab1');
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
            </table>
        </div>
    </form>
</body>
</html>
