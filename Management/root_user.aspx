<%@ page language="C#" autoeventwireup="true" inherits="management_root_user, App_Web_2wstwz9u" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
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
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }

    function AddUserDetails() 
    {
       // document.location.href="RootUserDetails.aspx?id=Add"
        var url='RootUserDetails.aspx?id=Add';
        //New Work 20/02/2023
//        parent.OnMoreInfoClick(url,"Add User Details",'940px','450px',"Y");
        parent.OnMoreInfoClick(url,"Add User Details",'940px','650px',"Y");
        //End of New Work 20/02/2023
    }
    function EditUserDetails(keyValue) 
    {
    
      //document.location.href="RootUserDetails.aspx?id="+keyValue;
        var url='RootUserDetails.aspx?id='+keyValue;
        //New Work 20/02/2023
//        parent.OnMoreInfoClick(url,"Edit User Details",'940px','450px',"Y");
        parent.OnMoreInfoClick(url,"Edit User Details",'940px','650px',"Y");
        //End of New Work 20/02/2023
    }
    
       function AddCompany(keyValue) 
    {
   
      //document.location.href="RootUserDetails.aspx?id="+keyValue;
        var url='Root_AddUserCompany.aspx?id='+keyValue;
        parent.OnMoreInfoClick(url,"Add Company Details for User",'940px','450px',"Y");
    }
    
    
    FieldName='Headermain1_cmbSegment';
    function ShowHideFilter(obj)
    {
       grid.PerformCallback(obj);
    }
    function callback()
    {
       grid.PerformCallback('All');
      // grid.PerformCallback();
    } 
    function EndCall(obj)
    {
        height();
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">All User List</span></strong>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%">
                        <tr>
                            <td style="text-align: left; vertical-align: top">
                                <table>
                                    <tr>
                                        <td id="ShowFilter">
                                            <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                                Show Filter</span></a>
                                        </td>
                                        <td id="Td1">
                                            <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                                All Records</span></a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                            </td>
                            <td class="gridcellright">
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
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="userGrid" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False"
                        DataSourceID="RootUserDataSource" KeyFieldName="user_id" Width="100%" OnCustomCallback="userGrid_CustomCallback" OnCustomJSProperties="userGrid_CustomJSProperties" >
                        <Columns>
                            <dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="0" FieldName="user_id"
                                Visible="False">
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="0" FieldName="user_name"
                                Caption="Name" Width="40%">
                                <PropertiesTextEdit>
                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                        <RequiredField ErrorText="Please Enter user Name" IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                                <EditFormSettings Caption="User Name:" Visible="True" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="1" Caption="Designation" FieldName="designation">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="2" FieldName="user_loginId"
                                Caption="Login ID">
                                <PropertiesTextEdit>
                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                        <RequiredField ErrorText="Please Enter Login Id" IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                                <EditFormSettings Caption="Login Id:" Visible="True" />
                            </dxwgv:GridViewDataTextColumn>
                            
                            
                                 <dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="3" FieldName="Status"
                                Caption="Status">
                                <PropertiesTextEdit>
                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                        <RequiredField ErrorText="Please Enter Login Id" IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                                <EditFormSettings Caption="Login Id:" Visible="True" />
                            </dxwgv:GridViewDataTextColumn>
                            
                           <dxwgv:GridViewDataTextColumn Caption="Company Add/Edit" VisibleIndex="4" Width="5%">
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="AddCompany('<%# Container.KeyValue %>')">Add Company</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <HeaderTemplate>
                                 <span style="color: #000099;
                                        ">Company Add/Edit</span>
                                </HeaderTemplate>
                            </dxwgv:GridViewDataTextColumn>
                            
                            
                            
                            <dxwgv:GridViewDataTextColumn Caption="Edit" VisibleIndex="4" Width="5%">
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="EditUserDetails('<%# Container.KeyValue %>')">Edit</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <HeaderTemplate>
                                    <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                       { %>
                                    <a href="javascript:void(0);" onclick="AddUserDetails()"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                    <%} %>
                                </HeaderTemplate>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Styles>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <Cell CssClass="gridcellleft">
                            </Cell>
                        </Styles>
                        <Settings ShowStatusBar="Visible" />
                        <SettingsPager NumericButtonCount="20" PageSize="20" AlwaysShowPager="True" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsBehavior ConfirmDelete="True" />
                        <ClientSideEvents EndCallback="function(s, e) {
	EndCall(s.cpHeight);
}" />
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="RootUserDataSource" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" DeleteCommand="DELETE FROM [tbl_master_user] WHERE [user_id] = @original_user_id"
            OldValuesParameterFormatString="original_{0}" SelectCommand="">
            <DeleteParameters>
                <asp:Parameter Name="original_user_id" Type="Decimal" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="branch" SessionField="userbranchHierarchy" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
