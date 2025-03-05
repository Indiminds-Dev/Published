<%@ page language="C#" autoeventwireup="true" inherits="management_CfSettingsMain, App_Web_yq8u0p-o" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
 
    <!--___________________These files are for List Items__________________________-->

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <!--___________________________________________________________________________-->
    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	    /* Never change this one */
		width:50px;	        /* Width of box */
		height:auto;	        /* Height of box */
		overflow:auto;	        /* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:100;
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
		z-index:900;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:10;
	}
	
	form{
		display:inline;
	}
	
	</style>
    <style type="text/css">
       a:hover {background:#ffffff; text-decoration:none;} /*BG color is a must for IE6*/
       a.tooltip span {display:none; padding:2px 3px; font-size:smaller; margin-left:1px; width:100px;}
       a.tooltip:hover span{display:inline; position:horizontal; background:#ffffff; border:1px solid #cccccc; color:#6c6c6c; width:100px}
    
    </style>
      <script language="javascript" type="text/javascript">
  function SignOff()
    {
        window.parent.SignOff();
    }
 
function PopulateGrid()
 {
   grid.PerformCallback();
 }
   
  function OnMoreInfoClick(keyValue)
   {
      var str='CfSettingsDetail.aspx?cfmainid='+keyValue+' &clientid='+document.getElementById('ASPxPageControl1_hddnclientid').value+' &clientname='+document.getElementById('ASPxPageControl1_hddnclientname').value+' &Addurl='+document.getElementById('ASPxPageControl1_hddnaddurl').value+' &mode='+'Edit';
      frmOpenNewWindow1(str,200,550);
   }
    
  function OnAddButtonClick() 
    {  
      if(document.getElementById("ASPxPageControl1_hddncfid").value=='')
      {
       alert("First Add CF-Settings Main Details");
      }
      else
      {
          var str='CfSettingsDetail.aspx?cfmainid='+document.getElementById("ASPxPageControl1_hddncfid").value+' &clientid='+document.getElementById('ASPxPageControl1_hddnclientid').value+' &clientname='+document.getElementById('ASPxPageControl1_hddnclientname').value+' &Addurl='+document.getElementById('ASPxPageControl1_hddnaddurl').value+' &mode='+'Add';
          frmOpenNewWindow1(str,200,550);
      }
    }
   function frmOpenNewWindow1(location,v_height,v_weight)
    {
        var y=(screen.availHeight-v_height)/2;
        var x=(screen.availWidth-v_weight)/2;
        window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=yes,resizable=no,dependent=no");       
    }
 

    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
   <form id="form1" runat="server" autocomplete="off" >
        <div>
            <table class="TableMain100" >
                <tr>
                    <td >
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="page"
                            Width="100%">
                            <tabpages>
<dxtc:TabPage Name="General" Text="General"><ContentCollection>
    <dxw:ContentControl runat="server">
        <table class="TableMain100">
            <tbody>
                <tr valign="top">
                    <td>
                        <table style="background-color: #fff3df" width="50%">
                            <tbody>
                               
                              
                                <tr>
                                    <td style="text-align: left" class="Ecoheadtxt">
                                        <dxe:ASPxLabel runat="server" Text="CF-Settings Of:" Width="150px" ID="lbl1">
                                        </dxe:ASPxLabel>
                                    </td>
                                    <td style="text-align: left" class="Ecoheadtxt">
                                        <asp:Label runat="server" Font-Size="X-Small" Width="150px" ForeColor="Brown" ID="lblName"></asp:Label>
                                    </td>
                                    <td style="text-align: left" class="Ecoheadtxt">
                                        <dxe:ASPxLabel runat="server" Text="In:" ID="lbl2">
                                        </dxe:ASPxLabel>
                                    </td>
                                    <td style="text-align: left" class="Ecoheadtxt">
                                        <asp:Label runat="server" Font-Size="X-Small" Width="250px" ForeColor="Brown" ID="lblCompSegmentName"></asp:Label>
                                    </td>
                                    <td style="text-align: left" class="Ecoheadtxt">
                                        <dxe:ASPxLabel runat="server" Text="Date:" ID="lbl3">
                                        </dxe:ASPxLabel>
                                    </td>
                                    <td style="text-align: left" class="Ecoheadtxt">
                                        <dxe:ASPxDateEdit runat="server" Width="150px" EditFormat="Custom" ID="Dateedit"
                                            DateOnError="Today" UseMaskBehavior="True">
                                            <buttonstyle width="13px"></buttonstyle>
                                        </dxe:ASPxDateEdit>
                                    </td>
                                </tr>
                              
                                <tr style="display: none;">
                                    <td>
                                        <asp:HiddenField runat="server" ID="hddnclientid"></asp:HiddenField>
                                         <asp:HiddenField runat="server" ID="hddncfid"></asp:HiddenField>
                                <asp:HiddenField runat="server" ID="hddnaddurl"></asp:HiddenField>
                                <asp:HiddenField runat="server" ID="hddnclientname"></asp:HiddenField>
                              
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr valign="top">
                    <td>
                        <table style="z-index: 101; width: 100px">
                            <tbody>
                                <tr>
                                    <td style="text-align: left" class="Ecoheadtxt">
                                        <dxe:ASPxLabel runat="server" Text="Mode:" Width="50px" ID="lbl_Mode">
                                        </dxe:ASPxLabel>
                                    </td>
                                    <td style="padding-left: 5px; text-align: left" class="Ecoheadtxt">
                                        <dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False"
                                            Width="120px" ID="ddlMode" ClientInstanceName="ddlMode" ValueType="System.String"
                                            EnableIncrementalFiltering="True">
                                            <items>
<dxe:ListEditItem Text="Daily" Value="1"></dxe:ListEditItem>
<dxe:ListEditItem Text="Weekly" Value="2"></dxe:ListEditItem>
<%--<dxe:ListEditItem Text="Fortnightly" Value="3"></dxe:ListEditItem>--%>
<dxe:ListEditItem Text="Monthly" Value="4"></dxe:ListEditItem>
</items>
                                        </dxe:ASPxComboBox>
                                    </td>
                                     <td style="text-align: left" class="Ecoheadtxt">
                                        <dxe:ASPxLabel runat="server" Text="PositionType:" Width="100px" ID="lbl_PositionType">
                                        </dxe:ASPxLabel>
                                    </td>
                                    <td style="padding-left: 5px; text-align: left" class="Ecoheadtxt">
                                        <dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False"
                                            Width="200px" ID="ddlpositiontype" ValueType="System.String" ClientInstanceName="ddlpositiontype"
                                            EnableIncrementalFiltering="True">
                                            <items>
<dxe:ListEditItem Text="Only Purchases" Value="1"></dxe:ListEditItem>
<%--<dxe:ListEditItem Text="Only Sales" Value="2"></dxe:ListEditItem>
<dxe:ListEditItem Text="Both" Value="3"></dxe:ListEditItem>--%>
</items>
                                        </dxe:ASPxComboBox>
                                    </td>
                                   
                                </tr>
                                  <tr valign="top">
                                    <td style="text-align: left" class="Ecoheadtxt">
                                        <dxe:ASPxLabel runat="server" Text="Decimals:" Width="200px" ID="lbl6">
                                        </dxe:ASPxLabel>
                                    </td>
                                    <td style="padding-left: 5px; text-align: left" class="Ecoheadtxt">
                                        <dxe:ASPxSpinEdit runat="server" MaxValue="6" ID="txtcommdecimal" Width="50px" Number="2"
                                            NumberType="Integer">
                                        </dxe:ASPxSpinEdit>
                                    </td>
                                    <td style="text-align: left" class="Ecoheadtxt">
                                        <dxe:ASPxLabel runat="server" Text="Round Pattern:" Width="200px" ID="lbl7">
                                        </dxe:ASPxLabel>
                                    </td>
                                      <td style="padding-left: 5px; text-align: left" class="Ecoheadtxt">
                                          <dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False"
                                              Width="100px" ID="ddlcomroundpattern" ValueType="System.String" ClientInstanceName="ddlcomroundpattern"
                                              EnableIncrementalFiltering="True">
                                              <items>
<dxe:ListEditItem Value="1" Text="Nearest"></dxe:ListEditItem>
<dxe:ListEditItem Value="2" Text="Higher"></dxe:ListEditItem>
<dxe:ListEditItem Value="3" Text="Lower"></dxe:ListEditItem>
<dxe:ListEditItem Value="4" Text="Truncate"></dxe:ListEditItem>
</items>
                                          </dxe:ASPxComboBox>
                                      </td>
                                     
                                </tr>
                               <tr valign="top">
                                    <td style="text-align: left" class="Ecoheadtxt">
                                        <dxe:ASPxLabel runat="server" Text="Charge On:" Width="100px" ID="lbl_ChargeOn">
                                        </dxe:ASPxLabel>
                                    </td>
                                    <td style="padding-left: 5px; text-align: left" class="Ecoheadtxt">
                                        <dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False"
                                            Width="200px" ID="ddlChangeOn" ValueType="System.String" ClientInstanceName="ddlChangeOn"
                                            EnableIncrementalFiltering="True">
                                            <items>
<dxe:ListEditItem Text="Close Price" Value="1"></dxe:ListEditItem>
<dxe:ListEditItem Text="Cost Price" Value="2"></dxe:ListEditItem>

</items>
                                        </dxe:ASPxComboBox>
                                    </td>
                                     <td style="text-align: left" class="Ecoheadtxt">
                                        <dxe:ASPxLabel runat="server" Text="Accounting For:" Width="100px" ID="lbl_ddlMTMGenerate">
                                        </dxe:ASPxLabel>
                                    </td>
                                    <td style="padding-left: 5px; text-align: left" class="Ecoheadtxt">
                                        <dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False"
                                            Width="200px" ID="ddlmtmGenerate" ValueType="System.String" ClientInstanceName="ddlMTMGenerate"
                                            EnableIncrementalFiltering="True">
                                            <items>
<dxe:ListEditItem Text="Only MTM" Value="1"></dxe:ListEditItem>
<dxe:ListEditItem Text="Only CF-Charge" Value="2"></dxe:ListEditItem>
<dxe:ListEditItem Text="Both" Value="3"></dxe:ListEditItem>
</items>
                                        </dxe:ASPxComboBox>
                                    </td>
                                </tr>
                                 <tr valign="top">
                                    <td style="text-align: left" class="Ecoheadtxt" colspan="4">
                                       <asp:CheckBox ID="ChkPostCharges" runat="server"/>
                                                        Post Charges Along With Daily MTM
                                    </td>
                                  
                                    
                                </tr>
                                <tr>
                                    <td style="text-align: right" colspan="4">
                                        <asp:Button runat="server" ID="btnSave" Width="44px" CssClass="btnUpdate" Text="Save"
                                            Height="23px" OnClientClick="return aa();" Style="cursor: pointer" OnClick="btnSave_Click">
                                        </asp:Button>
                                        <asp:Button runat="server" ID="btnCancel" CssClass="btnUpdate" Text="Cancel" Height="23px"
                                            OnClick="btnCancel_Click"></asp:Button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
        <table class="TableMain100">
            <tbody>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView runat="server" Width="100%" ID="CFDetailGrid" DataSourceID="CFDetailDataSource"
                            KeyFieldName="ScripDetail_ID" AutoGenerateColumns="False" ClientInstanceName="grid"
                            OnCustomCallback="CFDetailGrid_CustomCallback" OnRowDeleting="CFDetailGrid_RowDeleting">
                            <columns>
<dxwgv:GridViewDataTextColumn FieldName="ScripDetail_ID" Caption="ID" Visible="False" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="AssetName" Caption="Asset" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>


<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="ScripDetail_SlabCode" Width="12%" Caption="Slab Code" VisibleIndex="1">
<EditFormSettings Visible="False"></EditFormSettings>


<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="ScripDetail_Rate" Width="20%" Caption="Rate" VisibleIndex="2">
<EditFormSettings Visible="False"></EditFormSettings>


<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Width="20%" Caption="Details" VisibleIndex="3">

<DataItemTemplate>
                                <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                    More Info...</a>
                            
</DataItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<HeaderTemplate>
                        
                      
                            <a href="javascript:void(0);" onclick="OnAddButtonClick( )">
                              <span style="color: #000099; text-decoration: underline">Add Detail</span>
                            </a>
                          
                        
</HeaderTemplate>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn Caption="Delete" VisibleIndex="4">
<DeleteButton Visible="True"></DeleteButton>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</dxwgv:GridViewCommandColumn>
</columns>
                            <settingsbehavior confirmdelete="True" columnresizemode="NextColumn" allowfocusedrow="True"></settingsbehavior>
                            <settingspager alwaysshowpager="True" pagesize="20" numericbuttoncount="20" showseparators="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</settingspager>
                            <settingsediting editformcolumncount="3" popupeditformhorizontalalign="Center" popupeditformmodal="True"
                                popupeditformwidth="900px" popupeditformverticalalign="WindowCenter" mode="PopupEditForm"></settingsediting>
                            <settings showgroupbuttons="False" showverticalscrollbar="True" showstatusbar="Visible"
                                verticalscrollableheight="100" verticalscrollbarstyle="Virtual"></settings>
                            <settingstext popupeditformcaption="Add/ Modify Employee"></settingstext>
                            <styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</styles>
                            <templates><TitlePanel>

                        
</TitlePanel>
<EditForm>
                        
</EditForm>
</templates>
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
                <asp:SqlDataSource runat="server" ID="CFDetailDataSource" DeleteCommandType="StoredProcedure"
                    ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"></asp:SqlDataSource>
            </tbody>
        </table>
    </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
</tabpages>
                            <contentstyle>
                        <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                    </contentstyle>
                            <loadingpanelstyle imagespacing="6px">
                    </loadingpanelstyle>
                        </dxtc:ASPxPageControl>
                    </td>
         </tr>
         </table>
        </div>
        <%-- BeginRegion DataSources --%>
        <asp:SqlDataSource ID="AccessDataSourceCompany" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT cmp_internalid,cmp_Name FROM [tbl_master_company]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="AccessDataSourcesegment" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT MCE.exch_internalId, (ME.exh_shortName+'_'+ MCE.exch_segmentId)as segment_name FROM [tbl_master_exchange]ME
         left outer join [tbl_master_companyExchange]as MCE on MCE.exch_exchId=ME.exh_cntId WHERE ( MCE.exch_compId=@CompId) ">
            <SelectParameters>
                <asp:Parameter Name="CompId" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>

        <%-- End of Region --%>
     
    </form>
</body>
</html>
