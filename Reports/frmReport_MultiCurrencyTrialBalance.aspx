<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" inherits="Reports_frmReport_MultiCurrencyTrialBalance, App_Web_-n9yptcr" %>
    
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Multi Currency Trial Balance</title>
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
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:5;
	}
	
	form{
		display:inline;
	}
	
	</style>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>
    <script language="javascript" type="text/javascript" src="../CentralData/JSScript/timeSolver.min.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">

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
    FieldName='ctl00_ContentPlaceHolder1_Headermain1';        

    function Page_Load()
    {
        height(); 
    }
    
    function Hide(obj)
    {
      document.getElementById(obj).style.display='none';
    }
    function Show(obj)
    {
      document.getElementById(obj).style.display='inline';
    }
    
    function GnrcCallBackPanel_Methods(WhichCall)
    {
        Show("divLoading");
        cbtnExport.SetEnabled(false);
        cGnrcCallBackPanel.PerformCallback(WhichCall+'~');
        height();
    }
    function GnrcCallBackPanel_EndCallBack()
    {
        Hide("divLoading");
        cbtnExport.SetEnabled(true);
        if(cGnrcCallBackPanel.cpIsSpData!=undefined)
        {
            if(cGnrcCallBackPanel.cpIsSpData=="Export")
                GetObjectID('AbtnExport').click();
            else 
                alert(cGnrcCallBackPanel.cpIsSpData);
        }
        if(cGnrcCallBackPanel.cpDateSat!=undefined)
        {
            dtDate.SetDate(new Date(cGnrcCallBackPanel.cpDateSat));
        }
        height();
    }
    function DateChange(DateObj)
    {
        var Lck ='<%=Session["LCKBNK"] %>';
        var FYS ='<%=Session["FinYearStart"]%>';
        var FYE ='<%=Session["FinYearEnd"]%>'; 
        var LFY ='<%=Session["LastFinYear"]%>';
        var GetDate='<%=Session["ServerDate"]%>';
        var ExpDate='<%=Session["ExpireDate"]%>';
        //DevE_CheckForLockDate(DateObj,Lck);
        DevE_CheckForFinYear(DateObj,FYS,FYE,LFY);
        DevE_CompareDateForMin(dtFrom,dtToDate,'From Date Must Be Less than To Date!!!');
    }
    </script>

        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Multi Currency Trial Balance</span></strong>
                </td>
            </tr>
        </table>
        <table class="TableMain100">
            <tr>
                <td style="text-align: left; vertical-align: top">
                    <table cellspacing="1" cellpadding="2" style="background-color: #B7CEEC; border: solid 1px  #ffffff"
                        border="1">
                        <tr>
                            <td class="gridcellleft" style="width: 58px">
                                As On Date
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="dtDate" runat="server" EditFormat="Custom" UseMaskBehavior="True" ClientInstanceName="dtDate">
                                    <DropDownButton Text="..." Tooltip="Click to Select Report Generation Date">
                                    </DropDownButton>
                                    <ClientSideEvents DateChanged="function(s,e){DateChange(dtDate);}" />
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft" style="width: 58px">
                                Segment
                            </td>
                            <td style="text-align: left;" colspan="2">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rdbSegAll" runat="server" Checked="True" GroupName="a" />
                                        </td>
                                        <td>
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbSegSelected" runat="server" GroupName="a" />
                                        </td>
                                        <td>
                                            Selected
                                        </td>
                                        <td>
                                            (<span id="litSegment" runat="server" style="color: Maroon"></span>)
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Show Sub Ledger BreakUp?
                            </td>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="ddlSubLedger" runat="server" Width="130px" Font-Size="12px">
                                                <asp:ListItem Value="NO">No</asp:ListItem>
                                                <asp:ListItem Value="YES">Yes</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td id="Td_Export" class="gridcellleft" style="width: 267px">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <dxe:ASPxButton ID="btnExport" runat="server" AutoPostBack="False" ClientInstanceName="cbtnExport"
                                                Text="Export To Excel">
                                                <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('Export');}" />
                                            </dxe:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
          </tr>
        </table>
        
        <div id="divLoading">
            <dxcp:ASPxCallbackPanel ID="GnrcCallBackPanel" runat="server" ClientInstanceName="cGnrcCallBackPanel"
                BackColor="White" OnCallback="GnrcCallBackPanel_Callback" LoadingPanelText="Generating File...Please Wait..."
                LoadingPanelStyle-Font-Size="Medium">
                <PanelCollection>
                    <dxp:panelcontent>
                    </dxp:panelcontent>
                </PanelCollection>
                <ClientSideEvents EndCallback="function(s, e) {
                                                        GnrcCallBackPanel_EndCallBack(); }" />
            </dxcp:ASPxCallbackPanel>
        </div>
        <div style="display: none">
            <asp:Button ID="AbtnExport" runat="server" BackColor="#DDECFE" BorderStyle="None"
                OnClick="btnExport_Click" />
        </div>
    </form>
</body>
</html>
