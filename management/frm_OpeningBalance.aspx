<%@ page language="C#" autoeventwireup="true" inherits="management_frm_OpeningBalance, App_Web_snhbal_j" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

  

    <script type="text/javascript">
function aaa(obj,evt,uid)
{


    evt = (evt) ? evt : event;
    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :((evt.which) ? evt.which : 0));
    if((charCode != 9)&& (charCode != 8))
    {      
             var CurrentTextBox_Value=uid.id.value;
             var CurrentTextBox_id = uid.id;

     
            var txtF_Char=CurrentTextBox_id.charAt(0);
//            alert(txtF_Char);
  

        //This txtF_Char if start Here....
        if(txtF_Char=='L')
        {
                var RespectiveTextBox_id=CurrentTextBox_id.replace(/\L/,"R");
                alert(RespectiveTextBox_id);
        }

        else
        {
        
                var RespectiveTextBox_id=CurrentTextBox_id.replace(/\R/,"L");
               alert(RespectiveTextBox_id);
              var dd=document.getElementById(RespectiveTextBox_id);
              alert(dd);
              alert(dd.);
        }
        
         var respValue=document.getElementById(RespectiveTextBox_id + '_Raw').value;
         var blankvalue='Rs. 0.20';
         if(respValue!='Rs. 0.00')
         {
         alert(at1.GetValue());
        at1.SetValue('000000.00');
        alert(Dtxt2.GetValue());
        Dtxt2.SetValue('11.00');
       var rr='D'+'txt2';
       alert(rr);
       
         }
        

    }

 }
 

    </script>

    <script type="text/javascript">
     function OnCloseButtonClick(s, e)
       {
            e.processOnServer = false;
            var parentWindow = window.parent;
            parentWindow.popup.Hide();

        }
    
    </script>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
            <asp:HiddenField ID="hdnStatus" runat="server" />
            <table border="10" cellpadding="1" cellspacing="1">
                <tr>
                    <td>
                        <table border="10" cellpadding="1" cellspacing="1">
                            <tr>
                                <td class="gridcellleft" bgcolor="#b7ceec">
                                    Company :
                                </td>
                                <td>
                                    <asp:Label ID="lblCompanyName" runat="server" Width="300px"></asp:Label>
                                </td>
                            </tr>
                            </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="10" cellpadding="1" cellspacing="1">
                            <tr>
                                <td class="gridcellleft" bgcolor="#b7ceec">
                                    Segemnt :
                                </td>
                                <td>
                                    <asp:Label ID="lblSegmentName" runat="server" Width="300px"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="10" cellpadding="1" cellspacing="1">
                            <tr>
                                <td class="gridcellleft" bgcolor="#b7ceec">
                                    Branch :
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="cmbBranch" ClientInstanceName="cmbBranch" runat="server" DataSourceID="dsBranch"
                                        ValueType="System.String" AutoPostBack="true" ValueField="BANKBRANCH_ID" TextField="BANKBRANCH_NAME"
                                        EnableIncrementalFiltering="true" EnableSynchronization="False" OnSelectedIndexChanged="cmbBranch_SelectedIndexChanged">
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="10" cellpadding="1" cellspacing="1">
                            <tr>
                                <td class="gridcellleft" bgcolor="#b7ceec">
                                    Opening DR :
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="DRopening" runat="server" Width="170px">
                                        <masksettings mask="<Rs.|*Rs. ><0..999999999g>.<00..99>" includeliterals="DecimalSymbol"
                                            errortext="None" />
                                    </dxe:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="10" cellpadding="1" cellspacing="1">
                            <tr>
                                <td class="gridcellleft" bgcolor="#b7ceec">
                                    Opening CR :
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="CRopening" runat="server" Width="170px">
                                        <masksettings mask="<Rs. |*Rs. ><0..999999999g>.<00..99>" includeliterals="DecimalSymbol"
                                            errortext="None" />
                                    </dxe:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <dxe:ASPxButton ID="Button1" runat="server" AutoPostBack="false" Text="Update" OnClick="Button1_Click"
                                        VerticalAlign="Bottom">
                                    </dxe:ASPxButton>
                                </td>
                                <td>
                                    <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="Cancel" VerticalAlign="Bottom">
                                        <clientsideevents click="OnCloseButtonClick" />
                                    </dxe:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="dsBranch" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" ConflictDetection="CompareAllValues" 
                SelectCommand="">
            </asp:SqlDataSource>
            
        </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </form>
</body>
</html>
