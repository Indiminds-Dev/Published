<%@ page language="C#" autoeventwireup="true" inherits="management_frm_DoubleCapture_UnMatchedRecord_Popup, App_Web_ko_nrypx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
     <form id="form1" runat="server">
    <div>
        <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
           KeyFieldName="id" Width="100%">
            <Columns>
                <dxwgv:GridViewDataTextColumn FieldName="AcceptReject" VisibleIndex="1" FixedStyle="Left"
                    Visible="False" Width="75px">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataColumn FieldName="SlipNumber" VisibleIndex="1" FixedStyle="Left"
                    Width="50px" Caption="Detail Record" >
                    <CellStyle BackColor="#FFFFD6">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="ClientID" VisibleIndex="2" FixedStyle="Left"
                    Width="200px"  Visible="False">
                    <CellStyle Wrap="False" BackColor="#FFFFD6">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="TransactionType" VisibleIndex="3" FixedStyle="Left"
                    Width="150px"  Visible="False">
                    <CellStyle Wrap="False" BackColor="#FFFFD6">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="MarketType" VisibleIndex="4"   Visible="False">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="SettlementNumber" VisibleIndex="5"   Visible="False">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="NsdlOffline_DPID" VisibleIndex="6" Visible="False">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="NsdlOffline_OtherClientID" VisibleIndex="7" Width="200px"  Visible="False">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="OtherCMBPID" VisibleIndex="8" Width="200px"  Visible="False">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="CCCMID" VisibleIndex="9" Width="250px"  Visible="False">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="OtherMarketType" VisibleIndex="10" Width="100px"  Visible="False">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="OtherSettlementNumber" VisibleIndex="11" Width="100px"  Visible="False">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="ISIN" VisibleIndex="12" Width="200px"  Visible="False">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="Quantity" VisibleIndex="13" Width="50px"  Visible="False">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="TransactionDate" VisibleIndex="14" Width="100px"  Visible="False">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="ExecutionDate" VisibleIndex="15" Width="100px"  Visible="False">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="EntryUserRole" VisibleIndex="16" Width="200px"  Visible="False">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="CCCMID" VisibleIndex="18" Visible="False" Width="100px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="ClientID" VisibleIndex="19" Visible="False"
                    Width="100px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="NsdlOffline_MarketType" VisibleIndex="20" Visible="False"
                    Width="100px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="NsdlOffline_OtherMarketType" VisibleIndex="21"
                    Visible="False" Width="100px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="NsdlOffline_TransactionType" VisibleIndex="22"
                    Visible="False" Width="100px" >
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="SourceCCCMID" VisibleIndex="23" Visible="False"
                    Width="100px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn VisibleIndex="24" Visible="False" Width="100px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn VisibleIndex="25" Visible="False" Width="100px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataColumn>
            </Columns>
          <Templates>
          <DataRow>
        <table border="1">
        <tr>
            <td style="font-size:x-small">
                SlipNumber
            </td>
            <td>
                <dxe:aspxlabel id="lblslipno" runat="server" text='<%# Bind("SlipNumber") %>' Font-Size="X-Small">
                </dxe:aspxlabel>
            </td>
            <td  style="font-size:x-small">
                ClientId</td>
            <td nowrap="nowrap">
                <dxe:aspxlabel id="lblclient" clientinstancename="clblclient" runat="server" text='<%# Bind("ClientID") %>' Font-Size="X-Small">
                </dxe:aspxlabel>
            </td>
        </tr>
            <tr>
            <td  style="font-size:x-small">
                TransactionType
            </td>
            <td>
                 <dxe:aspxlabel id="Aspxlabel1" runat="server" text='<%# Bind("TransactionType") %>' Font-Size="X-Small">
                </dxe:aspxlabel>
            </td>
            <td  style="font-size:x-small">
                RecordEnterBy
            </td>
            <td>
                <asp:Label runat="server" ID="lblentryuserrole" Text='<%# Bind("EntryUserRole") %>' Font-Size="X-Small"> </asp:Label>
            </td>
            </tr>
        <tr>
            <td id="tdMarketTypeName"  style="font-size:x-small">
                SourceMktType
            </td>
            <td id="tdMarketTypeValue">
                 <dxe:aspxlabel id="Aspxlabel2" runat="server" text='<%# Bind("MarketType") %>' Font-Size="X-Small">
                </dxe:aspxlabel>
            </td>
            <td id="tdSettlementNumberName"  style="font-size:x-small">
                SourceSett.No.
            </td>
            <td id="tdSettlementNumberValue">
                <dxe:aspxlabel id="Aspxlabel3" runat="server" text='<%# Bind("SettlementNumber") %>' Font-Size="X-Small">
                </dxe:aspxlabel>
            </td>
        </tr>
        <tr>
            <td id="tdOtherDPIDName"  style="font-size:x-small">
                OtherDPId
            </td>
            <td id="tdOtherDPIDValue">
                  <dxe:aspxlabel id="Aspxlabel4" runat="server" text='<%# Bind("NsdlOffline_OtherDPID") %>' Font-Size="X-Small">
                </dxe:aspxlabel>
            </td>
            <td id="tdOtherClientIDName"  style="font-size:x-small">
                OtherClientID
            </td>
            <td id="tdOtherClientIDValue">
                 <dxe:aspxlabel id="Aspxlabel5" runat="server" text='<%# Bind("NsdlOffline_OtherClientID") %>' Font-Size="X-Small">
                </dxe:aspxlabel>
            </td>
        </tr>
        <tr>
            <td id="tdOtherCMBPIDName"  style="font-size:x-small">
                OtherCMID
            </td>
            <td id="tdOtherCMBPIDValue">
                  <dxe:aspxlabel id="Aspxlabel6" runat="server" text='<%# Bind("OtherCMBPID") %>' Font-Size="X-Small">
                </dxe:aspxlabel>
            </td>
            <td id="tdCCCMIDName"  style="font-size:x-small">
                
            </td>
            <td id="tdCCCMIDValue">
                
            </td>
        </tr>
        <tr>
            <td id="tdOtherMarketTypeName"  style="font-size:x-small">
                OtherMktType
            </td>
            <td id="tdOtherMarketTypeValue">
                <dxe:aspxlabel id="Aspxlabel8" runat="server" text='<%# Bind("OtherMarketType") %>' Font-Size="X-Small">
                </dxe:aspxlabel>
            </td>
            <td id="tdOtherSettlementNumberName"  style="font-size:x-small">
                OtherSett.No
            </td>
            <td id="tdOtherSettlementNumberValue">
                  <dxe:aspxlabel id="Aspxlabel9" runat="server" text='<%# Bind("OtherSettlementNumber") %>' Font-Size="X-Small">
                </dxe:aspxlabel>
            </td>
        </tr>
        <tr>
            <td  style="font-size:10px">
                ISIN
            </td>
            <td>
                 <dxe:aspxlabel id="Aspxlabel10" runat="server" text='<%# Bind("NsdlOffline_ISIN") %>' Font-Size="X-Small">
                </dxe:aspxlabel>
            </td>
            <td  style="font-size:x-small">
                Qty
            </td>
            <td>
                  <dxe:aspxlabel id="Aspxlabel11" runat="server" text='<%# Bind("Quantity") %>' Font-Size="X-Small">
                </dxe:aspxlabel>
            </td>
        </tr>
        <tr>
            <td  style="font-size:x-small">
                Tran.Date
            </td>
            <td>
                <dxe:aspxlabel id="Aspxlabel12" runat="server" text='<%# Bind("TransactionDate") %>' Font-Size="X-Small">
                </dxe:aspxlabel>
            <td  style="font-size:x-small">
                Exec.Date
            </td>
            <td>
                <dxe:aspxlabel id="Aspxlabel13" runat="server" text='<%# Bind("ExecutionDate") %>' Font-Size="X-Small">
                </dxe:aspxlabel>
            </td>
            
        </tr>
        <tr>
         <td  style="font-size:x-small">
                AcceptRejectRecord
            </td>
        <td>
                <dxe:aspxlabel id="Aspxlabel14" runat="server" text='<%# Bind("AcceptReject") %>' Font-Size="X-Small">
                </dxe:aspxlabel>
            </td>
            <td  style="font-size:x-small">
            Rejected Reason
            </td>
             <dxe:aspxlabel id="Aspxlabel15" runat="server" text='<%# Bind("AcceptRejectReason") %>' Font-Size="X-Small">
                </dxe:aspxlabel>
        </tr>
      
    </table>
      </DataRow>
        </Templates>
            <SettingsPager Visible="False">
            </SettingsPager>
          
        </dxwgv:ASPxGridView>
       
    </div>
    </form>
</body>
</html>
