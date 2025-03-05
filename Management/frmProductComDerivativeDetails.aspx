<%@ page language="C#" autoeventwireup="true" inherits="management_frmProductComDerivativeDetails, App_Web_ng-agpzn" %>

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
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Derivative Details</title>
    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

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
</head>

<script language="javascript" type="text/javascript">

//        function OnMoreInfoClick(keyValue)
//         {
//         var url='frmProductComDerivativeDetailItem.aspx?id='+keyValue;
//         editwin=dhtmlmodal.open("Editbox", "iframe", url, "Edit Item", "width=940px,height=380px,center=1,resize=1,scrolling=2,left=10,top=500", "recal")
//         //document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='hidden';
//         editwin.onclose=function()
//         {
//             //document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='visible';
//             //alert('j');
//             grid.PerformCallback();
//         }
//        }
        
        function OnMoreInfoClick(e,obj)
       {
        AddOrEdit=obj.split('~')[0];
        if(AddOrEdit.toUpperCase()=='EDIT')
        {
            FieldName='ASPxPopupControl1_ASPxCallbackPanel1_drpBranch';
            Filter='N';
            RowID='';
            var data=obj.split('~');
            if(data.length>1)
                RowID=data[1];
    //            alert(RowID);
            popup.Show();
            popPanel.PerformCallback(obj);
        }
         else
        {
            popup.Show();
            popPanel.PerformCallback(obj);
        }
      }
//        function ChildClose()
//        {
//            //alert('hi');
//           
//            editwin.close();
//        }

    function btnCancel_Click()
    {
        //alert('Hello');
        popup.Hide();
    }
    
    function btnSave_Click()
    {
        if(AddOrEdit.toUpperCase()=='EDIT')
        {
            Filter='Y';
            RowID='';
            var obj='Save';
            popPanel.PerformCallback(obj);
            grid.PerformCallback();
            popup.Hide();
        }
        else
        {
            var obj='Add_Save';
            popPanel.PerformCallback(obj);
        }
    }
    function WhichExpiryType(Type)
    {
        if(Type=="2")
        {
            document.getElementById("Tr_DeliveryEnddate").style.display="none";
            document.getElementById("Tr_TenderEndDate").style.display="none";
            document.getElementById("Tr_ContractEndDate").style.display="none";
            document.getElementById("Tr_ExffectiveDate").style.display="none";
            document.getElementById("Tr_DeliveryStartDate").style.display="none";
            document.getElementById("Tr_TenderStartDate").style.display="none";
            document.getElementById("Tr_ContractStartDate").style.display="none";
            document.getElementById("Tr_ExpiryDate").style.display="none";
        }
        else
        {
            document.getElementById("Tr_DeliveryEnddate").style.display="inline";
            document.getElementById("Tr_TenderEndDate").style.display="inline";
            document.getElementById("Tr_ContractEndDate").style.display="inline";
            document.getElementById("Tr_ExffectiveDate").style.display="inline";
            document.getElementById("Tr_DeliveryStartDate").style.display="inline";
            document.getElementById("Tr_TenderStartDate").style.display="inline";
            document.getElementById("Tr_ContractStartDate").style.display="inline";
            document.getElementById("Tr_ExpiryDate").style.display="inline";
        }
    }
    function ddlExpiryType_ValueChange(SelectedValue)
    {
        WhichExpiryType(SelectedValue);
    }
    function ASPxCallbackPanel11_EndCallBack()
    {
       if(popPanel.cpIsInsert!=null)
       {
            alert(popPanel.cpIsInsert);
            if(popPanel.cpIsInsert=='Successfully Saved') 
            {
                popup.Hide();
                grid.PerformCallback();
            }
            if(popPanel.cpIsInsert.toUpperCase()=='TICKERSYMBOL IS REQUIRED') 
            {
               popup.Hide();
            }
       }
       if(popPanel.cpExpiryTypeRolling!=null)
       {
          WhichExpiryType(popPanel.cpExpiryTypeRolling);
       }
       
    }
    
    
</script>

