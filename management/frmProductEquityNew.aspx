<%@ page language="C#" autoeventwireup="true" inherits="management_frmProductEquityNew, App_Web_itibbj7j" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

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
     <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>
   
   <script language="javascript" type="text/javascript">
   
        function SignOff()
        {
        window.parent.SignOff()
        }
        function height()
        {
            if(document.body.scrollHeight>=700)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '700px';
            window.frameElement.Width = document.body.scrollWidth;
        }
        
        function OnMoreInfoClick(keyValue,ProductNm)
         {
         var url='Exch_Product_Details.aspx?Flag=Exc&id='+keyValue+'&PD='+ProductNm;
          //parent.OnMoreInfoClick(url,"Exhange Details",'980px','500px',"Y");
         editwin=dhtmlmodal.open("Editbox", "iframe", url, "Exchange Details", "width=980px,height=500px,center=1,resize=1,top=500", "recal");  
         // editwin=dhtmlmodal.open()
    
        }
        function OnMoreInfoClick1(keyValue,ProductNm)
         {
         var url='Exch_Product_Details.aspx?Flag=CA&id='+keyValue+'&PD='+ProductNm;
          parent.OnMoreInfoClick(url,"Corporate Action",'940px','450px',"Y");
   
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
        function OnMoreInfoClick_Capital(keyValue,ProductNm)
         {
         var url='Exch_Product_Details.aspx?Flag=IC&id='+keyValue+'&PD='+ProductNm;
          parent.OnMoreInfoClick(url,"Issued Capital Details",'940px','450px',"Y");
        
        }
        function OnMoreInfoClick_Index(keyValue,ProductNm)
         {
         var url='Exch_Product_Details.aspx?Flag=IxM&id='+keyValue+'&PD='+ProductNm;
           parent.OnMoreInfoClick(url,"Index Member Details",'940px','450px',"Y");
         
        }
         function OnAddButtonClick()
         
         {
            var url='AddNewProduct.aspx';
           parent.OnMoreInfoClick(url,"Add New Products",'940px','450px');
         
        }
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
      <table class="TableMain100">
     <tr>
            <td class="EHEADER"  style="text-align: center;">
                <strong><span style="color: #000099">Product Equity</span></strong></td>
        </tr>
    <tr>
        <td>
            
            <table width="100%">
              <tr>
                 <td style="text-align:left; vertical-align:top">
                        <table>
                            <tr>
                                <td id="ShowFilter" style="height: 16px">
                                    <a  href="javascript:ShowHideFilter('s');" ><span style="color: #000099; text-decoration: underline">
                                        Show Filter</span></a>
                                </td>
                               <td id="Td1" style="height: 16px">
                                    <a  href="javascript:ShowHideFilter('All');" ><span style="color: #000099; text-decoration: underline">
                                        All Records</span></a>
                                </td>
                            </tr>
                        </table>
                  </td>
                 <td style="text-align:right; vertical-align:top">
                  <asp:Button ID="btnadd" runat="server" CssClass="btnUpdate" Height="20px" Text="Add New"
                  Width="101px" OnClientClick="OnAddButtonClick();"/></td>
            </tr>
            </table>
           
        </td>
    </tr>
        <tr>
            <td>
                <dxwgv:ASPxGridView ID="gridProduct" runat="server" ClientInstanceName="grid" OnCustomCallback="gridEquity_CustomCallback" Width="100%" KeyFieldName="ID" AutoGenerateColumns="False" 
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
                            <dxwgv:GridViewDataTextColumn Caption="Ticker Code" FieldName="Equity_TickerCode" VisibleIndex="1">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <Settings FilterMode="DisplayText"/>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Symbol" FieldName="Equity_TickerSymbol" VisibleIndex="2">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Series" FieldName="Equity_Series" VisibleIndex="3">
                        </dxwgv:GridViewDataTextColumn>
                          
                       
                            <dxwgv:GridViewDataTextColumn Caption="Exch Details" VisibleIndex="4">
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>','<%#Eval("ID") %>')">Show</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False" HorizontalAlign="Left">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                           <dxwgv:GridViewDataTextColumn Caption="Crop Action" VisibleIndex="5">
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick1('<%# Container.KeyValue %>','<%#Eval("ID") %>')">Show</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False" HorizontalAlign="Left">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn Caption="Issued Capital" VisibleIndex="6">
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick_Capital('<%# Container.KeyValue %>','<%#Eval("ID") %>')">Show</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False" HorizontalAlign="Left">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Index Member" VisibleIndex="7">
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick_Index('<%# Container.KeyValue %>','<%#Eval("ID") %>')">Show</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False" HorizontalAlign="Left">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Rates" VisibleIndex="8">
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick2('<%# Container.KeyValue %>','<%#Eval("ID") %>')">Show Rates</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False" HorizontalAlign="Left">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                    SelectCommand="SELECT distinct PM.Products_ID AS ID,PM.Products_Name,ME.Equity_TickerSymbol,ME.Equity_TickerCode,ME.Equity_Series FROM Master_Products PM,master_Equity ME WHERE PM.Products_ID=ME.Equity_ProductID and ME.Equity_ExchsegmentID=@ExchangeSegmentID"> 
                    <SelectParameters>
                     <asp:SessionParameter  SessionField="ExchangeSegmentID" Name="ExchangeSegmentID" Type="string"></asp:SessionParameter>
                    </SelectParameters>
                    </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
