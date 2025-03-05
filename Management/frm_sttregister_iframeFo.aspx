<%@ page language="C#" autoeventwireup="true" inherits="management_frm_sttregister_iframeFo, App_Web_mzqu16me" %>

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
    <title>STT Register</title>
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
          document.getElementById('stt1').style.display='none';
          document.getElementById('stt').style.display='inline';
          dllchange();
          height();
        }
       function nodisplay1()
        {
          document.getElementById('stt1').style.display='inline';
          document.getElementById('stt').style.display='none';
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
                        <strong><span style="color: #000099">STT Register</span></strong>
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
                <tr id="stt">
                    <td colspan="6">
                        <dxwgv:ASPxGridView ID="SttRegisterGrid" ClientInstanceName="grid" Width="100%" runat="server"
                            KeyFieldName="SttaxSummary_ID" 
                            AutoGenerateColumns="False" DataSourceID="SttRegisterDataSource"  OnCustomCallback="SttRegisterGrid_CustomCallback" OnCustomJSProperties="SttRegisterGrid_CustomJSProperties" OnSummaryDisplayText="SttRegisterGrid_SummaryDisplayText">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Width="40%" FieldName="name" VisibleIndex="0" Caption="Name">
                                    <EditFormSettings Visible="False" />
                                    <PropertiesTextEdit Width="90px">
                                    </PropertiesTextEdit>
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Width="15%" FieldName="SttaxSummary_CustomerUcc" VisibleIndex="1"
                                    Caption="Code">
                                    <EditFormSettings Visible="False" />
                                    <PropertiesTextEdit Width="90px">
                                    </PropertiesTextEdit>
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Width="15%" FieldName="SttaxSummary_TotalSTT" VisibleIndex="2"
                                    Caption="Total">
                                    <EditFormSettings Visible="False" />
                                    <PropertiesTextEdit Width="90px" DisplayFormatString="{0:N2}">
                                    </PropertiesTextEdit>
                                    <CellStyle CssClass="gridcellright">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn Width="15%" FieldName="SttaxSummary_NetSTT" VisibleIndex="4"
                                    Caption="Net">
                                    <EditFormSettings Visible="False" />
                                    <PropertiesTextEdit Width="90px" DisplayFormatString="{0:N2}">
                                    </PropertiesTextEdit>
                                    <CellStyle CssClass="gridcellright">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Width="15%" FieldName="SttaxSummary_RoundOffAmount"
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
                                <dxwgv:ASPxSummaryItem FieldName="SttaxSummary_NetSTT" ShowInColumn="Net" ShowInGroupFooterColumn="Net"
                                    SummaryType="Sum" Tag="net" />
                            </TotalSummary>
                            <Templates>
                                <DetailRow>
                                    <br />
                                    <dxwgv:ASPxGridView ID="SttDetailRegisterGrid" runat="server" 
                                        Width="100%" KeyFieldName="Sttax_ID"  DataSourceID="DataSourcedetailSttGrid"
                                        OnBeforePerformDataSelect="SttDetailRegisterGrid_DataSelect" >
                                     
                                        <Columns>
                                        
                                            <dxwgv:GridViewDataTextColumn FieldName="Sttax_SecuritySymbol" Caption="Symbol" VisibleIndex="1">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Sttax_SecuritySeries" Caption="Series" VisibleIndex="2">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataDateColumn FieldName="Sttax_ExpiryDate" Caption="Exp.Date" VisibleIndex="3">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataDateColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Sttax_StrikePrice" Caption="Strike Price"
                                                VisibleIndex="4">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Sttax_FutureSaleValue" Caption="FutureVal"
                                                VisibleIndex="5">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Sttax_FutureStt" Caption="Future STT"
                                                VisibleIndex="6">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Sttax_OptionSaleValue" Caption="Opt.Value"
                                                VisibleIndex="7">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Sttax_OptionStt" Caption="Opt.STT"
                                                VisibleIndex="8">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                        
                                            <dxwgv:GridViewDataTextColumn FieldName="Sttax_OptionExerciseValue" Caption="Exer.Val"
                                                VisibleIndex="10">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Sttax_OptionExerciseStt" Caption="Exer.STT"
                                                VisibleIndex="11">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Sttax_TotalStt" Caption="Total"
                                                VisibleIndex="12">
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
                   <tr id="stt1"><td colspan="6">
                        
                         <dxwgv:ASPxGridView ID="SttRegister" Width="100%" runat="server" KeyFieldName="provclient" 
                            
                            AutoGenerateColumns="False" ClientInstanceName="grid1" DataSourceID="SttDataSource" OnSummaryDisplayText="SttRegister_SummaryDisplayText" OnCustomCallback="SttRegister_CustomCallback" OnCustomJSProperties="SttRegister_CustomJSProperties">
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
<dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="ExchSTT" Width="15%" Caption="Exch STT">
<CellStyle CssClass="gridcellright"></CellStyle>

<PropertiesTextEdit DisplayFormatString="{0:N2}" Width="90px"></PropertiesTextEdit>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="ProvSTT" Width="15%" Caption="Prov STT">
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
<dxwgv:ASPxSummaryItem FieldName="ExchSTT" Tag="net" ShowInGroupFooterColumn="Exch STT" ShowInColumn="Exch STT" SummaryType="Sum"></dxwgv:ASPxSummaryItem>
<dxwgv:ASPxSummaryItem FieldName="ProvSTT" Tag="net" ShowInGroupFooterColumn="Prov STT" ShowInColumn="Prov STT" SummaryType="Sum"></dxwgv:ASPxSummaryItem>
<dxwgv:ASPxSummaryItem FieldName="Diffr" Tag="net" ShowInGroupFooterColumn="Diff" ShowInColumn="Diff" SummaryType="Sum"></dxwgv:ASPxSummaryItem>
</totalsummary>
                            <Settings ShowFooter="True" />
                                                         
                            </dxwgv:ASPxGridView>
                            </td>
                            </tr>
                                         <tr><td> <%--  <asp:SqlDataSource ID="SttRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="DataSourcedetailSttGrid" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="SELECT Sttax_SecuritySymbol,Sttax_SecuritySeries,Sttax_ExpiryDate,
                        (case when Sttax_StrikePrice=0.0000 then '' else convert( varchar,cast(Sttax_StrikePrice as money),1)end )as Sttax_StrikePrice,
                        (case when Sttax_FutureSaleValue=0.0000 then '' else convert(varchar,cast(Sttax_FutureSaleValue as money),1)end)as Sttax_FutureSaleValue,
                        (case when Sttax_FutureStt=0.0000 then '' else convert(varchar,cast(Sttax_FutureStt as money),1)end)as Sttax_FutureStt,
                        (case when Sttax_OptionSaleValue=0.0000 then '' else convert(varchar,cast(Sttax_OptionSaleValue as money),1)end )as Sttax_OptionSaleValue,
                        (case when Sttax_OptionStt=0.0000 then '' else convert(varchar,cast(Sttax_OptionStt  as money),1)end )as Sttax_OptionStt,
                        (case when Sttax_OptionExerciseValue=0.0000 then '' else convert(varchar,cast(Sttax_OptionExerciseValue as money),1) end)as Sttax_OptionExerciseValue,
                        (case when Sttax_OptionExerciseStt=0.0000 then '' else convert(varchar,cast(Sttax_OptionExerciseStt as money),1)end )as Sttax_OptionExerciseStt,
                       (case when Sttax_TotalStt=0.0000 then '' else convert(varchar,cast(Sttax_TotalStt as money ),1)end )as Sttax_TotalStt
                         FROM [Trans_Sttax] Where Sttax_CustomerID =(select SttaxSummary_CustomerID from Trans_SttaxSummary where SttaxSummary_ID=@Id )">
                            <SelectParameters>
                                <asp:SessionParameter Name="Id" SessionField="KeyVal" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>--%>
                        <asp:SqlDataSource ID="SttRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="DataSourcedetailSttGrid" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                        </asp:SqlDataSource><asp:SqlDataSource ID="SttDataSource" ConflictDetection="CompareAllValues" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                        </asp:SqlDataSource></td></tr>
            </table>
        </div>
    </form>
</body>
</html>
