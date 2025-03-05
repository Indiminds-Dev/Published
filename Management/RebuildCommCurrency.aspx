<%@ page language="C#" autoeventwireup="true" inherits="management_RebuildCommCurrency, App_Web_zsukfi_p" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Rebuild DematPositions and DematStocks</title>
        <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">

    function SignOff()
        {
            window.parent.SignOff();
        }
        function height()
       {
           if(document.body.scrollHeight>=350)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '350px';
            }
            window.frameElement.width = document.body.scrollWidth;
        }
        
</script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="load()">
    <form id="form1" runat="server">
    <div align="center"   style="background-color:#DDECFE; height:90%">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                    <strong><span id="SpanHeader" style="color: #000099">Rebuild DematPositions and DematStocks</span></strong></td>
                
            </tr>
        </table>
        <table  width="100%"> 
        <tr>    
            <td>
            &nbsp;
            </td>
        </tr>  
        <tr>    
            <td>
                 <asp:Button ID="btnRebuild" runat="server" Text="Rebuild DematPositions and DematStocks" CssClass="btnUpdate" Height="20px" OnClick="btnRebuild_Click"/>
          </td>
        </tr>     
        <tr>    
            <td>  
                <asp:Label ID="lblStatus" runat="server" Font-Size="X-Small" Font-Names="Arial"
                        Font-Bold="True" ForeColor="Red" />
                        
            </td>
        </tr>                  
     </table>
    </div>
    </form>
</body>
</html>
