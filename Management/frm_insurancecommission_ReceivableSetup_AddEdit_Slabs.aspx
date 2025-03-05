<%@ page language="C#" autoeventwireup="true" inherits="management_frm_insurancecommission_ReceivableSetup_AddEdit_Slabs, App_Web_ng-agpzn" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Insurance Commission Slabs</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript"> 
    function Page_Load(obj)
    {
        QueryID=obj;
        var txt=document.getElementById("txtSlabCode");
        txt.focus();
    }
    function upper(ustr) 
    { 
        var str=ustr.value; 
        ustr.value=str.toUpperCase(); 
    } 
    function Showdata()
    {
        grid.PerformCallback();
    }
    function OnGridSelectionChanged() 
    {
//        var noofrow=grid.GetSelectedRowCount().toString();
//        alert(noofrow);
        grid.GetSelectedFieldValues('InsCommissionSlab_Code', OnGridSelectionComplete);
    }
    function OnGridSelectionComplete(values) 
    {
        if(QueryID=='C')
        {
            parent.document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCommissionRate").value='';
            parent.document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_TextBox1").value=values;
            parent.document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtStaxCommission").focus();
        }
        else if(QueryID=='O')
        {
            parent.document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtORCrate").value='';
            parent.document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_TextBox2").value=values;
            parent.document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtServieceTax").focus();
        }
        else if(QueryID=='T')
        {
            parent.document.getElementById("txtRate").value='';
            parent.document.getElementById("txtTrailSlab").value=values;
            parent.document.getElementById("Slab").value=values;
            parent.document.getElementById("txtTrailStax").focus();
            parent.editwins.close();
        }
        parent.editwin.close();
    }
    function Cancel_click()
    {
        if(QueryID=='C')
        {
            parent.document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtStaxCommission").focus();
        }
        else if(QueryID=='O')
        {
            parent.document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtServieceTax").focus();
        }
        else if(QueryID=='T')
        {
            parent.document.getElementById("txtTrailStax").focus();
            parent.editwins.close();
        }
        parent.editwin.close();
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td class="gridcellleft">
                                <span class="Ecoheadtxt" style="color: Blue"><strong>Slab Code:</strong></span>
                            </td>
                            <td class="gridcellleft">
                                <asp:TextBox ID="txtSlabCode" runat="server" MaxLength="4" Width="50px" onkeyup="upper(this)"></asp:TextBox></td>
                            <td class="gridcellleft">
                                <span class="Ecoheadtxt" style="color: Blue"><strong>Slab name<span style="color:Red">*</span>:</strong></span></td>
                            <td class="gridcellleft">
                                <asp:TextBox ID="txtNotes" runat="server" Width="352px"></asp:TextBox>
                            </td>
                            <td class="gridcellleft">
                                <input id="btnShow" type="button" value="Show" class="btnUpdate" style="height: 20px"
                                    onclick="Showdata();" />
                                <input id="btncancel" type="button" value="Cancel" class="btnUpdate" style="height: 20px"
                                    onclick="Cancel_click()" />
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft" colspan="5">
                                <span class="Ecoheadtxt" style="color: Blue"><span style="color: red">*</span><span
                                    style="color: Green">Use comma(,) to separate keywords to be searched.</span></span><span
                                        style="color:Green"> </span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft">
                    <dxwgv:ASPxGridView ID="grdslab" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
                        KeyFieldName="InsCommissionSlab_Code" OnCustomCallback="GridMessage_CustomCallback"
                        Width="100%">
                        <Styles>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                        </Styles>
                        <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <ClientSideEvents SelectionChanged="function(s, e) { OnGridSelectionChanged(); }" />
                        <Columns>
                            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width="3%">
                                <HeaderStyle HorizontalAlign="Center">
                                    <Paddings PaddingBottom="1px" PaddingTop="1px" />
                                </HeaderStyle>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="InsCommissionSlab_Code" Caption="Code" VisibleIndex="1">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="InsCommissionSlab_Type" Caption="Type" VisibleIndex="2">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="PPT" FieldName="PPT" VisibleIndex="3">
                                <EditFormSettings Visible="False" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Min" FieldName="min" VisibleIndex="4">
                                <EditFormSettings Visible="False" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="max" Caption="Max" VisibleIndex="5">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                                <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Flat Rate" FieldName="InsCommissionSlab_FixedAmount"
                                VisibleIndex="6">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                                <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="InsCommissionSlab_Rate" Caption=" Min.Charge"
                                VisibleIndex="7">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                                <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="InsCommissionSlab_ORC" Caption="ORC(%)"
                                VisibleIndex="7">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                                <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="InsCommissionSlab_Notes" Caption="Slab name"
                                VisibleIndex="8">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Left">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
                        <Templates>
                            <DetailRow>
                                <dxwgv:ASPxGridView ID="BrokerageSlabGrid" runat="server" KeyFieldName="InsCommissionSlab_ID"
                                    AutoGenerateColumns="False" DataSourceID="BrokerageSlabDataSource" Width="100%"
                                    ClientInstanceName="gridDetail" OnBeforePerformDataSelect="BrokerageSlabGrid_BeforePerformDataSelect">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="PPT" FieldName="PPT" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle HorizontalAlign="Right">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Min" FieldName="min" VisibleIndex="1">
                                            <EditFormSettings Visible="False" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle HorizontalAlign="Right">
                                            </EditFormCaptionStyle>
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="max" Caption="Max" VisibleIndex="2">
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle HorizontalAlign="Right">
                                            </EditFormCaptionStyle>
                                            <EditFormSettings Visible="False" />
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Flat Rate" FieldName="InsCommissionSlab_FixedAmount"
                                            VisibleIndex="3">
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle HorizontalAlign="Right">
                                            </EditFormCaptionStyle>
                                            <EditFormSettings Visible="False" />
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="InsCommissionSlab_Rate" Caption=" Min.Charge"
                                            VisibleIndex="4">
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle HorizontalAlign="Right">
                                            </EditFormCaptionStyle>
                                            <EditFormSettings Visible="False" />
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="InsCommissionSlab_ORC" Caption="ORC(%)"
                                            VisibleIndex="4">
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle HorizontalAlign="Right">
                                            </EditFormCaptionStyle>
                                            <EditFormSettings Visible="False" />
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <Styles>
                                        <LoadingPanel ImageSpacing="10px">
                                        </LoadingPanel>
                                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                        </Header>
                                    </Styles>
                                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" AllowSort="False" />
                                    <SettingsPager ShowSeparators="True" NumericButtonCount="20" PageSize="30">
                                        <FirstPageButton Visible="True">
                                        </FirstPageButton>
                                        <LastPageButton Visible="True">
                                        </LastPageButton>
                                    </SettingsPager>
                                </dxwgv:ASPxGridView>
                                <asp:SqlDataSource ID="BrokerageSlabDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                    SelectCommand="SELECT [InsCommissionSlab_ID],cast(InsCommissionSlab_MinPPT as varchar)+'-'+ cast(InsCommissionSlab_MaxPPT as varchar) as PPT, InsCommissionSlab_MinAmount as min,InsCommissionSlab_MaxAmount as max,[InsCommissionSlab_Rate],[InsCommissionSlab_FixedAmount],InsCommissionSlab_ORC from Master_InsCommissionSlab where InsCommissionSlab_Code=@code and InsCommissionSlab_Type=@type  order by InsCommissionSlab_Code,InsCommissionSlab_ID ">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="code" SessionField="KeyVal_InternalID" Type="String" />
                                        <asp:QueryStringParameter Name="type" QueryStringField="type" Type="string" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </DetailRow>
                        </Templates>
                        <SettingsText EmptyDataRow="No Data To Display" />
                        <SettingsBehavior AllowFocusedRow="True" />
                    </dxwgv:ASPxGridView>
                    
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
