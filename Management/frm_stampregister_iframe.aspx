<%@ page language="C#" autoeventwireup="true" inherits="management_frm_Stampregister_iframe, App_Web_e81qjzgk" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Stamp Duty Register</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

<script type="text/javascript" src="../JSFUNCTION/init.js"></script>
   

    <script type="text/javascript" language="javascript">
        function SignOff()
        {
          window.parent.SignOff();
        }
       function ShowHeight(obj)
        {
       
          height();
          nodisplay();
        }
        function ShowHeight1(obj)
        {
         
          height();
          nodisplay1();
        }
         function height()
        {
            if(document.body.scrollHeight+50>300)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = 300;
            window.frameElement.widht = document.body.scrollWidht;
            
        }
        function nodisplay()
        {
          document.getElementById('Stamp1').style.display='none';
          document.getElementById('Stamp').style.display='inline';
          dllchange();
          height();
        }
       function nodisplay1()
        {
          document.getElementById('Stamp1').style.display='inline';
          document.getElementById('Stamp').style.display='none';
          dllchange();
          height();
        }
        function dllchange()
        {
            var obj=document.getElementById('cmbtype').value;
            if(obj=="Reconciliation")
              {
              
                 document.getElementById('tdshow').style.display='inline';

              }
            else
              {
                 document.getElementById('tdshow').style.display='none';

              }
          
        }
      function gridcallback()
        {
      
        var obj=document.getElementById('cmbtype').value;
         if(obj=="Reconciliation")
         {
	            grid1.PerformCallback();
	           
         }
         else
         {
                grid.PerformCallback();
                
         }
          dllchange();
       }
     function ShowHideFilter(obj)
    { 
         
         var objtype=document.getElementById('cmbtype').value;
         if(objtype=="Reconciliation")
         {
          grid1.PerformCallback(obj);
         }
         else
         {
          grid.PerformCallback(obj);
         }
       dllchange();
      height();
    }
            
    </script>
  

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div style="text-align: center; vertical-align: top">
            <table class="TableMain100">
                <tr>
                
                    <td class="gridcellright" style="width:150px" id="tdsettlement"  valign="top">
                        <span class="Ecoheadtxt" style="color: Blue"><strong>Date:</strong></span>
                    </td >
                       <td style="width: 81px; text-align:left"  valign="top">
                            <dxe:ASPxDateEdit ID="cmbDate" runat="server"  UseMaskBehavior="True"
                                 DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                >
                                <ButtonStyle Width="13px">
                                </ButtonStyle>
                                <DropDownButton ImagePosition="Top" Text="Date" Width="30px">
                                </DropDownButton>
                            </dxe:ASPxDateEdit>
                        </td>
                        <td class="gridcellright" style="width:80px"  valign="top">
                          <span class="Ecoheadtxt" style="color:Blue"><strong>Type:</strong></span>
                        </td>
                        <td class="gridcellleft" style="width:154px" valign="top">
                             <asp:DropDownList runat="server" width="130px" ID="cmbtype" onchange="javascript:dllchange();gridcallback();">
                             <asp:ListItem Value="Exchange">Exchange</asp:ListItem>
                                <asp:ListItem Value="Provisional">Provisional</asp:ListItem>
                                <asp:ListItem Value="Reconciliation">Reconciliation</asp:ListItem>
                                
                               </asp:DropDownList>
                        </td>
                    <td class="gridcellleft" style="width:154px" id="tdshow" runat="server" valign="top">
                        <asp:CheckBox ID="Chkdiff" runat="server"  Font-Size="X-Small" Checked="True"  />
                        <asp:Label ID="lblcheck" runat="server" Text="Show Only Differences"></asp:Label>
             
                    </td>
                   <td>           <dxe:ASPxButton ID="btnShow" runat="server"  AutoPostBack="False"  Text="Show" 
                            >
                            
                               <clientsideevents click="function(s, e) {
                               gridcallback();
	
}"></clientsideevents>
                        </dxe:ASPxButton></td>
                </tr>
                <tr>
                    <td class="gridcellleft" style="width: 150px" valign="top" id="ShowFilter">

                                        <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                            Show Filter</span></a> 
                                            <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                            All Records</span></a>
                                 
                    </td>
                    <td style="width: 81px; text-align: left" valign="top" id="Td1" class="gridcellleft">
                   
                                        
                                   
                    </td>
                    <td class="gridcellright" style="width: 80px" valign="top">
                    </td>
                    <td class="gridcellleft" style="width: 154px" valign="top">
                    </td>
                    <td runat="server" class="gridcellleft" style="width: 154px">
                    </td>
                    <td class="gridcellleft">
                    </td>
                </tr>
                
                <tr id="Stamp">
                      <td colspan="6">
                        <dxwgv:ASPxGridView ID="StampRegisterGrid" ClientInstanceName="grid" Width="100%" runat="server"
                            KeyFieldName="StampSummary_ID" 
                            AutoGenerateColumns="False" DataSourceID="StampRegisterDataSource"  OnCustomCallback="StampRegisterGrid_CustomCallback" OnCustomJSProperties="StampRegisterGrid_CustomJSProperties" OnSummaryDisplayText="StampRegisterGrid_SummaryDisplayText">
                            <ClientSideEvents EndCallback="function(s, e) {
	ShowHeight(s.cpHeight);
}" />
                            <Templates><DetailRow>
                                    <br />
                                    <dxwgv:ASPxGridView ID="StampDetailRegisterGrid" runat="server" 
                                        Width="100%" KeyFieldName="Stamp_ID"  DataSourceID="DataSourcedetailStampGrid"
                                        OnBeforePerformDataSelect="StampDetailRegisterGrid_DataSelect" >
                                        <%--OnCustomJSProperties="StampDetailRegisterGrid_CustomJSProperties"--%>
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_SecuritySymbol" Caption="Symbol" VisibleIndex="1">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_SecuritySeries" Caption="Series" VisibleIndex="2">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_AverageRate" Caption="Av.Rate" VisibleIndex="3">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_DeliveryBuyQuantity" Caption="Del.Buy"
                                                VisibleIndex="4">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_DeliveryBuyValue" Caption="Value"
                                                VisibleIndex="5">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_DeliverySaleQuantity" Caption="Del.Sale"
                                                VisibleIndex="6">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_DeliverySaleValue" Caption="Value"
                                                VisibleIndex="7">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_DeliverySaleStamp" Caption="Del.Stamp"
                                                VisibleIndex="8">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <%--  <dxwgv:GridViewDataTextColumn FieldName="Stamp_DeliveryBuyStamp" Caption="Del.Stamp" VisibleIndex="9">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>--%>
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_DifferenceSaleQuantity" Caption="Diff.Qnty"
                                                VisibleIndex="10">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_DifferenceSaleValue" Caption="Value"
                                                VisibleIndex="11">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_DifferenceStamp" Caption="Diff.Stamp"
                                                VisibleIndex="12">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_TotalStamp" Caption="Total" VisibleIndex="13">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>

                                    </dxwgv:ASPxGridView>
                                
