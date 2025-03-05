<%@ page language="C#" autoeventwireup="true" inherits="management_subbrkgsetup3, App_Web_zsukfi_p" %>

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
      var str='subbrkgsetup4.aspx?brkgmainid='+keyValue+' &clientid='+document.getElementById('ASPxPageControl1_hddnclientid').value+' &clientname='+document.getElementById('ASPxPageControl1_hddnclientname').value+' &Addurl='+document.getElementById('ASPxPageControl1_hddnaddurl').value+' &comcalbasis='+ddlcalbasis.GetValue()+' &mode='+'Edit';
      frmOpenNewWindow1(str,250,850);
   }
    
  function OnAddButtonClick() 
    {  
      if(document.getElementById("ASPxPageControl1_hddnbrkmaingid").value=='')
      {
       alert("First Add Sub-Brokerage Main Details");
      }
      else
      {
          var str='subbrkgsetup4.aspx?brkgmainid='+document.getElementById("ASPxPageControl1_hddnbrkmaingid").value+' &clientid='+document.getElementById('ASPxPageControl1_hddnclientid').value+' &clientname='+document.getElementById('ASPxPageControl1_hddnclientname').value+' &Addurl='+document.getElementById('ASPxPageControl1_hddnaddurl').value+' &comcalbasis='+ddlcalbasis.GetValue()+' &mode='+'Add';
          frmOpenNewWindow1(str,250,850);
      }
    }
   function frmOpenNewWindow1(location,v_height,v_weight)
    {
        var y=(screen.availHeight-v_height)/2;
        var x=(screen.availWidth-v_weight)/2;
        window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=yes,resizable=no,dependent=no");       
    }
   function noNumbers(e)
    {
        var keynum
        var keychar
        var numcheck
        
        if(window.event)//IE
        {
            keynum = e.keyCode                        
            if(keynum>=48 && keynum<=57 || keynum==46)
                 {
                  return true;
                 }
                 else
                {
                 alert("Please Insert Numeric Only");
                 return false;
                }
         } 
         
          else if(e.which) // Netscape/Firefox/Opera
       {
           keynum = e.which  
           
           if(keynum>=48 && keynum<=57 || keynum==46)
                 {
                  return true;
                 }
                 else
                 {
                 alert("Please Insert Numeric Only");
                 return false;
                 }     
        }
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
<dxw:ContentControl runat="server"><TABLE class="TableMain100"><TBODY><TR vAlign=top><TD><TABLE style="BACKGROUND-COLOR: #fff3df" width="50%"><TBODY><TR><TD style="TEXT-ALIGN: left" class="Ecoheadtxt"><asp:HiddenField runat="server" ID="hddnclientid"></asp:HiddenField>
 <asp:HiddenField runat="server" ID="hddnbrkmaingid"></asp:HiddenField>
 <asp:HiddenField runat="server" ID="hddnaddurl"></asp:HiddenField>
  <asp:HiddenField runat="server" ID="hddnclientname"></asp:HiddenField>
 <dxe:ASPxLabel runat="server" Text="Sub-Brkg SetUp Of:" Width="120px" ID="lbl1"></dxe:ASPxLabel>
 </TD><TD style="TEXT-ALIGN: left" class="Ecoheadtxt"><asp:Label runat="server" Font-Size="X-Small" Width="270px" ForeColor="Brown" ID="lblName"></asp:Label>
 </TD><TD style="TEXT-ALIGN: left" class="Ecoheadtxt"><dxe:ASPxLabel runat="server" Text="In:" ID="lbl2"></dxe:ASPxLabel>
 </TD><TD style="TEXT-ALIGN: left" class="Ecoheadtxt"><asp:Label runat="server" Font-Size="X-Small" Width="325px" ForeColor="Brown" ID="lblCompSegmentName"></asp:Label>
 </TD><TD style="TEXT-ALIGN: left" class="Ecoheadtxt"><dxe:ASPxLabel runat="server" Text="Date:" ID="lbl3"></dxe:ASPxLabel>
 </TD><TD style="TEXT-ALIGN: left" class="Ecoheadtxt"><dxe:ASPxDateEdit runat="server" Width="150px" EditFormat="Custom" ID="Dateedit" DateOnError="Today" UseMaskBehavior="True">
<ButtonStyle Width="13px"></ButtonStyle>
</dxe:ASPxDateEdit>
 </TD></TR></TBODY></TABLE></TD></TR><TR vAlign=top><TD><TABLE style="Z-INDEX: 101; WIDTH: 100px"><TBODY><TR><TD style="TEXT-ALIGN: left" class="Ecoheadtxt" colSpan=2><dxe:ASPxLabel runat="server" Text="Comm. Calculation Basis:" Width="200px" ID="lbl4"></dxe:ASPxLabel>
 </TD><TD style="PADDING-LEFT: 5px; TEXT-ALIGN: left" class="Ecoheadtxt" colSpan=3><dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False" Width="250px" ID="ddlcalbasis" ClientInstanceName="ddlcalbasis" ValueType="System.String" EnableIncrementalFiltering="True"><Items>
<dxe:ListEditItem Value="2" Text="Share(%) Of Brokerage For Sub-Broker"></dxe:ListEditItem>
<dxe:ListEditItem Value="1" Text="Rate(%) Of Market Price For Broker"></dxe:ListEditItem>
<dxe:ListEditItem Value="3" Text="Rate(%) Of Market Price For Sub-Broker"></dxe:ListEditItem>

</Items>
</dxe:ASPxComboBox>
 </TD><TD style="TEXT-ALIGN: left" class="Ecoheadtxt" colSpan=2><dxe:ASPxLabel runat="server" Text="Minimum Monthly Commitment: " Width="200px" ID="lbl5"></dxe:ASPxLabel>
 </TD><TD style="PADDING-LEFT: 5px; TEXT-ALIGN: left" class="Ecoheadtxt" colSpan=2><dxe:ASPxTextBox runat="server" Width="100px" ID="txtminmoncomm" onkeypress="return noNumbers(event)">
<MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..999999g&gt;.&lt;00..99&gt;"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD></TR><TR vAlign=top><TD style="TEXT-ALIGN: left" class="Ecoheadtxt" colSpan=2><dxe:ASPxLabel runat="server" Text="Comm Decimals:" Width="200px" ID="lbl6"></dxe:ASPxLabel>
 </TD><TD style="PADDING-LEFT: 5px; TEXT-ALIGN: left" class="Ecoheadtxt" colSpan=3><dxe:ASPxSpinEdit runat="server" MaxValue="6" ID="txtcommdecimal" Width="50px" Number="2" NumberType="Integer"></dxe:ASPxSpinEdit>
 </TD><TD style="TEXT-ALIGN: left" class="Ecoheadtxt" colSpan=2><dxe:ASPxLabel runat="server" Text="Comm. Round Pattern:" Width="200px" ID="lbl7"></dxe:ASPxLabel>
 </TD><TD style="PADDING-LEFT: 5px; TEXT-ALIGN: left" class="Ecoheadtxt" colSpan=2><dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False" Width="100px" ID="ddlcomroundpattern" ValueType="System.String" ClientInstanceName="ddlcomroundpattern" EnableIncrementalFiltering="True"><Items>
<dxe:ListEditItem Value="1" Text="Nearest"></dxe:ListEditItem>
<dxe:ListEditItem Value="2" Text="Higher"></dxe:ListEditItem>
<dxe:ListEditItem Value="3" Text="Lower"></dxe:ListEditItem>
<dxe:ListEditItem Value="4" Text="Truncate"></dxe:ListEditItem>
</Items>
</dxe:ASPxComboBox>
 </TD></TR><TR vAlign=top><TD style="TEXT-ALIGN: left" class="Ecoheadtxt" colSpan=2><dxe:ASPxLabel runat="server" Text="Per Contract Min Brokerage:" Width="200px" ID="lbl8"></dxe:ASPxLabel>
 </TD><TD style="PADDING-LEFT: 5px; TEXT-ALIGN: left" class="Ecoheadtxt" colSpan=3><dxe:ASPxTextBox runat="server" Width="100px" ID="txtcntperbrkg" onkeypress="return noNumbers(event)">
<MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..999999999999g&gt;.&lt;00..99&gt;"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD><TD style="TEXT-ALIGN: left" class="Ecoheadtxt" colSpan=2><dxe:ASPxLabel runat="server" Text="Per Order Min Brokerage:" Width="200px" ID="lbl9"></dxe:ASPxLabel>
 </TD><TD style="PADDING-LEFT: 5px; TEXT-ALIGN: left" class="Ecoheadtxt" colSpan=2><dxe:ASPxTextBox runat="server" Width="100px" ID="txtperorderbrkg" onkeypress="return noNumbers(event)">
<MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..999999999999g&gt;.&lt;00..99&gt;"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD></TR><TR vAlign=top><TD style="TEXT-ALIGN: left" class="Ecoheadtxt" colSpan=2><dxe:ASPxLabel runat="server" Text="Per Share Min Delivery Brokerage :" Width="250px" ID="lbl10"></dxe:ASPxLabel>
 </TD><TD style="PADDING-LEFT: 5px; TEXT-ALIGN: left" class="Ecoheadtxt" colSpan=3><dxe:ASPxTextBox runat="server" Width="100px" ID="txtpershrmindlvbrkg" onkeypress="return noNumbers(event)">
<MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..9999g&gt;.&lt;00..99&gt;"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD><TD style="TEXT-ALIGN: left" class="Ecoheadtxt" colSpan=2><dxe:ASPxLabel runat="server" Text="Per Share Min Square-Off Brokerage :" Width="250px" ID="lbl11"></dxe:ASPxLabel>
 </TD><TD style="PADDING-LEFT: 5px; TEXT-ALIGN: left" class="Ecoheadtxt" colSpan=2><dxe:ASPxTextBox runat="server" Width="100px" ID="txtpershrminsqrbrkg" onkeypress="return noNumbers(event)">
<MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..9999g&gt;.&lt;00..99&gt;"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD></TR><TR><TD style="TEXT-ALIGN: right" colSpan=10><asp:Button runat="server" ID="btnSave" Width="44px" CssClass="btnUpdate" Text="Save" Height="23px" OnClientClick="return aa();" style="CURSOR: pointer" OnClick="btnSave_Click"></asp:Button>
 <asp:Button runat="server" ID="btnCancel" CssClass="btnUpdate" Text="Cancel" Height="23px" OnClick="btnCancel_Click"></asp:Button>
 </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><TABLE class="TableMain100"><TBODY><TR><TD><dxwgv:ASPxGridView runat="server" Width="100%" ID="BrokerageDetailGrid" DataSourceID="BrokerageDetailDataSource" KeyFieldName="subBrokerageDetail_ID" AutoGenerateColumns="False" ClientInstanceName="grid" OnCustomCallback="BrokerageDetailGrid_CustomCallback" OnRowDeleting="BrokerageDetailGrid_RowDeleting">
<Templates><EditForm>
                        
</EditForm>
<TitlePanel>

                        
</TitlePanel>
</Templates>

<SettingsEditing EditFormColumnCount="3" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True" PopupEditFormWidth="900px" PopupEditFormVerticalAlign="WindowCenter" Mode="PopupEditForm"></SettingsEditing>

<SettingsText PopupEditFormCaption="Add/ Modify Employee"></SettingsText>

<Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>
</Styles>

<Settings ShowGroupButtons="False" ShowVerticalScrollBar="True" ShowStatusBar="Visible" VerticalScrollableHeight="100" VerticalScrollBarStyle="Virtual"></Settings>

<SettingsBehavior ConfirmDelete="True" ColumnResizeMode="NextColumn" AllowFocusedRow="True"></SettingsBehavior>

<SettingsPager AlwaysShowPager="True" PageSize="20" NumericButtonCount="20" ShowSeparators="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
<Columns>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="subBrokerageDetail_ID" Caption="ID">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="subBrokerageDetail_BrkgType" Caption="Sub-Brkg Type">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="subBrokerageDetail_TranType" Width="12%" Caption="Transaction Type">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="subBrokerageDetail_appfor" Width="20%" Caption="App. For">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>


<dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="subBrokerageDetail_Rate" Width="10%" Caption="Rate">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="subBrokerageDetail_MinAmount" Width="10%" Caption="Min Amt">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="subBrokerageDetail_FlateRate" Width="10%" Caption="Flat Amt">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

</dxwgv:GridViewDataTextColumn>


<dxwgv:GridViewDataTextColumn VisibleIndex="6" Width="5%" Caption="Details">
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
<DataItemTemplate>
                                <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                    More Info...</a>
                            
</DataItemTemplate>

<CellStyle Wrap="False"></CellStyle>
<HeaderTemplate>
                        
                      
                            <a href="javascript:void(0);" onclick="OnAddButtonClick( )">
                              <span style="color: #000099; text-decoration: underline">Add Detail</span>
                            </a>
                          
                        
</HeaderTemplate>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="9" Caption="Delete">
<DeleteButton Visible="True"></DeleteButton>
</dxwgv:GridViewCommandColumn>
</Columns>
</dxwgv:ASPxGridView>
 </TD></TR><asp:SqlDataSource runat="server" ID="BrokerageDetailDataSource" DeleteCommandType="StoredProcedure"  ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
</asp:SqlDataSource>
</TBODY></TABLE></dxw:ContentControl>
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
       <%--<table>
           <tr>
               <td class="gridcellright" id="tdshow" runat="server" align="left" style="display: none;">
                   <dxe:ASPxButton ID="btnShow" runat="server" Text="Show" AutoPostBack="False" >
                       <clientsideevents click="function(s, e) {
	grid.PerformCallback();
}"></clientsideevents>
                   </dxe:ASPxButton></td>
           </tr>
       </table>--%>
    </form>
</body>
</html>