<%@ page language="C#" autoeventwireup="true" inherits="management_specialdpacc, App_Web_fxnvzv_8" %>

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
<html xmlns="http://www.w3.org/1999/xhtml" >
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
      var url='dpacc.aspx?id='+keyValue;
     parent.OnMoreInfoClick(url,"Edit Details",'940px','450px',"Y");
   
    }
  
    function OnAddButtonClick() 
    {
      var e=parent.document.getElementById('cmbSegment').value;
      var url='dpacc.aspx?id=' + 'ADD'+ '/'+ e;
      parent.OnMoreInfoClick(url,"Add DP Account Details",'940px','450px',"Y");
       
    }
    function ShowHideFilter(obj)
    {
        grid.PerformCallback(obj);
    } 

    function PopulateGrid()
    {
       editwin.close();
       grid.PerformCallback();
    }
 </script>
<table class="TableMain100">
         <tr>
            <td class="EHEADER" style="text-align: center;" >
                <strong><span style="color: #000099">Special DP Accounts</span></strong></td>
        </tr>
    <tr>
        <td style="" align="right">
            <table width="100%">
              <tr>
                     <td style="text-align:left; vertical-align:top">
                        <table>
                            <tr>
                                <td id="ShowFilter">
                                    <a  href="javascript:ShowHideFilter('s');" ><span style="color: #000099; text-decoration: underline">
                                        Show Filter</span></a>
                                </td>
                               <td id="Td1">
                                    <a  href="javascript:ShowHideFilter('All');" ><span style="color: #000099; text-decoration: underline">
                                        All Records</span></a>
                                </td>
                            </tr>
                        </table>
                  </td>
                  <td>
                  </td>
                <td class="gridcellright">
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
 
  <tr>
  
    <td>
   <dxwgv:ASPxGridView ID="DpaccountGrid" runat="server"   KeyFieldName="SpecialDPAccount_ID"
         AutoGenerateColumns="False" DataSourceID="DpaccountGridDataSource" Width="100%" ClientInstanceName="grid" OnCustomCallback="DpaccountGrid_CustomCallback" >
           <Templates><TitlePanel>
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
</Templates>
        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
        <Styles  >
<Header SortingImageSpacing="5px" ImageSpacing="5px" CssClass="gridheader"></Header>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>
        <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="20" PageSize="20">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
        <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="3" />
        <SettingsText PopupEditFormCaption="Add/ Modify Employee" />
        <Columns>
<dxwgv:GridViewDataTextColumn FieldName="SpecialDPAccount_ID" Caption="ID" Visible="False" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="SpecialDPAccount_DPID" Width="15%" Caption="DPID" VisibleIndex="1">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="SpecialDPAccount_Groupcode" Width="15%" Caption="Grp.Code" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="SpecialDPAccount_AccountID" Width="20%" Caption="Account ID" VisibleIndex="2">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="SpecialDPAccount_CMBPID" Width="20%" Caption="CMDPID" VisibleIndex="3">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="SpecialDPAccount_AccountName" Width="35%" Caption="Account Name" VisibleIndex="4">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Width="15%" Caption="Details" VisibleIndex="5">
<EditFormSettings Visible="False"></EditFormSettings>
<DataItemTemplate>
                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">More Info...</a>
                
</DataItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle Wrap="False"></CellStyle>
<HeaderTemplate>
                            <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd"){ %>
                            <a href="javascript:void(0);" onclick="OnAddButtonClick( )">
                              <span style="color: #000099; text-decoration: underline">Add New</span>
                            </a>
                            <%} %>
                        
</HeaderTemplate>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn Caption="Delete" VisibleIndex="6">
<DeleteButton Visible="True"></DeleteButton>
</dxwgv:GridViewCommandColumn>
</Columns>
          <Settings ShowStatusBar="Visible" ShowGroupPanel="True" />
    </dxwgv:ASPxGridView>
    
    </td>
    </tr>
    </table>
         <asp:SqlDataSource ID="DpaccountGridDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
          DeleteCommand="delete from Master_SpecialDPAccount where SpecialDPAccount_ID=@SpecialDPAccount_ID" > 
       <DeleteParameters>
            <asp:Parameter Name="SpecialDPAccount_ID" Type="String" />
        </DeleteParameters>
         </asp:SqlDataSource>
             <br />
    <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
    </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
