<%@ page language="C#" autoeventwireup="true" inherits="management_frm_SlipsRegister, App_Web_e81qjzgk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script language="javascript" type="text/javascript">
        function height()
        {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '700px';
        window.frameElement.Width = document.body.scrollWidth;
        }
        
        function slipdetailspop(s,c)
        {
            
            var url='frm_SlipsRegisterDetails.aspx?benid=' + s + '&cname=' + c;
            parent.OnMoreInfoClick(url,'Slip Details','940px','460px','Y');
        
        
        
        }
         function SignOff()
        {
        window.parent.SignOff()
        } 
         </script>
</head>
<body style="margin: 0px 0px 0px 10px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                From Date
                </td>
                <td>
                    <dxe:ASPxDateEdit ID="dtFrom" runat="server"  ClientInstanceName="dtFrom1" DateOnError="Today" EditFormat="Custom" EditFormatString="dd/MM/yyyy" UseMaskBehavior="True" Width="169px" Cursor="t"><ClientSideEvents ValueChanged="function(s, e){ DateChangeForFrom(dtTransaction1);}" />
                        
                        </dxe:ASPxDateEdit>
                </td>
                <td>
                    ToDate
                </td>
                <td>
                    <dxe:ASPxDateEdit ID="dtTo" runat="server"  ClientInstanceName="dtTo1" DateOnError="Today" EditFormat="Custom" EditFormatString="dd/MM/yyyy" UseMaskBehavior="True" Width="169px" Cursor="t"><ClientSideEvents ValueChanged="function(s, e){ DateChangeForFrom(dtTransaction1);}" />
                        
                        </dxe:ASPxDateEdit>
                </td>
                <td>
                    <asp:Button ID="btnShow" runat="server" Text="Show" OnClick="btnShow_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    
                     <dxwgv:ASPxGridView ID="gridSlips" runat="server" Width="100%" ClientInstanceName="grid"
                            AutoGenerateColumns="False" KeyFieldName="DPSlipsIssued_BenID" OnCustomCallback="gridSlips_CustomCallback" >
                            <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
<Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedGroupRow BackColor="#FCA977"></FocusedGroupRow>

<FocusedRow BackColor="#FCA977"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>
                            <SettingsPager PageSize="20" visible="True"></SettingsPager>
                                
                                <columns>
<dxwgv:GridViewDataTextColumn  Caption="Ben ID" VisibleIndex="0">

<Settings AllowAutoFilter="False"></Settings>
<DataItemTemplate>
<asp:Label ID="Label3" runat="server" Text='<%# Convert.ToString(Eval("name")) + " [" + Convert.ToString(Eval("DPSlipsIssued_BenID")) + "]" %>'></asp:Label>
</DataItemTemplate>
<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn FieldName="slipcount" Width="200px" Caption="Total Slip" VisibleIndex="1">
<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn  Caption="" VisibleIndex="2">


<Settings AllowAutoFilter="False"></Settings>
<DataItemTemplate>
<a href="javascript:void(0);" onclick="slipdetailspop('<%# Container.KeyValue %>','<%# Eval("name") %>')">
                                            <asp:Label id="Label1" runat="server" Text="More Details" ></asp:Label>
                                               
                                        </a>
                                        
</DataItemTemplate>

<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>

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
