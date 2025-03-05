<%@ page language="C#" autoeventwireup="true" inherits="management_EOD_Process, App_Web_8qixh_8w" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EOD Process</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <style type="text/css">
    #divLogBackup {margin-bottom:15px;}
    .imgHand{ float:left; background-image: url(../images/rightArrowHand.jpg); width: 33px; height: 12px;}
    </style>
</head>

<script language="javascript" type="text/javascript">
     function btnStartLogBackUp_Click()
     {
        cCbpEOD.PerformCallback("EOD_LogBackUp~");
     }
     function btnRecycleExcel_Click()
     {
        cCbpEOD.PerformCallback("EOD_RecycleExcel~");
     }     
     function CbpEOD_EndCallBack()
     {
        if(cCbpEOD.cpLogBackupInfo!=undefined)
        {
            if(cCbpEOD.cpLogBackupInfo=="Success")
            {
              alert('Log EOD Process Successfully Completed');
            }
            else
            {
                alert('There is Some Problem to Complete Process');
            }
        }
        if(cCbpEOD.cpRecycleExcelInfo!=undefined)
        {
            if(cCbpEOD.cpRecycleExcelInfo=="Recycled")
            {
              alert('Recycle Excel EOD Process Successfully Completed');
            }
            else
            {
                alert('There is Some Problem to Complete Process');
            }
        }
     }
</script>

<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
            <table border="1" width="98%">
                <tr>
                    <td class="EHEADER" align="center" colspan="6">
                        <strong><span id="SpanHeader" style="color: #000099">End Of Day Processes</span></strong>
                    </td>
                </tr>
            </table>
            <br />
            <dxcp:ASPxCallbackPanel ID="CbpEOD" runat="server" ClientInstanceName="cCbpEOD" OnCallback="CbpEOD_Callback">
                <ClientSideEvents EndCallback="function(s, e) {CbpEOD_EndCallBack(); }" />
                <PanelCollection>
                    <dxp:PanelContent runat="server">
                        <div id="divLogBackup">
                            <div class="imgHand" title="This Will Flush The Memory Where Log Save that Cause Low Performance. Take Log BackUp atleast in a Week for Good Performance..">
                            </div>
                            <div>
                                <dxe:ASPxButton ID="btnStartLogBackUp" runat="server" AutoPostBack="False" Text="Start Log BackUp"
                                    Width="200px" UseSubmitBehavior="False" ToolTip="Please Click To Start and Wait Until Process Complete.">
                                    <ClientSideEvents Click="function(s, e) {btnStartLogBackUp_Click();}"></ClientSideEvents>
                                </dxe:ASPxButton>
                            </div>
                        </div>
                        <div id="divExcelRecycle">
                            <div class="imgHand" title="Recycle Excel Contents atleast in a Week for Good Performance..">
                            </div>
                            <div>
                                <dxe:ASPxButton ID="btnRecycleExcel" runat="server" AutoPostBack="False" Text="Recycle Excel"
                                    Width="200px" UseSubmitBehavior="False" ToolTip="Please Click To Start and Wait Until Process Complete.">
                                    <ClientSideEvents Click="function(s, e) {btnRecycleExcel_Click();}"></ClientSideEvents>
                                </dxe:ASPxButton>
                            </div>
                        </div>
                    </dxp:PanelContent>
                </PanelCollection>
            </dxcp:ASPxCallbackPanel>
        </div>
    </form>
</body>
</html>
