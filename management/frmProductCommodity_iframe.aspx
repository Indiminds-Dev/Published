<%@ page language="C#" autoeventwireup="true" inherits="management_frmProductCommodity_iframe, App_Web_-k9nslwd" %>

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
    <title>Product Commodity</title>
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
       function PageLoad()
       {
            
       }
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
        AddOrEdit=obj.split('~')[0];
        if(AddOrEdit.toUpperCase()=='EDIT')
        {
            var Type=cddlType.GetValue();
            var SubType=cddlSubType.GetValue();
            FieldName='ASPxPopupControl1_ASPxCallbackPanel1_drpBranch';
            Filter='N';
            RowID='';
            var data=obj.split('~');
            if(data.length>1)
                RowID=data[1];
            popup.Show();
            popPanel.PerformCallback(obj+'~'+Type+'~'+SubType);
        }
        else
        {
            popup.Show();
            popPanel.PerformCallback(obj);
        }
      }
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
            if(RowID=='')
            {
                var SubType=cddlSubType.GetValue();
                var Type=cddlType.GetValue();
                var obj='Save~'+Type+'~'+SubType;
                popPanel.PerformCallback(obj);
                grid.PerformCallback();
            }
            if(Filter=='Y')
            {
                popup.Hide();
                grid.PerformCallback();
            }
        }
        else
        {
            var obj='Add_Save~'+cddlType.GetValue()+'~'+cddlSubType.GetValue();
            popPanel.PerformCallback(obj);
        }

        
        //alert('tt');
    }
//    function Validation()
//    {
//        if(document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtProductName').value='')
//        {
//            alert('Please Enter Product Name.');
//            document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtProductName').focus();
//            return 0;
//        }
//        if(document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtShortName').value='')
//        {
//            alert('Please Enter Short Name.');
//            document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtProductName').focus();
//            return 0;
//        }
//        return 1;
//    }
    
    
    function EndCallBack(obj)
    {
        if(obj !='')
        {
            var data=obj.split('~');
            if(data[0]=='Edit')
            {
//                AppBank.SetValue(data[1]);
//                cmbSubSequentBank.SetValue(data[2]);
            }
        }
        if(Filter=='Y')
        {
            popup.Hide();
            grid.PerformCallback();
        }
    }
    function ASPxCallbackPanel11_EndCallBack()
    {
       if(popPanel.cpIsInsert!=null)
       {
            alert(popPanel.cpIsInsert);
            document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtProductName').focus();
            if(popPanel.cpIsInsert=='Successfully Saved') 
            {
                popup.Hide();
                grid.PerformCallback();
            }
            else
            {
                popup.Hide();
            }
       }
       
        if(popPanel.cpHideShowProductSubType!=null)
        {
            if(popPanel.cpHideShowProductSubType=="H")
            {
                td_ProductSubtypeText.style.display="none";
                td_ProductSubtypeValue.style.display="none";
            }
            else
            {
                td_ProductSubtypeText.style.display="inline";
                td_ProductSubtypeValue.style.display="inline";
            }
        }
        if(popPanel.cpIsExists!=null)
            alert(popPanel.cpIsExists);
    }
    function FillddlSubType()
    {
        popPanel.PerformCallback("FillddlProductSubType~");
    }
   
    
