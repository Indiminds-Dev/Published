<%@ page language="C#" autoeventwireup="true" inherits="management_frmrfa, App_Web_6_wayyot" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script language="javascript" type="text/javascript">
         function SignOff()
            {
            window.parent.SignOff()
            }
        function height()
            {
                window.frameElement.height = document.body.scrollHeight;
                window.frameElement.widht = document.body.scrollWidht;
            }
   </script>
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
   <script language="javascript" type="text/javascript">
            function OnGridFocusedRowChanged() {
                // Query the server for the Row ID "rfa_id" fields from the focused row 
                // The values will be returned to the OnGetRowValues() function 
                grid.GetRowValues(grid.GetFocusedRowIndex(), 'rtd_reqnumber', OnGetRowValues);
            }
            //Value array contains Row ID "rfa_id" field values returned from the server 
            function OnGetRowValues(values) {
                RowID = values;
            }
            function btnHistory_Click()
            {
                document.getElementById("TdGrid").style.display = 'inline';   
                document.getElementById("TrCategory").style.display = 'inline';   
                document.getElementById("tdGMain").style.display = 'inline';   
                document.getElementById("tdGSub").style.display = 'inline';   
                document.getElementById("TdReq").style.display = 'none';   
                grid1.PerformCallback(RowID);
            }
            function Rfa_Template()
            {
                frmOpenNewWindow_custom('frmshowtemplate_rfa.aspx?tem_id='+ window.document.aspnetForm.lst_templates.options[window.document.aspnetForm.lst_templates.selectedIndex].value,'250','1000','200','0');
            }
            function frmOpenNewWindow_custom(location,v_height,v_weight,top,left)
            {   
                window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ top +",left="+ left +",location=no,directories=no,menubar=no,toolbar=no,status=no,scrollbars=yes,resizable=no,dependent=no'");       
            } 
            function GridBind()
            {
                var cmb = document.getElementById("lst_requestcategory");
                grid.PerformCallback(cmb.value);
            }
            function btnRequest_Click()
            {
                document.getElementById("TdGrid").style.display = 'none';   
                document.getElementById("TdReq").style.display = 'inline';   
            }
            function btnStatus_Click()
            {
                document.getElementById("TdGrid").style.display = 'inline';   
                document.getElementById("TrCategory").style.display = 'inline';   
                document.getElementById("tdGMain").style.display = 'inline';   
                document.getElementById("tdGSub").style.display = 'none';   
                document.getElementById("TdReq").style.display = 'none';   
            }
            function btnCancel_Click()
            {
                document.getElementById("TdGrid").style.display = 'inline';   
                document.getElementById("TrCategory").style.display = 'inline';   
                document.getElementById("tdGMain").style.display = 'inline';   
                document.getElementById("tdGSub").style.display = 'none';   
                document.getElementById("TdReq").style.display = 'none';   
            }
        </script>
        <script type="text/ecmascript">
            function btnSave_Click()
            {
                var data = 'Save';
                var cmb = document.getElementById("txt_content");
                data+='~'+cmb.value;
                cmb = document.getElementById("lst_templates");
                data+='~'+cmb.value;
                cmb = document.getElementById("HREC");
                data+='~'+cmb.value;
                CallServer(data, "");
                grid.PerformCallback();
                document.getElementById("TdGrid").style.display = 'inline';   
                document.getElementById("TrCategory").style.display = 'inline';   
                document.getElementById("tdGMain").style.display = 'inline';   
                document.getElementById("tdGSub").style.display = 'none';   
                document.getElementById("TdReq").style.display = 'none';   
            }
            function ReceiveServerData(rValue)
            {
                var DATA=rValue.split('~');
                if(DATA[0]=="Save")
                {    
                    if(DATA[1]="Y")
                    alert('Update Successfully!');
                }
            }
        </script>
    <table  class="TableMain100">
        <tr>
           <td class="EHEADER" colspan="2" style="text-align:center;">Outgoing RFAs</td>                
        </tr>
        <tr>
            <td style="text-align:left; vertical-align:top" width="10%">
                <table>
                    <tr>
                        <td>
                            <input id="btnRequest" type="button" value="Request" class="btnUpdate" onclick="btnRequest_Click()" style="width: 71px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input id="btnStatus" type="button" value="Status" class="btnUpdate" onclick="btnStatus_Click()" style="width: 71px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input id="btnHistory" type="button" value="History" class="btnUpdate" onclick="btnHistory_Click()" style="width: 71px" />
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table class="TableMain100">
                    <tr>
                        <td id="TdGrid">
                            <table class="TableMain100">
                                <tr id="TrCategory">
                                    <td style="width: 20%; text-align: right;">
                                        <span class="Ecoheadtxt" >Select Request Category  :</span>
                                    </td>
                                    <td class="gridcellleft">
                                        <asp:DropDownList ID="lst_requestcategory" runat="server" Width="116px">
                                            <asp:ListItem Value="0">Unread</asp:ListItem>
                                            <asp:ListItem Value="1">Pendding</asp:ListItem>
                                            <asp:ListItem Value="2">Approved</asp:ListItem>
                                            <asp:ListItem Value="3">Rejected</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" id="tdGMain">
                                        <dxwgv:ASPxGridView ID="grd_request" ClientInstanceName="grid" KeyFieldName="rtd_reqnumber" runat="server" Width="100%" OnCustomCallback="grd_request_CustomCallback">
                                            <Styles>
                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                </Header>
                                                <LoadingPanel ImageSpacing="10px">
                                                </LoadingPanel>
                                            </Styles>
                                               <Columns>
                                                <dxwgv:GridViewDataTextColumn FieldName="rtd_reqnumber" Visible="False" VisibleIndex="0">
                                                     <CellStyle CssClass="gridcellleft">
                                                     </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Request Id" Caption="Short Name" VisibleIndex="0">
                                                     <CellStyle CssClass="gridcellleft">
                                                     </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="current Approver" Caption="Current Approver" VisibleIndex="1">
                                                     <CellStyle CssClass="gridcellleft">
                                                     </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="current Status" Caption="Current Status" VisibleIndex="2">
                                                     <CellStyle CssClass="gridcellleft">
                                                     </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="current Note" Caption="Current Note" VisibleIndex="3">
                                                     <CellStyle CssClass="gridcellleft">
                                                     </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Approval No" Caption="Approval No" VisibleIndex="4">
                                                     <CellStyle CssClass="gridcellleft">
                                                     </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="mesage" Caption="Message" VisibleIndex="5">
                                                     <CellStyle CssClass="gridcellleft">
                                                     </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                            </Columns>
                                            <StylesEditors>
                                                <ProgressBar Height="25px">
                                                </ProgressBar>
                                            </StylesEditors>
                                            <SettingsBehavior AllowFocusedRow="True" AllowSort="False" />
                                            <ClientSideEvents FocusedRowChanged="function(s, e) { OnGridFocusedRowChanged(); }"/>
                                            <SettingsPager ShowSeparators="True">
                                                <FirstPageButton Visible="True">
                                                </FirstPageButton>
                                                <LastPageButton Visible="True">
                                                </LastPageButton>
                                            </SettingsPager>
                                        </dxwgv:ASPxGridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" id="tdGSub">
                                        <dxwgv:ASPxGridView ID="grd_reqhistory" runat="server" Width="100%" ClientInstanceName="grid1" OnCustomCallback="grd_reqhistory_CustomCallback">
                                            <Styles>
                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                </Header>
                                                <LoadingPanel ImageSpacing="10px">
                                                </LoadingPanel>
                                            </Styles>
                                            <StylesEditors>
                                                <ProgressBar Height="25px">
                                                </ProgressBar>
                                            </StylesEditors>
                                            <Columns>
                                                <dxwgv:GridViewDataTextColumn FieldName="ID" Caption="ID" VisibleIndex="0">
                                                     <CellStyle CssClass="gridcellleft">
                                                     </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Approver Name" Caption="Approver Name" VisibleIndex="1">
                                                     <CellStyle CssClass="gridcellleft">
                                                     </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Read Date" Caption="Read Date" VisibleIndex="2">
                                                     <CellStyle CssClass="gridcellleft">
                                                     </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Previous Status" Caption="Status" VisibleIndex="3">
                                                     <CellStyle CssClass="gridcellleft">
                                                     </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Note" Caption="Note" VisibleIndex="4">
                                                     <CellStyle CssClass="gridcellleft">
                                                     </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Next Approver" Caption="Next Approver" VisibleIndex="5">
                                                     <CellStyle CssClass="gridcellleft">
                                                     </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsPager ShowSeparators="True">
                                                <FirstPageButton Visible="True">
                                                </FirstPageButton>
                                                <LastPageButton Visible="True">
                                                </LastPageButton>
                                            </SettingsPager>
                                        </dxwgv:ASPxGridView>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td id="TdReq">
                            <table class="TableMain100">
                                <tr>
                                    <td style="width: 197px; text-align: right;">
                                        <span class="Ecoheadtxt" >Select Template For Request :</span>
                                    </td>
                                    <td class="gridcellleft">
                                        <asp:DropDownList ID="lst_templates" runat="server" Width="271px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 197px; text-align: right;">
                                        <span class="Ecoheadtxt" >Content :</span>
                                    </td>
                                    <td class="gridcellleft">
                                        <asp:TextBox ID="txt_content" runat="server" TextMode="MultiLine" Height="54px" Width="265px"></asp:TextBox>
                                        <asp:HiddenField ID="HREC" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td style="text-align:left">
                                        <input id="btnSave" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()" style="width: 71px" />
                                        <input id="btnCancel" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_Click()" style="width: 71px" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
