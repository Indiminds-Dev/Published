<%@ page language="C#" autoeventwireup="true" inherits="management_GenerateDematCharges, App_Web_rilo-itm" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Generate Demat Charges</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/GenericJscript.js"></script>
    <script language="javascript" type="text/javascript">
        function Page_Load()///Call Into Page Load
        {
            document.getElementById('btnshow').style.display = 'inline';
            document.getElementById('btndel').style.display = 'none';
            DevE_SetDateTime(cDTBill, DTTO.GetDate());
            cDTBill.SetEnabled(false);
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
        function Delete() {
            var answer = confirm("Are You Sure You Want To Delete ?");
            if (answer == true) {
                var answer1 = confirm("Are You Really Sure ?");
                if (answer1 == true) {
                    var answer2 = confirm("Are You Really Sure ?");

                    if (answer2 == true) {

                        document.getElementById('btnremove').click();
                    }
                    else {
                        return false;
                    }
                }
                else {
                    return false;
                }
            }
            else {
                return false;
            }

        }
        function fnchangebtn(obj) {
            if (obj == '0') {
                document.getElementById('btnshow').style.display = 'inline';
                document.getElementById('btndel').style.display = 'none';
            }
            else {
                document.getElementById('btnshow').style.display = 'none';
                document.getElementById('btndel').style.display = 'inline';

            }
            //Common
            document.getElementById('lblmsg').innerHTML = "";
        }
        function EnableBillDate(obj) {
            if (obj.checked) cDTBill.SetEnabled(true);
            else {
                cDTBill.SetEnabled(false);
                DevE_SetDateTime(cDTBill, DTTO.GetDate());
            }
        }
    </script>
</head>


<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
            <script language="javascript" type="text/javascript"> 

                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_initializeRequest(InitializeRequest);
                prm.add_endRequest(EndRequest);
                var postBackElement;
                function InitializeRequest(sender, args) {
                    if (prm.get_isInAsyncPostBack())

                        args.set_cancel(true);
                    postBackElement = args.get_postBackElement();
                    $get('UpdateProgress1').style.display = 'block';


                }
                function EndRequest(sender, args) {
                    $get('UpdateProgress1').style.display = 'none';

                }
            </script>


            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btndel" EventName="Click" />
                </Triggers>
                <ContentTemplate>
                    <table class="TableMain100">
                        <tr>
                            <td class="EHEADER" style="text-align: center;">
                                <strong><span style="color: #000099">Generate Demat Charges</span></strong>
                            </td>

                        </tr>
                    </table>
                    <table id="SELECT">
                        <tr valign="top">
                            <td>Transaction Date Range :</td>
                            <td>
                                <dxe:ASPxDateEdit ID="DTFROM" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="DTFROM">
                                    <DropDownButton Text="From">
                                    </DropDownButton>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td>
                                <dxe:ASPxDateEdit ID="DTTO" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="DTTO">
                                    <DropDownButton Text="To">
                                    </DropDownButton>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td>
                                Choose Specific Bill Date
                                <asp:CheckBox ID="chkBillDate" runat="server" onclick="EnableBillDate(this)" />
                            </td>
                             <td>
                                <dxe:ASPxDateEdit ID="DTBill" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="cDTBill" EditFormatString="dd-MM-yyyy">
                                    <DropDownButton Text="Bill Date">
                                    </DropDownButton>
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>

                        <tr valign="top">
                            <td>Action :</td>
                            <td>
                                <asp:DropDownList ID="ddlaction" runat="server" Font-Size="11px" Width="100px" onchange="fnchangebtn(this.value)">
                                    <asp:ListItem Value="0">Generate</asp:ListItem>
                                    <asp:ListItem Value="1">Delete</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                    
                    <div runat="server" ID="lblmsg"></div>
                  
                </ContentTemplate>

            </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <div id='Div1' style="position: absolute; font-family: arial; font-size: 30; left: 50%; top: 50%; background-color: white; 
                        layer-background-color: white; height: 80; width: 250;">
                        <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td height='25' align='center' bgcolor='#FFFFFF'>
                                                <img src='../images/progress.gif' width='18' height='18'></td>
                                            <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                <font size='2' face='Tahoma'><strong style="text-align:center">Please Wait..</strong></font></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ProgressTemplate>

            </asp:UpdateProgress>
            <asp:Button ID="btnshow" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate" Width="100px" OnClick="btnshow_Click" />
            <asp:Button ID="btndel" runat="server" CssClass="btnUpdate" Height="20px" Text="Remove" Width="100px" OnClientClick="javascript:return Delete();" OnClick="btndel_Click" />




        </div>
        
    </form>
</body>
</html>