</DetailRow>
</Templates>
                            <SettingsBehavior ConfirmDelete="True" allowfocusedrow="True" />
                            <Styles  >
<Header CssClass="gridheader"></Header>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<Footer CssClass="gridfooter"></Footer>
</Styles>
                            <Columns>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="name" Width="40%" Caption="Name">
<CellStyle CssClass="gridcellleft"></CellStyle>

<PropertiesTextEdit Width="90px"></PropertiesTextEdit>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="StampSummary_CustomerUcc" Width="15%" Caption="Code">
<CellStyle CssClass="gridcellleft"></CellStyle>

<PropertiesTextEdit Width="90px"></PropertiesTextEdit>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="StampSummary_TotalStamp" Width="15%" Caption="Total">
<CellStyle CssClass="gridcellright"></CellStyle>

<PropertiesTextEdit DisplayFormatString="{0:N2}" Width="90px"></PropertiesTextEdit>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="StampSummary_NetStamp" Width="15%" Caption="Net">
<CellStyle CssClass="gridcellright"></CellStyle>

<PropertiesTextEdit DisplayFormatString="{0:N2}" Width="90px"></PropertiesTextEdit>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="StampSummary_RoundOffAmount" Width="15%" Caption="RoundOff">
<CellStyle CssClass="gridcellright"></CellStyle>

