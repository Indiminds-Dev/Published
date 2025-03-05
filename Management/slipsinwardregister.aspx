<%@ page language="C#" autoeventwireup="true" inherits="management_frm_ShowslipsInwardregistered, App_Web_bfdn6hbr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
      <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script language="javascript" type="text/javascript">
        function addnew()
        {
            var url='frm_ShowslipsInwardregistered.aspx';
            parent.OnMoreInfoClick(url,'Slip Details','940px','460px','Y');
            
        }
        function height()
       {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
            window.frameElement.Width = document.body.scrollWidth;
       }
       function SignOff()
        {
        window.parent.SignOff()
        } 
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
        <table >
            <tr>
                <td>
                    From Date
                </td>
                <td style="width:200px">
                    <dxe:ASPxDateEdit ID="dtFrom" runat="server"  ClientInstanceName="dtFrom1" DateOnError="Today" EditFormat="Custom" EditFormatString="dd/MM/yyyy" UseMaskBehavior="True" Width="169px" Cursor="t"><ClientSideEvents ValueChanged="function(s, e){ DateChangeForFrom(dtExecution1);}" />
                        
                        </dxe:ASPxDateEdit>
                </td>
                <td>
                    To Date
                </td>
                <td>
                    <dxe:ASPxDateEdit ID="dtTo" runat="server"  ClientInstanceName="dtTo1" DateOnError="Today" EditFormat="Custom" EditFormatString="dd/MM/yyyy" UseMaskBehavior="True" Width="169px" Cursor="t"><ClientSideEvents ValueChanged="function(s, e){ DateChangeForFrom(dtExecution1);}" />
                        
                        </dxe:ASPxDateEdit>
                </td>
                <td>
                    <asp:Button ID="btnShow" runat="server" Text="Show" />
                </td>
            
            </tr>
            </table>
            <table width="800">
            <tr>
                <td colspan="5">
                    <dxwgv:ASPxGridView ID="gridSlips" runat="server" 
                      Width="100%" AutoGenerateColumns="False" KeyFieldName="SlipsInwardRegister_ID" >                  
                    
                    <settingsbehavior allowfocusedrow="True" />
        <styles>
<Header CssClass="gridheader"></Header>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<FocusedRow CssClass="gridselectrow"></FocusedRow>
</styles>
                    <columns>
                    <dxwgv:GridViewDataTextColumn FieldName="SlipsInwardRegister_ID" Visible="False" Caption="" VisibleIndex="0">
<HeaderStyle HorizontalAlign="Right"></HeaderStyle>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="SlipsInwardRegister_DPID" Width="33%" Caption="DP ID" VisibleIndex="1">
<HeaderStyle HorizontalAlign="Right"></HeaderStyle>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="SlipsInwardRegister_ClientID" Width="33%" Caption="Client Id" VisibleIndex="2">
<HeaderStyle HorizontalAlign="Right"></HeaderStyle>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="SlipsInwardRegister_SlipType" CellStyle-Wrap="False" Caption="Type" VisibleIndex="3">
<HeaderStyle HorizontalAlign="Right"></HeaderStyle>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="SlipsInwardRegister_SlipNumber" Caption="Slip Number" VisibleIndex="4">
<HeaderStyle HorizontalAlign="Right"></HeaderStyle>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="SlipsInwardRegister_Instructions" Caption="Instructions" VisibleIndex="5">
<HeaderStyle HorizontalAlign="Right"></HeaderStyle>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="SlipsInwardRegister_Status" Caption="Status" VisibleIndex="6">
<HeaderStyle HorizontalAlign="Right"></HeaderStyle>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn FieldName="SlipsInwardRegister_TransactionDate" CellStyle-Wrap="False" Caption="Transaction Date" VisibleIndex="7">
<HeaderStyle HorizontalAlign="Right"></HeaderStyle>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn FieldName="SlipsInwardRegister_ExecutionDate" CellStyle-Wrap="False" Caption="Execution Date" VisibleIndex="8">
<HeaderStyle HorizontalAlign="Right"></HeaderStyle>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn  Caption="" VisibleIndex="9">
<Settings AllowAutoFilter="False"></Settings>

 <HeaderTemplate>
 <a href="javascript:void(0)" onclick="addnew()" >Add new</a>
  </HeaderTemplate> 
</dxwgv:GridViewDataTextColumn>
</columns>
        <settings showgroupbuttons="False"></settings>
                </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
