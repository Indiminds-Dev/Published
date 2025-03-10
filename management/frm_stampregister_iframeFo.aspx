<%@ page language="C#" autoeventwireup="true" inherits="management_frm_stampregister_iframeFo, App_Web_ko_nrypx" %>

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

<html xmlns="http://www.w3.org/1999/xhtml" >
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
    function onchangecheckbox(obj)
    {
      if(obj=='on')
       {
         grid1.PerformCallback(obj);
       }
    }
            
    </script>
  

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div style="text-align: center; vertical-align: top">
            <table class="TableMain100"> 
            <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Stamp Duty Register</span></strong>
                    </td>
                </tr>
            </table>
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
                        <asp:CheckBox ID="Chkdiff" runat="server"  Font-Size="X-Small" Checked="True" onClick="onchangecheckbox(this.value)" /> 
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
                    <td id="Td2" runat="server" class="gridcellleft" style="width: 154px">
                    </td>
                    <td class="gridcellleft">
                    </td>
                </tr>
                <tr id="Stamp">
                    <td colspan="6">
                        <dxwgv:ASPxGridView ID="StampRegisterGrid" ClientInstanceName="grid" Width="100%" runat="server"
                            KeyFieldName="StampSummary_ID" 
                            AutoGenerateColumns="False" DataSourceID="StampRegisterDataSource"  OnCustomCallback="StampRegisterGrid_CustomCallback" OnCustomJSProperties="StampRegisterGrid_CustomJSProperties" OnSummaryDisplayText="StampRegisterGrid_SummaryDisplayText">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Width="40%" FieldName="name" VisibleIndex="0" Caption="Name">
                                    <EditFormSettings Visible="False" />
                                    <PropertiesTextEdit Width="90px">
                                    </PropertiesTextEdit>
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Width="15%" FieldName="StampSummary_CustomerUcc" VisibleIndex="1"
                                    Caption="Code">
                                    <EditFormSettings Visible="False" />
                                    <PropertiesTextEdit Width="90px">
                                    </PropertiesTextEdit>
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Width="15%" FieldName="StampSummary_TotalStamp" VisibleIndex="2"
                                    Caption="Total">
                                    <EditFormSettings Visible="False" />
                                    <PropertiesTextEdit Width="90px" DisplayFormatString="{0:N2}">
                                    </PropertiesTextEdit>
                                    <CellStyle CssClass="gridcellright">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn Width="15%" FieldName="StampSummary_NetStamp" VisibleIndex="4"
                                    Caption="Net">
                                    <EditFormSettings Visible="False" />
                                    <PropertiesTextEdit Width="90px" DisplayFormatString="{0:N2}">
                                    </PropertiesTextEdit>
                                    <CellStyle CssClass="gridcellright">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Width="15%" FieldName="StampSummary_RoundOffAmount"
                                    VisibleIndex="3" Caption="RoundOff">
                                    <EditFormSettings Visible="False" />
                                    <PropertiesTextEdit Width="90px" DisplayFormatString="{0:N2}">
                                    </PropertiesTextEdit>
                                    <CellStyle CssClass="gridcellright">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <Settings ShowFooter="True" />
                             <TotalSummary>
                                <dxwgv:ASPxSummaryItem FieldName="StampSummary_NetStamp" ShowInColumn="Net" ShowInGroupFooterColumn="Net"
                                    SummaryType="Sum" Tag="net" />
                            </TotalSummary>
                            <Templates>
                                <DetailRow>
                                    <br />
                                    <dxwgv:ASPxGridView ID="StampDetailRegisterGrid" runat="server" 
                                        Width="100%" KeyFieldName="Stamp_ID"  DataSourceID="DataSourcedetailStampGrid"
                                        OnBeforePerformDataSelect="StampDetailRegisterGrid_DataSelect" >
                                     
                                        <Columns>
                                        
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_SecuritySymbol" Caption="Instrument" VisibleIndex="1">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>


                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_FutureSaleValue" Caption="Future Buy Value"
                                                VisibleIndex="5">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_FutureStamp" Caption="Future Stamp"
                                                VisibleIndex="6">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_OptionSaleValue" Caption="Option Buy Value"
                                                VisibleIndex="7">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_OptionStamp" Caption="Option Stamp"
                                                VisibleIndex="8">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                        
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_DeliveryBuyValue" Caption="Delivery Buy Value"
                                                VisibleIndex="10">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_DeliveryBuyStamp" Caption="Delivery Stamp"
                                                VisibleIndex="11">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>

                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_DifferenceSaleValue" Caption="Non Delivery Value" VisibleIndex="12">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataDateColumn FieldName="Stamp_DifferenceStamp" Caption="Non Delivery Stamp" VisibleIndex="13">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataDateColumn>

                                            <dxwgv:GridViewDataTextColumn FieldName="Stamp_TotalStamp" Caption="Total Stamp"
                                                VisibleIndex="14">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                      
                                        </Columns>

                                    </dxwgv:ASPxGridView>
                                </DetailRow>
                            </Templates>
                            <SettingsDetail ShowDetailRow="True" />
                            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                            <ClientSideEvents EndCallback="function(s, e) {
	ShowHeight(s.cpHeight);
}" />
                      
                            
                        </dxwgv:ASPxGridView>
                     
                    </td>
                </tr>
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
                                         <tr><td> <%--  <asp:SqlDataSource ID="StampRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="DataSourcedetailStampGrid" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="SELECT Stamp_SecuritySymbol+' '+Stamp_SecuritySeries+' '+(case when Stamp_StrikePrice=0.0000 then '' else convert( varchar,cast(Stamp_StrikePrice as money),1)end )+' '+convert(varchar(9),Stamp_ExpiryDate,6) as Stamp_SecuritySymbol,
                        (case when Stamp_StrikePrice=0.0000 then '' else convert( varchar,cast(Stamp_StrikePrice as money),1)end )as Stamp_StrikePrice,
                        (case when Stamp_FutureSaleValue=0.0000 then '' else convert(varchar,cast(Stamp_FutureSaleValue as money),1)end)as Stamp_FutureSaleValue,
                        (case when Stamp_FutureStamp=0.0000 then '' else convert(varchar,cast(Stamp_FutureStamp as money),1)end)as Stamp_FutureStamp,
                        (case when Stamp_OptionSaleValue=0.0000 then '' else convert(varchar,cast(Stamp_OptionSaleValue as money),1)end )as Stamp_OptionSaleValue,
                        (case when Stamp_OptionStamp=0.0000 then '' else convert(varchar,cast(Stamp_OptionStamp  as money),1)end )as Stamp_OptionStamp,
                        (case when Stamp_DeliveryBuyValue=0.0000 then '' else convert(varchar,cast(Stamp_DeliveryBuyValue as money),1) end)as Stamp_DeliveryBuyValue,
                        (case when Stamp_DeliveryBuyStamp=0.0000 then '' else convert(varchar,cast(Stamp_DeliveryBuyStamp as money),1)end )as Stamp_DeliveryBuyStamp,
                        (case when Stamp_DifferenceSaleValue=0.0000 then '' else convert(varchar,cast(Stamp_DifferenceSaleValue as money),1) end)as Stamp_DifferenceSaleValue,
                        (case when Stamp_DifferenceStamp=0.0000 then '' else convert(varchar,cast(Stamp_DifferenceStamp as money),1)end )as Stamp_DifferenceStamp,
                       (case when Stamp_TotalStamp=0.0000 then '' else convert(varchar,cast(Stamp_TotalStamp as money ),1)end )as Stamp_TotalStamp
                         FROM [Trans_Stamp] Where Stamp_CustomerID =(select StampSummary_CustomerID from Trans_StampSummary where StampSummary_ID=@Id )">
                            <SelectParameters>
                                <asp:SessionParameter Name="Id" SessionField="KeyVal" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>--%>
                        <asp:SqlDataSource ID="StampRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="DataSourcedetailStampGrid" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                        </asp:SqlDataSource><asp:SqlDataSource ID="StampDataSource" ConflictDetection="CompareAllValues" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                        </asp:SqlDataSource></td></tr>
            </table>
        </div>
    </form>
</body>
</html>
