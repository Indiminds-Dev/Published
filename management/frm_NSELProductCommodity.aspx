<%@ page language="C#" autoeventwireup="true" inherits="management_frmProductCommodity_iframe, App_Web_6bj03ldo" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Product Commodity Of NSEL-SPOT</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
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
<script language="javascript" type="text/javascript">
       function ShowHeight(obj)
       {
            
           height();
       }
         function height()
        {
                        
            if(document.body.scrollHeight>250)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '250px';
            window.frameElement.widht = document.body.scrollWidht;
            
        }
        function ShowHideFilter(obj)
        {
           grid.PerformCallback(obj);
        }
       function OnMoreInfoClick(e,obj)
       {
        FieldName='ASPxPopupControl1_ASPxCallbackPanel1_drpBranch';
        Filter='N';
        RowID='';
        var data=obj.split('~');
        if(data.length>1)
            RowID=data[1];
        popup.Show();
        popPanel.PerformCallback(obj);
      }
    function btnCancel_Click()
    {
        popup.Hide();
    }
       function btnSave_Click()
    {
        Filter='Y';
        RowID='';
        if(RowID=='')
        {
            var obj='Save';
            popPanel.PerformCallback(obj);
            grid.PerformCallback();
        }
        if(Filter=='Y')
        {
            popup.Hide();
            grid.PerformCallback();
        }
    }
    
    
    function EndCallBack(obj)
    {
        if(obj !='')
        {
            var data=obj.split('~');
            if(data[0]=='Edit')
            {
            }
        }
        if(Filter=='Y')
        {
            popup.Hide();
            grid.PerformCallback();
        }
    }
  function btnSearch_click()
   {
        document.getElementById('TrFilter').style.display="none";
        grid.PerformCallback('s');
   }  


</script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td style="height: 84px">
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
                                <td class="gridcellright" style="text-align: right">
                                    <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                        Font-Bold="False" ForeColor="White" ValueType="System.Int32" Width="130px" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged">
                                     
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
                        <table>
                            <tr id="TrFilter" style="display:none">
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="water" Font-Size="10px" Text="Ticker Symbol"
                                        ToolTip="Name" Width="119px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTickerCode" runat="server" CssClass="water" Font-Size="10px"
                                        Text="Ticker Code" ToolTip="Branch Name" Width="100px"></asp:TextBox>
                                </td>
                             
                                <td>
                                    <input id="btnSearch" class="btnUpdate" onclick="btnSearch_click()" style="height: 21px"
                                        type="button" value="Search" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="gridCommodities" runat="server" ClientInstanceName="grid"
                            Width="100%" KeyFieldName="Commodity_ProductSeriesID" AutoGenerateColumns="False"  DataSourceID="sqlCommodity" OnCustomCallback="gridCommodities_CustomCallback"
                            OnCustomJSProperties="gridCommodities_CustomJSProperties">
                            <ClientSideEvents EndCallback="function(s, e) {
	
	ShowHeight(s.cpHeight)
}" />
                            <Styles>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                            </Styles>
                            
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Name" FieldName="Products_Name" VisibleIndex="0">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                  <dxwgv:GridViewDataTextColumn Caption="Ticker Code" FieldName="Commodity_TickerCode" VisibleIndex="1">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Symbol" FieldName="Commodity_TickerSymbol" VisibleIndex="2">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Cycle" FieldName="Commodity_Cycle" Visible="True" VisibleIndex="3">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Delivery Mode" FieldName="Commodity_DeliveryMode" VisibleIndex="4">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="5">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnMoreInfoClick(this,'Edit~'+'<%# Container.KeyValue %>')">
                                            Edit Items</a>
                                    </DataItemTemplate>
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                            <Settings ShowGroupPanel="True" ShowFooter="True" ShowStatusBar="Visible" ShowTitlePanel="True" />
                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <SettingsBehavior AllowFocusedRow="True" />
                        </dxwgv:ASPxGridView>
                        <asp:SqlDataSource ID="sqlCommodity" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" ProviderName="<%$ ConnectionStrings:crmConnectionString.ProviderName %>">
                        </asp:SqlDataSource>
                       
                    </td>
                </tr>
                  <tr>
                                <td>
                                    <dxpc:ASPxPopupControl ID="ASPxPopupControl1" runat="server" AllowDragging="True"
                                        BackColor="#DDECFE" ClientInstanceName="popup" CloseAction="CloseButton" DisappearAfter="500"
                                        EnableHotTrack="False" HeaderText="Product Detail" PopupHorizontalAlign="OutsideRight"
                                        Width="100%">
                                        <SizeGripImage Height="16px" Width="16px" />
                                        <ContentCollection>
                                            <dxpc:PopupControlContentControl runat="server">
                                                <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="popPanel"
                                                    OnCallback="ASPxCallbackPanel1_Callback" Width="100%">
                                                    <panelcollection>
