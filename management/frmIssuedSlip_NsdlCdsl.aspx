<%@ page language="C#" autoeventwireup="true" inherits="management_frmIssuedSlip_NsdlCdsl, App_Web_6_wayyot" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
     <script language="javascript" type="text/javascript">
         function ShowHideFilter(obj)
        {
           grid.PerformCallback(obj);
        }
        
     </script>
     
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <div>
                        <table class="TableMain100">
                            <tbody>
                                <tr>
                                    <td id="ShowFilter" width="7%">
                                        <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                            Show Filter</span></a>
                                    </td>
                                    <td id="Td1" width="7%">
                                        <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                            All Records</span></a>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div>
            <dxwgv:ASPxGridView ID="gridSlipIssued" KeyfieldName="DpSlipsUsage_ID" runat="server" AutoGenerateColumns="False" OnCustomCallback="gridSlipIssued_CustomCallback"
            ClientInstanceName="grid"   
             Width="100%">
            <SettingsBehavior AllowFocusedRow="True" />
            <Styles>
                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                </Header>
            </Styles>
            <SettingsPager PageSize="20">
            </SettingsPager>
            

            <Columns>
                <dxwgv:GridViewDataTextColumn Caption="Type" FieldName="dpslipsusage_sLIptype" VisibleIndex="0">
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Slip No" FieldName="dpslipsusage_slipnumber"
                    VisibleIndex="1">
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="dpslipsusage_status"
                    VisibleIndex="2">
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Issue Date" FieldName="dpslipsusage_issuedate"
                    UnboundType="Integer" VisibleIndex="3">
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Used Date" FieldName="dpslipsusage_useddate"
                    UnboundType="Integer" VisibleIndex="4">
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Remarks" FieldName="remarks_reason"
                    UnboundType="Integer" VisibleIndex="5">
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                
              
            </Columns>
            
            <StylesEditors>
                <ProgressBar Height="25px">
                </ProgressBar>
            </StylesEditors>
           
        </dxwgv:ASPxGridView>
        </div>
    </div>
    </form>
</body>
</html>
