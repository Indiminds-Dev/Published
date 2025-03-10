<%@ page language="C#" autoeventwireup="true" inherits="management_frm_OpeningBalanceSubAcWC, App_Web_5zwtjf_c" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <script type="text/javascript">
 function OnCloseButtonClick(s, e)
   {
        e.processOnServer = false;
        var parentWindow = window.parent;
        parent.window.popup.Hide();

    }
    </script>

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

    <form id="form1" runat="server">
        <div style="border-left-color: inactivecaption; border-bottom-color: inactivecaption; border-top-style: solid; border-top-color: inactivecaption; border-right-style: solid; border-left-style: solid; border-right-color: inactivecaption; border-bottom-style: solid" >
        <asp:HiddenField  ID="hdnStatus" runat="server" />
        <asp:HiddenField  ID="hdnSubAcCode" runat="server" />
            <table class="TableMain100" id="maintransation">
                <tr>
                    <td class="Ecoheadtxt" style="width: 118px">
                        Company :
                    </td>
                    <td style="width: 173px">
                        <dxe:ASPxComboBox ID="cmbCompany" runat="server" DataSourceID="dsCompany" ValueType="System.String" 
                            ValueField="COMPANYID" TextField="COMPANYNAME" EnableIncrementalFiltering="True">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) { clientinstSegment.PerformCallback(s.GetValue());}" />
                        </dxe:ASPxComboBox>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td class="Ecoheadtxt" style="width: 118px">
                        Segemnt :
                    </td>
                    <td style="width: 173px">
                        <dxe:ASPxComboBox ID="cmbSegment" runat="server" DataSourceID="SelectSegment" ValueType="System.String"
                            ValueField="SEGMENTID" TextField="EXCHANGENAME" EnableIncrementalFiltering="true"
                            ClientInstanceName="clientinstSegment">
                        </dxe:ASPxComboBox>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td class="Ecoheadtxt" style="width: 118px">
                        Branch :
                    </td>
                    <td colspan="2" style="text-align: left">
                        <dxe:ASPxComboBox ID="cmbBranch" runat="server" DataSourceID="dsBranch" ValueType="System.String" 
                            ValueField="BANKBRANCH_ID" TextField="BANKBRANCH_NAME" EnableIncrementalFiltering="true">
                        </dxe:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="Ecoheadtxt" style="width: 118px">
                        Opening DR :
                    </td>
                    <td style="width: 173px">
                        <dxe:ASPxTextBox ID="DRopening" runat="server" Width="170px">
                            <MaskSettings Mask="<Rs. |*Rs. ><0..999999999g>.<00..99>" IncludeLiterals="DecimalSymbol"
                                ErrorText="None" />
                        </dxe:ASPxTextBox>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td class="Ecoheadtxt" style="width: 118px; height: 26px;">
                        Opening CR :
                    </td>
                    <td style="width: 173px; height: 26px;">
                        <dxe:ASPxTextBox ID="CRopening" runat="server" Width="170px">
                            <MaskSettings Mask="<Rs. |*Rs. ><0..999999999g>.<00..99>" IncludeLiterals="DecimalSymbol"
                                ErrorText="None" />
                        </dxe:ASPxTextBox>
                    </td>
                    <td style="height: 26px">
                    </td>
                </tr>
                
                <tr>
                    <td valign="top" style="width: 118px; text-align: right;">
                        
                    </td>
                    <td style="width: 173px; text-align: right;">
                        <table>
                            <tr>
                                <td>
                                    <dxe:ASPxButton ID="Button1" runat="server" AutoPostBack="false" Text="Update" OnClick="Button1_Click"
                                        VerticalAlign="Bottom">
                                    </dxe:ASPxButton>
                                </td>
                                <td>
                                    <dxe:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="false" Text="Cancel"
                                        VerticalAlign="Bottom">
                                        <ClientSideEvents Click="OnCloseButtonClick" />
                                    </dxe:ASPxButton>
                                </td>
                            </tr>
                        </table>
                        
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="dsBranch" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" ConflictDetection="CompareAllValues"
                SelectCommand="">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsCompany" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="SELECT COMP.CMP_INTERNALID AS COMPANYID , COMP.CMP_NAME AS COMPANYNAME  FROM TBL_MASTER_COMPANY AS COMP">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SelectSegment" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" ConflictDetection="CompareAllValues"
                SelectCommand="">
                <%--<SelectParameters>
                    <asp:Parameter Name="COMPANYID" Type="string" />
                </SelectParameters>--%>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>


