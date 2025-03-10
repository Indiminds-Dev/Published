<%@ page language="C#" autoeventwireup="true" inherits="management_RiskProfileParameter, App_Web_alid8jfz" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Risk Profile Parameter</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
   <script language="javascript" type="text/javascript">
       function EndCall(obj)
        {
            height();
        }
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
        function callback()
        {
          grid.PerformCallback();
        }

        function OnMoreInfoClick(obj)
        {
         var url="RiskProfileParameterPopUp.aspx?id="+obj
         parent.OnMoreInfoClick(url,"Modify RiskProfile Entries",'980px','580px',"Y");
         
        }
        function NewRow() 
        {
           var url='RiskProfileParameterPopUp.aspx';
           parent.OnMoreInfoClick(url,"Add RiskProfile Entries",'980px','580px',"Y");
           
        }
//        function RefreshGrid()
//        {
//            editwin.close();
//        }
    
</script>
<table class="TableMain100">  
             <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Risk Profle Settings</span></strong>
                    </td>
                </tr>
      <tr><td>         
    <dxwgv:ASPxGridView ID="gridRiskProfileSettings" runat="server" ClientInstanceName="grid" KeyFieldName="ID" DataSourceID="SqlRiskProfileSettings" Width="100%" OnCustomCallback="gridRiskProfileSettings_CustomCallback" OnRowDeleting="gridRiskProfileSettings_RowDeleting" AutoGenerateColumns="False" OnCustomJSProperties="gridRiskProfileSettings_CustomJSProperties">
        <Styles>
            <Header ImageSpacing="5px" SortingImageSpacing="5px">
            </Header>
            <LoadingPanel ImageSpacing="10px">
            </LoadingPanel>
            <FocusedGroupRow CssClass="gridselectrow">
            </FocusedGroupRow>
            <FocusedRow CssClass="gridselectrow">
            </FocusedRow>
        </Styles>
           <StylesEditors>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
        <Columns>            
            <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="ID" Visible="False" >
                 <CellStyle CssClass="gridcellleft">
                 </CellStyle>
                 <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                 </EditFormCaptionStyle>
                 <EditFormSettings Visible="False" VisibleIndex="0" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Profile Type" FieldName="PRofile1" VisibleIndex="0" >
                 <CellStyle CssClass="gridcellleft">
                 </CellStyle>
                 <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                 </EditFormCaptionStyle>
                 <EditFormSettings Visible="False" VisibleIndex="0" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Profile Name" FieldName="Code" VisibleIndex="1" >
                 <CellStyle CssClass="gridcellleft">
                 </CellStyle>
                 <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                 </EditFormCaptionStyle>
                 <EditFormSettings Visible="False" VisibleIndex="0" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Segment Name" FieldName="SegID" VisibleIndex="2" >
                 <CellStyle CssClass="gridcellleft">
                 </CellStyle>
                 <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                 </EditFormCaptionStyle>
                 <EditFormSettings Visible="False" VisibleIndex="0" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="From Date" FieldName="DateFrom" VisibleIndex="3" >
                 <CellStyle CssClass="gridcellleft">
                 </CellStyle>
                 <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                 </EditFormCaptionStyle>
                 <EditFormSettings Visible="False" VisibleIndex="0" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="To Date" FieldName="DateTo" VisibleIndex="4" >
                 <CellStyle CssClass="gridcellleft">
                 </CellStyle>
                 <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                 </EditFormCaptionStyle>
                 <EditFormSettings Visible="False" VisibleIndex="0" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="5" Width="5%">
                  <DataItemTemplate>
                         <a href="#" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">Edit</a>
                  </DataItemTemplate>
                  <HeaderTemplate>
                    <a href="javascript:void(0);" onclick="NewRow()">
                           <span style="color: #000099; text-decoration: underline">Add New</span></a>
                  </HeaderTemplate>                 
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewCommandColumn VisibleIndex="6" >
                <DeleteButton Visible="True">
                </DeleteButton>                
            </dxwgv:GridViewCommandColumn>
        </Columns>
        <Settings ShowGroupPanel="True" />
        <SettingsText ConfirmDelete="Are you sure to Delete this Record!" />
        <SettingsPager NumericButtonCount="20" ShowSeparators="True" AlwaysShowPager="True">
            <FirstPageButton Visible="True">
            </FirstPageButton>
            <LastPageButton Visible="True">
            </LastPageButton>
        </SettingsPager>
        <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
        <ClientSideEvents EndCallback="function(s, e) {
	EndCall(s.cpEND);
}" />
    </dxwgv:ASPxGridView>
    </td></tr> </table>
    <asp:SqlDataSource ID="SqlRiskProfileSettings" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" ConflictDetection="CompareAllValues"
        SelectCommand="SELECT CAST(RiskProfile_ID AS varchar(10)) + ',' + '1' AS ID,'Risk Profile' as PRofile1, (SELECT TradingProfile_Name FROM Master_TradingProfile WHERE (TradingProfile_Code = Config_RiskProfile.RiskProfile_Code)) AS Code, (SELECT (SELECT exh_shortName FROM tbl_master_exchange WHERE (exh_cntId = tbl_master_companyExchange.exch_exchId)) + '-' + exch_segmentId AS Expr1 FROM tbl_master_companyExchange WHERE (exch_internalId = Config_RiskProfile.RiskProfile_SegmentID)) AS SegID, CONVERT (varchar(11), RiskProfile_DateFrom, 113) AS DateFrom, CONVERT (varchar(11), RiskProfile_DateTo, 113) AS DateTo FROM Config_RiskProfile UNION ALL SELECT CAST(DeliveryProfile_ID AS varchar(10)) + ',' + '2' AS ID,'Delivery Profile' as PRofile1, (SELECT TradingProfile_Name FROM Master_TradingProfile WHERE (TradingProfile_Code = Config_DeliveryProfile.DeliveryProfile_Code)) AS Code, (SELECT (SELECT exh_shortName FROM tbl_master_exchange WHERE (exh_cntId = tbl_master_companyExchange.exch_exchId)) + '-' + exch_segmentId AS Expr1 FROM tbl_master_companyExchange WHERE (exch_internalId = Config_DeliveryProfile.DeliveryProfile_SegmentID)) AS SegID, CONVERT (varchar(11), DeliveryProfile_DateFrom, 113) AS DateFrom, CONVERT (varchar(11), DeliveryProfile_DateTo, 113) AS DateTo FROM Config_DeliveryProfile UNION ALL SELECT CAST(FundProfile_ID AS varchar(10)) + ',' + '3' AS ID,'Fund Profile' as PRofile1, (SELECT TradingProfile_Name FROM Master_TradingProfile WHERE (TradingProfile_Code = Config_FundProfile.FundProfile_Code)) AS Code, (SELECT (SELECT exh_shortName FROM tbl_master_exchange WHERE (exh_cntId = tbl_master_companyExchange.exch_exchId)) + '-' + exch_segmentId AS Expr1 FROM tbl_master_companyExchange WHERE (exch_internalId = Config_FundProfile.FundProfile_SegmentID)) AS SegID, CONVERT (varchar(11), FundProfile_DateFrom, 113) AS DateFrom, CONVERT (varchar(11), FundProfile_DateTo, 113) AS DateTo FROM Config_FundProfile">
    </asp:SqlDataSource>
    </form>
</body>
</html>
