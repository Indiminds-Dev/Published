<%@ page language="C#" autoeventwireup="true" inherits="management_frmProductDerivatives, App_Web_co654op-" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
        function OnMoreInfoClick(keyValue,ProductNm,ProductType)
        {
             var url='Fo_ExchProductsDetails.aspx?Flag=Exc&id='+keyValue+'&PD='+ProductNm+'&Type='+ProductType;
             parent.OnMoreInfoClick(url,"Exhange Details","950px","500px","N");

//             editwin=dhtmlmodal.open("Editbox", "iframe", url, "Exhange Details", "width=940px,height=450px,center=1,resize=1,scrolling=2,top=500", "recal")
//             document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='hidden';
//             editwin.onclose=function()
//             {
//                    document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='visible';
//             }
         
        }
        function OnMoreInfoClick1(keyValue,ProductNm,ProductType)
        {
             var url='FOExch_Product_Details.aspx?Flag=CA&id='+keyValue+'&PD='+ProductNm+'&Type='+ProductType;
             parent.OnMoreInfoClick(url,"Corporate Action","950px","500px","N");

//             editwin=dhtmlmodal.open("Editbox", "iframe", url, "Corporate Action", "width=940px,height=450px,center=1,resize=1,scrolling=2,top=500", "recal")
//             document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='hidden';
//             editwin.onclose=function()
//             {
//                 document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='visible';
//             }
         
        }
        function OnMoreInfoClick2(keyValue,ProductNm,ProductType)
        {
             var url='FOExch_Product_Details.aspx?Flag=SR&id='+keyValue+'&PD='+ProductNm+'&Type='+ProductType;
             parent.OnMoreInfoClick(url,"Show Rates","950px","500px","N");

//             editwin=dhtmlmodal.open("Editbox", "iframe", url, "Show Rates", "width=940px,height=450px,center=1,resize=1,scrolling=2,top=500", "recal")
//             document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='hidden';
//             editwin.onclose=function()
//             {
//                 document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='visible';
//             }
        
        }
        function ShowHideFilter(obj)
        {
           grid.PerformCallback(obj);
        }
        function height()
        {
            if(document.body.scrollHeight<=500)
                window.frameElement.height = '500px';
            else         
                window.frameElement.height = document.body.scrollHeight;
            window.frameElement.widht = document.body.scrollWidht;
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" align="center">
                    <span style="color: #000099;">Derivaties</span></td>
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
                    <dxwgv:ASPxGridView ID="gridProduct" runat="server" ClientInstanceName="grid" OnCustomCallback="gridEquity_CustomCallback"
                        Width="100%" KeyFieldName="Products_ID" AutoGenerateColumns="False" >
                        <Styles>
                         
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                </Header>
                                                <LoadingPanel ImageSpacing="10px">
                                                </LoadingPanel>
                                                <FocusedRow BackColor="#FEC6AB">
                                                </FocusedRow>
                        </Styles>
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                        <Settings ShowStatusBar="Visible"  />
                        <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Name" FieldName="Products_Name" VisibleIndex="0">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Type" FieldName="Products_OptionType" VisibleIndex="1">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <Settings FilterMode="DisplayText" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Exch Details" VisibleIndex="2">
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>','<%#Eval("Products_Name") %>','<%#Eval("Products_OptionType") %>')">
                                        Show</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False" HorizontalAlign="Left">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Rates" VisibleIndex="3">
                                <DataItemTemplate>
                                    <%-- <a href="javascript:void(0);" onclick="OnMoreInfoClick2('<%# Container.KeyValue %>')">Show Rates</a>--%>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick2('<%# Container.KeyValue %>','<%#Eval("Products_Name") %>','<%#Eval("Products_OptionType") %>')">
                                        Show Rates</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False" HorizontalAlign="Left">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                    </dxwgv:ASPxGridView>
<%--                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                        SelectCommand="SELECT MP.Products_ID,MP.Products_Name,MP.Products_ShortName,MP.Products_DerivedFromID,&#13;&#10;(CASE MP.Products_OptionType WHEN 'CALL'  THEN 'CALL' WHEN 'PUT'  THEN 'PUT' WHEN ''  THEN 'FUTURE'  ELSE MP.Products_OptionType END) AS Products_OptionType&#13;&#10;FROM   Master_Products MP INNER JOIN Master_ProductTypes MPT&#13;&#10;ON MPT.ProductType_ID=MP.Products_ProductTypeID AND MPT.ProductType_Code='DE'&#13;&#10;ORDER BY   MP.Products_ShortName ,MP.Products_ID ">
                    </asp:SqlDataSource>--%>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
