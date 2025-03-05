<%@ page language="C#" autoeventwireup="true" inherits="management_frm_ReportAssetDetail_iframe, App_Web_n3rnr3dz" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Report AssetDetail</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>
   

    <script type="text/javascript" language="javascript">
   
   function CallList(obj,obj1,obj2,obj3)
    {
        
        var o = document.getElementById("txtAssetMain")
        ajax_showOptions(obj,obj1,obj2,o.value);
    }
    FieldName='ctl00_ContentPlaceHolder1_Headermain1_cmbSegment'; 
    
//    function CallList(obj,obj1,obj2,ob3)
//    {
//        alert(obj);
//        ajax_showOptions(obj,obj1,obj2,obj3);
//    }
//    FieldName='ctl00_ContentPlaceHolder1_Headermain1_cmbSegment'; 
       
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
               
        function OnMainAssetChanged(cmbAssetMain) 
        {
            
            cmbAssetSub.PerformCallback(cmbAssetMain.GetValue());
        }
        
        
        function ShowHide(obj)
        {
            document.getElementById("tr1").style.display='none';
            document.getElementById("tr2").style.display='none';
            document.getElementById("tblmain").style.display='none';
            document.getElementById("tblsub").style.display='none';
            document.getElementById("tr3").style.display='inline';
            document.getElementById("tr4").style.display='inline';
            
            height();
        }
        function ForFilter()
        {
            
            
            document.getElementById("tr1").style.display='inline';
            document.getElementById("tr2").style.display='inline';
            document.getElementById("tblmain").style.display='inline';
            document.getElementById("tblsub").style.display='inline';
            document.getElementById("tr3").style.display='none';
            document.getElementById("tr4").style.display='none';
            
            
            var val = 0;
            
            for( i = 0; i < document.form1.All.length; i++ )
            {
                if( document.form1.All[i].checked == true )
                    {
                        val = document.form1.All[i].value;
                        
                    }
                if(val=='All')
                    {
                        document.getElementById("tblsub").style.display='none';
                        
                    }
                if(val=='Specific')
                    {
                        document.getElementById("tblsub").style.display='inline';
                        
                    } 

            }
            height();
            
                      
        }
        function ForCkeckBox()
        {
            var i=document.getElementById("rdnAll").value;
            if(i=='All')
            {
                document.getElementById("tblsub").style.display='none'; 
            }
           
            
              
        }
        function ForCkeckBoxSpecific()
        {
            var j=document.getElementById("rdnSpecific").value;
            if(j=='Specific')
            {
                document.getElementById("tblsub").style.display='inline';
            }
           
            
              
        }
        
        
        function OnMoreInfoClick(keyValue,MainValue) 
        {
            //alert(keyValue);
            var url='ItemHistroy.aspx?id='+keyValue;
            parent.OnMoreInfoClick(url,"Show Items Of "+ MainValue +"~"+ keyValue +"",'960px','470px')
         
        }
   
            
    </script>

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
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div style="text-align: center; vertical-align: top">
               <table class="TableMain100">
                  <tr>
            <td class="EHEADER">
                <span style="color: Blue"><strong>Report Asset Detail</strong></span>&nbsp;</td>
        </tr></table>
            <table class="TableMain100">
      
                <tr>
                    <td style="text-align: center; width: 125px;">
                        <table cellpadding="0" cellspacing="0">
                            <tr id="tr3">
                                <td style="text-align: right; width: 30px;" id="TrForFilter">
                                    <a href="#" style="font-weight: bold; color: Blue" onclick="javascript:ForFilter();">
                                        Filter</a>
                                    <%--|| <a href="#" style="font-weight: bold; color: Blue" onclick="javascript:search1();">
                                                        Search</a>--%>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="tr1">
                    <td class="gridcellright" style="width: 125px; text-align: left;  vertical-align: text-top;"
                        id="tdsettlement">
                        <span class="Ecoheadtxt" style="color:Blue"><strong>AssetCategory:</strong></span>
                        &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;</td>
                    <td class="mt" style="width: 160px; text-align: left; vertical-align: text-top;">
                        <asp:DropDownList ID="cmbAssetCategory" runat="server" Width="142px">
                            <asp:ListItem Selected="True">ALL</asp:ListItem>
                            <asp:ListItem Value="M">Movable</asp:ListItem>
                            <asp:ListItem Value="I">Immovable</asp:ListItem>
                            <asp:ListItem Value="W">Work In Progress</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="width: 156px; vertical-align: text-top; text-align: left;">
                        <table id="tblmain" style="width: 200px">
                            <td class="gridcellleft" style="width: 603px; vertical-align: text-top; height: 24px;"
                                runat="server" id="Td4">
                                <span class="Ecoheadtxt" style="color: Blue"><strong>Asset Type:</strong></span></td>
                            <td style="width: 40px; vertical-align: text-top; text-align: left; height: 24px;"
                                runat="server" id="tdckeck">
                                All:<input id="rdnAll" name="All" runat="server" style="width: 16px; height: 16px;" title="All"
                                    type="radio" value="All" onclick="ForCkeckBox();" /></td>
                            <td class="gridcellleft" style="width: 131px; vertical-align: text-top; height: 24px;"
                                runat="server" id="Td8">
                                Specific:<input id="rdnSpecific" dir="ltr" name="All" runat="server" style="width: 18px;
                                    height: 14px;" title="Specific" type="radio" value="Specific" checked="true"
                                    onclick="ForCkeckBoxSpecific();" /></td>
                        </table>
                    </td>
                    <td colspan="4" style="width: 200px; vertical-align: text-top; text-align: left;"
                        id="Td9">
                        <table id="tblsub">
                            <td class="gridcellright" style="text-align: left; height: 9px; vertical-align: text-top;
                                width: 97px;">
                                <span style="color: Blue"><strong>AssetMain:</strong></span></td>
                            <td style="width: 114px">
                                <asp:TextBox ID="txtAssetMain" runat="server" Width="117px">ALL</asp:TextBox></td>
                            <td class="gridcellright" style="text-align: left; height: 9px; vertical-align: text-top;
                                width: 120px;">
                                <span style="color: Blue"><strong>AssetSub:</strong></span></td>
                            <td style="width: 128px; text-align: left;">
                                <asp:TextBox ID="txtAssetSub" runat="server" Width="117px">ALL</asp:TextBox></td>
                        </table>
                    </td>
                </tr>
                <tr id="tr2">
                    <td class="gridcellright" style="width: 125px; text-align: left; height: 44px; vertical-align: text-top;"
                        id="td1">
                        <span class="Ecoheadtxt" style="text-align: left"><strong>Location:<span style="color: #000000"></span></strong><span
                            style="color: #000000"></span></span></td>
                    <td class="lt" style="text-align: left; height: 44px; vertical-align: top;
                        width: 160px;">
                       <asp:TextBox ID="txtLocation" runat="server" Width="137px">ALL</asp:TextBox></td>
                    <td colspan="2" style="width: 195px">
                        <table>
                            <td class="gridcellleft" style="width: 300px; vertical-align: text-top; height: 24px;"
                                runat="server" id="td2">
                                <span class="Ecoheadtxt" style="color: Blue"><strong>UsedBy:</strong></span></td>
                            <td class="gridcellleft" style="text-align: left; height: 44px; vertical-align: top;
                                width: 158px;" id="td3">
                                <asp:TextBox ID="txtUsedBy" runat="server" Width="139px">ALL</asp:TextBox>
                            </td>
                            <td style="height: 44px; vertical-align: text-top; text-align: left; width: 102px;">
                                <dxe:ASPxButton ID="btnShow" runat="server" AutoPostBack="False" Text="Show" 
                                     Height="1px" Width="54px">
                                    <ClientSideEvents Click="function(s, e) {grid.PerformCallback();}"></ClientSideEvents>
                                </dxe:ASPxButton>
                            </td>
                        </table>
                    </td>
                    
                </tr>
                <tr id="tr4">
                    <td colspan="9">
                        <dxwgv:ASPxGridView ID="AssetDetailGrid" ClientInstanceName="grid" Width="100%" runat="server"
                            KeyFieldName="MainAccountName" 
                            AutoGenerateColumns="False" DataSourceID="AssetDetailDatasource" 
                            OnCustomCallback="AssetDetailGrid_CustomCallback" OnHtmlEditFormCreated="AssetDetailGrid_HtmlEditFormCreated" OnHtmlRowCreated="AssetDetailGrid_HtmlRowCreated" OnRowInserting="AssetDetailGrid_RowInserting" OnHtmlDataCellPrepared="AssetDetailGrid_HtmlDataCellPrepared">
                            <ClientSideEvents EndCallback="function(s, e) {ShowHide(s.cpheight);
