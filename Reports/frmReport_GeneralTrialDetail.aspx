<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_GeneralTrialDetail, App_Web_hnkxxmul" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
     <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    
     <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>



     <script language="javascript" type="text/javascript">
      function ShowHideFilter(obj)
    {
           grid.PerformCallback(obj);
    } 
    
   function callback()
    {
       grid.PerformCallback();
        height();
    }  
    
    function ShowLedger(objMainID,objSubID,objSegmentID,objMainAcc,objSubAcc,objUcc,objDate)
    {
        var URL='frmReport_IFrameLedgerView.aspx?MainID='+objMainID +' &SubID='+objSubID +' &SegmentID='+objSegmentID +' &date='+objDate;	        
//	    parent.OnMoreInfoClick(URL,""+objMainAcc+"  -  "+objSubAcc+" ["+objUcc+"]",'1000px','500px',"N");
//	    
//	    
//	      var URL='../management/ObligationStatementCM.aspx?date='+objDate +' &SettNo='+objSettno+' &Compid='+objComp+' &SegID='+objSegment+' &ClientID='+objCliID;	        
            editwin=dhtmlmodal.open("Editbox", "iframe", URL, ""+objSubAcc+"", "width=940px,height=450px,center=1,resize=1,top=500", "recal");                 
    }
 
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
    <div>
 <%--   <table width="100%"><tr><td>
    <div id="display" runat="server" >
                                </div></td></tr></table>--%>
                                
                                
                                <table class="TableMain100">
            <%-- <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Email Accounts Setup</span></strong>
                    </td>
                </tr>--%>
                <tr>
                <td>
                <table width="100%">
                  <tr>
                                                    <td id="Td1" align="left">
                                                        <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                                            Show Filter</span></a> || <a href="javascript:ShowHideFilter('All');"><span style="color: #000099;
                                                                text-decoration: underline">All Records</span></a>
                                                    </td>
                                                    <td align="right">
                                                        <asp:DropDownList ID="ddlExport" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged1">
                            <asp:ListItem Value="Ex" Selected="True">Export</asp:ListItem>
                            <asp:ListItem Value="E">Excel</asp:ListItem>                           
                        </asp:DropDownList>
                                                    </td>
                                                   
                                                </tr></table></td>
                
                </tr>
                <tr>
                    <td>
                 
                        <dxwgv:ASPxGridView ID="gridStatus" ClientInstanceName="grid"  Width="100%"
                            KeyFieldName="ClosingID"  runat="server"
                            AutoGenerateColumns="False" OnCustomCallback="gridStatus_CustomCallback" OnDataBound="gridStatus_DataBound" OnDataBinding="gridStatus_DataBinding" OnHtmlRowCreated="gridStatus_HtmlRowCreated" OnHtmlRowPrepared="gridStatus_HtmlRowPrepared">
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                               
                            <Styles>
                                <FocusedRow CssClass="gridselectrow" BackColor="#FCA977">
                                </FocusedRow>
                                <FocusedGroupRow CssClass="gridselectrow" BackColor="#FCA977">
                                </FocusedGroupRow>
                                <Footer BackColor="#FFE0C0" Font-Bold="True" HorizontalAlign="Right">
                                </Footer>
                            </Styles>
                            <SettingsPager NumericButtonCount="20" PageSize="15" ShowSeparators="True" AlwaysShowPager="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Visible="False" FieldName="ClosingID" Caption="ID" >
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                            
                                <dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="accountsledger_subaccountName" 
                                    Caption="Name">
                                    <CellStyle CssClass="gridcellleft" Wrap="True">
                                    </CellStyle>
                                    <FooterTemplate>
                                             Total :
                                                </FooterTemplate>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="BRANCH" 
                                    Caption="Branch">
                                    <CellStyle CssClass="gridcellleft" Wrap="True">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="UCC"
                                    Caption="Code">
                                    <CellStyle CssClass="gridcellleft" Wrap="True">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                
                                    <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="OpeningDr"
                                    Caption="Opening Dr" >
                                    <CellStyle CssClass="gridcellright" >
                                    </CellStyle>
                                     <FooterTemplate>
                                              <%# GetTotalOPDr() %>
                                                </FooterTemplate>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                
                                 
                                  
                                    <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="OpeningCr"
                                    Caption="OpeningCr">
                                    <CellStyle CssClass="gridcellright">
                                    </CellStyle>
                                     <FooterTemplate>
                                               <%# GetTotalOPCr() %>
                                                </FooterTemplate>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                 
                                    <dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="AmountDr"
                                    Caption="AmountDr">
                                    <CellStyle CssClass="gridcellright">
                                    </CellStyle>
                                    <FooterTemplate>
                                              <%# GetTotalAmDr() %>
                                                </FooterTemplate>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                
                                    <dxwgv:GridViewDataTextColumn VisibleIndex="6" FieldName="AmountCr"
                                    Caption="AmountCr">
                                    <CellStyle CssClass="gridcellright">
                                    </CellStyle>
                                    <FooterTemplate>
                                    
                                              <%# GetTotalAmCr() %>
                                                </FooterTemplate>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                

                                    <dxwgv:GridViewDataTextColumn VisibleIndex="7" FieldName="ClosingDr"
                                    Caption="ClosingDr">
                                    <CellStyle CssClass="gridcellright">
                                    </CellStyle>
                                    <FooterTemplate>
                                              <%# GetTotalCLDr() %>
                                                </FooterTemplate>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>

                                    <dxwgv:GridViewDataTextColumn VisibleIndex="8" FieldName="ClosingCr"
                                    Caption="ClosingCr">
                                    <CellStyle CssClass="gridcellright">
                                    </CellStyle>
                                    <FooterTemplate>
                                              <%# GetTotalCLCr() %>
                                                </FooterTemplate>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                    </dxwgv:GridViewDataTextColumn>
                                
                                                     
                            </Columns>
                                    <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                             <TotalSummary>
                                            <dxwgv:ASPxSummaryItem FieldName="TotOPDr" ShowInColumn="OpeningDr" ShowInGroupFooterColumn="OpeningDr" Tag="Total Opening Debit" DisplayFormat="#,##,###.00" />
                                            <dxwgv:ASPxSummaryItem FieldName="TotOPCr" ShowInColumn="OpeningCr" ShowInGroupFooterColumn="OpeningCr" Tag="Total Opening Debit" DisplayFormat="#,##,###.00" />
                                            <dxwgv:ASPxSummaryItem FieldName="TotAmtDr" ShowInColumn="AmountDr" ShowInGroupFooterColumn="AmountDr" Tag="Total Opening Debit" DisplayFormat="#,##,###.00" />
                                            <dxwgv:ASPxSummaryItem FieldName="TotAmtCr" ShowInColumn="AmountCr" ShowInGroupFooterColumn="AmountCr" Tag="Total Opening Debit" DisplayFormat="#,##,###.00" />
                                            <dxwgv:ASPxSummaryItem FieldName="TotCLDr" ShowInColumn="ClosingDr" ShowInGroupFooterColumn="ClosingDr" Tag="Total Opening Debit" DisplayFormat="#,##,###.00" />
                                            <dxwgv:ASPxSummaryItem FieldName="TotCLCr" ShowInColumn="ClosingCr" ShowInGroupFooterColumn="ClosingCr" Tag="Total Opening Debit" DisplayFormat="#,##,###.00" />
                                        </TotalSummary>
                            <Settings ShowFooter="True" />
                        </dxwgv:ASPxGridView>
                                  
           
                    </td>
                </tr>
            </table>
    </div>
    </form>
</body>
</html>
