<%@ page language="C#" autoeventwireup="true" inherits="management_frmcallforward, App_Web_n2fxndvz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
   <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
  <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
<script language="javascript" type="text/javascript">
         function SignOff()
        {
        window.parent.SignOff()
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
        function lostFocus()
        {
            var str = window.opener.document.getElementById("ctl00_ContentPlaceHolder3_txtNote");
            str.focus();
        }
    </script>
    <form id="form1" runat="server">
    <div>
        <table class="TableMain100">
        <tr>
            <td colspan="3" class="Ecoheadtxt" style="text-align: center" >Call Forward/Deligate</td>
        </tr>
        <tr>
            <td style="width:20%" class="Ecoheadtxt" >Call Outcome</td>
            <td style="width:1%" class="Ecoheadtxt" >:</td>
            <td class="Ecoheadtxt" style="text-align: left" ><asp:TextBox id="txtCallOutcome" runat="server" Width="380px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width:20%" class="Ecoheadtxt" >Forward To</td>
            <td style="width:1%" class="Ecoheadtxt" >:</td>
            <td class="Ecoheadtxt" style="text-align: left" ><asp:DropDownList id="drpCallForward" runat="Server" Width="383px"></asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width:20%" class="Ecoheadtxt" >Call DateTime</td>
            <td style="width:1%" class="Ecoheadtxt" >:</td>
            <td class="Ecoheadtxt" style="text-align: left" ><asp:Panel id="pnlnextcall" runat="server" Width="380px"></asp:Panel></td>
        </tr>
        <tr style="display:none;" class="Ecoheadtxt" >
            <td style="width:20%" class="Ecoheadtxt" >Expected End DateTime</td>
            <td style="width:1%" class="Ecoheadtxt" >:</td>
            <td class="Ecoheadtxt" style="text-align: left" ><asp:Panel id="pnlEndDate" runat="Server" Width="380px"></asp:Panel></td>
        </tr>
        <tr>
            <td style="width:20%" class="Ecoheadtxt" >Insutruction</td>
            <td style="width:1%" class="Ecoheadtxt" >:</td>
            <td class="Ecoheadtxt" style="text-align: left" ><asp:TextBox id="txtInsutruction" runat="Server" TextMode="MultiLine" Width="380px"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Button id="btnSave" runat="Server" CssClass="btnUpdate" text="Forward/Deligate" OnClick="btnSave_Click" />
                <input type="button" id="btnDiscard" name="btnDiscard" class="btnUpdate" value="Discard" onclick="window.close();" />
            </td>
        </tr>
    </table>
                
    </div>
    </form>
</body>
</html>
