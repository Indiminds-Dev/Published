<%@ page language="C#" autoeventwireup="true" inherits="management_Lead, App_Web_sggmuspu" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
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

    function OnMoreInfoClick(keyValue) {
        
       var url='Lead_general.aspx?id='+keyValue;
        parent.OnMoreInfoClick(url,"Modify Lead Details",'940px','450px',"Y");
   
    }
    function OnCreateActivityClick(KeyVal)
    {
        //alert(KeyVal);
        var url='Lead_Activity.aspx?id=' + KeyVal;
        parent.OnMoreInfoClick(url,"Lead Activity Creation",'940px','450px',"Y");
        
    }
    function OnAddButtonClick() 
    {
     var url='Lead_general.aspx?id=' + 'ADD';
     parent.OnMoreInfoClick(url,"Add New Lead Details",'940px','450px',"Y");
    
    }
    function ShowHideFilter(obj)
    {
        grid.PerformCallback(obj);
    } 
    function callback()
        {
            grid.PerformCallback();
        } 
    function callheight(obj)
    {
        height();
        parent.CallMessage();
    }
    function OnContactInfoClick(keyValue,CompName)
    {
        var url='insurance_contactPerson.aspx?id='+keyValue;
        parent.OnMoreInfoClick(url,"Lead Name : "+CompName+"",'940px','450px',"Y");
    } 
    function OnHistoryInfoClick(keyValue,CompName)
    {
        var url='ShowHistory_Phonecall.aspx?id1='+keyValue;
        parent.OnMoreInfoClick(url,"Lead  History",'940px','450px',"Y");
    }
//-->
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">All Lead Details</span></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="TableMain100">
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
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="LeadGrid" runat="server" AutoGenerateColumns="False" KeyFieldName="cnt_id"
                            Width="100%" ClientInstanceName="grid" OnCustomCallback="LeadGrid_CustomCallback1"
                            OnCustomJSProperties="LeadGrid_CustomJSProperties">
                            <Settings ShowGroupPanel="True" />
                            <Columns>
                                <dxwgv:GridViewDataTextColumn FieldName="Name" ReadOnly="True" VisibleIndex="0">
                                    <CellStyle HorizontalAlign="Left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="BranchName" VisibleIndex="1">
                                    <CellStyle HorizontalAlign="Left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="phone" ReadOnly="True" VisibleIndex="2">
                                    <CellStyle HorizontalAlign="Left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="Status" ReadOnly="True" VisibleIndex="3">
                                    <CellStyle HorizontalAlign="Left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Create Activity" FieldName="Id" ReadOnly="True"
                                    VisibleIndex="4">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnCreateActivityClick('<%# Eval("Id") %>')">Create
                                            Activity</a>
                                    </DataItemTemplate>
                                    <CellStyle HorizontalAlign="Left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="ADD/Modify " FieldName="cnt_id" ReadOnly="True"
                                    VisibleIndex="5">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                            More Info...</a>
                                    </DataItemTemplate>
                                    <EditFormSettings Visible="False" />
                                    <CellStyle HorizontalAlign="Left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="OnAddButtonClick();"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                    </HeaderTemplate>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Cont.Person" VisibleIndex="6">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnContactInfoClick('<%#Eval("Id") %>','<%#Eval("Name") %>')">
                                            Show</a>
                                    </DataItemTemplate>
                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                    </CellStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="7">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnHistoryInfoClick('<%#Eval("Id") %>','<%#Eval("Name") %>')">
                                            History</a>
                                        <cellstyle horizontalalign="Left" wrap="False">
                                    </cellstyle>
                                        <editformsettings visible="False" />
                                    </DataItemTemplate>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" />
                            <Styles>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                            </Styles>
                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <ClientSideEvents EndCallback="function(s, e) {
	callheight(s.cpHeight);
}" />
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="LeadGridDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="select ISNULL(cnt_firstName, '') + ' ' + ISNULL(cnt_middleName, '') + ' ' + ISNULL(cnt_lastName, '') AS Name, tbl_master_branch.branch_description AS BranchName, (select top 1 isnull(case mp.phf_phonenumber when null then '' else (Select top 1  '(M)'+ m.phf_phonenumber from tbl_master_phonefax m where m.phf_cntid=cnt_internalId and m.phf_type = 'Mobile') end,'')  + isnull(case mp.phf_phonenumber  when null then '' else (Select top 1  '(R)'+ r.phf_phonenumber from tbl_master_phonefax r where r.phf_cntid=cnt_internalId and r.phf_type = 'Residence') end,'')  + isnull(case mp.phf_phonenumber  when null then '' else (Select top 1  '(R)'+ o.phf_phonenumber from tbl_master_phonefax o where o.phf_cntid=cnt_internalId and o.phf_type = 'Office') end ,'') from tbl_master_phonefax mp where mp.phf_cntid=cnt_internalId)as phone, case tbl_master_lead.cnt_Lead_Stage when 1 then 'Due' when 2 then 'Opportunity' when 3 then 'Sales/Pipeline' when 4 then 'Converted' when 5 then 'Lost' End as Status, tbl_master_lead.cnt_internalId AS Id, tbl_master_lead.createdate, tbl_master_lead.cnt_InternalId as cnt_UCC,tbl_master_lead.createUser,tbl_master_lead.cnt_id from tbl_master_lead, tbl_master_branch Where tbl_master_lead.CreateUser in (@userlist) and tbl_master_lead.cnt_branchid = tbl_master_branch.branch_id order by tbl_master_lead.CreateDate desc">
                <SelectParameters>
                    <asp:SessionParameter Name="userlist" SessionField="userchildHierarchy" Type="string" />
                </SelectParameters>
            </asp:SqlDataSource>
            <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
            </dxwgv:ASPxGridViewExporter>
        </div>
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
