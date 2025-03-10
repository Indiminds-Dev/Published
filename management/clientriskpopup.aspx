<%@ page language="C#" autoeventwireup="true" inherits="management_clientriskpopup, App_Web_4andsqnv" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Client Risk Analysis</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
   
</head>
<body onload="clearPreloadPage()" style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
   <div>
                <table id="DATADISPLAY">
                   
                    <tr bordercolor="Blue">
                        <td>
                           <div id="DivDateDisply" runat="server">
                                        </div>
                            
                        </td>
                    </tr>
                </table>
           
    </div>
    </form>
</body>
</html>