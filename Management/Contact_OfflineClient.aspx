<%@ page language="C#" autoeventwireup="true" inherits="management_Contact_OfflineClient, App_Web_fxnvzv_8" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>NSDL Offline Client</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <script type="text/javascript"> 
        $(document).ready(function() { 

            $(".water").each(function() { 
                if ($(this).val() == this.title) { 
                    $(this).addClass("opaque"); 
                } 
            }); 

            $(".water").focus(function() { 
                if ($(this).val() == this.title) { 
                    $(this).val(""); 
                    $(this).removeClass("opaque"); 
                }                 
            }); 

            $(".water").blur(function() { 
                if ($.trim($(this).val()) == "") { 
                    $(this).val(this.title); 
                    $(this).addClass("opaque"); 
                } 
                else { 
                    $(this).removeClass("opaque"); 
                } 
            }); 
        });       

    </script>

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
    function NewPage(cnt_id)
    {
        //alert('cnt_id');
    }
    
 
    function OnMoreInfoClick(keyValue)
    {
      
       
        var url='OfflineClient_General.aspx?id='+keyValue;
        parent.OnMoreInfoClick(url,"Modify Offline Client Details",'1000px','500px',"Y");

    }
    function OnAddButtonClick() 
    {
        var url='OfflineClient_General.aspx?id=' + 'ADD';
   
        parent.OnMoreInfoClick(url,"Add Offline Client Details",'1000px','500px',"Y");

    }
    
    function OnEditClick(keyValue)
    {
        //alert(keyValue) ;
        var url='OfflineClient_General.aspx?id='+keyValue;
        parent.OnMoreInfoClick(url,"Edit Offline Client Details",'1000px','500px',"Y");

    }
    
   
    function ShowHideFilter(obj)
    {
        InitialTextVal();
        if(obj=="s")
            document.getElementById('TrFilter').style.display="inline";
        else
        {
            document.getElementById('TrFilter').style.display="none";
            grid.PerformCallback(obj);
        }
    }
    function callback()
    {
        grid.PerformCallback();
    }
  
   function btnSearch_click()
   {
        document.getElementById('TrFilter').style.display="none";
        grid.PerformCallback('s');
   }  
   function InitialTextVal()
   {
        document.getElementById('txtName').value = "Short Name";  
        document.getElementById('txtAcCategory').value = "Account Category";
        document.getElementById('txtBranchName').value = "Branch Name";
        document.getElementById('txtBeneficiary').value = "Beneficiary Type / SubType";
        document.getElementById('txtStatus').value = "Status";    
   }  
//-->
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form2" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Offline Client Contact List</span></strong></td>
                </tr>
                <tr>
                    <td>&nbsp;
                        <table width="100%" style="display:none;">
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
                                <td class="gridcellright" align="right">
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
                <tr id="TrFilter" style="display:none">
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="water" Text="Short Name" ToolTip="Short Name"
                                        Font-Size="10px" Width="119px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAcCategory" runat="server" CssClass="water" Text="Account Category" ToolTip="Account Category"
                                        Font-Size="10px" Width="85px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBranchName" runat="server" CssClass="water" Text="Branch Name" ToolTip="Branch Name"
                                        Font-Size="10px" Width="100px"></asp:TextBox>
                                </td>
                                
                                <td>
                                    <asp:TextBox ID="txtBeneficiary" runat="server" CssClass="water" Text="Beneficiary Type / SubType" ToolTip="Beneficiary Type / SubType" Font-Size="10px" Width="200px"></asp:TextBox>
                                </td>
                               
                                <td>
                                    <asp:TextBox ID="txtStatus" runat="server" CssClass="water" Text="Status" ToolTip="Status"
                                        Font-Size="10px" Width="97px"></asp:TextBox>
                                </td>
                                <td>
                                    <input id="btnSearch" type="button" value="Search" class="btnUpdate" style="height: 21px" onclick="btnSearch_click()" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="OfflineClientGrid" runat="server" KeyFieldName="Id" AutoGenerateColumns="False" OnRowDeleting="OfflineClientGrid_RowDeleting"
                            DataSourceID="OfflineClientDataSource" Width="100%" ClientInstanceName="grid" OnCustomCallback="OfflineClientGrid_CustomCallback" >
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                            <Styles>
<Header SortingImageSpacing="5px" BackColor="#8EB3E7" ImageSpacing="5px"></Header>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<Footer CssClass="gridheader"></Footer>
</Styles>
 <SettingsPager NumericButtonCount="20" ShowSeparators="True" AlwaysShowPager="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
                            <Columns>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="0" FieldName="ShortName">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="AccountCategory" Caption="Account Category">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn VisibleIndex="2"  Caption="BranchName" FieldName="BranchID">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="BeneficiaryTypeSubtype" Caption="Beneficiary Type / Subtype">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="Status" Caption="Status">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn VisibleIndex="5" Caption="Details"><DataItemTemplate>
  <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                            More Info...</a>
                                    
</DataItemTemplate>
<HeaderTemplate>
     <a href="javascript:void(0);" onclick="OnAddButtonClick()"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                    
</HeaderTemplate>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<%--<dxwgv:GridViewDataTextColumn VisibleIndex="6" Caption="Edit"><DataItemTemplate>
  <a href="javascript:void(0);" onclick="OnEditClick('<%# Container.KeyValue %>')">
                                            Edit</a>
                                    
</DataItemTemplate>

<CellStyle Wrap="False" HorizontalAlign="Left"></CellStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>--%>
<dxwgv:GridViewCommandColumn Caption="Delete" Visible="True" VisibleIndex="8">
<DeleteButton Visible="True"></DeleteButton>

<CellStyle ForeColor="White">
<HoverStyle BackColor="#000040"></HoverStyle>
</CellStyle>
</dxwgv:GridViewCommandColumn>
<%--<dxwgv:GridViewDataTextColumn VisibleIndex="7" Caption="Delete"><DataItemTemplate>
  <a href="javascript:void(0);" onclick="OnDeleteClick('<%#Eval("Id") %>' %>')">
                                            Delete</a>
                                    
</DataItemTemplate>

<CellStyle Wrap="False" HorizontalAlign="Left"></CellStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="6" FieldName="user_name" Caption="Created User">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>--%>
</Columns>
                            <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                                PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="3" />
                            <SettingsText PopupEditFormCaption="Add/ Modify OfflineClient" />
                            <StylesPager>
<Summary Width="100%"></Summary>
</StylesPager>
                            <Settings ShowStatusBar="Visible" />
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="OfflineClientDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" 
                SelectCommand="" ></asp:SqlDataSource>
            <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
            </dxwgv:ASPxGridViewExporter>
        </div>
     <%-- <asp:TextBox runat="server" ID="txt1"  TextMode="MultiLine"></asp:TextBox>--%>
        
    </form>
</body>
</html>

