<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_NewEmployeeDetails, App_Web_qrhyroaj" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>

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
           
           if(document.body.scrollHeight>=500)
                {
                    window.frameElement.height = document.body.scrollHeight;
                }
           else
                {
                    window.frameElement.height = '500px';
                }
                window.frameElement.widht = document.body.scrollWidht;
           
        }
   </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <script  type="text/ecmascript">
    function PageLoad()
    {
        FieldName='ctl00_ContentPlaceHolder3_bnSubmit';
        fromDt.Focus();
       // hide('tdgrid');
    }
//    function show(obj1)
//    {
//         document.getElementById(obj1).style.display='inline';
//    }
//    function hide(obj1)
//    {
//         document.getElementById(obj1).style.display='none';
//    }
     function showgrid()
     {
      grid.PerformCallback('BindGrid~');
//        if(fromDt.GetValue() != null)
//        {
//            show('tdgrid');   
//        }
//        else
//        {
//            hide('tdgrid');
//        }
     }
     
     
     function aspxEmpGrid_EndCallBack()
     {
     height();
     }
</script>
<div>
    <table class="TableMain100">
        <tr>
            <td class="EHEADER" colspan="0" style="text-align:center;">
                <strong><span style="color: #000099">New Employee's Details Report</span></strong>
            </td>
        </tr>
        <tr>
            <td class="gridcellright" valign="top" colspan="0">
                &nbsp;</td>
        </tr>
        <tr>
            <td >
                <table class="TableMain100" style="width:48%">
                    <tr>
                        <td class="gridcellleft" valign="top" style=" background-color: #b7ceec; height: 40px;">
                            <dxe:ASPxDateEdit ID="fromDate" ClientInstanceName="fromDt" runat="server" 
                                     EditFormatString="dd-MM-yyyy" DropDownButton-Width="100%"  Font-Size="10px" Width="145px" EditFormat="Custom" UseMaskBehavior="True">
                                    <ButtonStyle Width="13px"></ButtonStyle>
                                <ValidationSettings Display="Dynamic"  ErrorTextPosition="Bottom">
<RequiredField IsRequired="True" ErrorText="Invalid Date"></RequiredField>
</ValidationSettings>
                                    <DropDownButton Text="FromDate" Width="50px"></DropDownButton>
                            </dxe:ASPxDateEdit>
                            
                        </td>
                        
                        
                        <td class="gridcellleft" valign="top" style=" background-color: #b7ceec; height: 40px;">
                            <dxe:ASPxDateEdit ID="toDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                     EditFormatString="dd-MM-yyyy" DropDownButton-Width="100%"  Font-Size="10px" Width="145px">
                                    <ButtonStyle Width="13px"></ButtonStyle>
                                <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
<RequiredField IsRequired="True" ErrorText="Invalid Date"></RequiredField>
</ValidationSettings>
                                    <DropDownButton Text="ToDate" Width="50px"></DropDownButton>
                            </dxe:ASPxDateEdit>
                        </td>
                        <td class="gridcellleft" valign="top" style=" background-color: #b7ceec; height: 40px;">
                            <dxe:aspxcombobox id="cmbCompany" runat="server" 
                                 
                                valuetype="System.String" DropDownButton-Text="Company" Font-Size="10px" Width="148px" EnableIncrementalFiltering="True">
                        <ButtonStyle Width="13px"></ButtonStyle>
                                <DropDownButton Text="Company" Width="50px"></DropDownButton>
                        </dxe:aspxcombobox>
                        </td>
                        <td class="gridcellleft" valign="top" style=" background-color: #b7ceec; height: 40px;">                
                            <dxe:aspxcombobox id="cmbBranch" runat="server" 
                                 
                                valuetype="System.String" DropDownButton-Text="Branch" Font-Size="10px" Width="148px" EnableIncrementalFiltering="True">
                            <ButtonStyle Width="13px"></ButtonStyle>
                                <DropDownButton Text="Branch" Width="50px"></DropDownButton>
                            </dxe:aspxcombobox>
                        </td>
                        <td class="gridcellleft" valign="top" style=" background-color: #b7ceec; height: 40px;">                
                            <dxe:aspxcombobox id="cmbDepartment" runat="server" 
                                 
                                valuetype="System.String" DropDownButton-Text="Department" Font-Size="10px" Width="148px" EnableIncrementalFiltering="True">
                            <ButtonStyle Width="13px"></ButtonStyle>
                                <DropDownButton Text="Department" Width="50px"></DropDownButton>
                            </dxe:aspxcombobox>
                        </td>
                        <td class="gridcellleft" valign="top" style=" background-color: #b7ceec; height: 40px;">               
                            <dxe:ASPxButton ID="bnSubmit" runat="server" 
                                 Text="GO" Width="52px" Height="12px" AutoPostBack="False">
                                <ClientSideEvents Click="function(s, e) {
	showgrid();
}" />
                            </dxe:ASPxButton>
                        </td>
                        <td class="gridcellleft" valign="top" style=" background-color: #b7ceec; height: 40px;">                
                <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy" Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"  ValueType="System.Int32" Width="112px" >
                        <Items>
