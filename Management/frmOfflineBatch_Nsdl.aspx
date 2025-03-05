<%@ page language="C#" autoeventwireup="true" inherits="management_frmOfflineBatch_Nsdl, App_Web_jdrimxnc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Import NSDL Offline Batch</title>
     <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
     function DateChangeForFrom(s)
           {
                var currentTime = new Date()
                if(currentTime<s.GetValue())
                {           
               
                }
                else
                {                 
                s.SetDate(currentTime);  
                                    
                }
            
            }
    function height()
    {
        if(document.body.scrollHeight>=300)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '300px';
            window.frameElement.Width = document.body.scrollWidth;
    } 
    function SignOff()
    {
        window.parent.SignOff();
    }  
    
   </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color:#DDECFE">
    <form id="form1" runat="server">
    <div>
            <asp:Panel ID="Panelmain" runat="server" Visible="true" HorizontalAlign="Center">
                <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410"
                    style="border: solid 1px blue">
                    <tbody>
                        <tr>
                            <td class="EHEADER">
                                <span style="color: blue"><strong> NSDL Offline Batch</strong></span></td>
                        </tr>
                        <tr>
                            <td class="lt">
                                <table class="TableMain100" cellspacing="12" cellpadding="0" >
                                    <tbody>
                                        <tr>
                                            <td colspan="2" align="right" style="width: 278px">
                                                <asp:FileUpload ID="NSDLSelectFile" runat="server" Width="272px" Height="21px" />
                                            </td>
                                        </tr>
                                        <tr>
                                               <td colspan="2">
                                                  <dxe:ASPxDateEdit ID="dtexec" runat="server" ClientInstanceName="dtexec1" DateOnError="Today"
                                                  EditFormat="Custom" EditFormatString="dd/MM/yyyy" UseMaskBehavior="true" Width="120"><ClientSideEvents ValueChanged="function(s, e){ DateChangeForFrom(dtexec1);}"></ClientSideEvents> </dxe:ASPxDateEdit>
          
                                               </td>
                                         
                                         </tr>
                                        
                                        
                                        <tr>
                                            <td align="right" valign="middle" colspan="2">
                                                <table cellspacing="0" cellpadding="0">
                                                    <tbody>
                                                        <tr>
                                                            <td valign="top" align="left" style="height: 19px">
                                                                <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" 
                                                                    Width="84px" OnClick="BtnSave_Click" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                           <tr>
                                                <td>
                                                    <asp:Label ID="lblTotal" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblInserted" runat="server"></asp:Label>
                                                </td>
                                        </tr>
                                         
                                         <tr>
                                                <td colspan="2">
                                                    <asp:Label ID="lblRejected" runat="server"></asp:Label>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table id="tabRejectExp" runat="Server" cellspacing="0" cellpadding="0">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                Export the rejected records
                                                            </td>
                                                            <td valign="top" align="right" style="height: 19px">
                                                                <asp:Button ID="btnExport" runat="server" Text="Export" CssClass="btn" 
                                                                    Width="84px" OnClick="btnExport_Click" />
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
