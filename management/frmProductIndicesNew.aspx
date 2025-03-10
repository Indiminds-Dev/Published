<%@ page language="C#" autoeventwireup="true" inherits="management_frmProductIndicesNew, App_Web_0jwcfgzk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
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
        function OnMoreInfoClick(keyValue,ProductNm)
        {
         var url='Exch_Product_Details.aspx?Flag=Exc&id='+keyValue+'&PD='+ProductNm;
           parent.OnMoreInfoClick(url,"Exhange Details",'940px','450px',"Y");
        }
        function OnMoreInfoClick1(keyValue,ProductNm)
         {
         var url='Exch_Product_Details.aspx?Flag=CA&id='+keyValue+'&PD='+ProductNm;
         parent.OnMoreInfoClick(url,"Exhange Details",'940px','450px',"Y");
        }
        function OnMoreInfoClick2(keyValue,ProductNm)
        {
         var url='Exch_Product_Details.aspx?Flag=SR&id='+keyValue+'&PD='+ProductNm;
         parent.OnMoreInfoClick(url,"Show Rates",'940px','450px',"Y");
        }
        function ShowHideFilter(obj)
        {
           grid.PerformCallback(obj);
        }
    </script>


    <table class="TableMain100">
     <tr>
            <td class="EHEADER" >
                <strong><span style="color: #000099">Indices</span></strong></td>
        </tr>
    <tr>
        <td>
            
            <table width="100%">
              <tr>
                 <td style="text-align:left; vertical-align:top">
                        <table>
                            <tr>
                                <td id="ShowFilter">
                                    <a  href="javascript:ShowHideFilter('s');" ><span style="color: #000099; text-decoration: underline">
                                        Show Filter</span></a>
                                </td>
                               <td id="Td1">
                                    <a  href="javascript:ShowHideFilter('All');" ><span style="color: #000099; text-decoration: underline">
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
                <dxwgv:ASPxGridView ID="gridProduct" runat="server" ClientInstanceName="grid" OnCustomCallback="gridEquity_CustomCallback" Width="100%" KeyFieldName="Products_ID" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSource1" >
                    <Styles>
                        <Header ImageSpacing="5px" SortingImageSpacing="5px" BackColor="#8EB3E7">
                        </Header>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                        <FocusedRow CssClass="gridselectrow">
                        </FocusedRow>
                        <FocusedGroupRow CssClass="gridselectrow">
                        </FocusedGroupRow>
                    </Styles>
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <Settings ShowStatusBar="Visible" />
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
                            <dxwgv:GridViewDataTextColumn Caption="Short Name" FieldName="Products_ShortName" VisibleIndex="1">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <Settings FilterMode="DisplayText" />
                            </dxwgv:GridViewDataTextColumn>
                          
                       
                            
                           
                            <dxwgv:GridViewDataTextColumn Caption="Rates" VisibleIndex="2">
                                <DataItemTemplate>
                                   <%-- <a href="javascript:void(0);" onclick="OnMoreInfoClick2('<%# Container.KeyValue %>')">Show Rates</a>--%>
                                   <a href="javascript:void(0);" onclick="OnMoreInfoClick2('<%# Container.KeyValue %>','<%#Eval("Products_Name") %>')">Show Rates</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False" HorizontalAlign="Left">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                </dxwgv:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                    SelectCommand="SELECT MP.Products_ID,MP.Products_Name,MP.Products_ShortName&#13;&#10;FROM   Master_Products MP INNER JOIN Master_ProductTypes MPT&#13;&#10;ON MPT.ProductType_ID=MP.Products_ProductTypeID AND MPT.ProductType_Code='ID'&#13;&#10;&#13;&#10;"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
