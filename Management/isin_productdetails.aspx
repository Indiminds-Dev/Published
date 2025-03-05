<%@ page language="C#" autoeventwireup="true" inherits="management_isin_productdetails, App_Web_fxnvzv_8" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.XtraCharts.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.XtraCharts.v9.1.Web, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Product Details</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
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
   
    function ShowError(obj)
    {
        if(obj!="3")
        {
          alert(obj);
        }
       
    }
    </script>
    
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div style="color:red"> *only one ISIN Can be active at a time </div>
        <table id="tblT1" runat="server" width="100%">
            <tr>
                <td>
              <dxwgv:ASPxGridView ID="grdisindetails"  ClientInstanceName="grdisindetails" KeyFieldName="ISIN_Id" runat="server"
                        Width="100%" AutoGenerateColumns="False" OnRowInserting="grdisindetails_RowInserting" OnRowUpdating="grdisindetails_RowUpdating" OnCustomJSProperties="grdisindetails_CustomJSProperties"  
                         DataSourceID="ISINDataSource">
                         <ClientSideEvents EndCallback="function(s,e){ShowError(s.cpInsertError);}" />                          
                        <Styles  >
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        
                        <Settings ShowStatusBar="Visible" />
                        <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsBehavior AllowFocusedRow="True" />
                  <Columns>
                      <dxwgv:GridViewDataTextColumn Caption="ISIN Number" FieldName="isin_number" VisibleIndex="0">
                          <EditCellStyle Wrap="False">
                          </EditCellStyle>
                          <CellStyle CssClass="gridcellleft">
                          </CellStyle>
                          <PropertiesTextEdit Width="120px">
                          </PropertiesTextEdit>
                          <EditFormCaptionStyle Wrap="False">
                          </EditFormCaptionStyle>
                          <EditFormSettings CaptionLocation="Near" />
                      </dxwgv:GridViewDataTextColumn>
                      <dxwgv:GridViewDataDateColumn Caption="From Date" FieldName="isin_existencefrom"
                          VisibleIndex="1">
                          <HeaderStyle HorizontalAlign="Center" />
                          <EditCellStyle Wrap="False">
                          </EditCellStyle>
                          <PropertiesDateEdit DateOnError="Today" DisplayFormatString="dd MM yyyy" EditFormat="Custom"
                              EditFormatString="dd MM yyyy" Width="120px" UseMaskBehavior="True">
                          </PropertiesDateEdit>
                          <Settings AllowAutoFilter="True" FilterMode="DisplayText" ShowFilterRowMenu="False"
                              ShowInFilterControl="False" />
                          <CellStyle HorizontalAlign="Center" Wrap="False">
                          </CellStyle>
                          <EditFormCaptionStyle Wrap="False">
                          </EditFormCaptionStyle>
                          <EditFormSettings CaptionLocation="Near" />
                      </dxwgv:GridViewDataDateColumn>
                      <dxwgv:GridViewDataDateColumn Caption="To Date" FieldName="isin_existenceuntil" VisibleIndex="2">
                          <HeaderStyle HorizontalAlign="Center" />
                          <EditCellStyle Wrap="False">
                          </EditCellStyle>
                          <PropertiesDateEdit DateOnError="Today" DisplayFormatString="dd MM yyyy" EditFormat="Custom"
                              EditFormatString="dd MM yyyy" Width="120px" UseMaskBehavior="True">
                          </PropertiesDateEdit>
                          <Settings AllowAutoFilter="True" FilterMode="DisplayText" ShowFilterRowMenu="False"
                              ShowInFilterControl="False" />
                          <CellStyle HorizontalAlign="Center" Wrap="False">
                          </CellStyle>
                          <EditFormCaptionStyle Wrap="False">
                          </EditFormCaptionStyle>
                          <EditFormSettings CaptionLocation="Near" />
                      </dxwgv:GridViewDataDateColumn>
                      <dxwgv:GridViewDataTextColumn Caption="Face Value" FieldName="isin_facevalue" VisibleIndex="3">
                          <CellStyle CssClass="gridcellleft">
                          </CellStyle>
                          <PropertiesTextEdit Width="120px">
                          </PropertiesTextEdit>
                          <EditFormCaptionStyle Wrap="False">
                          </EditFormCaptionStyle>
                          <EditFormSettings CaptionLocation="Near" />
                      </dxwgv:GridViewDataTextColumn>
                      <dxwgv:GridViewDataTextColumn Caption="PaidUp Value" FieldName="isin_paidupvalue"
                          VisibleIndex="4">
                          <CellStyle CssClass="gridcellleft">
                          </CellStyle>
                          <PropertiesTextEdit Width="120px">
                          </PropertiesTextEdit>
                          <EditFormCaptionStyle Wrap="False">
                          </EditFormCaptionStyle>
                          <EditFormSettings CaptionLocation="Near" />
                      </dxwgv:GridViewDataTextColumn>
                      <dxwgv:GridViewDataComboBoxColumn Caption="ISIN Appl." FieldName="isin_isactive"
                          VisibleIndex="5">
                          <EditCellStyle Wrap="False">
                          </EditCellStyle>
                          <PropertiesComboBox ValueType="System.String" Width="120px">
                              <Items>
                                  <dxe:ListEditItem Text="Active" Value="Y" />
                                  <dxe:ListEditItem Text="InActive" Value="N" />
                              </Items>
                          </PropertiesComboBox>
                          <CellStyle CssClass="gridcellleft">
                          </CellStyle>
                          <EditFormCaptionStyle Wrap="False">
                          </EditFormCaptionStyle>
                          <EditFormSettings CaptionLocation="Near" Visible="True" VisibleIndex="0" />
                      </dxwgv:GridViewDataComboBoxColumn>
                      <dxwgv:GridViewCommandColumn VisibleIndex="6">
                          <ClearFilterButton Visible="True">
                          </ClearFilterButton>
                          <HeaderStyle HorizontalAlign="Center" />
                          <HeaderTemplate>
                              <a href="javascript:void(0);" onclick="grdisindetails.AddNewRow()"><span style="color: #000099;
                                  text-decoration: underline">Add New</span> </a>
                          </HeaderTemplate>
                          <EditButton Visible="True">
                          </EditButton>
                      </dxwgv:GridViewCommandColumn>
                  </Columns>
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                        PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="4" />
                          <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <Templates>
                 <EditForm>
                    <table style="width:100%">
                      <tr><td style="width:25%"></td>
                          <td style="width:50%">
                            <controls>
                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                            </controls>
                            <div style="text-align:right; padding:2px 2px 2px 2px">
                                <dxwgv:ASPxGridViewTemplateReplacement  ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server" ></dxwgv:ASPxGridViewTemplateReplacement>
                                <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                            </div>
                         </td>
                         <td style="width:25%"></td>
                     </tr>
                   </table>
                </EditForm>
            </Templates>
                    </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="ISINDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                        </asp:SqlDataSource>
                </td>
            </tr>
           
        </table>
      
    </form>
</body>
</html>
