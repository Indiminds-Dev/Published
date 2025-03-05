<%@ page language="C#" autoeventwireup="true" inherits="management_HrCost, App_Web_yq8u0p-o" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
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
        //document.location.href="HrCost.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="HRCostBranch.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="HRCostEmployee.aspx"; 
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
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="90%"
                            ClientInstanceName="page" Font-Size="10px">
                            <TabPages>
                                <dxtc:TabPage Text="Update" Name="Update">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <table width="100%">
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label1" runat="server" Text="Cost Name Centers:"></asp:Label></td>
                                                    <td>
                                                        <asp:TextBox ID="TxtCenter" runat="server" Width="250px"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label2" runat="server" Text="Cost Center Type"></asp:Label></td>
                                                    <td>
                                                        <asp:DropDownList ID="DDLType" runat="server" Width="254px">
                                                            <asp:ListItem>Department</asp:ListItem>
                                                            <asp:ListItem>Employee</asp:ListItem>
                                                            <asp:ListItem>Branch</asp:ListItem>
                                                        </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label3" runat="server" Text=" Parent Cost  Center/Dept."></asp:Label></td>
                                                    <td>
                                                        <asp:DropDownList ID="DDLCostDept" runat="server" Width="254px">
                                                        </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label4" runat="server" Text="Head Of Department"></asp:Label></td>
                                                    <td>
                                                        <asp:DropDownList ID="DDLHeadDept" runat="server" Width="254px">
                                                        </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label5" runat="server" Text="Email -Id"></asp:Label></td>
                                                    <td>
                                                        <asp:TextBox ID="TxtEmail" runat="server" Width="250px"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        &nbsp;</td>
                                                    <td>
                                                        <table style="width: 200px">
                                                            <tr>
                                                                <td style="width: 100px">
                                                                    <asp:CheckBox ID="ChkFund" runat="server" Text="Mutual Funds" />
                                                                </td>
                                                                <td style="width: 100px">
                                                                    <asp:CheckBox ID="ChkBrok" runat="server" Text="Broking " />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px">
                                                                    <asp:CheckBox ID="ChkInsu" runat="server" Text="Insurance" />
                                                                </td>
                                                                <td style="width: 100px">
                                                                    <asp:CheckBox ID="ChkDepos" runat="server" Text="Depository" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        <asp:Label ID="lblmessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="BtnSave" runat="server" Text="Save" OnClick="BtnSave_Click" /></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Text="Branch" Name="Branch">
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
                            </TabPages>
                            <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                            var Tab2 = page.GetTab(2);	                                            
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
                            <tr>
                                <td align="right" style="width: 843px">
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
