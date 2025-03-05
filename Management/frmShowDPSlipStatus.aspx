<%@ page language="C#" autoeventwireup="true" inherits="management_frmShowDPSlipStatus, App_Web_vvdfezxa" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>

    
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
     <script language="javascript" type="text/javascript">
        function SignOff()
        {
            window.parent.SignOff();
        }
        function ShowHideFilter(obj)
        {
           grid.PerformCallback(obj);
        }
        function ShowDetailPopup(RecordID) {
           document.getElementById('Hdn_StatusChangeID').value=RecordID;
           cgridSlipStatus.PerformCallback('CheckSlipStatus~'+RecordID);
          
          }
        function ChosenSetAsInUse()
        {
            grid.PerformCallback('SetAsInUse');
            cgridSlipStatus.PerformCallback('SetAsInUse~ ');
            cSetStatusPopUp.Hide();
        }
        function ChosenSetAsUsed()
        {
             grid.PerformCallback('SetAsUsed');
             cgridSlipStatus.PerformCallback('SetAsUsed~ ');
             cSetStatusPopUp.Hide();
             ctxtRemarks.SetText('');
        }
        function ChosenBack()
        {
            cSetStatusPopUp.Hide();
        }
        function HideShowTd(s,e)
        {
            var Status = s.cpCurrentSlipStatus;
            
            if(Status=="Change") {alert('Successfully Change'); return}
            if(Status=="0") {tdInUse.style.display='none'; tdUsed.style.display='inline';  cSetStatusPopUp.Show();s.cpCurrentSlipStatus='Change';}
            else if(Status=="1") {tdUsed.style.display='none';tdInUse.style.display='inline'; cSetStatusPopUp.Show();s.cpCurrentSlipStatus='Change'}
            else {tdUsed.style.display='none';tdInUse.style.display='none';};
        }
   </script>
   <style type="text/css">
        
    </style>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
    <table  class="TableMain100" style="width: 90%" >
    <tr>
    <td>
        <dxwgv:ASPxGridView ID="gridSlipStatus" ClientInstanceName="cgridSlipStatus" runat="server"
            Width="100%" AutoGenerateColumns="False" KeyFieldName="InUse" OnCustomCallback="gridSlipStatus_CustomCallback">
            <ClientSideEvents EndCallback="HideShowTd" />
            <SettingsBehavior AllowFocusedRow="True" />
            <Styles>
                <Header CssClass="gridheader">
                </Header>
                <FocusedGroupRow CssClass="gridselectrow">
                </FocusedGroupRow>
                <FocusedRow CssClass="gridselectrow">
                </FocusedRow>
            </Styles>
            <Columns>
                <dxwgv:GridViewDataTextColumn FieldName="InUse" Width="33%" Caption="In Use" VisibleIndex="0">
                    <HeaderStyle HorizontalAlign="Right"></HeaderStyle>
                    <CellStyle HorizontalAlign="Right" CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="Used" Width="33%" Caption="Used" VisibleIndex="1">
                    <HeaderStyle HorizontalAlign="Right"></HeaderStyle>
                    <CellStyle HorizontalAlign="Right" CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="Cancelled" Caption="Cancelled" VisibleIndex="2">
                    <HeaderStyle HorizontalAlign="Right"></HeaderStyle>
                    <CellStyle HorizontalAlign="Right" CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
            </Columns>
            <Settings ShowGroupButtons="False"></Settings>
        </dxwgv:ASPxGridView>
    </td>
    
    </tr>   
    </table>
        <br />
        <table class="TableMain100" style="width: 90%">
            <tr>
                <td class="EHEADER" style="vertical-align: top; text-align: center" width="70%">
                    <span style="color: #3300cc"><strong>Individual Slip Status</strong></span>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">
                    <table>
                        <tr>
                            <td id="ShowFilter">
                                <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                    Show Filter</span></a>
                            </td>
                            <td id="Td1">
                                <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                    All Records</span></a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height: 205px">
                    <dxwgv:ASPxGridView ID="gridStcokIssue" runat="server" AutoGenerateColumns="False"
                        KeyFieldName="DpSlipsUsage_ID" ClientInstanceName="grid" OnCustomCallback="gridStcokIssue_CustomCallback"
                        Width="100%" OnCustomJSProperties="gridStcokIssue_CustomJSProperties">
                        
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Styles>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <FocusedGroupRow CssClass="gridselectrow">
                            </FocusedGroupRow>
                            <FocusedRow CssClass="gridselectrow">
                            </FocusedRow>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" PageSize="10" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="SlipNumber" FieldName="DpSlipsUsage_SlipNumber"
                                VisibleIndex="0">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle CssClass="gridcellleft" HorizontalAlign="Left">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="SlipType" FieldName="SlipType" VisibleIndex="1">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle CssClass="gridcellleft" HorizontalAlign="Left">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Issued Date" FieldName="DpSlipsUsage_IssueDate"
                                VisibleIndex="2">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle CssClass="gridcellleft" HorizontalAlign="Left">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataHyperLinkColumn FieldName="DpSlipsUsage_ID" Caption="Change Status"  VisibleIndex="3"
                                FixedStyle="Left" Width="20px">
                                <PropertiesHyperLinkEdit Text="Change Status" NavigateUrlFormatString="javascript:ShowDetailPopup('{0}');" >
                                </PropertiesHyperLinkEdit>
                            </dxwgv:GridViewDataHyperLinkColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Slip Status" FieldName="Status" VisibleIndex="3">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Slip Used Date" FieldName="DpSlipsUsage_UsedDate"
                                VisibleIndex="4">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Slip Cancel Date" FieldName="DpSlipsUsage_CencelledDate"
                                VisibleIndex="5">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Remark" FieldName="DpSlipsUsage_Remarks" VisibleIndex="6">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle CssClass="gridcellleft" HorizontalAlign="Left">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowStatusBar="Visible" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                 <dxpc:ASPxPopupControl ID="SetStatusPopUp" runat="server" HeaderText="Change Slip Status" ClientInstanceName="cSetStatusPopUp" Width="510px">
                            <ContentCollection>
                                <dxpc:PopupControlContentControl runat="server">
                                    <table class="style1" style="border-top-style: groove; border-right-style: groove; border-left-style: groove; border-bottom-style: groove" border="1">
                                        <tr>
                                            <td colspan="2" style="height: 17px">
                                                Are you sure?Do You Want To Change This Slip Status?
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" id="tdInUse" >
                                                <dxe:ASPxButton ID="btnInuse" runat="server" AutoPostBack="False" Text="Set As INUSE">
                                                    <ClientSideEvents Click="function (s, e) { ChosenSetAsInUse(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td valign="top" id="tdUsed">
                                                <table style="border-top-style: groove; border-right-style: groove; border-left-style: groove; border-bottom-style: groove" border="1">
                                                    <tr>
                                                        <td style="width: 38px; height: 35px;" valign="top">
                                                            Remarks</td>
                                                        <td style="width: 100px; height: 35px;" valign="top">
                                                        <dxe:aspxtextbox runat="server" id="txtRemarks" clientinstancename="ctxtRemarks"
                                                             autoresizewithcontainer="True" Width="200px"  Font-Size="X-Small">
                                                        </dxe:aspxtextbox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 38px">
                                                        </td>
                                                        <td style="width: 100px">
                                                <dxe:ASPxButton ID="btnUsed" runat="server" AutoPostBack="False" Text="Set As USED">
                                                    <ClientSideEvents Click="function (s, e) { ChosenSetAsUsed(); }" />
                                                </dxe:ASPxButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td valign="top">
                                                <dxe:ASPxButton ID="btnBack" runat="server" AutoPostBack="False" Text="Back">
                                                    <ClientSideEvents Click="function (s, e) {ChosenBack(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </dxpc:PopupControlContentControl>
                            </ContentCollection>
                        </dxpc:ASPxPopupControl>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="Hdn_StatusChangeID" runat="server" />
    </div>
    </form>
</body>
</html>