<dxe:ListEditItem Text="Select" Value="0"></dxe:ListEditItem>
<dxe:ListEditItem Text="PDF" Value="1"></dxe:ListEditItem>
<dxe:ListEditItem Text="XLS" Value="2"></dxe:ListEditItem>
<dxe:ListEditItem Text="RTF" Value="3"></dxe:ListEditItem>
<dxe:ListEditItem Text="CSV" Value="4"></dxe:ListEditItem>
</Items>
                        <ButtonStyle BackColor="#C0C0FF" ForeColor="Black"></ButtonStyle>
                        <Border BorderColor="White" />
                        <ItemStyle BackColor="Navy" ForeColor="White">
<HoverStyle BackColor="#8080FF" ForeColor="White"></HoverStyle>
</ItemStyle>
                        <DropDownButton Text="Export"></DropDownButton>
                    </dxe:ASPxComboBox></td>
                    </tr>
                </table>
            </td>
        </tr>
        
        <tr>
            <td id="tdgrid">
                <dxwgv:ASPxGridView Width="965px" ID="aspxEmpGrid" KeyFieldName="emp_contactId" ClientInstanceName="grid" DataSourceID="SqlEmployeeDetails" runat="server" AutoGenerateColumns="False"
                      OnCustomCallback="aspxEmpGrid_CustomCallback" Settings-ShowHorizontalScrollBar="true" >
                       <ClientSideEvents EndCallback="function (s, e) {aspxEmpGrid_EndCallBack();}" />
<Styles  >
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>
<Columns>
    <dxwgv:GridViewDataDateColumn Caption="Joining Date" FieldName="joindate"
        VisibleIndex="0" Width="150px">
        <CellStyle HorizontalAlign="Left" Wrap="False">
        </CellStyle>
    </dxwgv:GridViewDataDateColumn>
    <dxwgv:GridViewDataTextColumn Caption="EmpName[code]" FieldName="Name" VisibleIndex="1"
        Width="50px">
        <CellStyle HorizontalAlign="Left" Wrap="False">
        </CellStyle>
    </dxwgv:GridViewDataTextColumn>
    <dxwgv:GridViewDataTextColumn Caption="Designation" FieldName="designation" VisibleIndex="2"
        Width="50px">
        <CellStyle HorizontalAlign="Left" Wrap="False">
        </CellStyle>
    </dxwgv:GridViewDataTextColumn>
    <dxwgv:GridViewDataTextColumn Caption="Company" FieldName="company" VisibleIndex="3"
        Width="50px">
        <CellStyle HorizontalAlign="Left" Wrap="False">
        </CellStyle>
    </dxwgv:GridViewDataTextColumn>
    <dxwgv:GridViewDataTextColumn Caption="Branch" FieldName="branch" VisibleIndex="4"
        Width="50px">
        <CellStyle HorizontalAlign="Left" Wrap="False">
        </CellStyle>
    </dxwgv:GridViewDataTextColumn>
    <dxwgv:GridViewDataTextColumn Caption="Department" FieldName="department" VisibleIndex="5"
        Width="50px">
        <CellStyle HorizontalAlign="Left" Wrap="False">
        </CellStyle>
    </dxwgv:GridViewDataTextColumn>
    <dxwgv:GridViewDataTextColumn Caption="Reporting Head" FieldName="reportTo" VisibleIndex="6"
        Width="50px">
        <CellStyle HorizontalAlign="Left" Wrap="False">
        </CellStyle>
    </dxwgv:GridViewDataTextColumn>

</Columns>
<settings  ShowHorizontalScrollBar="True" ></settings>
<StylesEditors>
<ProgressBar Height="25px"></ProgressBar>
</StylesEditors>
<SettingsBehavior AllowFocusedRow="True" />  
                     <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True" PageSize="20">
                                                <FirstPageButton Visible="True">
                                                </FirstPageButton>
                                                <LastPageButton Visible="True">
                                                </LastPageButton>
                                            </SettingsPager>
                    <Settings ShowGroupPanel="True" />
</dxwgv:ASPxGridView>
                <dxwgv:ASPxGridViewExporter ID="exporter" Landscape="true" runat="server">
                </dxwgv:ASPxGridViewExporter>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlEmployeeDetails" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
    </asp:SqlDataSource>
</div>
    </form>
</body>
</html>
