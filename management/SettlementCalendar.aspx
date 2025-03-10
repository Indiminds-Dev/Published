<%@ page language="C#" autoeventwireup="true" inherits="management_SettlementCalendar, App_Web_yf04ozfw" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">

        <script language="javascript" type="text/javascript">
   function callback()
    {
      grid.PerformCallback();
    }
   function EndCall(obj)
    {
        if(grid.cpSameSettlement!=undefined)
        {
            alert(grid.cpSameSettlement);
        }
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

    function OnMoreInfoClick(keyValue)
     {
     
         var url='calendar.aspx?id='+keyValue;
         parent.OnMoreInfoClick(url,"Add Calendar Details",'700px','350px',"Y");
     }
    
    function ShowHideFilter(obj)
    {
       grid.PerformCallback(obj);
    } 
    function OnAddButtonClick() 
    {
       var e=parent.document.getElementById('cmbSegment').value;
       var url='calendar.aspx?id=' + 'ADD'+'/'+ e;
       parent.OnMoreInfoClick(url,"Add Calendar Details",'700px','350px',"Y");
          
     }
     function PopulateGrid()
     {
       editwin.close();
       grid.PerformCallback();
     }
     function OnDeleteClick(obj)
     {
        grid.PerformCallback("Delete~"+obj);
     }
        </script>

        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Settlements Status</span></strong></td>
            </tr>
            <tr>
                <td style="" align="right">
                    <table width="100%">
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
                            <td>
                            </td>
                            <td class="gridcellright">
                                <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                    Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                    ValueType="System.Int32" Width="130px">
                                    <Items>
                                        <dxe:ListEditItem Text="Select" Value="0" />
                                        <dxe:ListEditItem Text="PDF" Value="1" />
                                        <dxe:ListEditItem Text="XLS" Value="2" />
                                        <dxe:ListEditItem Text="RTF" Value="3" />
                                        <dxe:ListEditItem Text="CSV" Value="4" />
                                    </Items>
                                    <ButtonStyle BackColor="#C0C0FF" ForeColor="Black">
                                    </ButtonStyle>
                                    <ItemStyle BackColor="Navy" ForeColor="White">
                                        <HoverStyle BackColor="#8080FF" ForeColor="White">
                                        </HoverStyle>
                                    </ItemStyle>
                                    <Border BorderColor="White" />
                                    <DropDownButton Text="Export">
                                    </DropDownButton>
                                </dxe:ASPxComboBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="CalendarGrid" runat="server" KeyFieldName="Settlements_ID"
                        AutoGenerateColumns="False" DataSourceID="CalendarDataSource" Width="100%" ClientInstanceName="grid"
                        OnCustomCallback="CalendarGrid_CustomCallback" OnCustomJSProperties="CalendarGrid_CustomJSProperties"
                        OnRowDeleting="CalendarGrid_RowDeleting">
                        <templates><TitlePanel>
                <table style="width:100%">
                    <tr>
                         <td align="right">
                            <table width="200px">
                                <tr>
          
                                </tr>
                              </table>
                          </td>   
                     </tr>
                </table>
                
            
</TitlePanel>
<EditForm>
                
            
</EditForm>
</templates>
                        <settingsbehavior allowfocusedrow="True" confirmdelete="True" />
                        <styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px" CssClass="gridheader"></Header>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</styles>
                        <settingspager showseparators="True" alwaysshowpager="True" numericbuttoncount="20"
                            pagesize="20">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</settingspager>
                        <settingsediting mode="PopupEditForm" popupeditformhorizontalalign="Center" popupeditformmodal="True"
                            popupeditformverticalalign="WindowCenter" popupeditformwidth="900px" editformcolumncount="3" />
                        <settingstext popupeditformcaption="Add/ Modify Employee" />
                        <clientsideevents endcallback="function(s, e) {
	  EndCall(s.cpEND);
}"></clientsideevents>
                        <columns>
<dxwgv:GridViewDataTextColumn FieldName="Settlements_ID" Caption="ID" Visible="False" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="Settlements_Type" Width="20%" Caption="Type" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="Settlements_Number" Width="12%" Caption="Number" VisibleIndex="1">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="Settlements_TypeSuffix" Width="10%" Caption="Type" VisibleIndex="2">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="Settlements_StartDateTime" Width="15%" Caption="Start Date " VisibleIndex="3">
<%--<PropertiesDateEdit DisplayFormatString="dd-MM-yyyy"></PropertiesDateEdit>--%>

<EditFormSettings Visible="False"></EditFormSettings>
<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="Settlements_EndDateTime" Width="15%" Caption="End Date" VisibleIndex="4">
<%--<PropertiesDateEdit DisplayFormatString="dd-MM-yyyy"></PropertiesDateEdit>--%>

<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="Settlements_DeliveryPayout" Width="15%" Caption="Del.Payout" VisibleIndex="5">
<%--<PropertiesDateEdit DisplayFormatString="dd-MM-yyyy"></PropertiesDateEdit>--%>

<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Width="10%" Caption="Details" VisibleIndex="6">
<EditFormSettings Visible="False"></EditFormSettings>
<DataItemTemplate>
    <table>
        <tr>
            <td><a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">More Info</a></td>
            <td><a href="javascript:void(0);" onclick="OnDeleteClick('<%# Container.KeyValue %>')">Delete</a></td>
        </tr>
    </table>
</DataItemTemplate>


<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle Wrap="False"></CellStyle>
<HeaderTemplate>
                      
                            <a href="javascript:void(0);" onclick="OnAddButtonClick( )">
                              <span style="color: #000099; text-decoration: underline">Add New</span>
                            </a>
                          
                        
</HeaderTemplate>
</dxwgv:GridViewDataTextColumn>
</columns>
                        <settings showstatusbar="Visible" showgrouppanel="True" />
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="CalendarDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
        </asp:SqlDataSource>
        <br />
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