<body>
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="gridDerivativesDetails" runat="server" ClientInstanceName="grid"
                            KeyFieldName="Commodity_ProductSeriesID" Width="100%" AutoGenerateColumns="False"
                            DataSourceID="sqlDerivativeDetail" OnCustomJSProperties="gridDerivativesDetails_CustomJSProperties"
                            OnCustomCallback="gridDerivativesDetails_CustomCallback">
                            <SettingsBehavior AllowFocusedRow="True" />
                            <Styles>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                            </Styles>
                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="ProductID" FieldName="Commodity_ProductID"
                                    Visible="False" VisibleIndex="0">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                               <%--<dxwgv:GridViewDataTextColumn Caption="Ticker Symbol" FieldName="Commodity_TickerSymbol"
                                    VisibleIndex="1">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>--%>
                                <dxwgv:GridViewDataTextColumn Caption="Ticker Symbol" FieldName="Commodity_TickerSymbol"
                                    VisibleIndex="2">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataDateColumn Caption="Contact Expiry Date" FieldName="Commodity_ExpiryDate"
                                    VisibleIndex="3">
                                    <PropertiesDateEdit DisplayFormatString="dd MMM yyyy">
                                    </PropertiesDateEdit>
                                </dxwgv:GridViewDataDateColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Trading Lot" FieldName="Commodity_TradingLot"
                                    VisibleIndex="4">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <PropertiesTextEdit DisplayFormatString="0.00">
                                        <MaskSettings Mask="$&lt;0..99999g&gt;.&lt;00..99&gt;" />
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Unit Name" FieldName="TShortName" ReadOnly="True"
                                    VisibleIndex="5">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                               <dxwgv:GridViewDataTextColumn Caption="Identifier" FieldName="Commodity_Identifier"
                                    Visible="False" VisibleIndex="6">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Numerator" FieldName="Commodity_ConvNumerator"
                                    VisibleIndex="7">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <PropertiesTextEdit DisplayFormatString="0.00">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Denominator" FieldName="Commodity_ConDenominator"
                                    VisibleIndex="8">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <PropertiesTextEdit DisplayFormatString="0.00">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Quote Lot" FieldName="Commodity_QuoteLot" ReadOnly="True"
                                    VisibleIndex="9">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Unit Name" FieldName="QShortName" ReadOnly="True"
                                    VisibleIndex="10">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Exchange" FieldName="Commodity_Exchange" ReadOnly="True"
                                    VisibleIndex="11">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="11">
                                    <HeaderTemplate>
                                    <a href="javascript:void(0);" style="color: #800000;font-weight:bold" onclick="OnMoreInfoClick(this,'Add~')">
                                            Add Items</a>
                                    </HeaderTemplate>
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" style="color: #800000" onclick="OnMoreInfoClick(this,'Edit~'+'<%# Container.KeyValue %>')">
                                            Edit Items</a>
                                    </DataItemTemplate>
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                           
                            <Settings ShowGroupPanel="True" ShowFooter="True" ShowStatusBar="Visible" ShowTitlePanel="True" />
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                        </dxwgv:ASPxGridView>
                        <asp:SqlDataSource ID="sqlDerivativeDetail" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand=""></asp:SqlDataSource>
                        <asp:HiddenField ID="hdnProductID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxpc:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="popup" runat="server"
                            AllowDragging="True" PopupHorizontalAlign="OutsideRight" HeaderText="Product Item Detail"
                            EnableHotTrack="False" BackColor="#DDECFE" Width="100%" DisappearAfter="500"
                            CloseAction="CloseButton">
                            <ContentCollection>
                                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                                    <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="100%" ClientInstanceName="popPanel"
                                        OnCallback="ASPxCallbackPanel1_Callback">
                                        <PanelCollection>
                                            <dxp:PanelContent runat="server">
                                                <table class="TableMain100" style="border-right: #000099 1px solid; border-top: #000099 1px solid; border-left: #000099 1px solid; border-bottom: #000099 1px solid" border="1">
                                                    <tr>
                                                        <td class="gridcellleft" style="width:20%">
                                                            <span style="color: #000099; vertical-align: middle; text-align: center;">Product Name
                                                                :</span></td>
                                                        <td class="gridcellleft" style="vertical-align: middle; text-align: left; height: 26px;">
                                                            <asp:TextBox ID="txtProductName" runat="server" Width="85%" ReadOnly="True"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="gridcellleft" >
                                                            <span style="color: #000099">Ticker Symbol</span><span style="color: #000000">&nbsp;:</span></td>
                                                        <td class="gridcellleft" style="vertical-align: middle; height: 26px; text-align: left">
                                                                        <asp:TextBox ID="txtTickerSymbol" runat="server" Width="85%" Height="17px"></asp:TextBox>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="gridcellleft" >
                                                            <span style="color: #000099">Ticker Code</span><span style="color: #000000"> :</span></td>
                                                        <td class="gridcellleft" style="vertical-align: middle; height: 26px; text-align: left">
                                                                        <asp:TextBox ID="txtTickerCode" runat="server" Height="17px" Width="162px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="gridcellleft">
                                                        <span style="color: #000099; vertical-align: middle; text-align: center;">Expiry Type
                                                                :</span>
                                                        </td>
                                                        <td class="gridcellleft" style="vertical-align: middle; height: 26px; text-align: left">
                                                            <asp:DropDownList ID="ddlExpiryType" runat="server" Width="177px" TabIndex="0" onchange="ddlExpiryType_ValueChange(this.value);">
                                                                <asp:ListItem Value="1">Fixed</asp:ListItem>
                                                                <asp:ListItem Value="2">Rolling</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table class="TableMain100" style="border-right: blue 1px solid; border-top: blue 1px solid; border-left: blue 1px solid; border-bottom: blue 1px solid">
                                                    <tr>
                                                        <td class="gridcellleft" style="vertical-align: middle; text-align: Center;
                                                            width: 330px;">
                                                            <table style="border: solid 1px white">
                                                                <tr id="Tr_ExpiryDate">
                                                                    <td class="gridcellleft">
                                                                        <span style="color: #000099"><span style="color: #000000"><span style="color: #000099">
                                                                            Expiry Date :</span></span></span></td>
                                                                    <td class="gridcellleft">
                                                                        <dxe:ASPxDateEdit ID="dtpExpiryDate" runat="server" ClientInstanceName="cdtpExpiryDate" EditFormat="Custom" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy"
                                                                            Height="17px" Width="175px" TabIndex="1">
                                                                            <clientsideevents datechanged="function(s,e){cdtpEffectivedate.SetDate(cdtpExpiryDate.GetDate());}"></clientsideevents>
                                                                        </dxe:ASPxDateEdit>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="gridcellleft">
                                                                        <span style="color: #000099">Trading Lot<span style="color: #000000">&nbsp;:</span></span></td>
                                                                    <td class="gridcellleft">
                                                                        <asp:TextBox ID="txtTradingLot" runat="server" Width="175px" Height="17px" TabIndex="3"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="gridcellleft">
                                                                        <span style="color: #000099">Delivery Lot :</span></td>
                                                                    <td class="gridcellleft">
                                                                        <asp:TextBox ID="txtDeliveryLot" runat="server" Height="17px" Width="175px" TabIndex="5"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="gridcellleft">
                                                                        <span style="color: #000099">Quote Lot :</span></td>
                                                                    <td class="gridcellleft">
                                                                        <asp:TextBox ID="txtQuoteLot" runat="server" Width="175px" TabIndex="7"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="gridcellleft">
                                                                        <span style="color: #000099">Strike Price<span style="color: #000000"> :</span></span></td>
                                                                    <td class="gridcellleft">
                                                                        <asp:TextBox ID="txtStrikePrice" runat="server" Width="175px" Height="17px" TabIndex="9"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr id="Tr_ContractStartDate">
                                                                    <td class="gridcellleft" >
                                                                        <span style="color: #000099">ContractStartDate<span style="color: #000000"> :</span></span></td>
                                                                    <td class="gridcellleft">
                                                                        <dxe:ASPxDateEdit ID="dtpContractStartDate" runat="server" EditFormat="Custom" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy"
                                                                             Width="175px" Height="17px" TabIndex="11">
                                                                        </dxe:ASPxDateEdit>
                                                                    </td>
                                                                </tr>
                                                                <tr id="Tr_TenderStartDate">
                                                                    <td class="gridcellleft" >
                                                                        <span style="color: #000099">Tender StartDate<span style="color: #000000"> :</span></span></td>
                                                                    <td class="gridcellleft">
                                                                        <dxe:ASPxDateEdit ID="dtpTenderStartDate" runat="server" EditFormat="Custom" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy"
                                                                            Height="17px"  Width="175px" TabIndex="13">
                                                                        </dxe:ASPxDateEdit>
                                                                    </td>
                                                                </tr>
                                                                <tr id="Tr_DeliveryStartDate">
                                                                    <td class="gridcellleft" >
                                                                        <span style="color: #000099">Delivery StartDate :</span></td>
                                                                    <td class="gridcellleft">
                                                                        <dxe:ASPxDateEdit ID="dtpDeliveryStartDate" runat="server" EditFormat="Custom" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy"
                                                                            Height="17px" Width="175px" TabIndex="15">
                                                                        </dxe:ASPxDateEdit>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                     <td class="gridcellleft">
                                                                        <span style="color: #000099">Qty Numerator :</span></td>
                                                                    <td class="gridcellleft">
                                                                        <asp:TextBox ID="txtCommodityNumerator" runat="server" Width="169px" TabIndex="17"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                     <td class="gridcellleft">
                                                                        <span style="color: #000099">Price Numerator :</span></td>
                                                                    <td class="gridcellleft">
                                                                        <asp:TextBox ID="txtPriceNumerator" runat="server" Width="169px" TabIndex="17"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="gridcellleft">
                                                                        <span style="color: #000099">WareHouse Name :</span></td>
                                                                    <td class="gridcellleft">
                                                                        <asp:DropDownList ID="ddlWareHouse" runat="server" Width="177px" TabIndex="19">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td class="gridcellleft" style="vertical-align: top; text-align: left;">
                                                            <table style="border: solid 1px white">
                                                                <tr id="Tr_ExffectiveDate">
                                                                    <td class="gridcellleft" >
                                                                        <span style="color: #000099">Effective End Date :</span></td>
                                                                    <td class="gridcellleft">
                                                                        <dxe:ASPxDateEdit ID="dtpEffectivedate" ClientInstanceName="cdtpEffectivedate" runat="server" EditFormat="Custom" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy"
                                                                            Height="21px" Width="172px"  TabIndex="2">
                                                                        </dxe:ASPxDateEdit>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="gridcellleft">
                                                                        <span style="color: #000099">Trading Unit :</span></td>
                                                                    <td class="gridcellleft">
                                                                        <asp:DropDownList ID="ddlTradingUnit" runat="server" DataSourceID="SqlUnit" DataTextField="UOM_ShortName"
                                                                            DataValueField="UOM_ID" Width="88px" TabIndex="4">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="gridcellleft">
                                                                        <span style="color: #000099">Delivery Unit :</span></td>
                                                                    <td class="gridcellleft">
                                                                        <asp:DropDownList ID="ddlDeliveryUnit" runat="server" DataSourceID="SqlUnit" DataTextField="UOM_ShortName"
                                                                            DataValueField="UOM_ID" Width="88px" TabIndex="6">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="gridcellleft">
                                                                        <span style="color: #000099">Quote Unit :</span></td>
                                                                    <td class="gridcellleft">
                                                                        <asp:DropDownList ID="ddlQuoteUnit" runat="server" DataSourceID="SqlUnit" DataTextField="UOM_ShortName"
                                                                            DataValueField="UOM_ID" Width="88px" TabIndex="8">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="gridcellleft">
                                                                        <span style="color: #000099">Price Tick :</span></td>
                                                                    <td class="gridcellleft" style="height: 6px">
                                                                        <asp:TextBox ID="txtPriceTick" runat="server" Width="169px" TabIndex="10"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr id="Tr_ContractEndDate">
                                                                    <td class="gridcellleft" >
                                                                        <span style="color: #000099">Contract EndDate :</span></td>
                                                                    <td class="gridcellleft">
                                                                        <dxe:ASPxDateEdit ID="dtpContractEndDate" runat="server" EditFormat="Custom" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy"
                                                                            Height="21px" Width="172px" TabIndex="12">
                                                                        </dxe:ASPxDateEdit>
                                                                    </td>
                                                                </tr>
                                                                <tr id="Tr_TenderEndDate">
                                                                    <td class="gridcellleft" >
                                                                        <span style="color: #000099">Tender EndDate :</span></td>
                                                                    <td class="gridcellleft"> 
                                                                        <dxe:ASPxDateEdit ID="dtpTenderEndDate" runat="server" EditFormat="Custom" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy"
                                                                            Height="21px"  Width="172px" TabIndex="14">
                                                                        </dxe:ASPxDateEdit>
                                                                    </td>
                                                                </tr>
                                                                <tr id="Tr_DeliveryEnddate">
                                                                    <td class="gridcellleft" >
                                                                        <span style="color: #000099">Delivery EndDate :</span></td>
                                                                    <td class="gridcellleft" style="height: 24px">
                                                                        <dxe:ASPxDateEdit ID="dtpDeliveryEndDate" runat="server" UseMaskBehavior="True" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                                                            Height="21px" Width="172px" TabIndex="16">
                                                                        </dxe:ASPxDateEdit>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="gridcellleft">
                                                                        <span style="color: #000099">Qty Denominator :</span></td>
                                                                    <td class="gridcellleft">
                                                                        <asp:TextBox ID="txtDenominator" runat="server" Height="17px" Width="175px" TabIndex="18"></asp:TextBox>
                                                                        &nbsp;
                                                                    </td>
                                                                   
                                                                </tr>
                                                                <tr>
                                                                    <td class="gridcellleft">
                                                                        <span style="color: #000099">Price Denominator :</span></td>
                                                                    <td class="gridcellleft">
                                                                        <asp:TextBox ID="txtPriceDenominator" runat="server" Height="17px" Width="175px" TabIndex="18"></asp:TextBox>
                                                                        &nbsp;
                                                                    </td>
                                                                   
                                                                </tr>
                                                                <tr>
                                                                    <td class="gridcellleft" >
                                                                        <span style="color: #000099">Assayer Name :</span></td>
                                                                    <td class="gridcellleft">
                                                                        <asp:DropDownList ID="ddlAssayerName" runat="server" Width="168px" TabIndex="20">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table class="TableMain100" style="border-right: #000099 1px solid; border-top: #000099 1px solid; border-left: #000099 1px solid; border-bottom: #000099 1px solid" border="1">
                                                    <tr>
                                                        <td class="gridcellleft" style="width:20%">
                                                            <span style="color: #000099">Exchange :</span></td>
                                                        <td class="gridcellleft" colspan="3">
                                                            <asp:DropDownList ID="ddlExchange" runat="server" TabIndex="21">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="gridcellcenter">
                                                            &nbsp;
                                                        </td>
                                                        <td class="gridcellcenter" style="width: 276px; height: 34px">
                                                            <input id="Button3" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()"
                                                                style="width: 60px" tabindex="22" />
                                                            <input id="Button4" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_Click()"
                                                                style="width: 60px" tabindex="23" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td >
                                                            <asp:HiddenField ID="hdnID" runat="server" />
                                                            <%--                                                                        <asp:HiddenField ID="hdSubBroker" runat="server" />
                                                                        <asp:HiddenField ID="hdSubSeqBank" runat="server" />
                                                                        <input id="Hidden1" type="hidden" />
                                                                        <asp:HiddenField ID="childemployees" runat="server" />
