<%@ page language="C#" autoeventwireup="true" inherits="management_frmCdslPoaDetails, App_Web_nidspgif" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CDSL POA</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
   <script language="javascript" type="text/javascript">
   
        function callback()
        {
          height();
          grid.PerformCallback();
        }
        function SignOff()
        {
            window.parent.SignOff();
        }
        function height()
        {
//            alert('Hi!');
            if(document.body.scrollHeight>=500)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '500px';
            window.frameElement.Width = document.body.scrollWidth;
        }     
        function PageLoad()
        {
          QStrDpType = window.location.search;
        }     
        function OnAddButtonClick() 
        {
          var url='frm_IssueSlipBooks.aspx'+QStrDpType;
          parent.OnMoreInfoClick(url,"Issue Slips",'940px','450px',"Y");
         
        }
        function PopulateGrid()
        {
            editwin.close();
            grid.PerformCallback();
        }
        function OnMoreInfoClick(CdslCLients_ID)
        {
            
              var str=document.getElementById('hdnSeg').value;
              //alert(str);
              var url='frmCdslPoaDetails.aspx?Id='+CdslCLients_ID+'&type='+str;
              parent.OnMoreInfoClick(url,"Details",'940px','450px',"Y");
         }
        function OnCancelSlipClick(DpSlipsIssued_ID,BenId,SlipType)     
        {
             
              var url='frm_CancelSlip.aspx?Id='+DpSlipsIssued_ID+'&BenId='+BenId+'&SlipType='+SlipType;
              parent.OnMoreInfoClick(url,"Cancel Slip",'940px','450px',"Y");
            
        }
       function ShowHideFilter(obj)
        {
//            alert('a');
           grid.PerformCallback(obj);
        }
        function showmessage()
        {
            alert('hi');
        }
        function EndCallmethod(obj)
        {
            //alert(obj);
            if(obj!=undefined)
            {
                if(obj=='3')
                {
                    alert('Successfully Deleted!');
                }
                else if(obj=='2')
                {
                    alert('Items Already Used,Cannot Be Deleted!');
                }
                
           }
          height();  
        }
    </script>
            <table class="TableMain100">
                <tr>
                    <td style="text-align: center; vertical-align: top" class="EHEADER">
                        <span style="color: #3300cc"><strong>POA Details</strong></span>
                    </td>
                </tr>
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
                                <td id="tdmessage">
                                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="gridStcokIssue" runat="server" ClientInstanceName="grid"
                            KeyFieldName="CdslCLients_ID" Width="100%" AutoGenerateColumns="False"
                            OnCustomCallback="gridStcokIssue_CustomCallback">
                            <clientsideevents endcallback="function(s, e) {
	EndCallmethod(s.cpEND);
}"></clientsideevents>
                                        <SettingsBehavior ConfirmDelete="True" allowfocusedrow="True" />                                    
                            <styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>
</styles>
                          <settingspager numericbuttoncount="20" pagesize="20" showseparators="True" mode="ShowAllRecords">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</settingspager>
                                        <columns>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="CdslClients_DPID" Caption="DP ID">
<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle HorizontalAlign="Left" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="CdslClients_BOID" Caption="BO ID">
<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle HorizontalAlign="Left" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="CdslClients_BenAccountNumber" Caption="Ben Number">
<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle HorizontalAlign="Left" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="cdslclients_FirstHolderName" Caption="Holder Name">
<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="CdslClients_FirstHolderPAN" Caption="PAN">
<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="CdslClients_AccountOpeningDate" Caption="Opening Date">
<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="6" FieldName="CdslClients_AccountClosSuspDate" Caption="Closing date">
<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle HorizontalAlign="Left" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="7" FieldName="CdslClients_accountStatus" Caption="Status">
<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle HorizontalAlign="Left" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<%--<dxwgv:GridViewDataTextColumn VisibleIndex="8" Caption="View"><DataItemTemplate>
                                            <a href="#"  onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">Detail Records</a>
                                           
                                        
</DataItemTemplate>

<CellStyle HorizontalAlign="Left" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="9" Caption="Details"><DataItemTemplate>
                                               <a href="javascript:void(0);" onclick="OnCancelSlipClick('<%#Eval("DpSlipsIssued_DPID") %>','<%#Eval("DpSlipsIssued_BenID") %>','<%#Eval("DpSlipsIssued_SlipType") %>')"  >Cancel Slips</a>
                                        
                                        
</DataItemTemplate>
<HeaderTemplate>
                                            <a href="javascript:void(0);" onclick="OnAddButtonClick()"><span style="color: #000099;
                                                text-decoration: underline">Add New</span></a>
                                        
                                        
</HeaderTemplate>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="10">
<DeleteButton Visible="True"></DeleteButton>
</dxwgv:GridViewCommandColumn>--%>
</columns>
                                        <SettingsEditing PopupEditFormHeight="300px" PopupEditFormHorizontalAlign="Center"
                                            PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="500px" />
                                        <SettingsText ConfirmDelete="Do You Want To Delete This Record ???" />
                                        <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                                        <styleseditors>
<ProgressBar Height="25px"></ProgressBar>
</styleseditors>
</dxwgv:ASPxGridView>
                         <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
                        <!--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="[DpStockUsageFetch]" SelectCommandType="StoredProcedure" DeleteCommand="[DpStockUsageDelete]" DeleteCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="" Name="Dp" QueryStringField="type" Type="String" />
                            </SelectParameters>
                            <DeleteParameters>
                                    <asp:Parameter Name="DpSlipsIssued_ID" Type="int32" />
                                    
                            </DeleteParameters>
                            
                        </asp:SqlDataSource>-->
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HiddenField ID="hdnID" runat="server" />
                        <asp:HiddenField ID="hdnSeg" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
