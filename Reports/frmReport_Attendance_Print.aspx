<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_Attendance_Print, App_Web_91unyima" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attendance Print</title>
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table>
            <tr>
                <td>
                    <cr:crystalreportviewer id="CrystalReportViewer1" runat="server" autodatabind="true"
                        displaygrouptree="False" />
                    <cr:crystalreportpartsviewer id="CrystalReportPartsViewer1" runat="server" autodatabind="True"
                        reportsourceid="CrystalReportSource1" />
                    <cr:crystalreportsource id="CrystalReportSource1" runat="server">
                                    <Report FileName="Reports\AttendenceRport.rpt">
                                    </Report>
                                </cr:crystalreportsource>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
