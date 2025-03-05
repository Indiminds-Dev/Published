<%@ page language="C#" autoeventwireup="true" inherits="management_professional, App_Web_g1t3n0jz" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>   
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dxhf" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profession</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript">
        function ShowHideFilter(obj)
        {
            grid.PerformCallback(obj);
        } 
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
    function fn_PopUpOpen()
    {
        chfProfId.Set('hfProfId','');
        ctxtProfession.SetText('');
        cPopupProfession.Show();
    
    }
    function fn_EditProfession(keyValue)
    {
        grid.PerformCallback('Edit~'+keyValue);
    }
    function grid_EndCallBack()
    {
        if(grid.cpEdit!=null)
        {
        ctxtProfession.SetText(grid.cpEdit.split('~')[0]);
        var hfId=grid.cpEdit.split('~')[1];
        chfProfId.Set('hfProfId',hfId);
        cPopupProfession.Show();
        
        }
        
         if(grid.cpinsert!=null)
         {
           if(grid.cpinsert=='Success')
             {
               alert('Inserted Successfully');
               cPopupProfession.Hide();
             }
           else
             {
               alert("Error On Insertion\n'Please Try Again!!'");
             }
         }  
         
         if(grid.cpUpdate!=null)
         {
           if(grid.cpUpdate=='Success')
             {
               alert('Updated Successfully');
               cPopupProfession.Hide();
             }
           else
             {
               alert("Error On Updatio\n'Please Try Again!!'");
             }
         }
         
         if(grid.cpDelete!=null) 
          {
           if(grid.cpDelete=='Success')
              alert('Deleted Successfully');
           else
              alert("Error on deletion\n'Please Try again!!'")
          } 
         
         if(grid.cpExists!=null)
         {
           if(grid.cpExists=='Exists')
             {
               alert('Record Already Exists');
               cPopupProfession.Hide();
             }
          
         }           
    
    }
    function fn_DeleteProfession(keyValue)
    {
        grid.PerformCallback('Delete~'+keyValue);
    }
    
    function btnSave_Profession()
    {
        if(ctxtProfession.GetText()=='')
        {
            alert('Please Enter Profession Name');
            ctxtProfession.Focus();
        
        }
        else
        {
            var hfpid=chfProfId.Get('hfProfId');
            if(hfpid=='')
                grid.PerformCallback('SaveProfession~'+ctxtProfession.GetText());
            else
                grid.PerformCallback('UpdateProfession~'+chfProfId.Get('hfProfId'));
        }
    
    
    }
    </script>
    <style type="text/css">
        .profDiv{height: 25px; width: 100px; float:left; margin-left:10px;}
        .StateTextbox{height:25px;width:50px;} 
        .Top{height: 30px; width: 400px; background-color: Silver;padding-top: 5px;}
        .Footer{height: 30px; width: 400px; background-color: Silver;padding-top: 10px;}  
       
    </style>    

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Profession List</span></strong></td>
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
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="ProfQualGrid" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False"
                        KeyFieldName="pro_id" Width="100%" OnHtmlEditFormCreated="ProfQualGrid_HtmlEditFormCreated"
                        OnHtmlRowCreated="ProfQualGrid_HtmlRowCreated" OnCustomCallback="ProfQualGrid_CustomCallback">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="pro_id" ReadOnly="True" Visible="False"
                                VisibleIndex="0" Width="20%">
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Profession" FieldName="pro_professionName"
                                VisibleIndex="0" Width="80%">
                                <PropertiesTextEdit Width="300px">
                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorText="" ErrorTextPosition="Bottom"
                                        SetFocusOnError="True" ValidateOnLeave="False">
                                        <RequiredField ErrorText="Please Enter Profession Name" IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                                <EditFormSettings Visible="True" />
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                    <Paddings PaddingTop="15px" />
                                </EditCellStyle>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn>
                            <HeaderTemplate>
                                <a href="javascript:void(0);" onclick="fn_PopUpOpen()"><span style="color: #000099;text-decoration: underline">Add New</span> </a>
                            </HeaderTemplate>
                            <DataItemTemplate>
                                <a href="javascript:void(0);" onclick="fn_EditProfession('<%#Container.KeyValue %>')">Edit</a>
                                <a href="javascript:void(0);" onclick="fn_DeleteProfession('<%#Container.KeyValue %>')">Delete</a>
                            </DataItemTemplate>
                            
                            </dxwgv:GridViewDataTextColumn>
                            
                            
                            
                           <%-- <dxwgv:GridViewCommandColumn VisibleIndex="1">
                                <DeleteButton Visible="True">
                                </DeleteButton>
                                <EditButton Visible="True">
                                </EditButton>
                                <HeaderStyle HorizontalAlign="Center" />
                                <HeaderTemplate>
                                    <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                      { %>
                                    <a href="javascript:void(0);" onclick="fn_PopUpOpen()"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                    <%} %>
                                </HeaderTemplate>
                            </dxwgv:GridViewCommandColumn>--%>
                        </Columns>
                        <Styles>
                            <Cell CssClass="gridcellleft">
                            </Cell>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <Settings ShowStatusBar="Visible" />
                        <SettingsText CommandNew="Add" PopupEditFormCaption="Add/Modify Profession" />
                        <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="200px" PopupEditFormHorizontalAlign="Center"
                            PopupEditFormModal="True" PopupEditFormVerticalAlign="Above" PopupEditFormWidth="600px"
                            EditFormColumnCount="1" />
                        <SettingsPager NumericButtonCount="20" PageSize="20" AlwaysShowPager="True" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <Templates>
                            <EditForm>
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 100%">
                                            <controls>
                                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                                </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                                            </controls>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:center">
                                            <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                runat="server">
                                            </dxwgv:ASPxGridViewTemplateReplacement>
                                            <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                runat="server">
                                            </dxwgv:ASPxGridViewTemplateReplacement>
                                        </td>
                                    </tr>
                                </table>
                            </EditForm>
                        </Templates>
                        <clientsideevents endcallback="function (s, e) {grid_EndCallBack();}" />
                    </dxwgv:ASPxGridView>
                    <dxpc:ASPxPopupControl ID="PopupProfession" runat="server" ClientInstanceName="cPopupProfession"
                        Width="400px" Height="120px" HeaderText="Add Edit Profession Details" PopupHorizontalAlign="Windowcenter"
                        PopupVerticalAlign="WindowCenter" CloseAction="closeButton" Modal="true">
                        <ContentCollection>
                            <dxpc:PopupControlContentControl ID="countryPopup" runat="server">
                                <div class="Top">
                                    <div>
                                        <div class="profDiv">
                                            Profession &nbsp;</div>
                                        <div>
                                            <dxe:ASPxTextBox ID="txtProfession" ClientInstanceName="ctxtProfession" ClientEnabled="true"
                                                runat="server" Height="25px" Width="180px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="ContentDiv">                                   
                                    <div class="Footer">
                                        <div style="margin-left: 110px; width: 70px; float: left;">
                                            <dxe:ASPxButton ID="btnSave_Profession" ClientInstanceName="cbtnSave_Profession" runat="server"
                                                AutoPostBack="False" Text="Save">
                                                <ClientSideEvents Click="function (s, e) {btnSave_Profession();}" />
                                            </dxe:ASPxButton>
                                        </div>
                                        <div style="width: 220px;">
                                            <dxe:ASPxButton ID="btnCancel_Profession" runat="server" AutoPostBack="False" Text="Cancel">
                                                <ClientSideEvents Click="function (s, e) {fn_btnProfession();}" />
                                            </dxe:ASPxButton>
                                        </div>
                                        <br style="clear: both;" />
                                    </div>
                                    <br style="clear: both;" />
                                </div>
                            </dxpc:PopupControlContentControl>
                        </ContentCollection>
                        <HeaderStyle BackColor="LightGray" ForeColor="Black" />
                    </dxpc:ASPxPopupControl>
                </td>
            </tr>
            <tr>
            <td>
            <dxhf:ASPxHiddenField runat="server" ClientInstanceName="chfProfId" ID="hfProfId"></dxhf:ASPxHiddenField>
            </td>
            </tr>
        </table>
        <%--<asp:SqlDataSource ID="Professional" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" DeleteCommand="DELETE FROM [tbl_master_profession] WHERE [pro_id] = @original_pro_id"
            InsertCommand="INSERT INTO [tbl_master_profession] ([pro_professionName], [CreateDate], [CreateUser]) VALUES (@pro_professionName, getdate(), @CreateUser)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [pro_id],[pro_professionName] FROM [tbl_master_profession]"
            UpdateCommand="UPDATE [tbl_master_profession] SET [pro_professionName] = @pro_professionName ,[LastModifyDate]=getdate(),[LastModifyUser]= @CreateUser WHERE [pro_id] = @original_pro_id">
            <DeleteParameters>
                <asp:Parameter Name="original_pro_id" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="pro_professionName" Type="String" />
                <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="pro_professionName" Type="String" />
                <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
            </InsertParameters>
        </asp:SqlDataSource>--%>
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
        <br />
    </form>
</body>
</html>