ShowHeight(s.cpHeight);}" />
                            <Templates>
                                <DetailRow>
                                    <table class="TableMain100"><tr><td class="gridcellleft">
                                    <dxwgv:ASPxGridView ID="DetailAssetGrid" runat="server" 
                                        Width="100%" KeyFieldName="AssetDetail_ID"  DataSourceID="DataSourceDetailAssetGrid"
                                        OnBeforePerformDataSelect="AssetDetailGrid_DataSelect" AutoGenerateColumns="False" OnHtmlRowCreated="DetailAssetGrid_HtmlRowCreated" OnHtmlDataCellPrepared="DetailAssetGrid_HtmlDataCellPrepared">
                                        <Styles  >
                                        </Styles>
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn FieldName="SubAccountCode" Caption="SubItems" VisibleIndex="0">
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="OpeningBalance" Caption="Opening Balance"
                                                VisibleIndex="1">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Additions" Caption="Additions" VisibleIndex="2">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Disposals" Caption="Disposals" VisibleIndex="3">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Depreciation" Caption="Depreciation" VisibleIndex="4">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="CostPrice" Caption="Cost Price" VisibleIndex="5">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="NetValue" Caption="NetValue" VisibleIndex="6">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="CustomerName" Caption="User" VisibleIndex="7" Visible="False">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Desciption" Caption="Location" VisibleIndex="7" Visible="False">
                                                <CellStyle CssClass="gridcellright">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="#" VisibleIndex="7">
                                                <DataItemTemplate>
                                                <a href="javascript:void(0);">History</a>
                                                <%--<a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                                    History</a>--%>
                                                 </DataItemTemplate>
                                            <EditFormSettings Visible="False" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                               
                                            </dxwgv:GridViewDataTextColumn>
                                                                                       
                                        </Columns>
                                    </dxwgv:ASPxGridView>
                                    </table>
                                </DetailRow>
                            </Templates>
                            <SettingsBehavior ConfirmDelete="True" />
                            <Styles  >
                            </Styles>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Asset A/C" FieldName="MainAccountName" VisibleIndex="0"
                                    Width="40%">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <PropertiesTextEdit Width="90px">
                                    </PropertiesTextEdit>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="B/F Value" FieldName="OpeningBalance" UnboundType="Decimal"
                                    VisibleIndex="1" Width="15%">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <PropertiesTextEdit DisplayFormatString="{0:N2}" Width="90px">
                                        <MaskSettings Mask="0,00,000..9,99,999" />
                                    </PropertiesTextEdit>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Addition" FieldName="Additions" VisibleIndex="2"
                                    Width="15%">
                                    <CellStyle CssClass="gridcellright">
                                    </CellStyle>
                                    <PropertiesTextEdit DisplayFormatString="{0:N2}" Width="90px">
                                        <MaskSettings IncludeLiterals="DecimalSymbol" Mask="$&lt;0..99999g&gt;.&lt;00..99&gt;" />
                                    </PropertiesTextEdit>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Disposal" FieldName="Disposals" UnboundType="Decimal"
                                    VisibleIndex="4" Width="15%">
                                    <CellStyle CssClass="gridcellright">
                                    </CellStyle>
                                    <PropertiesTextEdit DisplayFormatString="{0:N2}" EnableClientSideAPI="True" Width="90px">
                                        <MaskSettings IncludeLiterals="DecimalSymbol" />
                                    </PropertiesTextEdit>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Depreciation" FieldName="Depreciation" VisibleIndex="3"
                                    Width="15%">
                                    <CellStyle CssClass="gridcellright">
                                    </CellStyle>
                                    <PropertiesTextEdit DisplayFormatString="{0:N2}" Width="90px">
                                    </PropertiesTextEdit>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Net Value" FieldName="NetValue" VisibleIndex="5">
                                    <PropertiesTextEdit DisplayFormatString="{0:N2}">
                                        <MaskSettings Mask="$&lt;0..99999g&gt;.&lt;00..99&gt;" />
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="OriginalCost" FieldName="CostPrice" VisibleIndex="6">
                                    <PropertiesTextEdit DisplayFormatString="{0:N2}">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <Settings ShowFooter="True" />
                            <SettingsDetail ShowDetailRow="True" />
                        </dxwgv:ASPxGridView>
                        <asp:SqlDataSource ID="DatasourceAssetSub" runat="server" ConflictDetection="CompareAllValues"
                            ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="DatasourceAssetMain" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="Select M.MainAccount_SubLedgerType,S.SubAccount_MainAcReferenceID,S.SubAccount_Code from Master_SubAccount S,Master_MainAccount M where M.MainAccount_SubLedgerType='Custom' And S.SubAccount_MainAcReferenceID=M.MainAccount_AccountCode">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="DatasourceFinancialYear" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="SELECT [FinYear_ID], [FinYear_Code] FROM [Master_FinYear] Order By FinYear_Code Desc ">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="AssetDetailDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="DataSourceDetailAssetGrid" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand=""></asp:SqlDataSource>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="display: none">
                        <asp:TextBox ID="txtLocation_hidden" runat="server" Visible="true"></asp:TextBox>
                        <asp:TextBox ID="txtUsedBy_hidden" runat="server" Visible="true"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <div style="text-align: right">
                &nbsp;</div>
        </div>
    </form>
</body>
</html>
