<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_AllRemarkDetails, App_Web_qrhyroaj" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
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
        
                
        if(document.body.scrollHeight>=350)
        {
            window.frameElement.height = document.body.scrollHeight;
        }
        else
        {
            window.frameElement.height = '350px';
        }
        window.frameElement.widht = document.body.scrollWidht;
     }
        </script>
        <script type="text/javascript" language="javascript">

    function PageLoad()
    {
        FieldName='ctl00_ContentPlaceHolder3_btnShow';
        ShowCategoryFilterForm(rbCategory.GetValue());
        hide('trResultGrid');
        hide('FilterTr')
        hide('td_export');
    }
    function ShowCategoryFilterForm(obj)
    { //alert(obj);
        if(obj=='A')
        {
            hide('tdCatType');
            
        }
        if(obj=='S')
        {
            show('tdCatType');
            
        }
    }
 
    function show(obj1)
    {
        //alert(obj1);
         document.getElementById(obj1).style.display='inline';
    }
    function hide(obj1)
    {  
         document.getElementById(obj1).style.display='none';
    }
    
    
</script>
<script type="text/ecmascript">
    function CallBack()
    {  
        show('trResultGrid');
        hide('FilterTr');
        grid.PerformCallback();
        show('td_export');
    }
    function FilterClick()
    {
        if(document.getElementById('FilterTr').style.display=='inline')
        {
            hide('FilterTr');
        }
        else
        {
            show('FilterTr');
        }
    }
</script>
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
    
<table class="TableMain100">
    <tr>
       <td class="EHEADER" colspan="0" style="text-align:center;">
                <strong><span style="color: #000099">All Remark Details Report</span></strong>
      </td>
    </tr>
</table>                  
<table>
    <tr>
        <td class="gridcellleft" valign="top" colspan="2">
            <table>
            <tr>
                <td>
                    <span class="Ecoheadtxt" style="color:Blue"><strong>Category Type:</strong></span></td>
                <td>
                    <dxe:ASPxRadioButtonList ID="rbCategory" ClientInstanceName="rbCategory" runat="server" SelectedIndex="0" ItemSpacing="10px" RepeatDirection="Horizontal" TextWrap="False" Font-Size="10px" Height="28px">
                        <Items>
                            <dxe:ListEditItem Text="All" Value="A" />
                            <dxe:ListEditItem Text="Specific" Value="S" />
                        </Items>
                        <ClientSideEvents ValueChanged="function(s, e) {ShowCategoryFilterForm(s.GetValue());}" />
                        <Border BorderWidth="0px" />
                    </dxe:ASPxRadioButtonList>
                </td>
                <td valign="middle" id="tdCatType">
                    <dxe:ASPxComboBox ID="cmbRemarkType" runat="server"
                        
                        ValueType="System.String" Width="130px" Font-Size="10px">
                        <ButtonStyle Width="13px">
                        </ButtonStyle>
                        <DropDownButton Text="RemarkType" Width="50px">
                        </DropDownButton>
                    </dxe:ASPxComboBox>
                </td>
                <td valign="middle" class="gridcellright">
                    <span class="Ecoheadtxt" style="color:Blue"><strong>Remark Value</strong></span>
                </td>
                <td valign="middle" class="gridcellleft">
                    <asp:TextBox ID="txtRemValue" runat="server"></asp:TextBox></td>
                <td class="gridcellleft" valign="middle">
                    <dxe:ASPxButton ID="btnSubmit" runat="server" Font-Size="10px"
                         Text="GO" AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {CallBack();}" />
                    </dxe:ASPxButton>
                 </td>
                <td class="gridcellleft" valign="middle">
                </td>
                <td class="gridcellleft" valign="middle">
                    <a href="#" id="btnFilter" onclick="FilterClick();"><span class="Ecoheadtxt" style="color:Blue"><strong>Filter Columns</strong></span></a>
                </td>
                
            </tr>
        </table>
        </td>
        <td  rowspan="3" id="FilterTr" align="right" valign="top">
            <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="gridcellleft">
                    <span class="Ecoheadtxt" style="color:Blue"><strong>Column Name</strong></span>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft">
                    <dxe:ASPxCheckBox ID="chkName" ClientInstanceName="chkName" runat="server" Text="Name" Checked="True" ValueChecked="Y" ValueType="System.Char" ValueUnchecked="N"></dxe:ASPxCheckBox>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft">
                    <dxe:ASPxCheckBox ID="chkShortNm" ClientInstanceName="chkShortNm" runat="server" Text="ShortName/Code" Checked="True" ValueChecked="Y" ValueType="System.Char" ValueUnchecked="N"></dxe:ASPxCheckBox>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft">
                    <dxe:ASPxCheckBox ID="chkBranch" ClientInstanceName="chkBranch" runat="server" Text="Branch" Checked="True" ValueChecked="Y" ValueType="System.Char" ValueUnchecked="N"></dxe:ASPxCheckBox>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft">
                    <dxe:ASPxCheckBox ID="chkPhones" ClientInstanceName="chkPhones" runat="server" Text="Phones" Checked="True" ValueChecked="Y" ValueType="System.Char" ValueUnchecked="N"></dxe:ASPxCheckBox>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft">
                    <dxe:ASPxCheckBox ID="chkRm" ClientInstanceName="chkRm" runat="server" Text="RM" Checked="True" ValueChecked="Y" ValueType="System.Char" ValueUnchecked="N"></dxe:ASPxCheckBox>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft">
                     <dxe:ASPxCheckBox ID="chkReff" runat="server" ClientInstanceName="chkReff"  Text="RefferdBy" Checked="True" ValueChecked="Y" ValueType="System.Char" ValueUnchecked="N"></dxe:ASPxCheckBox>
                </td>
               
            </tr>
             <tr>
                <td class="gridcellleft">
                    <dxe:ASPxCheckBox ID="chkpan" ClientInstanceName="chkpan" runat="server" Text="Pan" Checked="True" ValueChecked="Y" ValueType="System.Char" ValueUnchecked="N"></dxe:ASPxCheckBox>
                </td>
            </tr>
        </table>
        </td>
         <td class="gridcellright" align="right" id="td_export" runat="server">
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
    <tr id="trResultGrid">
        <td colspan="2" rowspan="2">
             <dxwgv:ASPxGridView ID="ASPxRemarkGrid" ClientInstanceName="grid" KeyFieldName="SlNo" runat="server" 
             OnCustomCallback="ASPxRemarkGrid_CustomCallback"  Width="1200px" >
            <Settings ShowGroupPanel="True" ShowHorizontalScrollBar="true"  />
            <SettingsBehavior AutoExpandAllGroups="False" AllowFocusedRow="True" />
            <Styles>
                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                </Header>
                <Cell Wrap="false"></Cell>
                <LoadingPanel ImageSpacing="10px">
                </LoadingPanel>
            </Styles>
             <StylesEditors>
                <ProgressBar Height="25px">
                </ProgressBar>
            </StylesEditors>
            <SettingsPager AlwaysShowPager="True" PageSize="20" ShowSeparators="True">
                <FirstPageButton Visible="True">
                </FirstPageButton>
                <LastPageButton Visible="True">
                </LastPageButton>
            </SettingsPager>
        </dxwgv:ASPxGridView>                       
        </td>
    </tr>
    <tr>
    </tr>
</table>
<dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
            </dxwgv:ASPxGridViewExporter>
    </div>
    </form>
</body>
</html>
