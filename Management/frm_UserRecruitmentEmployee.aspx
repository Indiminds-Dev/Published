<%@ page language="C#" autoeventwireup="true" inherits="management_frm_UserRecruitmentEmployee, App_Web_2wstwz9u" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
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
            page.SetActiveTab(page.GetTab(3));
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
    
     
    
    function OnMoreInfoClick(keyValue) {
     var url='frm_UserRecruitmentEmployee_Detail.aspx?id='+keyValue;
        parent.OnMoreInfoClick(url,"Activity",'950px','450px',"Y");

    }
    function OnMoreInfoClickCandiDetail(keyValue)
    {
         var url='frm_CandidateDetail.aspx?id='+keyValue;
         parent.OnMoreInfoClick(url,"Activity",'950px','450px',"N");

    }
    function callback()
    {
        window.location.reload();
    }
    </script>


</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="page"
            Width="100%" OnActiveTabChanged="ASPxPageControl1_ActiveTabChanged">
            <TabPages>
                <dxtc:TabPage Name="Summary" Text="Summary">
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Name="NewActivity" Text="New Activity">
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                            <dxwgv:ASPxGridView ID="GridNewActivity" runat="server" Width="100%" AutoGenerateColumns="False"
                                KeyFieldName="Id">
                                <SettingsEditing Mode="PopupEditForm"></SettingsEditing>
                                <Styles>
                                    <LoadingPanel ImageSpacing="10px">
                                    </LoadingPanel>
                                    <Header SortingImageSpacing="5px" ImageSpacing="5px">
                                    </Header>
                                </Styles>
                                <Settings ShowGroupPanel="True"></Settings>
                                <SettingsBehavior ConfirmDelete="True" ColumnResizeMode="NextColumn"></SettingsBehavior>
                                <SettingsPager PageSize="20" NumericButtonCount="20" AlwaysShowPager="True">
                                    <FirstPageButton Visible="True">
                                    </FirstPageButton>
                                    <LastPageButton Visible="True">
                                    </LastPageButton>
                                </SettingsPager>
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="0">
                                        <EditFormSettings Visible="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="ActNo" VisibleIndex="0">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Company" VisibleIndex="1">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Branch" VisibleIndex="2">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Department" VisibleIndex="3">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Vacancies" VisibleIndex="4">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="UserName" VisibleIndex="5">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="JobResponsibility" VisibleIndex="6">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="7">
                                        <DataItemTemplate>
                                            <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                                More Info...</a>
                                        </DataItemTemplate>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:ASPxGridView>
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Name="PendingInterview" Text="Pending Interview">
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                            <dxwgv:ASPxGridView ID="GridNewActivity1" runat="server" Width="100%" AutoGenerateColumns="False"
                                KeyFieldName="Id">
                                <SettingsEditing Mode="PopupEditForm"></SettingsEditing>
                                <Styles>
                                    <LoadingPanel ImageSpacing="10px">
                                    </LoadingPanel>
                                    <Header SortingImageSpacing="5px" ImageSpacing="5px">
                                    </Header>
                                </Styles>
                                <Settings ShowGroupPanel="True"></Settings>
                                <SettingsBehavior ConfirmDelete="True" ColumnResizeMode="NextColumn"></SettingsBehavior>
                                <SettingsPager PageSize="20" NumericButtonCount="20" ShowSeparators="True" AlwaysShowPager="True">
                                    <FirstPageButton Visible="True">
                                    </FirstPageButton>
                                    <LastPageButton Visible="True">
                                    </LastPageButton>
                                </SettingsPager>
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="0">
                                        <EditFormSettings Visible="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="ActNo" VisibleIndex="0">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Company" VisibleIndex="1">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Branch" VisibleIndex="2">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Department" VisibleIndex="3">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Vacancies" VisibleIndex="4">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="UserName" VisibleIndex="5">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="JobResponsibility" VisibleIndex="6">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="7">
                                        <DataItemTemplate>
                                            <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                                More Info...</a>
                                        </DataItemTemplate>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:ASPxGridView>
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Name="CompletedInterview" Text="Completed Interview">
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                            <dxwgv:ASPxGridView ID="GridCompltIntervw" runat="server" Width="100%" AutoGenerateColumns="False"
                                KeyFieldName="Id">
                                <SettingsEditing Mode="PopupEditForm"></SettingsEditing>
                                <Styles>
                                    <LoadingPanel ImageSpacing="10px">
                                    </LoadingPanel>
                                    <Header SortingImageSpacing="5px" ImageSpacing="5px">
                                    </Header>
                                </Styles>
                                <SettingsBehavior ConfirmDelete="True" ColumnResizeMode="NextColumn"></SettingsBehavior>
                                <SettingsPager PageSize="20" NumericButtonCount="20" ShowSeparators="True" AlwaysShowPager="True">
                                    <FirstPageButton Visible="True">
                                    </FirstPageButton>
                                    <LastPageButton Visible="True">
                                    </LastPageButton>
                                </SettingsPager>
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="0">
                                        <EditFormSettings Visible="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="ActNo" VisibleIndex="0">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="CandidateName" Caption="Candidate Name"
                                        VisibleIndex="1">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Company" VisibleIndex="2">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Branch" VisibleIndex="3">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Department" VisibleIndex="4">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="UserName" Caption="Assigned By" VisibleIndex="5">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="JobResponsibility" VisibleIndex="6">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="7">
                                        <DataItemTemplate>
                                            <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                                More Info...</a>
                                        </DataItemTemplate>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:ASPxGridView>
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Name="SelectedCandidate" Text="Selected Candidate">
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                            <dxwgv:ASPxGridView ID="GridCompltIntervw1" runat="server" Width="100%" AutoGenerateColumns="False"
                                KeyFieldName="RecruitmentId">
                                <SettingsEditing Mode="PopupEditForm"></SettingsEditing>
                                <Styles>
                                    <LoadingPanel ImageSpacing="10px">
                                    </LoadingPanel>
                                    <Header SortingImageSpacing="5px" ImageSpacing="5px">
                                    </Header>
                                </Styles>
                                <Settings ShowGroupPanel="True"></Settings>
                                <SettingsBehavior ConfirmDelete="True" ColumnResizeMode="NextColumn"></SettingsBehavior>
                                <SettingsPager PageSize="20" NumericButtonCount="20" ShowSeparators="True" AlwaysShowPager="True">
                                    <FirstPageButton Visible="True">
                                    </FirstPageButton>
                                    <LastPageButton Visible="True">
                                    </LastPageButton>
                                </SettingsPager>
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="0">
                                        <EditFormSettings Visible="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="ActNo" VisibleIndex="0">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="CandidateName" Caption="Candidate Name"
                                        VisibleIndex="1">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Company" VisibleIndex="2">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Branch" VisibleIndex="3">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Department" VisibleIndex="4">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="UserName" Caption="Assigned By" VisibleIndex="5">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="JobResponsibility" VisibleIndex="6">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="7">
                                        <DataItemTemplate>
                                            <a href="javascript:void(0);" onclick="OnMoreInfoClickCandiDetail('<%# Container.KeyValue %>')">
                                                More Info...</a>
                                        </DataItemTemplate>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:ASPxGridView>
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Name="EliminatedCandidate" Text="Eliminated Candidate">
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                            <dxwgv:ASPxGridView ID="GridEliminated" runat="server" Width="100%" AutoGenerateColumns="False"
                                KeyFieldName="Id">
                                <SettingsEditing Mode="PopupEditForm"></SettingsEditing>
                                <Styles>
                                    <LoadingPanel ImageSpacing="10px">
                                    </LoadingPanel>
                                    <Header SortingImageSpacing="5px" ImageSpacing="5px">
                                    </Header>
                                </Styles>
                                <Settings ShowGroupPanel="True"></Settings>
                                <SettingsBehavior ConfirmDelete="True" ColumnResizeMode="NextColumn"></SettingsBehavior>
                                <SettingsPager PageSize="20" NumericButtonCount="20" ShowSeparators="True" AlwaysShowPager="True">
                                    <FirstPageButton Visible="True">
                                    </FirstPageButton>
                                    <LastPageButton Visible="True">
                                    </LastPageButton>
                                </SettingsPager>
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="0">
                                        <EditFormSettings Visible="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="ActNo" VisibleIndex="0">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="CandidateName" Caption="Candidate Name"
                                        VisibleIndex="1">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Company" VisibleIndex="2">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Branch" VisibleIndex="3">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Department" VisibleIndex="4">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="UserName" VisibleIndex="5">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="JobResponsibility" VisibleIndex="6">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="7">
                                        <DataItemTemplate>
                                            <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                                More Info...</a>
                                        </DataItemTemplate>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:ASPxGridView>
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
        <br />
    </form>
</body>
</html>
