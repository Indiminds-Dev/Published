<%@ page language="C#" autoeventwireup="true" inherits="management_ChargeHeads, App_Web__y0k_erv" %>

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
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Other Charge Master</title>
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
  function OnMoreInfoClick(keyValue)
   {
    
     var url='heads.aspx?id='+keyValue;
      parent.OnMoreInfoClick(url,"Edit Charge Master Details",'940px','450px',"Y");
   }
    
     function OnAddButtonClick() 
    {
         var url='heads.aspx?id=' + 'ADD';
         parent.OnMoreInfoClick(url,"Add Charge Master Details",'940px','450px',"Y");
    }
 
  function callback()
    {
     grid.PerformCallback();
    }
   function EndCall(obj)
    {
        height();
        if(grid.cpDelmsg!=null)
            alert(grid.cpDelmsg);
            
    }
    </script>
  <table class="TableMain100">
                  <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Other Charge Master</span></strong>
                    </td>
                </tr>
    <tr>
        <td  align="right">
            <table>
              <tr>
               
                <td>
                   <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy" Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"  ValueType="System.Int32" Width="130px" >
                        <Items>
                            <dxe:ListEditItem Text="Select" Value="0"/>
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
  
   <dxwgv:ASPxGridView ID="MasterGrid" runat="server"   KeyFieldName="OtherCharges_ID"
         AutoGenerateColumns="False" DataSourceID="MasterDataSource" Width="100%" ClientInstanceName="grid" OnCustomCallback="MasterGrid_CustomCallback" OnCustomJSProperties="MasterGrid_CustomJSProperties" OnRowDeleting="MasterGrid_RowDeleting" >
       <ClientSideEvents EndCallback="function(s, e) {
	  EndCall(s.cpEND);
}" />
        <Templates><EditForm>
                
            
</EditForm>
<TitlePanel>
                <table style="width:100%">
                    <tr>
                         <td align="right">
                            <table width="200px">
                                <tr>
          
                           <%--         <td>
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
</Templates>
        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" ColumnResizeMode="NextColumn" />
        <Styles  >
<Header CssClass="gridheader" SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>
</Styles>
        <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="20" PageSize="20">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
        <Columns>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="OtherCharges_ID" Caption="ID">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="OtherCharges_Name" Width="20%" Caption="Charge Name">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="OtherCharges_Code" Width="30%" Caption="Code">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="OtherCharges_ChargeOn" Width="15%" Caption="Basis">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="OtherCharges_Frequency" Width="15%" Caption="Frequency">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="4" Width="10%" Caption="Details">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<DataItemTemplate>
                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">More Info...</a>
                
</DataItemTemplate>

<CellStyle Wrap="False"></CellStyle>
<HeaderTemplate>
                            <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd"){ %>
                            <a href="javascript:void(0);" onclick="OnAddButtonClick( )">
                              <span style="color: #000099; text-decoration: underline">Add New</span>
                            </a>
                            <%} %>
                        
</HeaderTemplate>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="5" Caption="Delete">
<DeleteButton Visible="True"></DeleteButton>
</dxwgv:GridViewCommandColumn>
</Columns>
        <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="3" />
        <SettingsText PopupEditFormCaption="Add/ Modify Employee" GroupPanel="Other Charge Heads" />
        <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
    </dxwgv:ASPxGridView>
  <asp:SqlDataSource ID="MasterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
     DeleteCommand="delete from Master_OtherCharges where OtherCharges_ID=@OtherCharges_ID">
       <DeleteParameters>
            <asp:Parameter Name="OtherCharges_ID" Type="String" />
        </DeleteParameters>
         </asp:SqlDataSource>
    
    <br />
    <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
    </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
