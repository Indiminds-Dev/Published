<%@ page language="C#" autoeventwireup="true" inherits="management_TransactionCharge, App_Web_8qixh_8w" %>

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
    <title>Transaction Charge</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
    function callback()
    {
      grid.PerformCallback();
    }
    function EndCall(obj)
    {
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
    
     var url='Transaction.aspx?id='+keyValue;
     parent.OnMoreInfoClick(url,"Edit Transaction Details",'980px','450px',"Y");
    }
    
     function OnAddButtonClick() 
    {
       var url='Transaction.aspx?id=' + 'ADD';
       parent.OnMoreInfoClick(url,"Add Transaction Details",'980px','450px',"Y");
      
    }
    function PopulateGrid()
    {
       editwin.close();
       grid.PerformCallback();
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
        <tr>
            <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Transaction Charge</span></strong>
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
        </table>
        <dxwgv:ASPxGridView ID="TransactionGrid" runat="server" KeyFieldName="TranCharge_ID"
            AutoGenerateColumns="False"  Width="100%"
            ClientInstanceName="grid" OnCustomCallback="TransactionGrid_CustomCallback" OnCustomJSProperties="TransactionGrid_CustomJSProperties" OnRowDeleting="TransactionGrid_RowDeleting" OnCommandButtonInitialize="TransactionGrid_CommandButtonInitialize">
            <templates><TitlePanel>
                <table style="width:100%">
                    <tr>
                         <td align="right">
                            <table width="200px">
                                <tr>
          
                             <%--       <td>
                                        <dxe:ASPxButton ID="ASPxButton2" runat="server" Text="Search" ToolTip="Search" OnClick="btnSearch"  Height="18px" Width="88px"  >
                                        </dxe:ASPxButton>
                                    </td>
                                    <td>
                                        <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd"){ %>
                                        <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"   Height="18px" Width="88px"   AutoPostBack="False">
                                            <clientsideevents click="function(s, e) {OnAddButtonClick();}" />
                                        </dxe:ASPxButton>
                                        <%} %>
                                    </td>--%>
                                 
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
            <settingstext popupeditformcaption="Add/ Modify Employee" grouppanel="Transaction Charges" />
            <clientsideevents endcallback="function(s, e) {
	 EndCall(s.cpEND);
}"></clientsideevents>
            <columns>
<dxwgv:GridViewDataTextColumn FieldName="TranCharge_ID" Caption="ID" Visible="False" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<%--<dxwgv:GridViewDataTextColumn FieldName="produtname" Width="24%" Caption="Product Name" VisibleIndex="1">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>--%>
<%--<dxwgv:GridViewDataTextColumn FieldName="ddd" Width="10%" Caption="Segment" VisibleIndex="1">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>--%>
<dxwgv:GridViewDataTextColumn FieldName="r" Width="20%" Caption="Group" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="TranCharge_Rate1" Width="5%" Caption="Rate" VisibleIndex="1">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>


<%--------------- Security Group Start-----------------------%>

<dxwgv:GridViewDataTextColumn FieldName="TranCharge_Group" Width="9%" Caption="Security Group" VisibleIndex="2">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>


<%------------------- Security Group End------------------%>


<dxwgv:GridViewDataTextColumn FieldName="TranCharge_ApplicableFor" Width="7%" Caption="Applicable For " VisibleIndex="3">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="TranCharge_STApplicable" Width="5%" Caption="Srv.Tax" VisibleIndex="4">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="TranCharge_PrdType" Width="5%" Caption="Prd.Type" VisibleIndex="5">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Left"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn FieldName="assetname" Width="21%" Caption="AssetName" VisibleIndex="6">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Left"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn FieldName="TranCharge_DateFrom" Width="7%" Caption="From Date" VisibleIndex="7">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn FieldName="TranCharge_DateTo" Width="7%" Caption="Untill Date" VisibleIndex="8">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn Width="6%" Caption="Details" VisibleIndex="9">
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
<dxwgv:GridViewCommandColumn Caption="Delete" Width="5%" VisibleIndex="10">
<DeleteButton Visible="True"></DeleteButton>
</dxwgv:GridViewCommandColumn>
</columns>
            <settings showgroupbuttons="False"
                showstatusbar="Visible" />
        </dxwgv:ASPxGridView>
       <%-- <asp:SqlDataSource ID="TransactionDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            DeleteCommand="TransactionCharge_Delete" DeleteCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="TranCharge_ID" Type="String" />  
                <asp:Parameter Name="TranCharge_CompanyID" Type="String" />
                <asp:Parameter Name="TranCharge_ExchangeSegmentID" Type="Int16" />
                <asp:Parameter Name="TranCharge_ChargeGroupID" Type="String" />
                <asp:Parameter Name="TranCharge_ProductSeriesID" Type="Int16" />
            </DeleteParameters>
        </asp:SqlDataSource>--%>
        <br />
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
