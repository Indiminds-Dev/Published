<%@ page language="C#" autoeventwireup="true" inherits="management_PLSharingSlab, App_Web_mzqu16me" %>

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
<head id="Head1" runat="server">
    <title>PL Sharing Slab</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
  
     function OnAddButtonClick() 
    {
         var url='PLSharingSlabPopup.aspx?id=' + 'ADD';
         parent.OnMoreInfoClick(url,"Add PL Sharing Slab",'500px','350px',"Y");
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
                <td class="EHEADER" align="center">
                    <strong><span style="color: #000099">PL Sharing Slab</span></strong></td>
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
             <tr>
                    <td>
                        <table>
                            <tr>
                                <td id="Td1" align="left">
                                    <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                        Show Filter</span></a> || <a href="javascript:ShowHideFilter('All');"><span style="color: #000099;
                                            text-decoration: underline">All Records</span></a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
        </table>
        <dxwgv:ASPxGridView ID="GridPlSlab" runat="server" KeyFieldName="PLSlab_ID"
            AutoGenerateColumns="False"  DataSourceID="PlSlabDataSource"
            Width="100%" ClientInstanceName="grid"  OnCustomJSProperties="GridPlSlab_CustomJSProperties" OnRowDeleting="GridPlSlab_RowDeleting" OnCustomCallback="GridPlSlab_CustomCallback" >
            <ClientSideEvents EndCallback="function(s, e) {
	  EndCall(s.cpEND);
}" />
           
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" ColumnResizeMode="NextColumn" />
            <Styles>
                <Header CssClass="gridheader" SortingImageSpacing="5px" ImageSpacing="5px">
                </Header>
                <FocusedRow CssClass="gridselectrow">
                </FocusedRow>
                <LoadingPanel ImageSpacing="10px">
                </LoadingPanel>
                <FocusedGroupRow CssClass="gridselectrow">
                </FocusedGroupRow>
            </Styles>
            <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="20"
                PageSize="20">
                <FirstPageButton Visible="True">
                </FirstPageButton>
                <LastPageButton Visible="True">
                </LastPageButton>
            </SettingsPager>
            <Columns>
                <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="PLSlab_ID"
                    Caption="ID">
                   <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <EditFormSettings Visible="False"></EditFormSettings>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="PLSlab_Type" Width="10%"
                    Caption="Slab Type">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <EditFormSettings Visible="False"></EditFormSettings>
                </dxwgv:GridViewDataTextColumn>
              <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="PLSlab_Code" Width="10%"
                    Caption="Code">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <EditFormSettings Visible="False"></EditFormSettings>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="PLSlab_AmountFrom"
                    Width="15%" Caption="Amount From">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <EditFormSettings Visible="False"></EditFormSettings>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="PLSlab_AmountTo"
                    Width="15%" Caption="Amount To">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <EditFormSettings Visible="False"></EditFormSettings>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="PLSlab_Rate"
                    Width="10%" Caption="Rate">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <EditFormSettings Visible="False"></EditFormSettings>
                </dxwgv:GridViewDataTextColumn>
               
               
                
                <dxwgv:GridViewCommandColumn VisibleIndex="4" Caption="Add New">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
 <HeaderTemplate>
                        <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                              { %>
                        <a href="javascript:void(0);" onclick="OnAddButtonClick()"><span style="color: #000099;
                            text-decoration: underline">Add New</span> </a>
                        <%} %>
                    </HeaderTemplate>
                    <DeleteButton Visible="True">
                    </DeleteButton>
                </dxwgv:GridViewCommandColumn>
            </Columns>
            <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="3" />
           
            
        </dxwgv:ASPxGridView>
        <asp:SqlDataSource ID="PlSlabDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            DeleteCommand="delete from Master_PLSlab where PLSlab_ID=@PLSlab_ID">
            <DeleteParameters>
                <asp:Parameter Name="PLSlab_ID" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <br />
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
