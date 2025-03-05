<%@ page language="C#" autoeventwireup="true" inherits="management_journal, App_Web_i8xxwgwk" %>

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
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
   <script language="javascript" type="text/javascript">
        function EndCall(obj)
        {
            if(obj=="3")
                alert('Delete Successfully');
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
        function OnMoreInfoClick(KeyValue,exch,date) 
        {
            <%Session["cashJournal"] = "2";%>
             var url="journalPopup.aspx?id="+KeyValue+"&exch="+exch+"&date="+date;
            parent.OnMoreInfoClick(url,"Modify Journal Entries",'940px','450px',"Y");
        
        }
        function OnAddButtonClick() 
        {
            <%Session["cashJournal"] = "2";%>
             var url='journalPopup.aspx';
             parent.OnMoreInfoClick(url,"Add Journal Entries",'985px','450px',"Y");
            
        }
        function RefreshGrid()
        {
           editwin.close();
        }
          FieldName='ctl00_ContentPlaceHolder1_Headermain1_Menumain_SkipLink';
          function ShowHideFilter(obj)
            {
               grid.PerformCallback(obj);
            }
        function callback()
        {
         grid.PerformCallback();
        }
    </script>
    <table class="TableMain100">
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
        </tr>
        <tr>
            <td>
                <dxwgv:ASPxGridView ID="gridJournal" ClientInstanceName="grid" KeyFieldName="JournalVoucher_ID" DataSourceID="SqlJournal" Width="100%" runat="server" OnCustomCallback="gridJournal_CustomCallback" AutoGenerateColumns="False" OnRowDeleting="gridJournal_RowDeleting" OnCustomJSProperties="gridJournal_CustomJSProperties">
                    <Styles>
                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                        </Header>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                    </Styles>
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <Columns>
                        <dxwgv:GridViewDataTextColumn Caption="Voucher Number" Visible="False" FieldName="JournalVoucher_ID"
                            VisibleIndex="0" >
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" VisibleIndex="0" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Voucher Number" FieldName="VoucherNumber"
                            VisibleIndex="0" >
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" VisibleIndex="0" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Transaction Date" FieldName="TDate"
                            VisibleIndex="1" >
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" VisibleIndex="0" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Segment" FieldName="Segment"
                            VisibleIndex="2" >
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" VisibleIndex="0" />
                        </dxwgv:GridViewDataTextColumn>
                         <dxwgv:GridViewDataTextColumn Caption="Credit" FieldName="JournalVoucher_ExchangeSegmentID" Visible="False" VisibleIndex="4"
                            >
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" VisibleIndex="0" />
                        </dxwgv:GridViewDataTextColumn>
                         <dxwgv:GridViewDataTextColumn Caption="Credit" FieldName="JournalVoucher_TransactionDate" Visible="False" VisibleIndex="5"
                            >
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" VisibleIndex="0" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="BID" FieldName="JournalVoucher_BranchID" Visible="False" VisibleIndex="6"
                            >
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" VisibleIndex="0" />
                        </dxwgv:GridViewDataTextColumn>
                         <dxwgv:GridViewDataTextColumn Caption="CompID" FieldName="JournalVoucher_CompanyID" Visible="False" VisibleIndex="7"
                            >
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" VisibleIndex="0" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Width="5%" Caption="Details" VisibleIndex="3">
                            <DataItemTemplate>
                                   <a href="#" onclick="OnMoreInfoClick('<%#Eval("VoucherNumber") %>','<%#Eval("JournalVoucher_ExchangeSegmentID") %>','<%#Eval("JournalVoucher_TransactionDate") %>')">Edit</a>
                            </DataItemTemplate>
                            <HeaderTemplate>
                                <a href="javascript:void(0);" onclick="OnAddButtonClick()"><span style="color: #000099;
                                    text-decoration: underline">Add New</span></a>
                            </HeaderTemplate>
                       </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewCommandColumn VisibleIndex="4" Width="5%">
                            <DeleteButton Visible="True">
                            </DeleteButton>
                        </dxwgv:GridViewCommandColumn>
                    </Columns>
                    <Settings ShowGroupPanel="True" />
                    <SettingsText PopupEditFormCaption="Add/Modify Cash/Bank" ConfirmDelete="Are you sure to Delete this Record!" />
                    <SettingsPager NumericButtonCount="20" Visible="False" ShowSeparators="True">
                        <FirstPageButton Visible="True">
                        </FirstPageButton>
                        <LastPageButton Visible="True">
                        </LastPageButton>
                    </SettingsPager>
                    <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                    <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormHeight="600px"
                        PopupEditFormVerticalAlign="TopSides" PopupEditFormWidth="900px" />
                    <ClientSideEvents EndCallback="function(s, e) {
	 EndCall(s.cpEND);
}" />
                </dxwgv:ASPxGridView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlJournal" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" 
        SelectCommand="">
    </asp:SqlDataSource>
    </form>
</body>
</html>
