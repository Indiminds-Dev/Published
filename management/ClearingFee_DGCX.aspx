<%@ page language="C#" autoeventwireup="true" inherits="management_ClearingFee_DGCX, App_Web_cvaj-tqf" %>

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
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Clearing Fees</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

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
    function OnMoreInfoClick(keyValue) {

       

        var url = 'ClearingTax_DGCX.aspx?id=' + keyValue;
      parent.OnMoreInfoClick(url,"Modify Clearing Fee Rates",'1100px','500px',"Y");
   
    }
    
    function OnAddButtonClick() 
    {
         var e=parent.document.getElementById('cmbSegment').value;
         var url = 'ClearingTax_DGCX.aspx?id=' + 'ADD';
         parent.OnMoreInfoClick(url, "Add Clearing Fee Rates", '1100px', '500px', "Y");
         
    }
    
     function PopulateGrid()
     {
      grid.PerformCallback();
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
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Clearing Fees</span></strong>
                </td>
            </tr>
            <tr>
                <td align="right">
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
        <dxwgv:ASPxGridView ID="ServiceTaxGrid" runat="server" KeyFieldName="ClearingFee_ID"
            AutoGenerateColumns="False" DataSourceID="ServiceTaxDataSource" Width="100%"
            ClientInstanceName="grid" OnCustomCallback="ServiceTaxGrid_CustomCallback" OnCustomJSProperties="ServiceTaxGrid_CustomJSProperties" OnCommandButtonInitialize="ServiceTaxGrid_CommandButtonInitialize">
            <Columns>
                <dxwgv:GridViewDataTextColumn FieldName="ClearingFee_ID" Caption="ID" VisibleIndex="0"
                    Visible="False">
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>
<%--                <dxwgv:GridViewDataTextColumn FieldName="cmp_Name" Caption="Company Name" VisibleIndex="0"
                    Width="25%">
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Segment" FieldName="ddd" VisibleIndex="1"
                    Width="8%">
                    <EditFormSettings Visible="False" />
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                </dxwgv:GridViewDataTextColumn>
--%>               
             <dxwgv:GridViewDataTextColumn Caption="Group" FieldName="r" VisibleIndex="2" Width="15%">
                    <EditFormSettings Visible="False" />
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="AssetType" Caption="Asset Type " VisibleIndex="3"
                    Width="20%">
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="Product" Caption="Product " VisibleIndex="4"
                    Width="25%">
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>

                <dxwgv:GridViewDataTextColumn Caption="InstrType" FieldName="InstrType" VisibleIndex="5"
                    Width="5%">
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>

                <dxwgv:GridViewDataTextColumn Caption="Exchange" FieldName="Exchange" VisibleIndex="6"
                    Width="5%">
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>

                <dxwgv:GridViewDataTextColumn Caption="Rate" FieldName="ClearingFee_Rate" VisibleIndex="7"
                    Width="4%">
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>

                <dxwgv:GridViewDataTextColumn Caption="Currency" FieldName="currency"
                    VisibleIndex="8" Width="3%">
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>
                
                
           
                
                    <dxwgv:GridViewDataTextColumn FieldName="STApplicable" Caption="VAT " VisibleIndex="9"
                    Width="2%">
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>
                
                
                <dxwgv:GridViewDataTextColumn Caption="From Date" FieldName="ClearingFee_DateFrom" VisibleIndex="10"
                    Width="6%">
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Untill Date" FieldName="ClearingFee_DateTo" VisibleIndex="11"
                    Width="6%">
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <EditFormCaptionStyle HorizontalAlign="Right">
                    </EditFormCaptionStyle>
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>
                
                <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="11" Width="7%">
                    <DataItemTemplate>
                        <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                            More Info...</a>
                    </DataItemTemplate>
                    <EditFormSettings Visible="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                    
                       <a href="javascript:void(0);" onclick="OnAddButtonClick( )"><span style="color: #000099;text-decoration: underline">Add New</span> </a>
                    
                       <%-- <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                              { %>--%>
                     
                      <%--  <%} %>--%>
                    </HeaderTemplate>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewCommandColumn VisibleIndex="12" Caption="Delete">
                    <DeleteButton Visible="True">
                    </DeleteButton>
                    <%--<CellStyle ForeColor="White">
                        <HoverStyle BackColor="#000040">
                        </HoverStyle>
                    </CellStyle>--%>
                </dxwgv:GridViewCommandColumn>
            </Columns>
            <Styles>
                <LoadingPanel ImageSpacing="10px">
                </LoadingPanel>
                <Header ImageSpacing="5px" SortingImageSpacing="5px" CssClass="gridheader">
                </Header>
                <FocusedRow CssClass="gridselectrow" HorizontalAlign="Left" VerticalAlign="Top">
                </FocusedRow>
                <Footer CssClass="gridfooter">
                </Footer>
                <FocusedGroupRow CssClass="gridselectrow">
                </FocusedGroupRow>
            </Styles>
            <Settings ShowGroupButtons="False" ShowStatusBar="Visible" ShowGroupPanel="True" />
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
            <SettingsText PopupEditFormCaption="Add/ Modify " GroupPanel="Clearing Fees" />
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
        </dxwgv:ASPxGridView>
        <asp:SqlDataSource ID="ServiceTaxDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            DeleteCommand="ClearingFeeDG_delete" DeleteCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="ClearingFee_ID" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <br />
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
