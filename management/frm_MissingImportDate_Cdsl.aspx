<%@ page language="C#" autoeventwireup="true" inherits="management_frm_MissingImportDate_Cdsl, App_Web_6_wayyot" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
    <%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
      <script language="javascript" type="text/javascript">
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
<body style="margin: 0px 0px 0px 10px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
        <table >
                                <tr>
                                    <td valign="top" >
                                        From</td>
                                    <td valign="top" >
                                       <dxe:ASPxDateEdit ID="dtexec" runat="server" ClientInstanceName="dtexec1" DateOnError="Today"
                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" 
                            UseMaskBehavior="True" Width="120px" TabIndex="5">
                            <ClientSideEvents ValueChanged="function(s, e){ DateChangeForFrom(dtexec1);}"></ClientSideEvents>
                        </dxe:ASPxDateEdit>
                                        </td>
                                   <td valign="top" >
                                        To</td>
                                    <td valign="top"  >
                                        <dxe:ASPxDateEdit ID="dtexecTo" runat="server" ClientInstanceName="dtexecTo1" DateOnError="Today"
                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" 
                            UseMaskBehavior="True" Width="120px" TabIndex="5">
                            <ClientSideEvents ValueChanged="function(s, e){ DateChangeForFrom(dtexecTo);}"></ClientSideEvents>
                        </dxe:ASPxDateEdit>
                                        
                                        
                                   </td>
                                   <td>
                                        <asp:Button ID="Button2" runat="server" CssClass="btnUpdate" OnClick="Button1_Click"
                                                OnClientClick="javascript:selecttion();" Text="Show" />
                                   </td>
                                   
                                </tr>
                               
                            </table>
                            
                             <table id="tabdata" runat="server" width="930" style="height: 24px">
                             <tr>
                                <td>
                                    Transaction
                                </td>
                                <td>
                                    Holding
                                </td>
                                <td>
                                    Dp Pricing
                                </td>
                             </tr>
                             <tr>
                                    <td valign="top">
                                            <dxwgv:ASPxGridView ID="gridMissingDateTransaction" runat="server" Width="100%" ClientInstanceName="grid"
                            AutoGenerateColumns="False" KeyFieldName="TaskDate">
                            <SettingsBehavior AllowSort="false" AllowFocusedRow="True"></SettingsBehavior>
<Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedGroupRow BackColor="#FCA977"></FocusedGroupRow>

<FocusedRow BackColor="#FCA977"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>
                            <SettingsPager PageSize="20" ></SettingsPager>
                                
                                <columns>
<dxwgv:GridViewDataTextColumn FieldName="TaskDate" Caption="Date" VisibleIndex="0">
<Settings FilterMode="DisplayText"  AutoFilterCondition="Contains"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="dayname" CellStyle-Wrap="False" UnboundType="String" Caption="Day" VisibleIndex="1"></dxwgv:GridViewDataTextColumn>




</columns>
                                <settings showfooter="True" showstatusbar="Visible" showtitlepanel="True"></settings>
                                <styleseditors>
<ProgressBar Height="25px"></ProgressBar>
</styleseditors>
                            </dxwgv:ASPxGridView>
                                    
                                    </td>
                                    <td valign="top">
                                             <dxwgv:ASPxGridView ID="gridMissingDateHolding" runat="server" Width="100%" ClientInstanceName="grid"
                            AutoGenerateColumns="False" KeyFieldName="TaskDate">
                            <SettingsBehavior AllowSort="false" AllowFocusedRow="True"></SettingsBehavior>
<Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedGroupRow BackColor="#FCA977"></FocusedGroupRow>

<FocusedRow BackColor="#FCA977"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>
                            <SettingsPager PageSize="20" ></SettingsPager>
                                
                                <columns>
<dxwgv:GridViewDataTextColumn FieldName="TaskDate" Caption="Date" VisibleIndex="0">
<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="dayname" CellStyle-Wrap="False" UnboundType="String" Caption="Day" VisibleIndex="1"></dxwgv:GridViewDataTextColumn>




</columns>
                                <settings showfooter="True" showstatusbar="Visible" showtitlepanel="True"></settings>
                                <styleseditors>
<ProgressBar Height="25px"></ProgressBar>
</styleseditors>
                            </dxwgv:ASPxGridView>
                                    </td>
                                    <td valign="top">
                                             <dxwgv:ASPxGridView ID="gridMissingDateDpPrice" runat="server" Width="100%" ClientInstanceName="grid"
                            AutoGenerateColumns="False" KeyFieldName="TaskDate">
                            <SettingsBehavior AllowSort="false" AllowFocusedRow="True"></SettingsBehavior>
<Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedGroupRow BackColor="#FCA977"></FocusedGroupRow>

<FocusedRow BackColor="#FCA977"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>
                            <SettingsPager PageSize="20" ></SettingsPager>
                                
                                <columns>
<dxwgv:GridViewDataTextColumn FieldName="TaskDate" Caption="Date" VisibleIndex="0">
<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="dayname" CellStyle-Wrap="False" UnboundType="String" Caption="Day" VisibleIndex="1"></dxwgv:GridViewDataTextColumn>




</columns>
                                <settings showfooter="True" showstatusbar="Visible" showtitlepanel="True"></settings>
                                <styleseditors>
<ProgressBar Height="25px"></ProgressBar>
</styleseditors>
                            </dxwgv:ASPxGridView>
                                    </td>
                             </tr>
                             
                             
                             </table>
    </div>
    </form>
</body>
</html>
