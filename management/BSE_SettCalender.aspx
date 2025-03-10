<%@ page language="C#" autoeventwireup="true" inherits="frm_MCXTRADES, App_Web_-k9nslwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>BSE Settlement Calender</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=300)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '300px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function selectfile()
    {
        var i=document.getElementById('cmbTrade').value;
        document.getElementById('txtType').value=i;
//        txtType.value=i;
        
        
    }
 </script>
<script type="text/javascript" src="../JSFUNCTION/init.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panelmain" runat="server" HorizontalAlign="Center" Style="z-index: 100;
            left: 236px; position: absolute; top: 13px" Visible="true">
            <table id="tbl_main" cellpadding="0" cellspacing="0" class="login" style="height: 153px"
                width="410">
                <tbody>
                 <tr>
                    <td class="lt1" style="height: 22px">
                        <h5>
                            Imports BSE Settlement Calender
                        </h5>
                    </td>
                </tr>
                
                    <tr>
                        <td class="lt" style="height: 115px">
                            <table cellpadding="0" cellspacing="12" class="width100per" style="width: 100%">
                                <tbody>
                                
                                    <tr>
                                        <td class="gridcellleft" style="width: 102px; height: 23px;">
                                            <span style="color: #000099; text-align: right">File Type</span></td>
                                        <td align="right" style="width: 278px; height: 23px; text-align: left;">
                                            <select id="cmbTrade" runat="server" onchange="selectfile();">
                                                <option>Select</option>
                                                <option>FINAL CSV</option>
                                            </select>
                                            
                                        </td>
                                    </tr>
                                      <tr>
                                      <td> </td>
                                        <td class="gridcellleft" style="width: 102px; height: 22px;" colspan=2 align="left">
                                            <asp:Label ID="Label1" runat="server" Font-Bold="False" Text="SETLMAS_MMDD csv/txt Files"
                                                Width="153px"></asp:Label></td>
                                            
                                       </tr>
                                         <tr>
                                         <td></td>
                                        <td class="gridcellleft" style="width: 102px; height: 22px;" colspan=2 align="center">
                                            <asp:Label ID="Label2" runat="server" Font-Bold="False" Text="Available at: BOLT -OR- https://www.bseindia.com/downloads/Help/file/scrip.zip"
                                                Width="113px"></asp:Label></td>
                                            
                                       </tr>
                                    <tr>
                                        <td class="gridcellleft" style="height: 23px">
                                            <span style="color: #000099; text-align: right">Select File</span></td>
                                        <td align="right" style="width: 278px; height: 23px; text-align: left;">
                                            <asp:FileUpload ID="McxTradeSelectFile" runat="server" Height="21px" Width="272px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2" style="height: 20px" valign="middle">
                                            <table cellpadding="0" cellspacing="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" style="height: 19px" valign="top">
                                                            <asp:Button ID="BtnSave" runat="server" CssClass="btn" OnClick="BtnSave_Click" Text="Import File"
                                                                Width="84px" />
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
            <%--</td>
                                </tr>
                                
                                   
                            </tbody>--%>
            <%--</table>--%>
            <asp:HiddenField ID="hdfname" runat="server" />
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