--%>
                                                            <asp:SqlDataSource ID="SqlUnit" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                                                SelectCommand="SELECT UOM_ID, UOM_Name, UOM_ShortName FROM Master_UOM"></asp:SqlDataSource>
                                                            <%--<asp:SqlDataSource ID="SqlAssayer" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                                                            SelectCommand="SELECT Assayer_ID,Assayer_Name FROM Master_Assayer"></asp:SqlDataSource>
                                                                        <asp:SqlDataSource ID="SqlWareHouse" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                                                            SelectCommand="SELECT WareHouse_ID,WareHouse_Name FROM Master_WareHouse"></asp:SqlDataSource>--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </dxp:PanelContent>
                                        </PanelCollection>
                                       <ClientSideEvents EndCallback="function(s, e) {
	                                                    ASPxCallbackPanel11_EndCallBack();
                                                    }" />
                                    </dxcp:ASPxCallbackPanel>
                                </dxpc:PopupControlContentControl>
                            </ContentCollection>
                            <HeaderStyle HorizontalAlign="Left">
                                <Paddings PaddingRight="6px" />
                            </HeaderStyle>
                            <SizeGripImage Height="16px" Width="16px" />
                            <CloseButtonImage Height="12px" Width="13px" />
                        </dxpc:ASPxPopupControl>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
