<%@ page language="C#" autoeventwireup="true" inherits="management_MasterChargeGroup, App_Web_i8xxwgwk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">

        <script language="javascript" type="text/javascript">
    function ShowHideFilter(obj)
    {
        grid.PerformCallback(obj);
          height();
    } 
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }  
   function OnMoreInfoClick(keyValue)
   {
       var ob3=document.getElementById("hdType");
       var typeb = ob3.value;
       var url='chargemaster.aspx?id='+keyValue+'&Type='+typeb;
       parent.OnMoreInfoClick(url,"Add Charge Master Details",'940px','450px',"Y");

   }
    
    function OnAddButtonClick() 
    {   
    
       var ob3=document.getElementById("hdType");
       var typeb = ob3.value;
       var url='chargemaster.aspx?id=ADD'+'&Type='+typeb ;
       parent.OnMoreInfoClick(url,"Add Charge Master Details",'940px','450px',"Y");

    }
    
 
   
   
     function PopulateGrid()
     {
       editwin.close();
       grid.PerformCallback();
     }
     function callback()
     {
     grid.PerformCallback();
     }
   function EndCall(obj)
    {
        height();
        if(grid.cpDelmsg!=null)
            alert(grid.cpDelmsg);
    }
    //---------Add Member Section ----
    
  
   function OnShowMoreInfoClick(keyValue)
   {
//         alert(obj1);
//       var ob3=document.getElementById("hdType");
//       var typeb = ob3.value;
       var url='MaseterChargeAddMember.aspx?id='+ keyValue;
       parent.OnMoreInfoClick(url,"Add Charge Master Details",'940px','450px',"Y");

   }
        </script>

        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">
                        <asp:Label ID="lblhdr" runat="server" Text=""></asp:Label>&nbsp;Schemes</span></strong>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <table>
                        <tr>
                            <td>
                                <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                    Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                    ValueType="System.Int32" Width="130px">
                                    <Items>
                                        <dxe:ListEditItem Text="Select" Value="0" />
                                        <dxe:ListEditItem Text="PDF" Value="1" />
                                        <dxe:ListEditItem Text="XLS" Value="2" />
                                        <dxe:ListEditItem Text="RTF" Value="3" />
                                        <dxe:ListEditItem Text="CSV" Value="4" />
                                    </Items>
                                    <ButtonStyle BackColor="#C0C0FF" ForeColor="Black">
                                    </ButtonStyle>
                                    <ItemStyle BackColor="Navy" ForeColor="White">
                                        <HoverStyle BackColor="#8080FF" ForeColor="White">
                                        </HoverStyle>
                                    </ItemStyle>
                                    <Border BorderColor="White" />
                                    <DropDownButton Text="Export">
                                    </DropDownButton>
                                </dxe:ASPxComboBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table class="TableMain100">
       <tr>
                                        <td style="text-align: left; vertical-align: top">
                                            <table width="100%">
                                                <tr>
                                                    <td id="Td1" align="left">
                                                        <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                                            Show Filter</span></a> || <a href="javascript:ShowHideFilter('All');"><span style="color: #000099;
                                                                text-decoration: underline">All Records</span></a>
                                                    </td>
                                                   <td>
                                                        <span id="spanshow2" style="color: Blue; font-weight: bold"></span>&nbsp;&nbsp;<span
                                                            id="spanshow3"></span>
                                                    </td>
                                                    <td align="right" style="text-align: left">
                                                        <span id="spanfltr" style="display: none"><a href="#" style="font-weight: bold; color: Blue"
                                                            onclick="javascript:ForFilterOn();">Filter</a></span>
                                                              
                                                            </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="ChargeGroupGrid" runat="server" KeyFieldName="ChargeGroup_ID"
                        AutoGenerateColumns="False" OnRowDeleting="ChargeGroupGrid_RowDeleting" DataSourceID="chargegroupDataSource"
                        Width="100%" ClientInstanceName="grid" OnCustomCallback="ChargeGroupGrid_CustomCallback"
                        OnCustomJSProperties="ChargeGroupGrid_CustomJSProperties">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="ChargeGroup_ID" Caption="ID" VisibleIndex="0"
                                Visible="False">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="ChargeGroup_Type" Caption="Type" VisibleIndex="0"
                                Width="15%">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Code" FieldName="ChargeGroup_Code" VisibleIndex="1"
                                Width="25%">
                                <EditFormSettings Visible="False" />
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="ChargeGroup_Name" Caption="Name" VisibleIndex="2"
                                Width="20%">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="ChargeGroup_IsDefault" Caption="Default Value"
                                VisibleIndex="3" Width="10%">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="4" Width="20%">
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                        More Info...</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <HeaderStyle HorizontalAlign="Center" />
                                <HeaderTemplate>
                                  <%--  <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                           { %>--%>
                                    <a href="javascript:void(0);" onclick="OnAddButtonClick( )"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                <%--    <%} %>--%>
                                </HeaderTemplate>
                            </dxwgv:GridViewDataTextColumn>
                            
                             <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="5" Width="20%">
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnShowMoreInfoClick('<%# Container.KeyValue %>')">
                                        Show Members</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <HeaderStyle HorizontalAlign="Center" />
                                <HeaderTemplate>
                                  <span style="color: #000099;
                                        text-decoration: underline">Show Members</span> 
                                    </HeaderTemplate>
                            </dxwgv:GridViewDataTextColumn>
                            
                            
                            <dxwgv:GridViewCommandColumn VisibleIndex="6" Caption="Delete">
                                <DeleteButton Visible="True">
                                </DeleteButton>
                            </dxwgv:GridViewCommandColumn>
                        </Columns>
                        <Styles>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px" cssclass="gridheader">
                            </Header>
                            <FocusedRow CssClass="gridselectrow">
                            </FocusedRow>
                            <FocusedGroupRow CssClass="gridselectrow">
                            </FocusedGroupRow>
                        </Styles>
                        <Settings ShowGroupPanel="True" ShowStatusBar="Hidden" />
                        <Templates>
                            <TitlePanel>
                                <table style="width: 100%">
                                    <tr>
                                        <td align="right">
                                            <table width="200px">
                                                <tr>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </TitlePanel>
                            <EditForm>
                            </EditForm>
                        </Templates>
                        <SettingsText PopupEditFormCaption="Add/ Modify Employee" GroupPanel="Brokerage Schemes" />
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="3" />
                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                        <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="20"
                            PageSize="20">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <ClientSideEvents EndCallback="function(s, e) {
	  EndCall(s.cpEND);
}" />
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="chargegroupDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            DeleteCommand="delete from table1 ">
            <DeleteParameters>
                <asp:Parameter Name="ChargeGroup_ID" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
        &nbsp;
        <br />
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
        <asp:HiddenField ID="hdType" runat="server" />
    </form>
</body>
</html>
