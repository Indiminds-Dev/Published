<%@ page language="C#" autoeventwireup="true" inherits="management_OtherChargeRate, App_Web_dw8rtpla" %>

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
             var url='ChargeRate.aspx?id='+keyValue;
             parent.OnMoreInfoClick(url,"Edit Other Charge Rate Details",'940px','450px',"Y");
             
         }
    
         function OnAddButtonClick() 
         {
             var url='ChargeRate.aspx?id=' + 'ADD';
            parent.OnMoreInfoClick(url,"Add Other Charge Rate Details",'940px','450px',"Y");
            
         }
         function PopulateGrid()
         {
           editwin.close();
           grid.PerformCallback();
         }
         function callback()
        {
            grid.PerformCallback();
        }
        </script>

        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Other Charges Settings</span></strong>
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
        <dxwgv:ASPxGridView ID="ChargeRateGrid" runat="server" KeyFieldName="OtherCharge_ID"
            AutoGenerateColumns="False" DataSourceID="ChargeRateDataSource" Width="100%"
            ClientInstanceName="grid" OnCustomCallback="ChargeRateGrid_CustomCallback" OnCustomJSProperties="ChargeRateGrid_CustomJSProperties1" OnCommandButtonInitialize="ChargeRateGrid_CommandButtonInitialize">
            <Templates>
                <TitlePanel>
                    <table style="width: 100%">
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
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" ColumnResizeMode="NextColumn" />
            <Styles>
                <Header SortingImageSpacing="5px" ImageSpacing="5px" CssClass="gridheader">
                </Header>
                <FocusedGroupRow CssClass="gridselectrow">
                </FocusedGroupRow>
                <FocusedRow CssClass="gridselectrow">
                </FocusedRow>
                <LoadingPanel ImageSpacing="10px">
                </LoadingPanel>
            </Styles>
            <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="20"
                PageSize="20">
                <FirstPageButton Visible="True">
                </FirstPageButton>
                <LastPageButton Visible="True">
                </LastPageButton>
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="3" />
            <SettingsText PopupEditFormCaption="Add/ Modify Employee" GroupPanel="Other Charge Settings" />
            <ClientSideEvents EndCallback="function(s, e) {
	  EndCall(s.cpEND);
}"></ClientSideEvents>
            <Columns>
                <dxwgv:GridViewDataTextColumn FieldName="OtherCharge_ID" Caption="ID" Visible="False"
                    VisibleIndex="0">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="OtherCharges_Name" Width="9%" Caption="Charge Master"
                    VisibleIndex="0">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="cmp_Name" Width="20%" Caption="Company Name"
                    VisibleIndex="1">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="ddd" Width="7%" Caption="Segment" VisibleIndex="2">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="r" Width="8%" Caption="Group" VisibleIndex="3">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
               
                <dxwgv:GridViewDataTextColumn FieldName="OtherCharge_Rate" Width="8%" Caption="Rate"
                    VisibleIndex="4">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="OtherCharge_SlabID" Width="7%" Caption="ChargeSlab"
                    VisibleIndex="5">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="OtherCharge_ApplicableFor" Width="8%" Caption="Applicable For "
                    VisibleIndex="6">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                
                 <dxwgv:GridViewDataTextColumn FieldName="OtherCharge_ApplicableFrom" Width="8%"
                    Caption="From Date" VisibleIndex="7">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                
                 <dxwgv:GridViewDataTextColumn FieldName="OtherCharge_ApplicableUntil" Width="8%"
                    Caption="Untill Date" VisibleIndex="8">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Width="9%" Caption="Details" VisibleIndex="9">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    <DataItemTemplate>
                        <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                            More Info...</a>
                    </DataItemTemplate>
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <CellStyle Wrap="False">
                    </CellStyle>
                    <HeaderTemplate>
                        <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                              { %>
                        <a href="javascript:void(0);" onclick="OnAddButtonClick( )"><span style="color: #000099;
                            text-decoration: underline">Add New</span> </a>
                        <%} %>
                    </HeaderTemplate>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewCommandColumn Caption="Delete" VisibleIndex="10">
                    <DeleteButton Visible="True">
                    </DeleteButton>
                </dxwgv:GridViewCommandColumn>
            </Columns>
            <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
        </dxwgv:ASPxGridView>
        <asp:SqlDataSource ID="ChargeRateDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            DeleteCommand="OtherChargeRate_Delete" DeleteCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="OtherCharge_ID" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <br />
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
