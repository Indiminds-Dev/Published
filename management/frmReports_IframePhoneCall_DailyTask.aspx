<%@ page language="C#" autoeventwireup="true" inherits="management_frmReports_IframePhoneCall_DailyTask, App_Web_itibbj7j" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script language="javascript" type="text/javascript">
        function frmOpenNewWindow1(location,v_height,v_weight)
          {
            var x=(screen.availHeight-v_height)/2;
            var y=(screen.availWidth-v_weight)/2
            window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ x +",left="+ y +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=yes,resizable=no,dependent=no'");       
          }
          function visibleProperty(obj)
          {
            document.getElementById('TdSelect').style.display='none';
            document.getElementById('TdResearch').style.display='inline';
            document.getElementById('spText').innerText=obj;
            height();
          }
          function Page_Load()
          {
                document.getElementById('TdResearch').style.display='none';
                height();
          }
          function btnResearch_Click()
          {
                document.getElementById('TdSelect').style.display='inline';
                document.getElementById('TdResearch').style.display='none';
                document.getElementById('spText').innerText="";
          }
          function height()
            {
                if(document.body.scrollHeight>=550)
                {
                    window.frameElement.height = document.body.scrollHeight;
                }
                else
                {
                    window.frameElement.height = '550px';
                }
                window.frameElement.widht = document.body.scrollWidht;
            }
          FieldName='ctl00_ContentPlaceHolder1_Headermain1';
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE"  onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER"  style="text-align:center">
                        <span style="color: Blue"><strong>Daily Tash Sheet For Tele Sales</strong></span>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <span id="spText" style="color: Red"></span>
                    </td>
                </tr>
                
                <tr>
                    <td id="TdSelect">
                        <table class="TableMain100">
                            <tr>
                                <td class="gridcellleft" style="color: Blue; width: 120px;">
                                    Search By User :
                                </td>
                                <td style="text-align: left">
                                    <asp:DropDownList ID="drpUser" runat="server" Width="200px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft" style="color: Blue; width: 120px;">
                                    Date :
                                </td>
                                <td style="text-align: left">
                                    <dxe:ASPxDateEdit ID="dtDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        Width="197px">
                                    </dxe:ASPxDateEdit>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft" style="color: Blue; width: 120px;">
                                </td>
                                <td style="text-align: left">
                                    <asp:Button ID="btnReport" runat="server" Text="Get Report" CssClass="btnUpdate"
                                        Height="22px" Width="86px" OnClick="btnReport_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td id="TdResearch" style="text-align: left">
                        <input id="btnResearch" type="button" value="ReSearch" onclick="btnResearch_Click()"
                            class="btnUpdate" style="width: 74px; height: 21px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:GridView ID="grdReports" runat="server" Width="100%" CssClass="gridcellleft"
                                    ShowFooter="True" BorderColor="#507CD1" BorderWidth="1px" GridLines="None" ForeColor="#333333"
                                    CellPadding="4" AllowPaging="True" OnRowDataBound="grdReports_RowDataBound">
                                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                    <RowStyle BackColor="#EFF3FB" BorderWidth="1px"></RowStyle>
                                    <EditRowStyle BackColor="#E59930"></EditRowStyle>
                                    <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                    <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                    <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                        Font-Bold="False"></HeaderStyle>
                                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnReport" EventName="Click"></asp:AsyncPostBackTrigger>
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
