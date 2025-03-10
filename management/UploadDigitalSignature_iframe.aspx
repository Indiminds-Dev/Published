<%@ page language="C#" autoeventwireup="true" inherits="management_UploadDigitalSignature_iframe, App_Web__yen2upk" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <title>Untitled Page</title>

    <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
      function OnMoreInfoClick(url,HeaderText,Width,Height,anyKey) //AnyKey will help to call back event to child page, if u have to fire more that one function 
        {
             alert("123");
             parent.OnMoreInfoClick(url,"Modify Lead Details",'940px','450px',"Y"); 
//             editwin=dhtmlmodal.open("Editbox", "iframe", url,HeaderText , "width="+Width+",height="+Height+",center=1,resize=1,scrolling=2,top=500", "recal")
//             document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='hidden';
//             editwin.onclose=function()
//             {
//                document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='visible';
//                 if(anyKey=='Y')
//                 {
//                    document.getElementById('IFRAME_ForAllPages').contentWindow.callback();
//                   
//                 }
//             }
        }
        function DhtmlClose()
        {
            parent.editwin.close();
            document.getElementById('IFRAME_ForAllPages').contentWindow.callback();
        }
       function InfoClick()
        {
        
            var URL='UploadDigitalSignature_add.aspx' ;
            parent.OnMoreInfoClick(URL,'Add Digital Signature','950px','450px','Y');
        }
        
       function AuthUser(obj)
        {
        if(obj==null)
        {
        alert('Please Select a Record');
        }
        else
        {
             var URL='UploadDigitalSignature_AuthUser.aspx?id='+obj ;
            parent.OnMoreInfoClick(URL,'Add Authorize User','950px','450px','Y');
            }
        }

        
        function callback()
        {
          grid.PerformCallback();
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
        
        function ShowHideFilter(obj)
          {
           grid.PerformCallback(obj);
          }



    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
     <table class="TableMain100">
     <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Digital Signature</span></strong>
                    </td>
                </tr></table>
        <table id="tblSummary" border="0" cellpadding="0" cellspacing="0" class="TableMain100">
            <tr>
                <td colspan="2" style="text-align: left;">
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
                <td class="gridcellright" colspan="4" valign="top">
                    <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                        ClientInstanceName="exp" Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                        SelectedIndex="0" ValueType="System.Int32" Width="130px">
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
            <tr>
                <td colspan="6" style="text-align: left">
                    <dxwgv:ASPxGridView ID="gridSign" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
                        KeyFieldName="DigitalSignature_ID" Width="100%" OnCustomCallback="gridSign_CustomCallback"
                        OnCommandButtonInitialize="gridSign_CommandButtonInitialize" OnCellEditorInitialize="gridSign_CellEditorInitialize"
                        OnRowUpdating="gridSign_RowUpdating" OnRowDeleting="gridSign_RowDeleting" >
                        <settingsbehavior allowfocusedrow="True" ConfirmDelete="true"/>
                        <styles>
                        <FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

                        <FocusedRow CssClass="gridselectrow"></FocusedRow>
                        </styles>
                          <settingspager numericbuttoncount="20" pagesize="20" showseparators="True" alwaysshowpager="True">
                        <FirstPageButton Visible="True"></FirstPageButton>

                        <LastPageButton Visible="True"></LastPageButton>
                        </settingspager>
                        <columns>
                        <dxwgv:GridViewDataTextColumn FieldName="name" Caption="Name" VisibleIndex="0">
                        <Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>
                        <EditItemTemplate>
                            <asp:Label ID="ename" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                        </EditItemTemplate>
                        <CellStyle Wrap="False" CssClass="gridcellleft"></CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataDateColumn FieldName="DigitalSignature_ValidFrom" Caption="Valid From"
                                VisibleIndex="1">
                                <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy"  EditFormat="Custom">
                                </PropertiesDateEdit>
                                <Settings AutoFilterCondition="Contains"></Settings>
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataDateColumn>
                        <dxwgv:GridViewDataDateColumn FieldName="DigitalSignature_ValidUntil" Caption="Valid To" VisibleIndex="2">
                        <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy" EditFormat="Custom"></PropertiesDateEdit>
                        <Settings AutoFilterCondition="Contains"></Settings>

                        <CellStyle Wrap="False" CssClass="gridcellleft"></CellStyle>
                        </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn VisibleIndex="3">
                                <DataItemTemplate>
                                    <a href="javascript:AuthUser('<%# Container.KeyValue %>');"><span style="color: Black;
                                        text-decoration: none;">Authorised User</span></a>
                                </DataItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="ename" runat="server" Text=""></asp:Label>
                                </EditItemTemplate>
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                                <HeaderTemplate>
                                    <a href="javascript:InfoClick();"><span style="color: #000099; text-decoration: underline">
                                        Add New</span></a>
                                </HeaderTemplate>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewCommandColumn VisibleIndex="11">
                                <ClearFilterButton Visible="True">
                                </ClearFilterButton>
                                <EditButton Visible="True">
                                </EditButton>
                                <DeleteButton Visible="True">
                                </DeleteButton>
                            </dxwgv:GridViewCommandColumn>
                        </columns>
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormVerticalAlign="TopSides" PopupEditFormHorizontalAlign="rightsides" PopupEditFormModal="True"
                        PopupEditFormWidth="900px" EditFormColumnCount="4" />
                                                <settings showstatusbar="Visible" />
                                                <styleseditors>
                        <ProgressBar Height="25px"></ProgressBar>
                        </styleseditors>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
