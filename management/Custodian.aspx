<%@ page language="C#" autoeventwireup="true" inherits="management_Custodian, App_Web_d1rqvttb" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
     <script language="javascript" type="text/javascript">
    function EndCall(obj)
    {
        height();
    }

    function callback()
    {
      grid.PerformCallback();
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
         var url='Custodian_general.aspx?id='+keyValue;
         parent.OnMoreInfoClick(url,"Modify Custodian Details",'940px','450px',"Y");
    }
   function OnAddButtonClick() 
    {
         var url='Custodian_general.aspx?id=' + 'ADD';
         parent.OnMoreInfoClick(url,"Add Custodian Details",'940px','450px',"Y");
            
    }
    function OnContactInfoClick(keyValue,CompName)
     {
         var url='insurance_contactPerson.aspx?id='+keyValue;
         parent.OnMoreInfoClick(url,"Custodian Name : "+CompName+"",'940px','450px',"Y");
          
     }
    function ShowHideFilter(obj)
    {
        grid.PerformCallback(obj);
    }  
    </script>
    <table class="TableMain100">
        <tr>
            <td class="EHEADER" style="text-align:center;">
                <strong><span style="color: #000099">Custodian Details</span></strong></td>
        </tr>
        <tr>
            <td>
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
                <dxwgv:ASPxGridView ID="CustodianGrid" runat="server" 
                     KeyFieldName="Custodian_InternalID" AutoGenerateColumns="False"
                    DataSourceID="SqlCusdian" Width="100%" ClientInstanceName="grid" OnCustomCallback="CustodianGrid_CustomCallback" OnCustomJSProperties="CustodianGrid_CustomJSProperties">
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="Custodian_Name" Caption="Name" VisibleIndex="0">
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Short Name" FieldName="Custodian_ShortName" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Custodian_SEBINo" Caption="Sebi No" VisibleIndex="2">
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>                        
                        <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="3" Width="10%">
                            <DataItemTemplate>
                                <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                    More Info...</a>
                            </DataItemTemplate>
                            <EditFormSettings Visible="False" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                            <HeaderTemplate>
                                <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                      { %>
                                <a href="javascript:void(0);" onclick="OnAddButtonClick()"><span style="color: #000099;
                                    text-decoration: underline">Add New</span> </a>
                                <%} %>
                            </HeaderTemplate>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Cont.Person" Width="10%" VisibleIndex="4">
                            <DataItemTemplate>
                                <a href="javascript:void(0);" onclick="OnContactInfoClick('<%# Container.KeyValue %>','<%#Eval("Custodian_Name") %>')">
                                    Show</a>
                            </DataItemTemplate>
                            <CellStyle HorizontalAlign="Left" Wrap="False">
                            </CellStyle>
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Styles  >
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                        </Header>
                        <FocusedGroupRow CssClass="gridselectrow">
                        </FocusedGroupRow>
                        <FocusedRow CssClass="gridselectrow">
                        </FocusedRow>
                    </Styles>
                    <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                     <SettingsText PopupEditFormCaption="Add/ Modify Employee" ConfirmDelete="Are you sure to delete?" />
                    <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                        PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="3" />
                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                    <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="20"
                        PageSize="20">
                        <FirstPageButton Visible="True">
                        </FirstPageButton>
                        <LastPageButton Visible="True">
                        </LastPageButton>
                    </SettingsPager>
                    <ClientSideEvents EndCallback="function(s, e) {
	  EndCall(s.cpEND);

}" />
                </dxwgv:ASPxGridView>
                <asp:SqlDataSource ID="SqlCusdian" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" 
                    SelectCommand="select Custodian_ID,Custodian_InternalID,Custodian_Name,Custodian_ShortName,Custodian_SEBINo from Master_Custodians">
                </asp:SqlDataSource>
                <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
                </dxwgv:ASPxGridViewExporter>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
