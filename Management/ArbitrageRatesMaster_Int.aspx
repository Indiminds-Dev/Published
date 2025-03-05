<%@ page language="C#" autoeventwireup="true" inherits="Management_ArbitrageRatesMaster_Int, App_Web_e81qjzgk" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Untitled Page</title>
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
     
       grid.PerformCallback(obj);
     }
    function Changestatus(obj)
    {
      var URL="ArbitrageRates_Int.aspx?id="+obj;
      editwin=dhtmlmodal.open("Editbox", "iframe", URL, "Add/Edit Arbitrage Rates", "width=1100px,height=300px,center=0,resize=1,top=-1", "recal");                 
      editwin.onclose=function()
             {
                 grid.PerformCallback();
             }
    }
    function ShowHideFilter(obj)
    {
        grid.PerformCallback(obj);
    } 
    function callback()
        {
            grid.PerformCallback();
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
                        <strong><span style="color: #000099">Inter-Exchange Arbitrage Rates</span></strong>
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
                                           
                                            <dxe:ListEditItem Text="XLS" Value="2" />
                                            
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
                        <dxwgv:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False"
                            KeyFieldName="IntArbRates_ID" Width="1250px" OnRowDeleting="grid_RowDeleting"
                            ClientInstanceName="grid" OnCustomCallback="grid_CustomCallback" OnHtmlRowCreated="grid_HtmlRowCreated"
                            OnCommandButtonInitialize="grid_CommandButtonInitialize">
                            <Templates>
                                <EditForm>
                                </EditForm>
                            </Templates>
                            <Settings ShowGroupPanel="false" ShowHorizontalScrollBar="true" />
                            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Srl No" VisibleIndex="1" Width="10px">
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                    <DataItemTemplate>
                                        <%# Container.ItemIndex+1%>
                                    </DataItemTemplate>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="Date" Caption="Date" VisibleIndex="2" Width="20px">
                                    <CellStyle CssClass="gridcellleft" Wrap="False">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="AssetName" Caption="Asset" VisibleIndex="3"  Width="55px">
                                    <CellStyle CssClass="gridcellleft" Wrap="False">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="ExchangeFromName" Caption="Exchange From" VisibleIndex="4"  Width="20px"
                                    Visible="true">
                                    <CellStyle CssClass="gridcellleft" Wrap="False">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="ExchangeToName" Caption="Exchange To" VisibleIndex="5"  Width="20px"
                                    Visible="true">
                                    <CellStyle CssClass="gridcellleft" Wrap="False">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="ExpiryFrom" Caption="Expiry From" VisibleIndex="6"  Width="20px">
                                    <CellStyle CssClass="gridcellleft" Wrap="False">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="ExpiryTo" Caption="Expiry To" VisibleIndex="7"  Width="20px">
                                    <CellStyle CssClass="gridcellleft" Wrap="False">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn FieldName="Rate" Caption="Rate" VisibleIndex="8"  Width="20px">
                                    <CellStyle CssClass="gridcellleft" Wrap="False">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="" Caption="Modify" VisibleIndex="9"  Width="20px">
                                <DataItemTemplate>Click to Modify</DataItemTemplate>
                                    <CellStyle CssClass="gridcellleft" Wrap="False">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewCommandColumn VisibleIndex="10" Width="10%">
                                    <EditButton Visible="false">
                                    </EditButton>
                                    <DeleteButton Visible="True">
                                    </DeleteButton>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="Changestatus('Add')"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                    </HeaderTemplate>
                                </dxwgv:GridViewCommandColumn>
                            </Columns>
                            <%--<SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" />--%>
                            <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
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
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
                <tr>
                    <td style="display: none;">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                </tr>
            </table>
            <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
            </dxwgv:ASPxGridViewExporter>
        </div>
    </form>
</body>
</html>
