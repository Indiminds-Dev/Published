<%@ page language="C#" autoeventwireup="true" inherits="management_frm_EmailBook, App_Web_psdiigfa" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dxdv" %>
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
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=650)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '650px';
        window.frameElement.Width = document.body.scrollWidth;
    }
     </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <script type="text/javascript" language="javascript">
    var contType='';
    var addType = '';
    function CallMethode()
        {
            document.getElementById("TrMasterEmail").style.display = 'inline';
            gridEmailMain.PerformCallback();
        }
    function AddressPrint(btnId)
    {
        var myArray = btnId.split("_");
        var tblId= "gridEmailMain_"+myArray[3]+"_SubGridMails_"+myArray[5]+"_0_tblEmailDetails";
        var tbl=document.getElementById(tblId);
        //gridEmailMain_dxdt9_SubGridMails_cell0_0_btnPrint
        //ref id Aspx_ContactMasterGrid_dxdt2_ASPx_AddDetails_cell0_0_btnPrint
        var disp_setting="toolbar=yes,location=no,directories=no,menubar=no,"; 
          disp_setting+="scrollbars=yes,width=200, height=100, left=100, top=25"; 
        var docprint=window.open("","",disp_setting);
        docprint.document.open();
        var content_vlue = tbl.innerHTML;
        docprint.document.write('<html><head><title></title>'); 
        docprint.document.write('</head><body onLoad="self.print()"><center><table width="100%" border="0">');          
        docprint.document.write(content_vlue);
        docprint.document.write('</center></table></body></html>'); 
        docprint.document.close(); 
        docprint.focus();
        
    }
    </script>

    <table  class="TableMain100">
        <tr>
            <td class="EHEADER" colspan="0" style="text-align:center;">
                <strong><span style="color: #000099">Email List Book</span></strong>
            </td>
        </tr>
        <tr>
            <td align="center">
                <dxe:ASPxComboBox ID="cmbSearchType" runat="server" 
                     Font-Size="10px" 
                    ValueType="System.String" EnableIncrementalFiltering="True">
                    <Items>
                        <dxe:ListEditItem Text="Single Search" Value="1" />
                        <dxe:ListEditItem Text="Bulk Search" Value="2" />
                        <dxe:ListEditItem Text="List All" Value="3" />
                    </Items>
                    <ButtonStyle Width="13px">
                    </ButtonStyle>
                    <DropDownButton Text="SearchType" ToolTip="Asking you for Email Book search type"
                        Width="50px">
                    </DropDownButton>
                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	FnHideShow(s);
}" />
                </dxe:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="gridcellleft">
                <table id="tblSingle" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="gridcellright" valign="top" style="height: 42px">
                            Find By :</td>
                        <td class="gridcellleft" valign="top" style="height: 42px">
                            <asp:TextBox ID="txtKeyWord" runat="server" Font-Size="11px" Width="252px"></asp:TextBox>
                        </td>
                        <td class="gridcellright" valign="top" style="height: 42px">
                            Filter Type:
                        </td>
                        <td class="gridcellleft" valign="top" style="height: 42px">
                            <asp:DropDownList ID="drpFilterType" runat="server">
                                <asp:ListItem Text="Name" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Short Name/UCC_Code" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="gridcellleft" valign="top" style="height: 42px">
                            <dxe:ASPxCheckBox ID="AspxChkWhole" runat="server" Text="Find whole words only.">
                            </dxe:ASPxCheckBox>
                        </td>
                        <td class="gridcellleft" valign="top" style="height: 42px">
                            <input type="button" id="btnFind" onclick="CallMethode();" class="btnUpdate" value="Find" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td id="TrMasterEmail">
                <dxwgv:ASPxGridView ID="gridEmailMain" runat="server" AutoGenerateColumns="False"
                     ClientInstanceName="gridEmailMain"
                    DataSourceID="DataSourceContactMaster"  Width="100%"
                    KeyFieldName="cnt_internalId" OnCustomCallback="gridEmailMain_CustomCallback">
                    <Styles  >
                        <Header SortingImageSpacing="5px" ImageSpacing="5px">
                        </Header>
                        <Cell HorizontalAlign="Left">
                        </Cell>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                    </Styles>
                    <Columns>
                        <dxwgv:GridViewDataTextColumn Caption="Name" FieldName="UserName" VisibleIndex="0"
                            Width="250px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Code" FieldName="cnt_shortName" VisibleIndex="1">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                        <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="True"></SettingsDetail>
                    <Templates>
                        <DetailRow>
                            <dxwgv:ASPxGridView ID="SubGridMails" KeyFieldName="eml_id" runat="server" DataSourceID="SqlDataSourceEmails"
                                 
                                OnLoad="SubGridMails_Load" Width="100%">
                                <Styles  >
                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                    </Header>
                                    <LoadingPanel ImageSpacing="10px">
                                    </LoadingPanel>
                                </Styles>
                              
                                <Columns>
                                    <dxwgv:GridViewDataDateColumn Caption="Email Details" VisibleIndex="0">
                                        <DataItemTemplate>
                                            <table border="0" class="TableMain2" id="tblEmailList" runat="server" cellpadding="0"
                                                cellspacing="0">
                                                <tr>
                                                    <td class="gridcellright" valign="top" style="width: 200px">
                                                        <span class="Ecoheadtxt" style="color: Blue"><strong>
                                                            <%# Eval("eml_type")%>
                                                        </strong></span>
                                                    </td>
                                                    <td colspan="4" class="gridcellleft" rowspan="2" style="width: 300px">
                                                        <table border="0" class="TableMain2" id="tblEmailDetails" runat="server" cellpadding="0"
                                                            cellspacing="0" style="padding-right: 2px; padding-left: 2px; padding-bottom: 2px;
                                                            padding-top: 2px;">
                                                            <tr>
                                                                <td colspan="3" class="gridcellleft">
                                                                    <%# Eval("eml_email")%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3" class="gridcellleft">
                                                                    <%# Eval("eml_ccEmail")%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3" class="gridcellleft">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td class="gridcellleft" valign="top" style="width: 80px">
                                                        <span class="Ecoheadtxt" style="color: Blue"><strong><a id="btnPrint" href="#" onclick="javascript:AddressPrint(this.id);"
                                                            runat="server">Print</a></strong></span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </DataItemTemplate>
                                        <EditCellStyle HorizontalAlign="Left">
                                        </EditCellStyle>
                                    </dxwgv:GridViewDataDateColumn>
                                </Columns>
                                <StylesEditors>
                                    <ProgressBar Height="25px">
                                    </ProgressBar>
                                </StylesEditors>
                                <SettingsPager Mode="ShowAllRecords" PageSize="20">
                                </SettingsPager>
                                <SettingsDetail AllowOnlyOneMasterRowExpanded="True" IsDetailGrid="True" />
                            </dxwgv:ASPxGridView>
                        </DetailRow>
                    </Templates>
                    <SettingsPager PageSize="20">
                        <FirstPageButton Visible="True">
                        </FirstPageButton>
                        <LastPageButton Visible="True">
                        </LastPageButton>
                    </SettingsPager>
                </dxwgv:ASPxGridView>
            </td>
        </tr>
        
    </table>
    <asp:SqlDataSource ID="DataSourceContactMaster" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceEmails" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
    </asp:SqlDataSource>

    <script language="ecmascript" type="text/ecmascript">
    function FnHideShow(cmbSearch)
        {
            if(cmbSearch.GetValue().toString() == "1")
            {
                document.getElementById("tblSingle").style.display = 'inline';
                document.getElementById("TrMasterEmail").style.display = 'inline';
            }
            else if(cmbSearch.GetValue().toString() == "2")
            {
                document.getElementById("tblSingle").style.display = 'none';
                document.getElementById("TrMasterEmail").style.display = 'none';
                var docprint1=window.open('frm_EmailList_Bulk_Print.aspx','50','height=500px,width=800px,scrollbars=yes,location=yes');
                return false;
            }
            else
            {
                document.getElementById("tblSingle").style.display = 'none';
                document.getElementById("TrMasterEmail").style.display = 'none';
                var docprint1=window.open('frm_EmailBook_list.aspx','50','height=500px,width=800px,scrollbars=yes,location=yes');
                return false;
            }
        }
    </script>
    </form>
</body>
</html>
