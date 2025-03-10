<%@ page language="C#" autoeventwireup="true" inherits="management_cdslTransctioniframe, App_Web_xu-hjjp9" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

    <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=400)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '400px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function hii()
        {
           var conf=confirm('This file already exists.\n Want to reimport?');
           
           if(conf)
           {
             document.getElementById('<%=Button1.ClientID %>').click();
           }
        }
        
         
        function insertCheck(s)
            {
                document.getElementById('<%=importstatus.ClientID%>').value=s;
            }
            
        function dematPopUp(time)
            {
                var URL='cdsl_DematCertificates.aspx?time='+time;
	            parent.OnMoreInfoClick(URL,"Demat Certificates Update",'650px','420px',"Y");
            }
        
        function ShowHidUpdateholding()
            {
               
              var selectval=document.getElementById('DropDownList1').value;
              if(selectval=='DP57')
                    {
                         document.getElementById('tdUpdateholding').style.display='none';
                    }
               else
                    {
                         document.getElementById('tdUpdateholding').style.display='inline';
                    }
            
            }
    </script>

    <form id="form1" runat="server">
        <div align="center">
            <asp:Panel ID="Panelmain" runat="server" Visible="true">
                <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
                    <tr>
                        <td class="lt1">
                            <h5>
                                Import Balance Report
                            </h5>
                        </td>
                    </tr>
                    <tbody>
                        <tr>
                            <td class="lt brdr" style="height: 280px">
                                <table cellspacing="0" cellpadding="0" align="center" width="100%">
                                    <tbody>
                                        <tr>
                                            <td class="lt" style="width: 369px">
                                                <table class="width100per" cellspacing="5" cellpadding="0">
                                                    <tbody>
                                                        <tr>
                                                            <td class="lt">
                                                            </td>
                                                            <td class="lt" style="width: 278px; height: 22px">
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lt">
                                                            </td>
                                                            <td class="lt" style="width: 278px; height: 22px;">
                                                                <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                                    Font-Bold="True" ForeColor="Red" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lt">
                                                                Report Type :</td>
                                                            <td class="lt" style="width: 278px; height: 22px">
                                                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="lt" onchange="ShowHidUpdateholding();" Width="190px">
                                                                    <asp:ListItem Value="DPC9">DPC9: Online DP05 Report</asp:ListItem>
                                                                    <asp:ListItem Value="DP50">DP50:BO ISIN Posting Journal</asp:ListItem>
                              <asp:ListItem Value="DP57">DP57</asp:ListItem>
                                                                </asp:DropDownList></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lt" valign="top">
                                                                File Path :
                                                            </td>
                                                            <td align="left" style="width: 278px; height: 22px;">
                                                                <asp:FileUpload ID="OFDSelectFile" runat="server" Width="272px" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lt" valign="top">
                                                            </td>
                                                            <td id="tdUpdateholding" align="left" style="width: 278px; height: 22px" valign="top">
                                                                <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" />Update Holding</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="middle" colspan="2">
                                                                <table cellspacing="0" cellpadding="0">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td valign="top" align="left" style="height: 19px">
                                                                                <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" Width="84px"
                                                                                    OnClick="BtnSave_Click" />
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr style="display: none; visibility: hidden">
                                                            <td>
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" /></td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr style="display: none; visibility: hidden">
                                                            <td>
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" /></td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr style="display: none; visibility: hidden">
                                                            <td>
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button3_Click" /></td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </asp:Panel>
            
        </div>
    </form>
</body>
</html>
