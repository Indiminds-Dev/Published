<%@ page language="C#" autoeventwireup="true" inherits="management_ProfBodies_general, App_Web_yq8u0p-o" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
        function disp_prompt(name)
        {
            if ( name == "tab0")
            {
            //alert(name);
            //document.location.href="ProfBodies_general.aspx"; 
            }
            if ( name == "tab1")
            {
            //alert(name);
            document.location.href="ProfBodies_correspondence.aspx";         
            }
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
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
                                                    <td class="Ecoheadtxt" style="width: 41%">
                                                        Name :
                                                    </td>
                                                    <td style="width: 186px">
                                                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="Ecoheadtxt">
                                                        Short Name :
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtShortName" runat="server" Width="163px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Ecoheadtxt" style="width: 41%">
                                                        REGN Number :
                                                    </td>
                                                    <td style="width: 186px">
                                                        <asp:TextBox ID="txtRegnNumber" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="Ecoheadtxt">
                                                        REGN Date :
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="txtRegndate" runat="server" EditFormat="Custom" UseMaskBehavior="true">
                                                            <ButtonStyle Width="13px">
                                                            </ButtonStyle>
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Ecoheadtxt" style="width: 41%">
                                                        Authority Name :
                                                    </td>
                                                    <td class="Ecoheadtxt" style="width: 186px">
                                                        <asp:TextBox ID="txtAuthorityName" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="Ecoheadtxt">
                                                        Country Of Registration :
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="drpcountry" runat="server" Width="168px">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Ecoheadtxt" style="width: 41%">
                                                        Description
                                                    </td>
                                                    <td colspan="3">
                                                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="374px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td colspan="3">
                                                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnUpdate" OnClick="btnSave_Click"
                                                            Width="48px" />
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
