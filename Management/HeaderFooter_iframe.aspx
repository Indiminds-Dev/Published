<%@ page language="C#" autoeventwireup="true" inherits="management_HeaderFooter_iframe, App_Web_jdrimxnc" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Header Footer</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript">
   function OnMoreInfoClick(keyValue) 
        {
            //alert(keyValue);
            var url='HeaderFooterDetails.aspx?id='+keyValue;
            parent.OnMoreInfoClick(url,"Show Items",'960px','530px',"Y")
         
        }
        
         function OnAddButtonClick() 
        {
            //alert(keyValue);
            var url='HeaderFooterDetails.aspx?id=Add';
            parent.OnMoreInfoClick(url,"Show Items",'960px','530px',"Y")
         
        }
     
    function ShowHideFilter(obj)
    {
    grid.PerformCallback(obj);
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
        <div>
            <table class="TableMain100" style="width: 100%">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Header/Footer</span></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td style="text-align: left; vertical-align: top; height: 37px;">
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
                                <td style="height: 37px">
                                </td>
                                <td style="text-align: right; vertical-align: top; height: 37px;">
                                    <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                        Font-Bold="False" ForeColor="White" ValueType="System.Int32" Width="130px">
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
                        <dxwgv:ASPxGridView ID="HeaderFooterGrid" runat="server" Width="100%" AutoGenerateColumns="False"
                            ClientInstanceName="grid" DataSourceID="HeaderFooter" KeyFieldName="HeaderFooter_ID"
                            OnAutoFilterCellEditorInitialize="HeaderFooterGrid_AutoFilterCellEditorInitialize"
                            OnCellEditorInitialize="HeaderFooterGrid_CellEditorInitialize" OnCustomCallback="HeaderFooterGrid_CustomCallback"
                            OnHtmlEditFormCreated="HeaderFooterGrid_HtmlEditFormCreated" OnHtmlRowCreated="HeaderFooterGrid_HtmlRowCreated"
                            OnInitNewRow="HeaderFooterGrid_InitNewRow" OnRowValidating="HeaderFooterGrid_RowValidating"
                            OnCustomJSProperties="HeaderFooterGrid_CustomJSProperties">
                            <settingsbehavior allowfocusedrow="True" confirmdelete="True" />
                            <styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</styles>
                            <settingspager alwaysshowpager="True" numericbuttoncount="20" pagesize="20" showseparators="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</settingspager>
                            <settingsediting editformcolumncount="1" popupeditformverticalalign="WindowCenter"
                                popupeditformwidth="800px" mode="EditForm" popupeditformheight="400px" popupeditformhorizontalalign="LeftSides"
                                popupeditformmodal="True" />
                            <settingstext confirmdelete="Are You Sure To Delete This Record ???" />
                            <clientsideevents endcallback="function(s, e) {
	                              EndCall(s.cpEND);
                            }"></clientsideevents>
                            <columns>
<dxwgv:GridViewDataTextColumn FieldName="HeaderFooter_ID" Visible="False" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>
<EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server">
                                        </asp:DropDownList>
                                    
                                
                                            
</EditItemTemplate>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataComboBoxColumn FieldName="HeaderFooter_Type" Caption="Type" VisibleIndex="0">
<PropertiesComboBox ValueType="System.Char" Width="40%"><Items>
<dxe:ListEditItem Text="Header" Value="H"></dxe:ListEditItem>
<dxe:ListEditItem Text="Footer" Value="F"></dxe:ListEditItem>
</Items>

<ValidationSettings CausesValidation="True" EnableCustomValidation="True"></ValidationSettings>
</PropertiesComboBox>

<EditFormSettings ColumnSpan="2" Visible="True"></EditFormSettings>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewDataTextColumn FieldName="HeaderFooter_ShortName" Width="400px" Caption="Name" VisibleIndex="1">
<PropertiesTextEdit Width="650px">
<ValidationSettings ErrorDisplayMode="ImageWithText" CausesValidation="True" ErrorText="Name cannot be left blank" SetFocusOnError="True" ValidationGroup="a">
<RequiredField IsRequired="True" ErrorText="Name cannot be left blank"></RequiredField>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormSettings ColumnSpan="2"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataMemoColumn FieldName="HeaderFooter_Content" Caption="Content" VisibleIndex="2">
<PropertiesMemoEdit Height="400px" EncodeHtml="False" EnableDefaultAppearance="False">
<Style BackColor="White">
<Border BorderColor="Black"></Border>
</Style>
</PropertiesMemoEdit>

<EditFormSettings Visible="True"></EditFormSettings>
<DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                            <u>MoreInfo... </u></a>
                                                                        
                                    
                                        
</DataItemTemplate>

<HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<CellStyle Wrap="True"></CellStyle>
</dxwgv:GridViewDataMemoColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="3">
<DeleteButton Visible="True"></DeleteButton>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<HeaderTemplate>
                                        <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                          { %>
                                        <%--<a href="javascript:void(0);" onclick="grid.AddNewRow()"><span style="color: #000099;
                                            text-decoration: underline">Add New Content</span> </a>--%>
                                             <a href="javascript:void(0);" onclick="OnAddButtonClick()">
                                            <u>Add New</u></a>
                                        <%} %>
                                    
                                
</HeaderTemplate>
</dxwgv:GridViewCommandColumn>
</columns>
                            <settings showgrouppanel="True" showstatusbar="Visible" />
                            <styleseditors>
<ProgressBar Height="25px"></ProgressBar>
</styleseditors>
                        </dxwgv:ASPxGridView>
                        <asp:SqlDataSource ID="HeaderFooter" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="SELECT HeaderFooter_ID, HeaderFooter_Type, HeaderFooter_ShortName, HeaderFooter_Content FROM [Master_HeaderFooter] ORDER BY HeaderFooter_ID"
                            DeleteCommand="Delete From [Master_HeaderFooter] where HeaderFooter_ID=@HeaderFooter_ID"
                            InsertCommand="INSERT INTO Master_HeaderFooter(HeaderFooter_Type, HeaderFooter_ShortName, HeaderFooter_Content) VALUES (@HeaderFooter_Type, @HeaderFooter_ShortName, @HeaderFooter_Content)"
                            UpdateCommand="Update [Master_HeaderFooter] set [HeaderFooter_ShortName]=@HeaderFooter_ShortName,[HeaderFooter_Content]=@HeaderFooter_Content where HeaderFooter_ID=@HeaderFooter_ID">
                            <DeleteParameters>
                                <asp:Parameter Name="HeaderFooter_ID" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="HeaderFooter_ShortName" />
                                <asp:Parameter Name="HeaderFooter_Content" />
                                <asp:Parameter Name="HeaderFooter_ID" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="HeaderFooter_Type" />
                                <asp:Parameter Name="HeaderFooter_ShortName" />
                                <asp:Parameter Name="HeaderFooter_Content" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        &nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