</script>

 <script type="text/ecmascript">   
 //Call Back Purpose Use Value Return by Variable 'data' in Cs Page
       function ReceiveServerData(rValue)
        {
                var j=rValue.split('~');
                
        }
        </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
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
                                <td class="gridcellright" style="text-align: right">
                                    <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                        Font-Bold="False" ForeColor="White" ValueType="System.Int32" Width="130px" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged">
                                        <%--OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"--%>
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
                        <dxwgv:ASPxGridView ID="gridCommodities" runat="server" ClientInstanceName="grid"
                            Width="100%" KeyFieldName="Products_ID" AutoGenerateColumns="False"  DataSourceID="sqlCommodity" OnCustomCallback="gridCommodities_CustomCallback"
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
                                <dxwgv:GridViewDataTextColumn Caption="Short Name" FieldName="Products_ShortName"
                                    VisibleIndex="1">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Type ID" FieldName="Products_ProductTypeID"
                                    Visible="False" VisibleIndex="2">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Asset Group" FieldName="SubTypeName" VisibleIndex="2">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Sector ID" FieldName="Products_SectorID" Visible="False"
                                    VisibleIndex="4">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="DerivedFrom ID" FieldName="Products_DerivedFromID"
                                    ReadOnly="True" Visible="False" VisibleIndex="5">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Option Type" FieldName="Products_OptionType"
                                    ReadOnly="True" Visible="False" VisibleIndex="6">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Index ID" FieldName="Products_IndexID" Visible="False"
                                    VisibleIndex="3">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="3">
                                <HeaderTemplate>
                                    <a href="javascript:void(0);" style="color: #800000;font-weight:bold" onclick="OnMoreInfoClick(this,'Add~')">
                                            Add Items</a>
                                </HeaderTemplate>
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" style="color: #800000;" onclick="OnMoreInfoClick(this,'Edit~'+'<%# Container.KeyValue %>')">
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
                        <asp:SqlDataSource ID="sqlCommodity" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                        </asp:SqlDataSource>
                        <%--SelectCommand="select P.Products_ID,P.Products_Name,P.Products_ShortName,P.Products_ProductTypeID,PS.ProductSubType_Name As SubTypeName,P.Products_SectorID,P.Products_DerivedFromID,P.Products_OptionType,P.Products_IndexID From Master_Products P,Master_ProductSubTypes PS Where P.Products_ProductTypeID in (1,5,8,10) AND PS.ProductSubType_ID=P.Products_ProductSubTypeID Order By P.Products_ID Desc"--%>
                    </td>
                </tr>
            </table>
            <dxpc:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="popup" runat="server"
                AllowDragging="True" PopupHorizontalAlign="OutsideRight" HeaderText="Product Detail"
                EnableHotTrack="False" BackColor="#DDECFE" Width="700px" DisappearAfter="500"
                CloseAction="CloseButton">
                <ContentCollection>
                    <dxpc:PopupControlContentControl runat="server">
                        <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="100%" ClientInstanceName="popPanel"
                            OnCallback="ASPxCallbackPanel1_Callback">
                            <PanelCollection>
                                <dxp:PanelContent runat="server">&nbsp; <table style="border: solid 1px white" border="1"><tr><td class="gridcellleft" style="width: 117px"><strong><span style="color: #000099">Product Name :</span></strong> </td><td class="gridcellleft"><asp:TextBox ID="txtProductName" runat="server" Width="175px" CssClass="EcoheadCon" Height="17px"></asp:TextBox>

 </td><td class="gridcellleft"><span style="color: #000099"><strong>Short Name :</strong></span></td><td class="gridcellleft"><asp:TextBox ID="txtShortName" runat="server" CssClass="EcoheadCon" Height="17px" Width="175px"></asp:TextBox>

 </td></tr><tr><td id="td_ProducttypeText" class="gridcellleft" style="width: 117px"><span style="color: #000099"><span style="color: #000099"><strong>Product Type :</strong></span></span></td><td id="td_ProducttypeValue" class="gridcellleft"><dxe:ASPxComboBox ID="ddlType" runat="server" ClientInstanceName="cddlType">
<clientsideevents valuechanged="FillddlSubType" ></clientsideevents>
</dxe:ASPxComboBox>

 </td><td id="td_ProductSubtypeText" class="gridcellleft"><span style="color: #000099"><strong>Product SubType :</strong></span></td><td id="td_ProductSubtypeValue" class="gridcellleft"><dxe:ASPxComboBox ID="ddlSubType" runat="server" ClientInstanceName="cddlSubType" OnCallback="ddlSubType_Callback"></dxe:ASPxComboBox>

 </td></tr><tr><td class="gridcellleft" style="width: 117px"><asp:HiddenField ID="hdnID" runat="server" />

 </td><td class="gridcellleft"></td><td class="gridcellleft"><input id="btnSave" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()"
                                                style="width: 60px" tabindex="0" /></td><td class="gridcellleft"><input id="btnCancel" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_Click()"
                                                style="width: 60px" tabindex="0" /> </td></tr></table></dxp:PanelContent>
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
            <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
            </dxwgv:ASPxGridViewExporter>
        </div>
    </form>
</body>

</html>
