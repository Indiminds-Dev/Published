<%@ page language="C#" autoeventwireup="true" inherits="management_Master_IFS, App_Web_sjbhlkdr" %>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>client</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>

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
    
     function grid_endcallback(obj)
     {
        if (obj=="ADD")
            height()
        if(grid.cpIsSpData!=undefined)
        {
            if(grid.cpIsSpData=="Export")
                GetObjectID('btnExcelExport').click();
            if(grid.cpIsSpData=="NoData")
                alert("No Data Found!!!");
                
        }
     }
    function height()
    {
        if(document.body.scrollHeight>=300)
            window.frameElement.height = document.body.scrollHeight;
        else
        {
            window.frameElement.height = '300px';
            window.frameElement.Width = document.body.scrollWidth;
             }
    }
    function NewPgae(cnt_id)
    {
        //alert('cnt_id');
    }
    function DeleteRow(keyValue)
    {
        doIt=confirm('Are You Want To Delete This Record ???');
        if(doIt)
            {
               var obj1="Delete"+"~"+keyValue;
               grid.PerformCallback(obj1);
               height();
            }
        else{
              
            }   
    }
    function OnMoreInfoClick(keyValue)
    {
        var url='IFS_General.aspx?id='+keyValue;
        parent.OnMoreInfoClick(url,"Modify IFS Details",'1000px','450px',"Y");
    }
    function OnAddButtonClick() 
    {
        var url='IFS_General.aspx?id=' + 'ADD';
        parent.OnMoreInfoClick(url,"Add IFS Details",'1000px','450px',"Y");
    }
    function ShowHideFilter(obj)
    {
        if(obj=="s")
            grid.PerformCallback('ssss');
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
    document.getElementById('txtName').value = "Name";
    document.getElementById('txtCode').value = "Code";
    document.getElementById('txtOInc').value = "D.O.Inc";
    document.getElementById('txtFace_Value').value = "Face Value";
    document.getElementById('txtCurrency').value = "Currency";
    document.getElementById('txtUnits_Issued').value = "Units Issued";
    document.getElementById('TxtFund_Invested').value = "Fund Invested";
    document.getElementById('txtFund_Value').value = "Fund Value";
    document.getElementById('txtFund_Value').value = "Current NAV";
   }  
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr id="td_contact" runat="server">
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Investment Fund Schemes(IFS) List</span></strong></td>
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
                                <td class="gridcellright" align="right">
                                    <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                        Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                        ValueType="System.Int32" Width="130px">
                                        <items>
                                            <dxe:ListEditItem Text="Select" Value="0" />
                                            <dxe:ListEditItem Text="PDF" Value="1" />
                                            <dxe:ListEditItem Text="XLS" Value="2" />
                                            <dxe:ListEditItem Text="RTF" Value="3" />
                                            <dxe:ListEditItem Text="CSV" Value="4" />
                                        </items>
                                        <buttonstyle backcolor="#C0C0FF" forecolor="Black">
                                        </buttonstyle>
                                        <itemstyle backcolor="Navy" forecolor="White">
                                            <HoverStyle BackColor="#8080FF" ForeColor="White">
                                            </HoverStyle>
                                        </itemstyle>
                                        <border bordercolor="White" />
                                        <dropdownbutton text="Export">
                                        </dropdownbutton>
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="TrFilter" style="display: none">
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="water" Text="Name" ToolTip="Name"
                                        Font-Size="10px" Width="119px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCode" runat="server" CssClass="water" Text="Code" ToolTip="Code"
                                        Font-Size="10px" Width="54px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDOInc" runat="server" CssClass="water" Text="D.O.Inc" ToolTip="D.O.Inc"
                                        Font-Size="10px" Width="79px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFace_Value" runat="server" CssClass="water" Text="Face Value" ToolTip="Face Value"
                                        Font-Size="10px" Width="79px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCurrency" runat="server" CssClass="water" Text="Currency" ToolTip="Currency" 
                                    Font-Size="10px" Width="85px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtUnits_Issued" runat="server" CssClass="water" Text="Units Issued" ToolTip="Units Issued"
                                        Font-Size="10px" Width="92px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFund_Invested" runat="server" CssClass="water" Text="Fund Invested" ToolTip="Fund Invested"
                                        Font-Size="10px" Width="90px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFund_Value" runat="server" CssClass="water" Text="Fund Value" ToolTip="Fund Value" 
                                    Font-Size="10px" Width="79px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextCurrent_NAV" runat="server" CssClass="water" Text="Current NAV" ToolTip="Current NAV" 
                                    Font-Size="10px" Width="79px"></asp:TextBox>
                                </td>
                                <td>
                                    <input id="btnSearch" type="button" value="Search" class="btnUpdate" style="height: 21px"
                                        onclick="btnSearch_click()" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="IFSGrid" runat="server" KeyFieldName="Id" AutoGenerateColumns="False"
                            DataSourceID="IFSDataSource" Width="1320px" ClientInstanceName="grid" OnCustomJSProperties="IFSGrid_CustomJSProperties"
                            OnCustomCallback="IFSGrid_CustomCallback" OnHtmlRowCreated="IFSGrid_HtmlRowCreated">
                            <settingsbehavior allowfocusedrow="True" confirmdelete="True" autofilterrowinputdelay="100000" />
                            <Styles>
                                <Header SortingImageSpacing="5px" BackColor="#8EB3E7" ImageSpacing="5px">
                                </Header>
                                <FocusedRow CssClass="gridselectrow">
                                </FocusedRow>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <FocusedGroupRow CssClass="gridselectrow">
                                </FocusedGroupRow>
                                <Footer CssClass="gridheader">
                                </Footer>
                            </Styles>
                            <SettingsPager NumericButtonCount="20" ShowSeparators="True" AlwaysShowPager="True"
                                PageSize="10">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <clientsideevents endcallback="function(s,e) { grid_endcallback(); }" />
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="Id">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="1" FieldName="Name" Caption="IFS Name" Width="200px">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="Code" Caption="IFS Code" Width="80px">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="DOInc" Caption="D.O.Inc" Width="70px">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="Face_Value" Caption="Face Value" Width="90px">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="Currency" Caption="Currency" Width="90px">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="6" FieldName="Units_Issued" Caption="Units Issued" Width="90px">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="7" FieldName="Fund_Invested" Caption="Fund Invested" Width="90px">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="8" FieldName="Fund_Value" Caption="Fund Value" Width="90px">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="9" FieldName="Current_NAV" Caption="Current NAV" Width="90px">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="10" Caption="Details" Width="100px">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                            Modify</a>
                                    </DataItemTemplate>
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="OnAddButtonClick()"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                    </HeaderTemplate>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="11" Caption="Delete" Width="100px">
                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="DeleteRow('<%# Container.KeyValue %>')">Delete</a>
                                    </DataItemTemplate>
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <HeaderTemplate>
                                        <span style="color: Red; text-decoration: underline">Delete</span>
                                    </HeaderTemplate>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <settingsediting mode="PopupEditForm" popupeditformhorizontalalign="Center" popupeditformmodal="True"
                                popupeditformverticalalign="WindowCenter" popupeditformwidth="900px" editformcolumncount="3" />
                            <settingstext popupeditformcaption="Add/ Modify IFS" ConfirmDelete="Are You Sure To Delete This Record ???"/>
                            <StylesPager>
                                <Summary Width="100%">
                                </Summary>
                            </StylesPager>
                            <settings showstatusbar="Visible" ShowHorizontalScrollBar="true" />
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="IFSDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand=""></asp:SqlDataSource>
            <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
            </dxwgv:ASPxGridViewExporter>
        </div>
        <div style="display: none">
            <asp:Button ID="btnExcelExport" runat="server" BackColor="#DDECFE" BorderStyle="None"
                OnClick="btnExcelExport_Click" />
        </div>
    </form>
</body>
</html>