<PropertiesTextEdit DisplayFormatString="{0:N2}" Width="90px"></PropertiesTextEdit>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
</Columns>
                             <TotalSummary>
<dxwgv:ASPxSummaryItem FieldName="StampSummary_NetStamp" Tag="net" ShowInGroupFooterColumn="Net" ShowInColumn="Net" SummaryType="Sum"></dxwgv:ASPxSummaryItem>
</TotalSummary>
                            <Settings ShowFooter="True" />
                            <SettingsDetail ShowDetailRow="True" />
                      
                            
                        </dxwgv:ASPxGridView>
                        </td></tr>
                        <tr id="Stamp1"><td colspan="6">
                        
                         <dxwgv:ASPxGridView ID="StampRegister" Width="100%" runat="server" KeyFieldName="provclient" 
                            
                            AutoGenerateColumns="False" ClientInstanceName="grid1" DataSourceID="StampDataSource" OnSummaryDisplayText="StampRegister_SummaryDisplayText" OnCustomCallback="StampRegister_CustomCallback" OnCustomJSProperties="StampRegister_CustomJSProperties">
                             <clientsideevents endcallback="function(s, e) {
	                            ShowHeight1(s.cpHeight1);
                            }" />
                             <settingsbehavior allowfocusedrow="True"></settingsbehavior>
                            <Columns>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="Name" Width="40%" Caption="Name">
<CellStyle CssClass="gridcellleft"></CellStyle>

<PropertiesTextEdit Width="90px"></PropertiesTextEdit>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="UCC" Width="15%" Caption="Code">
<CellStyle CssClass="gridcellleft"></CellStyle>

<PropertiesTextEdit Width="90px"></PropertiesTextEdit>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="ExchStamp" Width="15%" Caption="Exch Stamp">
<CellStyle CssClass="gridcellright"></CellStyle>

<PropertiesTextEdit DisplayFormatString="{0:N2}" Width="90px"></PropertiesTextEdit>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="ProvStamp" Width="15%" Caption="Prov Stamp">
<CellStyle CssClass="gridcellright"></CellStyle>

<PropertiesTextEdit DisplayFormatString="{0:N2}" Width="90px"></PropertiesTextEdit>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="Diffr" Width="15%" Caption="Diff">
<CellStyle CssClass="gridcellright"></CellStyle>

<PropertiesTextEdit DisplayFormatString="{0:N2}" Width="90px"></PropertiesTextEdit>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
</Columns>
                            
                             <totalsummary>
<dxwgv:ASPxSummaryItem FieldName="ExchStamp" Tag="net" ShowInGroupFooterColumn="Exch Stamp" ShowInColumn="Exch Stamp" SummaryType="Sum"></dxwgv:ASPxSummaryItem>
<dxwgv:ASPxSummaryItem FieldName="ProvStamp" Tag="net" ShowInGroupFooterColumn="Prov Stamp" ShowInColumn="Prov Stamp" SummaryType="Sum"></dxwgv:ASPxSummaryItem>
<dxwgv:ASPxSummaryItem FieldName="Diffr" Tag="net" ShowInGroupFooterColumn="Diff" ShowInColumn="Diff" SummaryType="Sum"></dxwgv:ASPxSummaryItem>
</totalsummary>
                            <Settings ShowFooter="True" />
                                                         
                            </dxwgv:ASPxGridView>
                            </td>
                            </tr>
                            <tr><td colspan="6">
                        <asp:SqlDataSource ID="StampRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="DataSourcedetailStampGrid" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                        </asp:SqlDataSource>
                          <asp:SqlDataSource ID="StampDataSource" ConflictDetection="CompareAllValues" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                        </asp:SqlDataSource>
                      <%--  (case when Stamp_TotalStamp=0.0000 then '' else cast(cast(Stamp_TotalStamp as varchar )as decimal(18,2))end )as Stamp_TotalStamp--%>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
