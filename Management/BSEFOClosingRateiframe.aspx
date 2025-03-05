<%@ page language="C#" autoeventwireup="true" inherits="management_frm_MCXClosingRates, App_Web_fxnvzv_8" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>USE-CDX Closing Rates</title>
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
    
    function ShowDate(objval)
        {
            
            if(objval=='3')
               {
                   document.getElementById('trDate').style.display='inline';
                   setfile();
               }
            else if(objval=='4')
                {
                
                    document.getElementById('trDate').style.display='inline';
                    setfile();
                }
             else
                document.getElementById('trDate').style.display='none';
        
        }
        
       function setfile()
                {
              
                var seldt=dtdate.GetText();
                 var filepath;
               if(document.getElementById('cmbTrade').value=='3')
                    filepath='http://www.bseindia.com/bhavcopy/eq'+seldt.split('-')[0]+seldt.split('-')[1]+seldt.split('-')[2].substring(2)+'_csv.zip';
               else
                    filepath='//www.bseindia.com/BSEDATA/IndexHighlights/INDEX'+seldt.split('-')[0]+seldt.split('-')[1]+seldt.split('-')[2].substring(2)+'.zip';
                
               // filepath='http://localhost:1146/Influx_New/management/dxSample.zip'
                var innerh='<a target="_blank" href="'+filepath+'" style="color: #000099;text-decoration: underline; font-size: 10pt;" >Get File</a>';     
               
                document.getElementById('divfiles').innerHTML=innerh;
                
                }
        
        function PageLoad()
                {
                    document.getElementById('trDate').style.display='none';
                    var cdate=new Date();
                    dtdate.SetDate(new Date());
                
                }
    </script>
<script type="text/javascript" src="../JSFUNCTION/init.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div align="center">
   
    <table class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 22px;">
                        <strong><span id="SpanHeader" style="color: #000099">Imports BSE-FO Closing Rates</span></strong>
                    </td>
                </tr></table>
                 
       <table class="TableMain100">
       <tr>
       <td>
        <table>
            <tr>
                <td align="left">
                    <span><strong>Select File Type :</strong></span>
                </td>
                <td style="padding-left:4px" align=left>
                    <select id="cmbTrade" onchange="Javascript:ShowDate(this.value)" runat="server">
                        <option selected="selected">Select</option>
                        <option value="1">MS_YYYYMMDD.CSV (FTP)</option>
                        <option value="2">Dload/UDiFF Format</option>
                        <option value="3">Cash Segment EQ File</option>
                        <option value="4">Index Close [INDEXDDMMYY.CSV]</option>
                        
                    </select>
                </td>
            </tr>
            <tr id="trDate">
                <td align="left">
                    <span><strong>Select Date : </strong></span>
                </td>
                <td align="left">
                    <table border="0">
                        <tr>
                            <td align="left">
                                <dxe:ASPxDateEdit ID="dtdate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" EditFormatString="dd-MM-yyyy" ClientInstanceName="dtdate">
                                    <DropDownButton Text="Date">
                                    </DropDownButton>
                                    <ClientSideEvents ValueChanged="function(s, e) {setfile();}" />
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="padding-left:10px">
                                <div id="divfiles"></div>
                            </td>
                        </tr>
                    </table>
                    
                </td>
                
            </tr>
            
            <tr>
                <td align="left">
                    <span><strong>Select File : </strong></span>
                </td>
                <td style="padding-left:4px" >
                    <asp:FileUpload ID="MarketStatsSelectFile" runat="server" Height="21px" Width="272px" />
                </td>
            </tr>
            
            <tr>
            <td align="right" valign="top" colspan="2">
                <asp:Button ID="BtnSave" runat="server" CssClass="btn" OnClick="BtnSave_Click" Text="Import File"
                    Width="84px" />
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