<dxp:PanelContent runat="server"><TABLE class="TableMain100"><TBODY><TR style="DISPLAY: none"><TD class="gridcellleft"></TD></TR><TR><TD><TABLE class="TableMain100"><TBODY><TR><TD style="VERTICAL-ALIGN: top; TEXT-ALIGN: right" class="gridcellleft"><TABLE style="BORDER-RIGHT: white 1px solid; BORDER-TOP: white 1px solid; BORDER-LEFT: white 1px solid; BORDER-BOTTOM: white 1px solid"><TBODY><TR><TD class="gridcellleft"><STRONG><SPAN style="COLOR: #000099">Commodity Cycle&nbsp;:</SPAN></STRONG> </TD><TD class="gridcellleft"><asp:TextBox runat="server" CssClass="EcoheadCon" Height="17px" TabIndex="1" Width="175px" ID="txtCycle" __designer:wfdid="w3"></asp:TextBox>

 </TD></TR></TBODY></TABLE></TD><TD style="VERTICAL-ALIGN: top; TEXT-ALIGN: left" class="gridcellleft"><TABLE style="BORDER-RIGHT: white 1px solid; BORDER-TOP: white 1px solid; BORDER-LEFT: white 1px solid; BORDER-BOTTOM: white 1px solid"><TBODY><TR><TD style="HEIGHT: 12px" class="gridcellleft"><STRONG><SPAN style="COLOR: #000099">&nbsp;Delivery Mode&nbsp;:</SPAN></STRONG></TD><TD style="HEIGHT: 12px" class="gridcellleft">&nbsp;<asp:DropDownList runat="server" Width="45px" ID="ddlDeliveryMode" __designer:wfdid="w7"><asp:ListItem>D</asp:ListItem>
<asp:ListItem>P</asp:ListItem>
<asp:ListItem>B</asp:ListItem>
</asp:DropDownList>

 </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR><TR><TD style="HEIGHT: 34px" class="gridcellcenter"><INPUT style="WIDTH: 60px" id="btnSave" class="btnUpdate" tabIndex=33 onclick="btnSave_Click()" type=button value="Save" /> <INPUT style="WIDTH: 60px" id="btnCancel" class="btnUpdate" tabIndex=34 onclick="btnCancel_Click()" type=button value="Cancel" /> </TD></TR><TR><TD style="HEIGHT: 30px"><asp:HiddenField runat="server" ID="hdnID" __designer:wfdid="w6"></asp:HiddenField>

 </TD></TR></TBODY></TABLE></dxp:PanelContent>
</panelcollection>
                                                </dxcp:ASPxCallbackPanel>
                                            </dxpc:PopupControlContentControl>
                                        </ContentCollection>
                                        <CloseButtonImage Height="12px" Width="13px" />
                                        <HeaderStyle HorizontalAlign="Left">
                                            <Paddings PaddingRight="6px" />
                                        </HeaderStyle>
                                    </dxpc:ASPxPopupControl>
                                  
                                </td>
                            </tr>
            </table>
            <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
            </dxwgv:ASPxGridViewExporter>
            <asp:SqlDataSource ID="SqlProductSubType" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="SELECT ProductSubType_ID,ProductSubType_Name FROM Master_ProductSubTypes Where ProductSubType_ApplicableType=10" ProviderName="<%$ ConnectionStrings:crmConnectionString.ProviderName %>"></asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>

</html>
