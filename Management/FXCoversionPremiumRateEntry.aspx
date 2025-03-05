<%@ page language="C#" autoeventwireup="true" inherits="management_FXCoversionPremiumRateEntry, App_Web_n3rnr3dz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>FX Coversion Premium Rates</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	/* Never change this one */
		width:50px;	/* Width of box */
		height:auto;	/* Height of box */
		overflow:auto;	/* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:32767;
	}
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and .optionDivSelected */
		margin:1px;		
		padding:1px;
		cursor:pointer;
		font-size:0.9em;
	}
	#ajax_listOfOptions .optionDiv{	/* Div for each item in list */
		
	}
	#ajax_listOfOptions .optionDivSelected{ /* Selected item in the list */
		background-color:#DDECFE;
		color:Blue;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:3000;
	}
	
	form{
		display:inline;
	}
	
	</style>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

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

    function PopulateGrid(obj)
 {
 
   cGridFXPR.PerformCallback(obj);
 }
    function Changestatus(obj)
    {
      var URL="FXCPRatePopup.aspx?id="+obj;
      editwin=dhtmlmodal.open("Editbox", "iframe", URL, "Add/Edit FX Coversion Premium Rates", "width=1100px,height=350px,center=1,resize=1,top=-1", "recal");                 
      editwin.onclose=function()
         {
            cGridFXPR.PerformCallback();
         }
    }
    function ShowHideFilter(obj)
    {
        cGridFXPR.PerformCallback(obj);
    } 
    function callback()
    {
        cGridFXPR.PerformCallback();
    }
    function callheight(obj)
    {
        height();
        parent.CallMessage();
    }
    </script>

    <%--</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">--%>
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">FX Coversion Premium Rates</span></strong>
                    </td>
                </tr>
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
                                <td style="width: 750px;">
                                </td>
                                <td class="gridcellright" align="right" id="td_export" runat="server">
                                    <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Gray"
                                        Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                        ValueType="System.Int32" Width="80px">
                                        <Items>
                                            <dxe:ListEditItem Text="Select" Value="0" />
                                           
                                            <dxe:ListEditItem Text="Excel" Value="1" />
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
                        <%--Width="100%"--%>
                        <dxwgv:ASPxGridView ID="GridFXPR" runat="server" AutoGenerateColumns="False"
                            KeyFieldName="FxPremium_ID" Width="100%" OnRowDeleting="GridFXPR_RowDeleting"
                            ClientInstanceName="cGridFXPR" OnCustomCallback="GridFXPR_CustomCallback" OnHtmlRowCreated="GridFXPR_HtmlRowCreated">
                            <Templates>
                                <EditForm>
                                </EditForm>
                            </Templates>
                            <Settings ShowGroupPanel="false" />
                            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Srl No" VisibleIndex="0" Width="5%">
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                    <DataItemTemplate>
                                        <%# Container.ItemIndex+1%>
                                    </DataItemTemplate>
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataDateColumn FieldName="Date" Caption="Rate Date" Width="15%" VisibleIndex="1">
                                    <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                                    </PropertiesDateEdit>
                                    <CellStyle CssClass="gridcellleft" Wrap="False"></CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataDateColumn>
                                
                                <dxwgv:GridViewDataDateColumn FieldName="ToDate" Caption="Rate Till Date" Width="15%" VisibleIndex="2">
                                    <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                                    </PropertiesDateEdit>
                                    <CellStyle CssClass="gridcellleft" Wrap="False"></CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataDateColumn>
                                                                
                                <dxwgv:GridViewDataTextColumn FieldName="From_Currency" Caption="From Currency" Width="15%" VisibleIndex="3">
                                    <CellStyle CssClass="gridcellleft" Wrap="False"></CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn FieldName="To_Currency" Caption="To Currency" Width="15%" VisibleIndex="4">
                                    <CellStyle CssClass="gridcellleft" Wrap="False"></CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn FieldName="FxPremium_ProfitRate" Caption="Fx Premium Profit Rate" Width="12%" VisibleIndex="5">
                                    <CellStyle CssClass="gridcellleft" Wrap="False"></CellStyle>
                                    <HeaderStyle HorizontalAlign="Right" />
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn FieldName="FxPremium_LossRate" Caption="Fx Premium Loss Rate" Width="12%" VisibleIndex="6">
                                    <CellStyle CssClass="gridcellleft" Wrap="False"></CellStyle>
                                    <HeaderStyle HorizontalAlign="Right" />
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn FieldName="Create_User" Caption="Create User" Width="15%" VisibleIndex="7">
                                    <CellStyle CssClass="gridcellleft" Wrap="False"></CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn FieldName="change" Caption="Change Combination" Width="15%" VisibleIndex="8">
                                    <CellStyle CssClass="gridcellleft" Wrap="False"></CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewCommandColumn VisibleIndex="9" Width="10%">
                                    <EditButton Visible="false"></EditButton>
                                    <DeleteButton Visible="True"></DeleteButton>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="Changestatus('Add')"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                    </HeaderTemplate>
                                </dxwgv:GridViewCommandColumn>
                                
                                <dxwgv:GridViewDataTextColumn FieldName="FromCurrencyID" VisibleIndex="10" Visible="False">
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn FieldName="ToCurrencyID" VisibleIndex="11" Visible="False">
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataDateColumn FieldName="ToDateChk" VisibleIndex="12" Visible="False">
                                    <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                                    </PropertiesDateEdit>
                                </dxwgv:GridViewDataDateColumn>
                            </Columns>
                            <Settings ShowGroupPanel="False" ShowStatusBar="Visible" />
                            <Styles>
                                <Header SortingImageSpacing="5px" ImageSpacing="5px" CssClass="gridheader">
                                </Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <FocusedGroupRow CssClass="gridselectrow">
                                </FocusedGroupRow>
                                <FocusedRow CssClass="gridselectrow">
                                </FocusedRow>
                            </Styles>
                            <SettingsPager NumericButtonCount="20" PageSize="10" ShowSeparators="True" AlwaysShowPager="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <Settings ShowHorizontalScrollBar="true" />
                            <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="200px" PopupEditFormHorizontalAlign="Center"
                                PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px"
                                EditFormColumnCount="1" />
                            <SettingsText PopupEditFormCaption="Add/Modify " ConfirmDelete="Are you sure to Delete this Record!" />
                            <ClientSideEvents EndCallback="function(s, e) {  
                                if (s.cpMessage) {
                                    alert(s.cpMessage); //alert  
                                    delete s.cpMessage; //delete  
                                }  
                            }"
                            />
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
            </table>
            <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
            </dxwgv:ASPxGridViewExporter>
        </div>
    </form>
</body>
</html>
