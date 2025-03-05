<%@ page language="C#" autoeventwireup="true" inherits="management_IFSCMargin, App_Web_0payuukt" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>IFSC Margin</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script language="javascript" type="text/javascript">
     function Page_Load(obj)///Call Into Page Load
      { 
           height();
           Hide('tr_Adhoc');
           Hide('tr_date');
           document.getElementById('lblEg').innerHTML='EG: G_Sn_MG13_MemberCode_DDMMYYYY.LIS';
           selecttion();
      }
   function height()
    {
        if(document.body.scrollHeight>=350)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '350px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
    function fnddlGeneration(obj)
     {
       if(obj=='0')
       {
         Hide('tr_Adhoc');
         Hide('tr_date');
         document.getElementById('lblEg').innerHTML='EG: G_Sn_MG13_MemberCode_DDMMYYYY.LIS';
       }
       else
       {
        Show('tr_Adhoc');
        Show ('tr_date');
        document.getElementById('lblEg').innerHTML='';
       }
     }  
   function AllowNumericOnly(e)
    {
        var keycode;
        if (window.event) keycode = window.event.keyCode;
        else if (event) keycode = event.keyCode;
        else if(e) keycode = e.which;
        else return true;
        if( (keycode > 47 && keycode <= 57) )
        {
          return true;
        }
        else
        {
          return false;
        }
      return true;  
    }
function selecttion()
        {
            var combo=document.getElementById('cmbFileType');
            combo.value='0';
        }  
    
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panelmain" runat="server" HorizontalAlign="Center" Style="z-index: 100;
            left: 301px; position: absolute; top: 3px" Visible="true">
            <table id="tbl_main" cellpadding="0" cellspacing="0" class="login" width="410" style="border: solid 1px blue">
                <tbody>
                    <tr>
                        <td class="EHEADER">
                            <span style="color: blue"><strong>IFSC Margin</strong></span></td>
                    </tr>
                    <tr>
                        <td class="lt">
                            <table cellpadding="0" cellspacing="12" class="TableMain100">
                                <tbody>
                                     <tr>
                                        <td>
                                            <asp:DropDownList ID="cmbFileType" runat="server" Width="265px" onchange="fnddlGeneration(this.value)">
                                                <asp:ListItem Value="0">Exchange Margin File </asp:ListItem>
                                                <%--<asp:ListItem Value="1">FT Margin File</asp:ListItem>--%>
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr><td>
                                        <div id="lblEg">
                                        </div>
                                    </td></tr>
                                    <tr>
                                    <td>
                                      <table>
                                            <tr valign="top" id="tr_date">
                                                <td style="height: 36px; width: 32px;">
                                                    <b>DATE</b></td>
                                                <td style="height: 36px">
                                                    <dxe:ASPxDateEdit ID="dtfor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                        Font-Size="10px" Width="120px" ClientInstanceName="dtfor">
                                                        <DropDownButton Text="For">
                                                        </DropDownButton>
                                                    </dxe:ASPxDateEdit>
                                                </td>

                                            </tr>
                                     
                                        </table>
                                    </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:FileUpload ID="IFSCMarginSelectFile" runat="server" Height="21px" Width="272px" />
                                        </td>
                                    </tr>
                                     <tr id="tr_Adhoc" runat="server">
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                Add Adhoc Margin In % 
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtAdhoc" runat="server" Width="75px" onkeypress="return AllowNumericOnly(this);"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    </td>
                                                </tr>
                                    <tr>
                                        <td colspan="2" valign="middle">
                                            <table cellpadding="0" cellspacing="0">
                                                <tbody>
                                                    <tr>
                                                        <td>
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
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
