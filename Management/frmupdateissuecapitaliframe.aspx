<%@ page language="C#" autoeventwireup="true" inherits="management_frmupdateissuecapitaliframe, App_Web_dw8rtpla" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=350)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '350px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    </script>
</head>

<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div align="center">
      <asp:Panel ID="Panelmain" runat="server" Visible="true">
        
  <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
    <tr> 
      <td class="lt" valign="top"> <h5>Import 
        Issue Capital CSV Files</h5></td>
    </tr>
    <tr> 
      <td align="left" valign="top"><font color="#000000" size="2" face="Times New Roman, Times, serif"> <span style="font-size: 8pt;
              font-family: MS Sans Serif; left: 0px; position: relative; top: 0px;">This routine will update the 'Issued Capital' of Listed Companies in NSE.<br>
        It also updates the 'Index memberships' of the shares.<br>
        It takes one or both of the following two files -<br>
        1: IXddmmyy.csv<br>
        2: ffIxddmmyy.csv<br>
        If you select both files,make sure they are of the same day. </span></font></td>
    </tr>
     <tr> 
      <td>
          <table  class="login" cellspacing="0" cellpadding="0" width="400">
              <tr>
                  <td>
                     <table class="TableMain100" cellspacing="0" cellpadding="0">
                         <tr>
                             <td align="center" colspan="2">
                                 <asp:Label ID="lblMsgError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
                         </tr>
                          <tr>
                              <td class="gridcellright">
                                  IX File:</td>
                              <td>
                                <asp:FileUpload ID="IXUpload" runat="server" Width="272px" />
                              </td>
                          </tr>
                          <tr>
                              <td class="gridcellright">
                                  ffIX File:</td>
                              <td>
                                 <asp:FileUpload ID="ffIXUpload" runat="server" Width="272px" />
                              </td>
                          </tr>
                          <tr>
                              <td>
                              </td>
                              <td>
                                  <asp:Button ID="BtnSave" runat="server" CssClass="btn" OnClick="BtnSave_Click" Text="Import File"
                                      Width="84px" /></td>
                          </tr>
                      </table>
                  </td>
              </tr>
          </table>
      </td>
    </tr>
  </table>
    </asp:Panel>
    </div>
    </form>
</body>
</html>
