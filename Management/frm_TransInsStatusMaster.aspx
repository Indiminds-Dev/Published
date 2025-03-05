<%@ page language="C#" autoeventwireup="true" inherits="management_frm_TransInsStatusMaster, App_Web_fxnvzv_8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
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

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

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
  function DeleteRow(keyValue)
    {
             doIt=confirm('Are You Want To Delete This Record ???');
            if(doIt)
                {
                   grid.PerformCallback(keyValue);
                   height();
                }
            else{
                  
                }

   
    }
   function OnMoreInfoClick(keyValue)
    {
      var dat=document.getElementById('dtTo_hidden').value;
       var url='frmClosingRatesAdd.aspx?id='+ keyValue +'&dtfor='+ dat;
       parent.OnMoreInfoClick(url,"Edit Closing Rates",'700px','350px',"Y");
   
    }
    function ShowHideFilter(obj)
    {
           grid.PerformCallback(obj);
    } 
    
    
      function OnAddButtonClick() 
    {
         var url='frm_transInsAddStatus.aspx?id=ADD';
         parent.OnMoreInfoClick(url,"Add New Status",'700px','350px',"Y");
    }
      function callback()
    {
       grid.PerformCallback();
        height();
    }  
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
             <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Transaction Status</span></strong>
                    </td>
                </tr>
                <tr>
                <table>
                  <tr>
                                                    <td id="Td1" align="left">
                                                        <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                                            Show Filter</span></a> || <a href="javascript:ShowHideFilter('All');"><span style="color: #000099;
                                                                text-decoration: underline">All Records</span></a>
                                                    </td>
                                                   
                                                </tr></table>
                
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="gridStatus" ClientInstanceName="grid" Width="100%"
                            KeyFieldName="Stat_ID" DataSourceID="gridStatusDataSource" runat="server"
                            AutoGenerateColumns="False" OnCustomCallback="gridStatus_CustomCallback">
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                            <Styles>
                                <Header CssClass="gridheader">
                                </Header>
                                <FocusedRow CssClass="gridselectrow" BackColor="#FCA977">
                                </FocusedRow>
                                <FocusedGroupRow CssClass="gridselectrow" BackColor="#FCA977">
                                </FocusedGroupRow>
                            </Styles>
                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Visible="false" FieldName="Stat_ID" Caption="ID" >
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                            
                                <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="Status_Short" Width="100px"
                                    Caption="Status">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="Status_Desc" Width="50px"
                                    Caption="Status Description">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="trn_StatID" Width="50px"
                                    Caption="Details" Visible="true">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="Status_Company" Width="50px"
                                    Caption="Company Name">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                   <dxwgv:GridViewDataTextColumn VisibleIndex="5" Width="60px" Caption="Details">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <DataItemTemplate>
<%--                                        <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                            Edit</a>--%> 
                                              <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                                              { %>
                                            <a href="javascript:void(0);" onclick="DeleteRow('<%# Container.KeyValue %>')">
                                                Delete</a>
                                               <%} %>
                                    </DataItemTemplate>
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="javascript:OnAddButtonClick();"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                    </HeaderTemplate>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <SettingsText ConfirmDelete="Are You Want To Delete This Record ???" />
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                        </dxwgv:ASPxGridView>
                                    <asp:SqlDataSource ID="gridStatusDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="">
                <SelectParameters>
                    <asp:SessionParameter Name="userlist" SessionField="userchildHierarchy" Type="string" />
                </SelectParameters>
            </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
