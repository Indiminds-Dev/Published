<%@ page language="C#" autoeventwireup="true" inherits="management_frm_AuthorizeHighValueSlips, App_Web_0jwcfgzk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Authorize High Value/Dormant Ac Slips</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script language="javascript" type="text/javascript">
       function SignOff()
       {
        window.parent.SignOff()
       }
       function height()
       {
       if(document.body.scrollHeight>=600)
        window.frameElement.height = document.body.scrollHeight;
       else
        window.frameElement.height = '600px';
        window.frameElement.Width = document.body.scrollWidth;
       }   
    </script>
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <table width="95%" border="1">
             <tr>
                 <td>
                 <div class="EHEADER" style="text-align: center">
                                         <strong><span id="Span1" style="color: #000099">Authorize High Value/Dormant Ac
                        Slip(s)</span></strong>&nbsp;</div>
                </td>
             </tr>
             <tr>
                 <td>
                 
                     <table border="1">
                         <tr>
                             <td style="width: 20%; vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                         <dxe:ASPxDateEdit ID="DtTranDate" runat="server" ClientInstanceName="cDtTranDate"
                             DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                             Width="200px" OnValueChanged="DtTranDate_ValueChanged">
                             <DropDownButton Text="Transaction Date From">
                             </DropDownButton>
                         </dxe:ASPxDateEdit>
                             </td>
                             <td style="width: 20%; vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                         <dxe:ASPxDateEdit ID="DtTranDateTo" runat="server" ClientInstanceName="cDtTranDateTo"
                             DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                             Width="200px" OnValueChanged="DtTranDate_ValueChanged">
                             <DropDownButton Text="Transaction Date To">
                             </DropDownButton>
                         </dxe:ASPxDateEdit>
                             </td>
                             <td style="width: 100px" valign="top">
                         <asp:Button ID="btnshow1" Text="Show" runat="server" CssClass="btn" /></td>
                         </tr>
                     </table>
                 </td>
             </tr>
                <tr>
                    <td>
                       
                            
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                  <dxwgv:ASPxGridView ID="GvAuthRecord" ClientInstanceName="cGvAuthRecord" runat="server"
                        KeyFieldName="ClientId" AutoGenerateColumns="False" Width="1150px" OnCustomButtonCallback="GvAuthRecord_CustomButtonCallback" OnHtmlCommandCellPrepared="GvAuthRecord_HtmlCommandCellPrepared" OnHtmlRowCreated="GvAuthRecord_HtmlRowCreated">
                        <Columns>
                            <dxwgv:GridViewCommandColumn VisibleIndex="0" FixedStyle="Left" Width="10px">
                                <CellStyle BackColor="Salmon">
                                </CellStyle>
                                <CustomButtons>
                                    <dxwgv:GridViewCommandColumnCustomButton ID="CustomBtnAuthSlip" Text="Authorize Slip">
                                    </dxwgv:GridViewCommandColumnCustomButton>
                                </CustomButtons>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="SlipNumber" VisibleIndex="1" Width="75px" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
                            <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataColumn FieldName="ClientId" VisibleIndex="2" Width="75px">
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="TotalValue" VisibleIndex="3" Width="75px">
                                <CellStyle Wrap="False" >
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="AuthorizedBy" VisibleIndex="4" 
                                Width="150px">
                                <CellStyle Wrap="False" >
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="Status" VisibleIndex="5" Width="50px">
                                <CellStyle Wrap="False" >
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="PendingAuthorization" Caption="Pend.Auth." VisibleIndex="6" Width="50px">
                               <CellStyle Wrap="False" >
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="IsAlreadyAuthorized" Caption="IsAlreadyAuth." VisibleIndex="7" Width="50px">
                               <CellStyle Wrap="False" >
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="BatchNumber" VisibleIndex="8" Width="50px">
                               <CellStyle Wrap="False" >
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="BatchExprotedDateTime" Caption="BatchExp.DateTime" VisibleIndex="9" Width="50px">
                               <CellStyle Wrap="False" >
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="ExportedStatus" Caption="Exp.Status" VisibleIndex="10" Width="50px">
                               <CellStyle Wrap="False" >
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Settings ShowGroupPanel="True" ShowHorizontalScrollBar="True" />
                        <Styles>
                            <FocusedRow HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FCA977"></FocusedRow>
                            <AlternatingRow Enabled="True"></AlternatingRow>
                        </Styles>

                    </dxwgv:ASPxGridView>
                  </ContentTemplate>
                </asp:UpdatePanel>  
                                           
                    </td>
                </tr>
            </table>
        </form>
</body></html>
