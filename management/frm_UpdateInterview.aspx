<%@ page language="C#" autoeventwireup="true" inherits="management_frm_UpdateInterview, App_Web_d1rqvttb" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
         function SignOff()
         {
            window.parent.SignOff();
         }
       
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr class="EHEADER">
                    <td class="ColHead">
                        <span style="color: #3300cc"><strong>Candidate Interview</strong></span>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <table style="border:solid 2px white">
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblmessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Candidate Name:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtName" runat="server" Width="200px" Font-Size="10px" TabIndex="1"
                                        ValidationGroup="a" Enabled="False"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                        Display="Dynamic" ErrorMessage="Candidate name required" ValidationGroup="a"
                                        Width="124px"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Interview Date/Time:</span>
                                </td>
                                <td class="gridcellleft">
                                    <dxe:ASPxDateEdit ID="drpInterviewDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        TabIndex="2" Width="201px">
                                        <ButtonStyle Width="13px">
                                        </ButtonStyle>
                                    </dxe:ASPxDateEdit>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Interview Place:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="drpIntPlace" runat="server" TabIndex="3" Width="203px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Interviewer:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="drpInterviewer" runat="server" TabIndex="4" Width="203px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td class="gridcellleft">
                                    <table width="203px">
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btnUpdate" OnClick="btnSave_Click"
                                                    TabIndex="5" ValidationGroup="a" />
                                                <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btnUpdate" OnClick="btnCancel_Click"
                                                    TabIndex="6" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="display:none;">
                                    <asp:TextBox ID="txtActivity" runat="server"></asp:TextBox>
                                    <asp:TextBox ID="txtRecruit" runat="server" ></asp:TextBox>
                                    <asp:TextBox ID="hdDateTime" runat="server" ></asp:TextBox>
                                    <asp:TextBox ID="hdPlace" runat="server" ></asp:TextBox>
                                    <asp:TextBox ID="hdInterviewer" runat="server" ></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
