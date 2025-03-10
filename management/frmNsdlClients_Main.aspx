<%@ page language="C#" autoeventwireup="true" inherits="management_frmNsdlClients_Main, App_Web_alid8jfz" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script language="javascript" type="text/javascript">
    function OnMoreInfoClick(keyValue,dpid,name)
    {
         var qrStr=window.location.search ;
         var spQrStr=qrStr.substring(1);
         var url='frmNsdlClients_General.aspx?id='+keyValue+'&dp='+dpid;
         var heading=Trim(name)+'('+keyValue+')';
//         var Title='Show Client Details For :'+name+keyValue;
         var Title='Show Client Details For :'+heading;
         parent.OnMoreInfoClick(url,Title,'980px','480px','N')

    }
    function ShowHideFilter(obj)
    {
       grid.PerformCallback(obj);
    }
    function height()
    {
        if(document.body.scrollHeight<=500)
            window.frameElement.height = '500px';
        else         
            window.frameElement.height = document.body.scrollHeight;
            window.frameElement.widht = document.body.scrollWidht;
   }
   function Trim(str)
    {
        while (str.substring(0,1) == ' ') // check for white spaces from beginning
        {
            str = str.substring(1, str.length);
        }
        while (str.substring(str.length-1, str.length) == ' ') // check white space from end
        {
            str = str.substring(0,str.length-1);
        }
       
        return str;
    }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER">
                    <strong><span style="color: #000099">NSDL Client List</span></strong>
                </td>
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
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="ClientGrid" runat="server" KeyFieldName="NsdlClients_BenAccountID"
                        AutoGenerateColumns="False" DataSourceID="ClientDataSource" Width="100%" ClientInstanceName="grid"
                        OnCustomCallback="ClientGrid_CustomCallback">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Account ID" FieldName="NsdlClients_BenAccountID"
                                ReadOnly="True" VisibleIndex="0" Width="7%">
                                <CellStyle CssClass="gridcellleft" HorizontalAlign="Left">
                                </CellStyle>
                                <Settings AutoFilterCondition="Contains" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Name" FieldName="NsdlClients_BenFirstHolderName"
                                VisibleIndex="1" Width="15%">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="PAN Number" FieldName="NsdlClients_FirstHolderPAN"
                                VisibleIndex="2" Width="10%">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn Caption="Aadhar" FieldName="NsdlClients_FirstHolderAadhar"
                                VisibleIndex="2" Width="10%">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Trading UCC" FieldName="NsdlClients_TradingUCC"
                                VisibleIndex="3" Width="8%">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Branch" FieldName="Branch" VisibleIndex="4"
                                Width="14%">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="NsdlClients_BeneficiaryStatus"
                                VisibleIndex="5" Width="8%">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataDateColumn Caption="Activation Date" FieldName="NsdlClients_ActivationDateTime"
                                VisibleIndex="6" Width="10%">
                                <PropertiesDateEdit DisplayFormatString="dd MMM yyyy">
                                </PropertiesDateEdit>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn Caption="Closure Date" FieldName="NsdlClients_AccountClosureDate"
                                VisibleIndex="7" Width="10%">
                                <PropertiesDateEdit DisplayFormatString="dd MMM yyyy">
                                </PropertiesDateEdit>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="8">
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>' ,'<%#Eval("NsdlClients_DPID")%>','<%#Eval("NsdlClients_BenFirstHolderName") %>' )">
                                        More Info...</a>
                                </DataItemTemplate>
                                <CellStyle HorizontalAlign="Left" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Styles>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px" CssClass="gridheader">
                            </Header>
                            <FocusedRow BackColor="#FCA977">
                            </FocusedRow>
                            <FocusedGroupRow BackColor="#FCA977">
                            </FocusedGroupRow>
                        </Styles>
                        <Settings ShowGroupPanel="True" ShowFooter="True" ShowStatusBar="Visible" />
                        <SettingsText PopupEditFormCaption="Client Detail" />
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="3" />
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn"
                            ConfirmDelete="True" />
                        <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="ClientDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="sp_ShowClientList" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="ben_type" QueryStringField="type" Type="String" />
                <asp:SessionParameter Name="branch" SessionField="userbranchHierarchy" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
