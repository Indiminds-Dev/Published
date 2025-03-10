<%@ page language="C#" autoeventwireup="true" inherits="management_ArbGroupMembers, App_Web_udicbieo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Global Settings</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

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
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and 

.optionDivSelected */
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
    FieldName='btnCancel';
    
    function ShowHideFilter(obj)
    {
       grid.PerformCallback(obj);
    } 
    function OnAddEditClick(e,obj)
    {
        var data=obj.split('~');
        document.getElementById("txt_hidden").value=data[0];
        popup.Show();
        popPanel.PerformCallback(obj+'~NA');
    }
    function OnDeleteClick(e,obj)
    {
    
        if(confirm('Are You Sure You Want To Delete?')==true)
        {
            grid.PerformCallback(obj);
        }
    }
    function btnSave_Click()
    {
        popPanel.PerformCallback("Save~"+document.getElementById("txt_hidden").value);
       
    }
    function EndCallBack(obj)
    {
        var j=obj.split('~');
        if(j[0]=='N')
        {
           popup.Hide();
           grid.PerformCallback();
        }
        else if(j[0]=='A')
        {
           popup.Hide();
           grid.PerformCallback();
           alert('You are Not Allowed !');
        }
        else if(j[0]=='G')
        {
          
           popup.Hide();
           grid.PerformCallback();
           alert('This Client Already Belongs To ' +j[1]+ ' For This Date !!');
        }
        else if(j[0]=='C')
        {
           popup.Hide();
           grid.PerformCallback();
           alert('From Date Can only be the first Date of any Arbitrage Settlement Cycle !!');
        }
    }
  
   function btnCancel_Click()
    {
        popup.Hide();
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
            <table class="TableMain100">
               
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td id="Td1" align="left">
                                    <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                        Show Filter</span></a> || <a href="javascript:ShowHideFilter('All');"><span style="color: #000099;
                                            text-decoration: underline">All Records</span></a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="GridArbGroupMembers" ClientInstanceName="grid" Width="100%" KeyFieldName="ArbGroupMembers_ID"
                            DataSourceID="ArbGroupMembers" runat="server" AutoGenerateColumns="False" OnCustomCallback="GridArbGroupMembers_CustomCallback"
                           >
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                            <Styles>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <FocusedRow BackColor="#FEC6AB">
                                </FocusedRow>
                            </Styles>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Visible="False" FieldName="ArbGroupMembers_ID" Caption="ID">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="ClientName" Caption="Client Name">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="ArbGroupMembers_Deposits" Caption="Deposits">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                 <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="ArbGroupMembers_FixedCostPerCycle" Caption="Fixed Cost">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                 <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="ArbGroupMembers_ProfitShareSlab" Caption="Profit Share Slab">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                 <dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="ArbGroupMembers_LossShareSlab" Caption="Loss Share Slab">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                 <dxwgv:GridViewDataTextColumn VisibleIndex="6" FieldName="ArbGroupMembers_DateFrom" Caption="From Date">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                 <dxwgv:GridViewDataTextColumn VisibleIndex="7" FieldName="ArbGroupMembers_DateTo" Caption="To Date">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="8">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnAddEditClick(this,'Show~'+'<%# Container.KeyValue %>')">
                                            <u>Edit</u> </a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="OnDeleteClick(this,'Delete~'+'<%# Container.KeyValue %>')">
                                                <u>Delete</u> </a>
                                    </DataItemTemplate>
                                    <EditFormSettings Visible="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="OnAddEditClick(this,'AddNew')"><u>Add New</u>
                                        </a>
                                    </HeaderTemplate>
                                    <HeaderStyle Wrap="False" />
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                            <SettingsBehavior AllowFocusedRow="True" AllowSort="False" AllowMultiSelection="True" />
                            <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True"
                                PageSize="15">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <SettingsText Title="Template" />
                            <Settings ShowGroupedColumns="True" ShowGroupPanel="True" />
                        </dxwgv:ASPxGridView>
                        <asp:SqlDataSource ID="ArbGroupMembers" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand=""></asp:SqlDataSource>
                            
                        
                    </td>
                </tr>
                <tr>
                    <td style="width:50%">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" >
                            <ContentTemplate>
                                <dxpc:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="popup" runat="server"
                                    AllowDragging="True" PopupHorizontalAlign="OutsideRight" HeaderText="Arbitrage Group Members"
                                    EnableHotTrack="False" BackColor="#DDECFE" Width="400px" CloseAction="CloseButton">
                                    <contentcollection>
                                        <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                                            <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="400px" ClientInstanceName="popPanel"
                                                OnCallback="ASPxCallbackPanel1_Callback" OnCustomJSProperties="ASPxCallbackPanel1_CustomJSProperties">
                                                <PanelCollection>
                                                    <dxp:PanelContent runat="server">
                                                        <table class="TableMain100" width="80%" border="10" cellpadding="1" cellspacing="1">
                <tr valign="top">
                    <td class="gridcellleft" bgcolor="#B7CEEC">
                        Client Name:
                    </td>
                    <td>
                        <asp:TextBox ID="txtClient" runat="server" Width="250px" Font-Size="12px" onkeyup="ajax_showOptions(this,'Arbclient',event,'Clients')"></asp:TextBox>
                    </td>
                    <td style="display: none;"><asp:TextBox ID="txtArbGroupMembersId" runat="server" Width="5px"></asp:TextBox>
                        <asp:TextBox ID="txtClient_hidden" runat="server" Width="5px"></asp:TextBox></td>
                   
                </tr>
                <tr> <td class="gridcellleft" bgcolor="#B7CEEC">
                        Total Deposit :
                    </td>
                    <td colspan="2">
                        <dxe:ASPxTextBox ID="Txt_Deposit" runat="server" HorizontalAlign="Right" Width="100px">
                            <masksettings mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" includeliterals="DecimalSymbol" />
                            <validationsettings errordisplaymode="None">
                                    </validationsettings>
                        </dxe:ASPxTextBox>
                    </td></tr>
                     <tr> <td class="gridcellleft" bgcolor="#B7CEEC">
                        Fixed Cost Per Cycle :
                    </td>
                    <td colspan="2">
                        <dxe:ASPxTextBox ID="Txt_FixedCostPerCycle" runat="server" HorizontalAlign="Right" Width="100px">
                            <masksettings mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" includeliterals="DecimalSymbol" />
                            <validationsettings errordisplaymode="None">
                                    </validationsettings>
                        </dxe:ASPxTextBox>
                    </td></tr>
                <tr valign="top">
                    <td class="gridcellleft" bgcolor="#B7CEEC">
                        Profit Share Slab :</td>
                    <td style="text-align: left;" colspan="2">
                        <dxe:ASPxComboBox ID="ComboProfitShareSlab" ClientInstanceName="ComboProfitShareSlab"
                            runat="server" ValueType="System.String" DataSourceID="SqlProfitShareSlab" ValueField="PLSlab_Code"
                            TextField="PLSlab_Code" EnableIncrementalFiltering="true" Width="203px">
                        </dxe:ASPxComboBox>
                    </td>
                  
                </tr>
                <tr>  <td class="gridcellleft" bgcolor="#B7CEEC">
                        Loss Share Slab :</td>
                    <td style="text-align: left;" colspan="2">
                        <dxe:ASPxComboBox ID="ComboLossShareSlab" ClientInstanceName="ComboLossShareSlab"
                            runat="server" ValueType="System.String" DataSourceID="SqlLossShareSlab" ValueField="PLSlab_Code"
                            TextField="PLSlab_Code" EnableIncrementalFiltering="true" Width="203px">
                        </dxe:ASPxComboBox>
                    </td></tr>
                <tr valign="top" id="Tr_Date" runat="server">
                    <td class="gridcellleft" bgcolor="#B7CEEC">
                        From Date :</td>
                    <td colspan="2" >
                        <dxe:ASPxDateEdit ID="DtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                            Font-Size="10px" Width="108px" ClientInstanceName="DtFrom">
                            <dropdownbutton text="From">
                                                    </dropdownbutton>
                        </dxe:ASPxDateEdit>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="gridcellleft" colspan="2">
                        <input id="Button1" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()" />
                        <input id="Button2" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_Click()" />
                    </td>
                    
                </tr>
            </table>
                                                    </dxp:PanelContent>
                                                </PanelCollection>
                                                <ClientSideEvents EndCallback="function(s, e) {
	                                                    EndCallBack(s.cpLast);
                                                    }" />
                                            </dxcp:ASPxCallbackPanel>
                                        </dxpc:PopupControlContentControl>
                                    </contentcollection>
                                    <headerstyle horizontalalign="Left">
                                        <Paddings PaddingRight="6px" />
                                    </headerstyle>
                                    <sizegripimage height="16px" width="16px" />
                                    <closebuttonimage height="12px" width="13px" />
                                    <clientsideevents closebuttonclick="function(s, e) {
	                                            popup.Hide();
                                    }" />
                                </dxpc:ASPxPopupControl>
                                
                                <asp:SqlDataSource ID="SqlProfitShareSlab" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="Select 'As Per Group' as PLSlab_Code Union All select distinct PLSlab_Code From Master_PLSlab where PLSlab_Type='P'">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlLossShareSlab" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="Select 'As Per Group' as PLSlab_Code Union All select distinct PLSlab_Code From Master_PLSlab where PLSlab_Type='L'">
        </asp:SqlDataSource>
                            </ContentTemplate>
                            <Triggers>
                                <%--    <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>--%>
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td style="display: none;">
                        <asp:TextBox ID="txt_hidden" runat="server" Width="5px"></asp:TextBox>
                        </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
