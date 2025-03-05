<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_MendatoryDoc, App_Web_pjhew0ax" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
        function SignOff()
        {
            window.parent.SignOff()
        }
        function height()
        {
           
           if(document.body.scrollHeight>=350)
                {
                    window.frameElement.height = document.body.scrollHeight;
                }
           else
                {
                    window.frameElement.height = '350px';
                }
                window.frameElement.widht = document.body.scrollWidht;
           
        }
        function PageLoad()
        {
            FieldName='btnSubmit';
            ShowCategoryFilterForm(rbCategory.GetValue());
            hide('trResult');
            
        }
        function ShowCategoryFilterForm(obj)
        { //alert(obj);
            if(obj=='A')
            {
                hide('tdDocType');
                
            }
            if(obj=='S')
            {
                show('tdDocType');
                
            }
        }
        function show(obj1)
        {
             document.getElementById(obj1).style.display='inline';
        }
        function hide(obj1)
        {  
             document.getElementById(obj1).style.display='none';
        }
        function Filter(obj)
        {
            cmbDocType.PerformCallback(obj.GetValue().toString());
        }
        function CallGridBind()
        {
            show('trResult');
            grid.PerformCallback();
        }
        function EndCall(obj)
        {
            height();
        }
        function ShowHideFilter(obj)
        {
            grid.PerformCallback(obj);
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="0" style="text-align: center;">
                    <strong><span style="color: #000099">Contacts Pending Mendatory Documents Report</span></strong>
                </td>
            </tr>
        </table>
        <table class="TableMain100">
            <tr>
                <td class="gridcellleft" colspan="3" valign="top">
                    <table class="TableMain100">
                        <tr>
                            <td>
                                <table>
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
                                        <td class="gridcellleft">
                                            <dxe:ASPxComboBox ID="cmbContactType" ClientInstanceName="cmbContactType" runat="server"
                                                ValueField="ContactType" EnableTheming="True" ValueType="System.String" Font-Size="10px"
                                                EnableIncrementalFiltering="True">
                                                <ButtonStyle Width="13px">
                                                </ButtonStyle>
                                                <DropDownButton Text="ContactType">
                                                </DropDownButton>
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {Filter(s);}" />
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td class="gridcellright">
                                            <span class="Ecoheadtxt" style="color: Blue"><strong>Document Type</strong></span></td>
                                        <td class="gridcellleft">
                                            <dxe:ASPxRadioButtonList ID="rbCategory" runat="server" ClientInstanceName="rbCategory"
                                                Font-Size="10px" Height="28px" ItemSpacing="10px" RepeatDirection="Horizontal"
                                                SelectedIndex="0" TextWrap="False">
                                                <Items>
                                                    <dxe:ListEditItem Text="All" Value="A" />
                                                    <dxe:ListEditItem Text="Specific" Value="S" />
                                                </Items>
                                                <ClientSideEvents ValueChanged="function(s, e) {ShowCategoryFilterForm(s.GetValue());}" />
                                                <Border BorderWidth="0px" />
                                            </dxe:ASPxRadioButtonList>
                                        </td>
                                        <td class="gridcellright" id="tdDocType">
                                            <dxe:ASPxComboBox ID="cmbDocType" runat="server" ClientInstanceName="cmbDocType"
                                                ValueField="distinct dty_documentType" ValueType="System.String" DropDownWidth="100%"
                                                TextFormatString="{0}" Font-Size="10px" OnCallback="cmbDocType_Callback" EnableIncrementalFiltering="True">
                                                <ButtonStyle Width="13px">
                                                </ButtonStyle>
                                                <DropDownButton Text="DocumentType" Width="50px">
                                                </DropDownButton>
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td class="gridcellright">
                                            <dxe:ASPxButton ID="btnSubmit" runat="server" Text="GO" AutoPostBack="False">
                                                <ClientSideEvents Click="function(s, e) {CallGridBind();}" />
                                            </dxe:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="gridcellright" style="display:none">
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
            <tr id="trResult">
                <td class="gridcellleft" colspan="3">
                    <dxwgv:ASPxGridView ID="AspXMendatoryDocGrid" ClientInstanceName="grid" runat="server" KeyFieldName="RowNo"
                        AutoGenerateColumns="False" Width="100%" OnCustomCallback="AspXMendatoryDocGrid_CustomCallback"
                        OnHtmlRowPrepared="AspXMendatoryDocGrid_HtmlRowPrepared" OnCustomJSProperties="AspXMendatoryDocGrid_CustomJSProperties">
                        <Styles>
                            <Header SortingImageSpacing="5px" ImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Contact Name" FieldName="Name" VisibleIndex="0">
                                <Settings AllowSort="False" AllowAutoFilter="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Code" FieldName="code" VisibleIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Phone No" FieldName="PhoneNo" VisibleIndex="2">
                                <Settings AllowSort="False" AllowAutoFilter="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Pending Documents" FieldName="DocumentType"
                                VisibleIndex="3">
                                <Settings AllowAutoFilter="False" />
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager PageSize="20" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <ClientSideEvents EndCallback="function(s, e) {
	EndCall(s.cpHeight);
}" />
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server" GridViewID="AspXMendatoryDocGrid">
        </dxwgv:ASPxGridViewExporter>
        <br />
        <br />
        <br />
    </form>
</body>
</html>
