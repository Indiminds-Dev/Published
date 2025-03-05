<%@ page language="C#" autoeventwireup="true" inherits="management_frmContactMain, App_Web_nhjs8cfd" %>
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
    
    function ShowMissingData(obj,obj2)
    {
      var url='frmContactMissingData.aspx?id=' +obj;
      parent.OnMoreInfoClick(url,"Record not available for  " + obj2 ,'650px','500px',"N");
    
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
        //{
            window.frameElement.height = document.body.scrollHeight;
           // alert('1');
           // }
        else
        {
            window.frameElement.height = '300px';
            window.frameElement.Width = document.body.scrollWidth;
            // alert('2');
             }
    }
    function NewPgae(cnt_id)
    {
        //alert('cnt_id');
    }
    function OnMoreInfoClick(keyValue)
    {
        var url='Contact_general.aspx?id='+keyValue;
        //New Work 30-12-2021
        //parent.OnMoreInfoClick(url,"Modify Contact Details",'1000px','550px',"Y");
        parent.OnMoreInfoClick(url,"Modify Contact Details",'1130px','550px',"Y");
        //End of New Work 30-12-2021
    }
    function OnAddButtonClick() 
    {
        var url='Contact_general.aspx?id=' + 'ADD';
        parent.OnMoreInfoClick(url,"Add Contact Details",'1000px','550px',"Y");

    }
    function OnCreateActivityClick(KeyVal)
    {
        //alert(KeyVal);
        var url='Lead_Activity.aspx?id=' + KeyVal;
        parent.OnMoreInfoClick(url,"Contact Activity Creation",'940px','450px',"Y");
     
    }
    function OnAllInfoClick(KeyVal)
    {
        grid.PerformCallback('ClientInfo~'+KeyVal);
    }
    function ShowHideFilter(obj)
    {
         if(document.getElementById('TxtSeg').value=='N')
           {
             document.getElementById('TxtTCODE').style.display="none";
           }
           else
           {
            document.getElementById('TxtTCODE').style.display="inline";
           }
        InitialTextVal();
        if(obj=="s")
            //document.getElementById('TrFilter').style.display="inline";
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
     function OnContactInfoClick(keyValue,CompName)
    {
    alert (CompName);
        var url='insurance_contactPerson.aspx?id='+keyValue;
        parent.OnMoreInfoClick(url,"Contact Name : "+CompName+"",'940px','450px',"Y");
       
    } 
   function btnSearch_click()
   {
        document.getElementById('TrFilter').style.display="none";
        grid.PerformCallback('s');
   }  
   function InitialTextVal()
   {
    document.getElementById('txtName').value = "Name";
    document.getElementById('txtBranchName').value = "Branch Name";
    document.getElementById('txtCode').value = "Code";
    document.getElementById('txtRelationManager').value = "R. Manager";
    document.getElementById('txtReferedBy').value = "Email";
    document.getElementById('txtPhNumber').value = "Ph. Number";
    document.getElementById('txtContactStatus').value = "Contact Status";
    document.getElementById('TxtTCODE').value = "Trade. Code";
    document.getElementById('txtPAN').value = "PAN No.";
   }  
//-->
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr id="td_contact" runat="server">
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Contact List</span></strong></td>
                </tr>
                <tr id="td_broker" runat="server">
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Broker List</span></strong></td>
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
                                    <asp:TextBox ID="txtBranchName" runat="server" CssClass="water" Text="Branch Name"
                                        ToolTip="Branch Name" Font-Size="10px" Width="100px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCode" runat="server" CssClass="water" Text="Code" ToolTip="Code"
                                        Font-Size="10px" Width="54px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtTCODE" runat="server" CssClass="water" Text="Trade. Code" ToolTip="Trade. Code"
                                        Font-Size="10px" Width="79px"></asp:TextBox>
                                    <asp:HiddenField ID="TxtSeg" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPAN" runat="server" CssClass="water" Text="PAN No." ToolTip="PAN No."
                                        Font-Size="10px" Width="79px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtRelationManager" runat="server" CssClass="water" Text="R. Manager"
                                        ToolTip="R. Manager" Font-Size="10px" Width="85px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtReferedBy" runat="server" CssClass="water" Text="Email" ToolTip="Email"
                                        Font-Size="10px" Width="92px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPhNumber" runat="server" CssClass="water" Text="Ph. Number" ToolTip="Ph. Number"
                                        Font-Size="10px" Width="90px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtContactStatus" runat="server" CssClass="water" Text="Contact Status"
                                        ToolTip="Contact Status" Font-Size="10px" Width="79px"></asp:TextBox>
                                </td>
                                <%--  <td visible="false">
                                    <asp:TextBox ID="txtStatus" runat="server" CssClass="water" Text="Status" ToolTip="Status"
                                        Font-Size="10px" Width="97px"></asp:TextBox>
                                </td>--%>
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
                        <dxwgv:ASPxGridView ID="EmployeeGrid" runat="server" KeyFieldName="cnt_Id" AutoGenerateColumns="False"
                            DataSourceID="EmployeeDataSource" Width="1320px" ClientInstanceName="grid" OnCustomJSProperties="EmployeeGrid_CustomJSProperties"
                            OnCustomCallback="EmployeeGrid_CustomCallback" OnHtmlRowCreated="EmployeeGrid_HtmlRowCreated">
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
                                <dxwgv:GridViewDataTextColumn VisibleIndex="0" Caption="Details" Width="55px">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                            More Info</a>
                                    </DataItemTemplate>
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="OnAddButtonClick()"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                    </HeaderTemplate>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="1" FieldName="Id">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="1" FieldName="Name" Width="200px">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="BranchName" Width="200px">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="Code" Caption="Code">
                                    <DataItemTemplate>
                                        <a title="Client to More Info." href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                            <%#Eval("Code")%></a>
                                    </DataItemTemplate>
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="CRG_TCODE" Caption="Trade. Code">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="PanNumber" Caption="PAN No.">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="6" FieldName="RM" Caption="Relationship Manager" Width="120px">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="7" FieldName="eml_email" Caption="Email (Official)" Width="250px">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="8" FieldName="phf_phoneNumber" Caption="Phone Number" Width="150px">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="9" FieldName="cntstu_contactStatus" Caption="Contact Status" >
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="10" FieldName="LegalStatus" Caption="Legal Status" Width="100px">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="11" FieldName="Status" Caption="Status"
                                    Visible="false">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                 <dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="12" FieldName="Id" Caption="AllInfo">
                                    <HeaderStyle HorizontalAlign="Center">
                                    </HeaderStyle>
                                    <HeaderCaptionTemplate>
                                        <a href="javascript:void(0);" onclick="OnAllInfoClick('ALL')">All Info</a>
                                    </HeaderCaptionTemplate>
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnAllInfoClick('<%# Eval("Id") %>')">Export</a>
                                    </DataItemTemplate>
                                    <CellStyle HorizontalAlign="Left">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="12" FieldName="Id" Caption="Activity">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnCreateActivityClick('<%# Eval("Id") %>')">Create</a>
                                    </DataItemTemplate>
                                    <CellStyle HorizontalAlign="Left">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                               <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="14" FieldName="user_name"
                                    Caption="Created User">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormCaptionStyle HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <settingsediting mode="PopupEditForm" popupeditformhorizontalalign="Center" popupeditformmodal="True"
                                popupeditformverticalalign="WindowCenter" popupeditformwidth="900px" editformcolumncount="3" />
                            <settingstext popupeditformcaption="Add/ Modify Employee" />
                            <StylesPager>
                                <Summary Width="100%">
                                </Summary>
                            </StylesPager>
                            <settings showstatusbar="Visible" ShowHorizontalScrollBar="true" />
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="EmployeeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
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
