<%@ page language="C#" autoeventwireup="true" inherits="management_frmduplicateLeads, App_Web_njtlujlb" %>

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
</script>
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
    <script type="text/javascript" language="javascript">
    
    function OnGridSelectionChanged() 
    {
        grid.GetSelectedFieldValues('id', OnGridSelectionComplete);
    }
    function OnGridSelectionComplete(values) 
    {
        counter = 'n';
        for(var i = 0; i < values.length; i ++) 
        {
            if(counter != 'n')
                counter += ',' + values[i];
            else
                counter = values[i];
        }
    }
    
    function AtTheTimePageLoad()
    {
        FieldName='';
    }
   function btnDelete_click()
    {
        var data="Delete";
        data+="~"+counter
        CallServer(data, ""); 
    }
    function ReceiveServerData(rValue)
    {
        var DATA=rValue.split('~');
        if(DATA[0]=="Delete")
        {
            if(DATA[1]=="Y")
            {
                alert('Delete Successfully !!');
                grid.PerformCallback();
            }
        }
    }
</script>
    <table  class="TableMain100">
    <tr>
    <td>
    <table>
    
        <tr>
            <td class="EHEADER" colspan="2" style="text-align:center;">
                <strong><span style="color: #000099">Duplicate Lead Report</span></strong>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <input id="btnDelete" runat="server" type="button" value="Delete" class="btnUpdate" onclick="btnDelete_click()"  style="height: 19px; width: 48px;"  />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%--<input id="Button1" runat="server" type="button" value="Upload" class="btnUpdate"  style="height: 19px; width: 48px;"  />--%>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width:90%; vertical-align:top">
            <asp:Panel ID="panel" runat="server" BorderColor="blue" BorderWidth="0px" Width="99%">
                <table>
                    <tr>
                        <td>
                            <dxwgv:ASPxGridView ID="GridDuplicateLead" ClientInstanceName="grid" KeyFieldName="id" runat="server" Width="100%" AutoGenerateColumns="False" OnCustomCallback="GridDuplicateLead_CustomCallback">
                                <Styles>
                                    <LoadingPanel ImageSpacing="10px">
                                    </LoadingPanel>
                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                    </Header>
                                </Styles>
                                
                                <ClientSideEvents SelectionChanged="function(s, e) { OnGridSelectionChanged(); }"  />
                                <Columns>
                                    <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width="5%">
                                        <ClearFilterButton Visible="True">
                                        </ClearFilterButton>
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                    </dxwgv:GridViewCommandColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Lead ID" FieldName="id" ReadOnly="True"
                                                                    VisibleIndex="1" Width="10%">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Name" FieldName="name"
                                                                    ReadOnly="True" VisibleIndex="2" Width="60%">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Phone" FieldName="phone"  ReadOnly="True" VisibleIndex="3" >
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="status" VisibleIndex="4">
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <SettingsPager AlwaysShowPager="True" PageSize="20" ShowSeparators="True">
                                    <FirstPageButton Visible="True">
                                    </FirstPageButton>
                                    <LastPageButton Visible="True">
                                    </LastPageButton>
                                </SettingsPager>
                                <SettingsBehavior AllowSort="False" ColumnResizeMode="NextColumn" />
                            </dxwgv:ASPxGridView>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            </td>
        </tr>
   </table>
    </td>
    </tr>
   </table>
    </div>
    </form>
</body>
</html>
