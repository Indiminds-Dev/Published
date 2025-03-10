<%@ page language="C#" autoeventwireup="true" inherits="Reports_MarginCalculationFO, App_Web_yf04ozfw" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Position File For Span</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /* Loading spinner */
        #loading {
            display: none;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 4px solid #f3f3f3; /* Light grey */
            border-top: 4px solid #3498db; /* Blue */
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 2s linear infinite;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }
    </style>

    <script language="javascript" type="text/javascript">
        groupvalue = "";

        function Page_Load()///Call Into Page Load
        {

            height();
        }
        function height() {
            if (document.body.scrollHeight >= 350) {
                window.frameElement.height = document.body.scrollHeight;
            }
            else {
                window.frameElement.height = '350px';
            }
            window.frameElement.width = document.body.scrollwidth;
        }
        function Hide(obj) {
            document.getElementById(obj).style.display = 'none';
        }
        function Show(obj) {
            document.getElementById(obj).style.display = 'inline';
        }
        function dateassign() {
            cCbpDisplay.PerformCallback('Bind~');
        }
        function heightlight(obj) {

            var colorcode = obj.split('&');

            if ((document.getElementById('hiddencount').value) == 0) {
                prevobj = '';
                prevcolor = '';
                document.getElementById('hiddencount').value = 1;

            }
            document.getElementById(obj).style.backgroundColor = '#ffe1ac';

            if (prevobj != '') {
                document.getElementById(prevobj).style.backgroundColor = prevcolor;
            }
            prevobj = obj;
            prevcolor = colorcode[1];

        }
        // Function to show the loading spinner
        function showLoading() {
            document.getElementById('btnGenerate').style.display = 'none';
            document.getElementById('loading').style.display = 'block'; // Show the spinner
        }

        // Function to hide the loading spinner (to be called after the button's server-side processing is done)
        function hideLoading() {
            document.getElementById('btnGenerate').style.display = 'block';
            document.getElementById('loading').style.display = 'none'; // Hide the spinner
        }

    </script>


</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
        <table border="1">
            <tr>
                <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                    <strong><span id="SpanHeader" style="color: #000099">Margin Calculation For FO Segments</span></strong></td>
            </tr>
        </table>
        <table>
            <tr>
                <td bgcolor="#B7CEEC">
                    <strong>Date :</strong>
                </td>
                <td>
                    <dxe:ASPxDateEdit ID="dtDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                        Font-Size="10px" Width="108px" ClientInstanceName="dtDate">
                        <ClientSideEvents ValueChanged="function(s, e) {dateassign();}" />
                        <DropDownButton Text="For">
                        </DropDownButton>
                    </dxe:ASPxDateEdit>
                </td>
            </tr>
        </table>
        <table border="10" cellpadding="1" cellspacing="1">
            <tr>
                <td>
                    <dxcp:ASPxCallbackPanel ID="cbpDisplay" runat="server" ClientInstanceName="cCbpDisplay" OnCallback="cbpDisplay_Callback" BackColor="White">
                        <PanelCollection>
                            <dxp:PanelContent runat="server">
                                <div id="display" runat="server" style="border: solid 1px black"></div>
                            </dxp:PanelContent>
                        </PanelCollection>
                        <%-- <ClientSideEvents EndCallback="function(s, e) {
                                                            cbpDisplay_EndCallBack(); }" />--%>
                    </dxcp:ASPxCallbackPanel>
                </td>
            </tr>


        </table>
        <table>
            <tr>
                <td colspan="5">
                    <div style="width: 100px">Browse Span File :</div>
                </td>
                <td colspan="5" align="left">
                    <asp:FileUpload ID="fileSpanParameter" runat="server" Width="272px" />
                </td>
            </tr>
        </table>
        <asp:Button ID="btnGenerate" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate"
                        Width="101px" OnClientClick="showLoading(); return true;" OnClick="btnGenerate_Click" />
        <div style="display: none" id="loading"></div>
        <br />
        <br />
        <asp:Label  ID="fileMsg" ForeColor="Blue" Font-Size="Medium" runat="server"></asp:Label>
    </form>
</body>
</html>
