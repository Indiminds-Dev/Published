<%@ page language="C#" autoeventwireup="true" inherits="management_cfslabs, App_Web__yen2upk" %>
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
<head id="Head1" runat="server">
    <title>CF Slab</title>
      <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
     <script language="javascript" type="text/javascript">
  function OnMoreInfoClick(keyValue)
   {
     var url='cfslabspopup.aspx?id='+keyValue;
     parent.OnMoreInfoClick(url,"Edit CF Slab Details",'940px','450px',"Y");
    
   }
    
     function OnAddButtonClick() 
    {
         var url='cfslabspopup.aspx?id=' + 'ADD';
         parent.OnMoreInfoClick(url,"Add CF Slab Details",'940px','450px',"Y");
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
    function callback()
    {
     grid.PerformCallback();
    }
   function EndCall(obj)
    {
        height();
    }

    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" align="center">
                    <strong><span style="color: #000099">CF Slab</span></strong></td>
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
        <table>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="CFSlabGrid" runat="server" KeyFieldName="ScripSlab_ID"
                        AutoGenerateColumns="False"  DataSourceID="CFSlabDataSource"
                        Width="100%" ClientInstanceName="grid" 
                        OnCustomJSProperties="CFSlabGrid_CustomJSProperties" OnCustomCallback="CFSlabGrid_CustomCallback" OnRowDeleting="CFSlabGrid_RowDeleting">
                        <clientsideevents endcallback="function(s, e) {
	  EndCall(s.cpEND);
}" />
                        <templates><EditForm>
                
            
</EditForm>
<TitlePanel>
              
                
            
</TitlePanel>
</templates>
                        <settingsbehavior allowfocusedrow="True" confirmdelete="True" columnresizemode="NextColumn" />
                        <styles>
<Header  SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>
</styles>
                        <settingspager showseparators="True" alwaysshowpager="True" numericbuttoncount="20"
                            pagesize="20">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</settingspager>
                        <columns>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="ScripSlab_ID" Caption="ID">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="ScripSlab_Code" Width="10%" Caption="Code">
<CellStyle CssClass="gridcellleft"></CellStyle>
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="ScripSlab_Mode" Width="15%" Caption="Mode">
<CellStyle CssClass="gridcellleft"></CellStyle>
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="ScripSlab_From" Width="15%" Caption="Min">
<CellStyle CssClass="gridcellleft"></CellStyle>
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="ScripSlab_To" Width="15%" Caption="Max">
<CellStyle CssClass="gridcellleft"></CellStyle>
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="ScripSlab_Flat" Width="10%" Caption="Flat">
<CellStyle CssClass="gridcellleft"></CellStyle>
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="ScripSlab_Rate" Width="10%" Caption="Rate">
<CellStyle CssClass="gridcellleft"></CellStyle>
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>


<%--<dxwgv:GridViewDataTextColumn VisibleIndex="5" Width="10%" Caption="Details">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<DataItemTemplate>
                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">More Info...</a>
                
</DataItemTemplate>

<CellStyle Wrap="False"></CellStyle>
<HeaderTemplate >
                            <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                              { %>
                            <a href="javascript:void(0);" onclick="OnAddButtonClick( )">
                              <span style="color: #000099; text-decoration: underline">Add New</span>
                            </a>
                            <%} %>
                        
</HeaderTemplate>
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>--%>
<dxwgv:GridViewCommandColumn VisibleIndex="6" Caption="Delete">
<DeleteButton Visible="True"></DeleteButton>
<HeaderTemplate >
                            <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                              { %>
                            <a href="javascript:void(0);" onclick="OnAddButtonClick( )">
                              <span style="color: #000099; text-decoration: underline">Add New</span>
                            </a>
                            <%} %>
                        
</HeaderTemplate>
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

</dxwgv:GridViewCommandColumn>
</columns>
                        <settingsediting mode="PopupEditForm" popupeditformhorizontalalign="Center" popupeditformmodal="True"
                            popupeditformverticalalign="WindowCenter" popupeditformwidth="900px" editformcolumncount="3" />
                       
                        
                    </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="CFSlabDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                        DeleteCommand="delete from Master_ScripSlab where ScripSlab_ID=@ScripSlab_ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ScripSlab_ID" Type="String" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                    <br />
                    <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
                    </dxwgv:ASPxGridViewExporter>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
