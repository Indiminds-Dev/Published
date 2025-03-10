<%@ page language="C#" autoeventwireup="true" inherits="management_frm_EmployeeRecruitmentSummary, App_Web_udicbieo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }
 
    function disp_prompt(name)
    {
        //alert(name);
        if ( name == "tab0")
        {
            document.location.href="frm_EmployeeRecruitmentSummary.aspx"; 
        }
        if ( name == "tab1")
        {
            document.location.href="frm_UserRecruitmentEmployee.aspx?id=NewActivity"; 
        }
        else if ( name == "tab2")
        {
            document.location.href="frm_UserRecruitmentEmployee.aspx?id=PendingInterview"; 
        }
        else if ( name == "tab3")
        {
            document.location.href="frm_UserRecruitmentEmployee.aspx?id=CompletedInterview"; 
        }
        else if ( name == "tab4")
        {
            document.location.href="frm_UserRecruitmentEmployee.aspx?id=SelectedCandidate"; 
        }
        else if ( name == "tab5")
        {
            document.location.href="frm_UserRecruitmentEmployee.aspx?id=EliminatedCandidate"; 
        }
        
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="page"
            Width="100%">
            <TabPages>
                <dxtc:TabPage Name="Summary" Text="Summary">
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                            <asp:Table ID="TblSummary" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                BorderWidth="1px" CellPadding="0" CellSpacing="0">
                            </asp:Table>
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Name="NewActivity" Text="New Activity">
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Name="PendingInterview" Text="Pending Interview">
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Name="CompletedInterview" Text="Completed Interview">
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Name="SelectedCandidate" Text="Selected Candidate">
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Name="EliminatedCandidate" Text="Eliminated Candidate">
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
            </TabPages>
            <ContentStyle>
                <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
            </ContentStyle>
            <LoadingPanelStyle ImageSpacing="6px">
            </LoadingPanelStyle>
            <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                        var activeTab   = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                            var Tab2 = page.GetTab(2);
	                                            var Tab3 = page.GetTab(3);
	                                            var Tab4 = page.GetTab(4);
	                                            var Tab5 = page.GetTab(5);
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
                                            }" />
        </dxtc:ASPxPageControl>
    </form>
</body>
</html>
