<%@ page language="C#" autoeventwireup="true" inherits="management_Closingrateiframe, App_Web_fbvamflg" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <title>Untitled Page</title>

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
    function FileListChange(obj)
            {
        var lblid=document.getElementById("Label1");
        if(obj=="1")
        {
            lblid.innerText="File :CPDDMMYY";
            document.getElementById('Link').style.display='none';
            document.getElementById('Literal1').style.display='none';
        }
        else if(obj=="2")
        {
            lblid.innerText="File :EQDDMMYY";
        document.getElementById("Literal1").innerText="Available At:";
        document.getElementById('Link').style.display='inline';
        }
    }
    
    
     function Page_Load(obj)
     {
        if(obj=='B')
        {
            document.getElementById("trYesNo").style.display="none";
            document.getElementById('Link').style.display='none';
        }
        else if(obj=='A')
            document.getElementById("trYesNo").style.display="inline";
        
        height();
     }
     function showpage()
     {
       window.open("https://www.bseindia.com/markets/MarketInfo/BhavCopy.aspx");
     }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div align="center">
            <asp:Panel ID="Panelmain" runat="server" Visible="true">
                <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
                    <tbody>
                        <tr>
                            <td class="lt1">
                                <h5>
                                    Imports Closing Rates BSE Files
                                </h5>
                            </td>
                        </tr>
                        <tr>
                            <td class="lt brdr" style="height: 317px">
                                <table cellspacing="0" cellpadding="0" align="center">
                                    <tbody>
                                        <tr>
                                            <td class="lt">
                                                <table class="width100per" cellspacing="12" cellpadding="0">
                                                    <tbody>
                                                     <tr id="trYesNo" runat="server">
                                                            
                                                            <td>
                                                            
                                                                <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                                    Font-Bold="True" ForeColor="Blue" /></td>
                                                        </tr>
                                                        <tr>
                                                            
                                                            <td class="lt">
                                                                <strong>
                                                                    <table>
                                                                        <tr>
                                                                            <td style="width: 369px">
                                                                                <asp:DropDownList ID="ddlFileList" runat="server" Height="19px" onchange="FileListChange(this.value);"
                                                                                    Width="158px">
                                                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                                                    <asp:ListItem Value="2">EQ File</asp:ListItem>
                                                                                </asp:DropDownList><br />
                                                                                <strong>&nbsp;<br />
                                                                                    DATE:</strong>
                                                                                <dxe:ASPxDateEdit ID="dtfor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                                                    Font-Size="10px" Width="154px" ClientInstanceName="dtfor">
                                                                                    <dropdownbutton text="For"></dropdownbutton>
                                                                                </dxe:ASPxDateEdit>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="height: 18px" >
                                                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Label" Width="154px"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td >
                                                                                <asp:Label ID="Literal1" runat="server" Font-Bold="True" Text="Label" Width="156px"></asp:Label>                                                                               
                                                                            </td>
                                                                             
                                                                        </tr>
                                                                          <tr id="Link">
                                                                            <td >
                                                                            <label id="Caption" runat="server" onclick="showpage();" style="color: blue; background-color: transparent; cursor:pointer " >
                                                                                <strong>
                                                                                https://www.bseindia.com/markets/MarketInfo/BhavCopy.aspx</strong></label>
                                                                                </td>
                                                                     
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 369px">
                                                                                <asp:FileUpload ID="OFDSelectFile" runat="server" Height="23px" Width="272px"/>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 369px">
                                                                <asp:HiddenField ID="hdnChk" runat="server" Value="0" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: left; width: 369px;">
                                                                                <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" OnClick="BtnSave_Click"
                                                                                    Width="84px" />
                                                                              <%--  <asp:Button ID="btnDownload" runat="server" Text="Download And Import File" CssClass="btn" OnClick="btnDownload_Click"
                                                                                    Width="174px" Visible="False" /></td>--%>
                                                                        </tr>
                                                                    </table>
                                                                </strong>
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
