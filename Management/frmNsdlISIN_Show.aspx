<%@ page language="C#" autoeventwireup="true" inherits="management_frmNsdlISIN_Show, App_Web_i8xxwgwk" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
        function OnMoreInfoClick(keyValue)
        {
             var qrStr=window.location .search ;
             var spQrStr=qrStr.substring(1);
             var nameArray=keyValue.split(",");
             var url='frmNsdlISIN_ShowDetails.aspx?&Id='+nameArray[0];
             parent.OnMoreInfoClick(url,"Equity Details",'940px','450px',"Y");
               
        }
        function ShowHideFilter(obj)
        {
            grid.PerformCallback(obj);
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

    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align:center;">
                        <strong><span style="color: #000099; text-align: center" id="s1" runat="server"></span>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td style="text-align: left; vertical-align: top">
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
                                <td>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="gridISIN" runat="server" ClientInstanceName="grid" OnCustomCallback="gridISIN_CustomCallback"
                            Width="100%" KeyFieldName="NSDLISIN_ID" AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSource1">
                            <settingsbehavior allowfocusedrow="True" />
                            <styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px" BackColor="#8EB3E7"></Header>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</styles>
                            <settingspager numericbuttoncount="20" pagesize="20" showseparators="True" alwaysshowpager="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</settingspager>
                            <columns>
<dxwgv:GridViewDataTextColumn FieldName="NSDLISIN_Number" Caption="ISIN" VisibleIndex="0">
<Settings FilterMode="DisplayText"></Settings>
<DataItemTemplate>
                                <span title="<%#Eval("NSDLISIN_SecurityStatus_StaticData") %>" ><%#Eval("NSDLISIN_Number")%></span>
                            
</DataItemTemplate>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="NSDLISIN_ShortName" Caption="Short Name" VisibleIndex="1">
<Settings FilterMode="DisplayText"></Settings>
<DataItemTemplate>
                                <span title="<%#Eval("NSDLISIN_SecurityStatus_StaticData") %>" ><%#Eval("NSDLISIN_ShortName")%></span>
                            
</DataItemTemplate>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="NSDLISIN_CompanyName" Caption="Company Name" VisibleIndex="2">
<Settings FilterMode="DisplayText"></Settings>
<DataItemTemplate>
                                <span title="<%#Eval("NSDLISIN_SecurityStatus_StaticData") %>" ><%#Eval("NSDLISIN_CompanyName")%></span>
                            
</DataItemTemplate>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="NSDLISIN_SecurityType_SubType_StaticData" Caption="Security Type" VisibleIndex="3">
<Settings FilterMode="DisplayText"></Settings>
<DataItemTemplate>
                                <span title="<%#Eval("NSDLISIN_SecurityStatus_StaticData") %>" ><%#Eval("NSDLISIN_SecurityType_SubType_StaticData")%></span>
                            
</DataItemTemplate>

<CellStyle HorizontalAlign="Left" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="4">
<EditFormSettings Visible="False"></EditFormSettings>
<DataItemTemplate>
                                    <a title="<%#Eval("NSDLISIN_SecurityStatus_StaticData") %>" href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue+","+Eval("NSDLISIN_ShortName") %>')">Show</a>
                            
</DataItemTemplate>

<CellStyle HorizontalAlign="Left" Wrap="False"></CellStyle>
</dxwgv:GridViewDataTextColumn>
</columns>
                            <settings showstatusbar="Visible" />
                            <styleseditors>
<ProgressBar Height="25px"></ProgressBar>
</styleseditors>
                        </dxwgv:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="sp_ShowNsdlISINList" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="All" Name="security_type" QueryStringField="type"
                                    Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
