<%@ page language="C#" autoeventwireup="true" inherits="management_DeliveryCharges, App_Web_2wstwz9u" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">

        <script language="javascript" type="text/javascript">
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
  function callback()
  {
     grid.PerformCallback();
  }
  function EndCall(obj)
    {
        height();
    }
  function OnMoreInfoClick(keyValue)
   {
     var url='demat.aspx?id='+keyValue;
     parent.OnMoreInfoClick(url,"Edit Demat Charges Details",'940px','450px',"Y");
   
   }
    
     function OnAddButtonClick() 
    {
         var url='demat.aspx?id=' + 'ADD';
         parent.OnMoreInfoClick(url,"Add Demat Charges Details",'940px','450px',"Y");
             
    }
       function PopulateGrid()
         {
           editwin.close();
           grid.PerformCallback();
         }
        </script>

        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Demat Delivery Charges</span></strong>
                </td>
            </tr>
            <tr>
                <td style="" align="right">
                    <table>
                        <tr>
                            <td>
                                <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                    Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                    ValueType="System.Int32" Width="130px">
                                    <items>
                            <dxe:ListEditItem Text="Select" Value="0"/>
                            <dxe:ListEditItem Text="PDF" Value="1" />
                            <dxe:ListEditItem Text="XLS" Value="2" />
                            <dxe:ListEditItem Text="RTF" Value="3" />
                            <dxe:ListEditItem Text="CSV" Value="4" />
                        </items>
                                    <buttonstyle backcolor="#C0C0FF" forecolor="Black">
                        </buttonstyle>
                                    <itemstyle backcolor="Navy" forecolor="White">
                            <HoverStyle BackColor="#8080FF" ForeColor="White">
                            </HoverStyle>
                        </itemstyle>
                                    <border bordercolor="White" />
                                    <dropdownbutton text="Export">
                        </dropdownbutton>
                                </dxe:ASPxComboBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <dxwgv:ASPxGridView ID="DeliveryGrid" runat="server" KeyFieldName="DematCharges_ID"
            AutoGenerateColumns="False" DataSourceID="DeliveryDataSource" Width="100%" ClientInstanceName="grid"
            OnCustomCallback="DeliveryGrid_CustomCallback" OnCommandButtonInitialize="DeliveryGrid_CommandButtonInitialize">
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
            <settingsbehavior allowfocusedrow="True" confirmdelete="True" columnresizemode="NextColumn" />
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
            <settingstext popupeditformcaption="Add/ Modify Employee" grouppanel="Demat Delivery Charges" />
            <columns>
<dxwgv:GridViewDataTextColumn FieldName="DematCharges_ID" Caption="ID" Visible="False" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="cmp_Name" Width="18%" Caption="Company Name" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="ddd" Width="10%" Caption="Segment" VisibleIndex="1">
<Settings AllowAutoFilter="False"></Settings>

<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="r" Width="20%" Caption="Group" VisibleIndex="2">
<Settings AllowAutoFilter="False"></Settings>

<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="DematCharges_DateFrom" Width="15%" Caption="From Date" VisibleIndex="3">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="DematCharges_DateTo" Width="15%" Caption="Untill Date" VisibleIndex="4">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn Width="10%" Caption="Details" VisibleIndex="5">
<EditFormSettings Visible="False"></EditFormSettings>
<DataItemTemplate>
                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">More Info...</a>
                
</DataItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle Wrap="False"></CellStyle>
<HeaderTemplate>
                            <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                              { %>
                            <a href="javascript:void(0);" onclick="OnAddButtonClick( )">
                              <span style="color: #000099; text-decoration: underline">Add New</span>
                            </a>
                            <%} %>
                        
</HeaderTemplate>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn Caption="Delete" VisibleIndex="6">
<DeleteButton Visible="True"></DeleteButton>
</dxwgv:GridViewCommandColumn>
</columns>
            <settings showgrouppanel="True" showstatusbar="Visible" />
        </dxwgv:ASPxGridView>
        <asp:SqlDataSource ID="DeliveryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            DeleteCommand="DematCharge_Delete" DeleteCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="DematCharges_ID" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <br />
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
