<%@ page language="C#" autoeventwireup="true" inherits="management_Frm_UploadCommonFolder, App_Web_fxnvzv_8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" language="javascript">
    function dhtmlclose()
    {
   
    parent.editwin.close();
    }
    
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table width="100%" style="border: solid 1px white;">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Upload File into Common Folder</span></strong>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table>
                            <tr>
                                <td class="gridcellright">
                                   <strong><span style="color: #000099"> Upload File: </span></strong>
                                </td>
                                <td>
                                    :</td>
                                <td class="gridcellleft">
                                    <asp:FileUpload ID="OFDSelectFile" runat="server" Width="372px" /></td>
                                <td align="LEFT">
                                    <asp:Button ID="btnAddForm" runat="Server" Text="Upload"   Width="100px" CssClass="btnUpdate"
                                        OnClick="btnAddForm_Click" />
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
