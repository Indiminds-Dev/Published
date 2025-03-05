<%@ page language="C#" autoeventwireup="true" inherits="management_frm_insurancecommission_ReceivableSetup_Trail, App_Web_psdiigfa" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trail Add/Modify</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

    <script type="text/javascript" language="javascript">
        function Page_Load(obj)
        {
            if(obj=='Y')
            {
                document.getElementById("SlabEntryPart").style.display='inline';
                document.getElementById("txtTo").focus();
                document.getElementById("txtTo").select();
            }
            else
                document.getElementById("SlabEntryPart").style.display='none';
        }
        function OnCloseClick()
        {
            parent.editwin.close();
        }
        function BindGrid()
        {
            document.getElementById("SlabEntryPart").style.display='none';
            grid.PerformCallback('AllData');
        }
        function ShowSlabs(obj)
        {
            var url='frm_insurancecommission_ReceivableSetup_AddEdit_Slabs.aspx?id='+obj+'&type=R';
            editwins=dhtmlmodal.open("Editbox", "iframe", url, "Commission Slab", "width=750px,height=350px,center=1,resize=0,scrolling=2,top=500", "recal")
            editwins.onclose=function()
            {
            }
        }
        function ShowHideTrailrate()
        {
            var txt=document.getElementById("txtRate");
            if(txt.value=='')
            {
                document.getElementById("txtTrailSlab").disabled=false;
                document.getElementById("HyperLink3").disabled=false;
            }
            else
            {
                document.getElementById("txtTrailSlab").value='';
                document.getElementById("txtTrailSlab").disabled=true;
                document.getElementById("HyperLink3").disabled=true;
            }
        }
        function OnEditClick(obj)
        {
            document.getElementById("SlabEntryPart").style.display='inline';
            document.getElementById("slabid").value=obj;
            document.getElementById("btnEdit").click();
        }
        function OnDelClick(obj)
        {
            if(confirm('Are you sure to Delete this record?'))
            {
                grid.PerformCallback('Delete~'+obj);
            }
        }
        function SetFocus(obj)
        {
            document.getElementById("txtTo").focus();
            document.getElementById("txtTo").select();
            document.getElementById("Slab").value=obj;
            
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="Off">
        <table class="TableMain100">
            <tr>
                <td class="gridcellright">
                    <a href="javascript:void(0);" onclick="OnCloseClick( )"><span style="color: #000099;
                        text-decoration: underline">Close Window</span> </a>
                </td>
            </tr>
            <tr>
                <td class="gridcellcenter" id="SlabEntryPart">
                    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="36000">
                    </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table style="width: 437px; border: solid 1px blue">
                                <tr>
                                    <td class="Ecoheadtxt" style="text-align: left; width: 117px;">
                                        Year From:
                                    </td>
                                    <td class="gridcellleft" style="text-align: left; width: 52px;">
                                        <asp:TextBox ID="txtFrom" runat="server" Width="75px" MaxLength="1" onkeypress="return noNumbers(event)"
                                            TabIndex="1" ReadOnly="true">
                                        </asp:TextBox>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left; width: 58px;">
                                        Year To:
                                    </td>
                                    <td class="gridcellleft" style="text-align: left; width: 112px;">
                                        <asp:TextBox ID="txtTo" runat="server" Width="55px" MaxLength="2" onkeypress="return noNumbers(event)"
                                            TabIndex="2">
                                        </asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Ecoheadtxt" style="text-align: left; width: 117px;">
                                        Trail rate:
                                    </td>
                                    <td class="gridcellleft" style="text-align: left; width: 52px;">
                                        <asp:TextBox ID="txtRate" runat="server" Width="75px" onkeypress="return noNumbers(event)"
                                            TabIndex="3" onkeyup="ShowHideTrailrate()">
                                        </asp:TextBox>
                                    </td>
                                    <td class="Ecoheadtxt" style="text-align: left; width: 58px;">
                                        Trail Slab:
                                    </td>
                                    <td class="gridcellleft" style="text-align: left; width: 112px;">
                                        <asp:TextBox ID="txtTrailSlab" runat="server" onkeyup="ShowSlabs('T')" TabIndex="4"
                                            Width="55px" ReadOnly="true">
                                        </asp:TextBox>
                                        <asp:HyperLink ID="HyperLink3" runat="server" Font-Underline="True" NavigateUrl="javascript:ShowSlabs('T');">Get Code</asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Ecoheadtxt" style="text-align: left; width: 117px;">
                                        Service Tax & Cess<br />
                                        component on Trail(%):
                                    </td>
                                    <td class="gridcellleft" style="text-align: left; width: 52px;">
                                        <asp:TextBox ID="txtTrailStax" runat="server" onkeypress="return noNumbers(event)"
                                            Width="75px" TabIndex="5">
                                        </asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                    </td>
                                    <td class="gridcellright" style="text-align: left; width: 58px;">
                                        <asp:Button ID="Button1" runat="server" Text="Save" Style="width: 60px" TabIndex="6"
                                            class="btnUpdate" OnClick="Button1_Click" />
                                    </td>
                                    <td class="gridcellleft" style="text-align: left; width: 112px;">
                                        <input id="Button4" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_Click()"
                                            style="width: 60px" tabindex="7" />
                                    </td>
                                </tr>
                                <td>
                                </td>
                                    <td style="display: none;">
                                        <asp:Button ID="btnEdit" runat="server" Text="Button" OnClick="btnEdit_Click" />
                                        <asp:HiddenField ID="hdType" runat="server" />
                                        <asp:HiddenField ID="Slab" runat="server" />
                                        <asp:HiddenField ID="slabid" runat="server" />
                                    </td>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td class="gridcellcenter">
                    <dxwgv:ASPxGridView ID="grdTrailSlab" runat="server" KeyFieldName="InsCommissionTrail_ID"
                        AutoGenerateColumns="False" DataSourceID="TrailSlabDataSource" ClientInstanceName="grid"
                        Font-Size="10px" OnCustomCallback="grdTrailSlab_CustomCallback">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="InsCommissionTrail_ID" Caption="ID" VisibleIndex="0"
                                Visible="False">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="InsCommissionTrail_YearFrom" Caption=" Year From"
                                VisibleIndex="0">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="InsCommissionTrail_YearTo" Caption="Year To"
                                VisibleIndex="1">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="RC Rate" FieldName="InsCommissionTrail_Rate"
                                VisibleIndex="2">
                                <EditFormSettings Visible="False" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="RC Slab Code" FieldName="InsCommissionTrail_Slab"
                                VisibleIndex="3">
                                <EditFormSettings Visible="False" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="InsCommissionTrail_STax" Caption="S.Tax &amp; Cess Comp."
                                VisibleIndex="4">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                                <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="#" VisibleIndex="5" Width="50px">
                                <HeaderStyle HorizontalAlign="Center" />
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnEditClick('<%# Container.KeyValue %>')">Edit</a>
                                    &nbsp; <a href="javascript:void(0);" onclick="OnDelClick('<%# Container.KeyValue %>')">
                                        Delete</a>
                                </DataItemTemplate>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Styles>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                        </Styles>
                        <SettingsText PopupEditFormCaption="Add/ Modify Employee" />
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="3" />
                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" AllowSort="False" />
                        <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="20"
                            PageSize="20">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="TrailSlabDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                    </asp:SqlDataSource>
                     
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
