<%@ page language="C#" autoeventwireup="true" inherits="management_Country, App_Web_n3rnr3dz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>

    <script language="javascript" type="text/javascript">
         function SignOff()
         {
            window.parent.SignOff()
         }
        function height()
        {
        if(document.body.scrollHeight<=500)
            window.frameElement.height = '500px';
        else         
            window.frameElement.height = document.body.scrollHeight;
        window.frameElement.widht = document.body.scrollWidht;
        }
    </script>

    <script type="text/javascript">
        function ShowHideFilter(obj)
        {
           grid.PerformCallback(obj);
        }
        function fn_PopUpOpen()
        {
            chfID.Set("hfID",'');
            ctxtCountryName.SetText('');
            ctxtNseCode.SetText('');
            ctxtBseCode.SetText('');
            ctxtMcxCode.SetText('');
            ctxtMcsxCode.SetText('');
            ctxtNcdexCode.SetText('');
            ctxtCdslCode.SetText('');
            ctxtNsdlCode.SetText('');
            ctxtNdmlCode.SetText('');
            ctxtDotexidCode.SetText('');
            ctxtCvlidCode.SetText('');
            ctxtCkycCode.SetText('');
            cPopupCountry.Show();
        
        }
        function fn_EditCountry(keyValue)
        {      
            grid.PerformCallback('Edit~'+keyValue);       
        }
        function fn_DeleteCountry(keyValue)
        {
            grid.PerformCallback('Delete~'+keyValue);
        }
        function fn_btnCancel()
        {
            cPopupCountry.Hide();
        }
        function btnSave_Country()
        {
            if(ctxtCountryName.GetText()=='')
            {
                alert('Please Enter Country Name');
                ctxtCountryName.Focus();
            }
            else
            {
                var id=chfID.Get('hfID');               
                if(id=='')
              
                   grid.PerformCallback('savecountry~'+ctxtCountryName.GetText()+'~'+ ctxtNseCode.GetText()+'~'+ ctxtBseCode.GetText()+'~'+ ctxtMcxCode.GetText()+'~'+ ctxtMcsxCode.GetText()+'~'+ ctxtNcdexCode.GetText()+'~'+ ctxtCdslCode.GetText()+'~'+ ctxtNsdlCode.GetText()+'~'+ ctxtNdmlCode.GetText()+'~'+ ctxtDotexidCode.GetText()+'~'+ ctxtCvlidCode.GetText()+'~'+ ctxtCkycCode.GetText());
                else
                   grid.PerformCallback('updatecountry~'+chfID.Get('hfID'));
            }
        }
        
        
        function grid_EndCallBack()
        {        
            if(grid.cpEdit!=null)
            {
                ctxtCountryName.SetText(grid.cpEdit.split('~')[0]);               
                ctxtNseCode.SetValue(grid.cpEdit.split('~')[2]);
                ctxtBseCode.SetValue(grid.cpEdit.split('~')[3]);
                ctxtMcxCode.SetValue(grid.cpEdit.split('~')[4]);
                ctxtMcsxCode.SetValue(grid.cpEdit.split('~')[5]);
                ctxtNcdexCode.SetValue(grid.cpEdit.split('~')[6]);
                ctxtCdslCode.SetValue(grid.cpEdit.split('~')[7]);
                ctxtNsdlCode.SetValue(grid.cpEdit.split('~')[8]);
                ctxtNdmlCode.SetValue(grid.cpEdit.split('~')[9]);
                ctxtDotexidCode.SetValue(grid.cpEdit.split('~')[10]);
                ctxtCvlidCode.SetValue(grid.cpEdit.split('~')[11]);
                ctxtCkycCode.SetValue(grid.cpEdit.split('~')[12]);
                var hfid=grid.cpEdit.split('~')[1];
               
                chfID.Set("hfID",hfid);
                cPopupCountry.Show();            
            }
            
             if(grid.cpinsert!=null)
             {
               if(grid.cpinsert=='Success')
                 {
                   alert('Inserted Successfully');
                   cPopupCountry.Hide();
                 }
               else
                 {
                   alert("Error On Insertion\n'Please Try Again!!'");
                 }
              }
              
         if(grid.cpExists!=null)
         {
           if(grid.cpExists=='Exists')
             {
               alert('Record Already Exists');
               cPopupCountry.Hide();
             }
          
         }                   
            
            if(grid.cpUpdate!=null) 
            {
               if(grid.cpUpdate=='Success')
                 {
                   alert('Update Successfully');
                   cPopupCountry.Hide();
                 }
                else
                    alert("Error on Updation\n'Please Try again!!'")
            }  
              
              
            if(grid.cpDelete!=null)
            {
             if(grid.cpDelete=='Success')
                alert('Record Delete Successfully');
             else
                alert('Error on deletio/n Please Try again!!')
            }
        }
    </script>

    <style type="text/css">
        .stateDiv{height: 25px; width: 130px; float:left; margin-left:70px;}
        .StateTextbox{height:25px;width:50px;} 
        .Top{height: 30px; width: 400px; background-color: Silver;padding-top: 5px;}
        .Footer{height: 30px; width: 400px; background-color: Silver;padding-top: 10px;}  
        .ScrollDiv{height: 250px; width: 400px; background-color: Silver;overflow-x: hidden; overflow-y: scroll;}
        .ContentDiv{width: 400px; height: 300px; border: 2px;background-color: Silver;} 
        
        .TitleArea
        {   height: 20px;
	        padding-left: 10px;
	        padding-right: 3px;
	        background-image: url( '../images/EHeaderBack.gif' );
	        background-repeat: repeat-x;
	        background-position: bottom;
	        text-align: center;
        }
        
        .FilterSide
        {
            float: left; padding-left: 15px; width: 50%;           
        }
        
        .SearchArea
        {
        width: 100%;height:30px;padding-top:5px;        
        }
        
    </style>
    
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div class="Main">
            <div class="TitleArea">
                <strong><span style="color: #000099">Country List</span></strong>
            </div>
            
            <div class="SearchArea">
                <div class="FilterSide">
                    <div style="float: left;padding-right:5px;">
                        <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                            Show Filter</span></a></div>
                            
                    <div>
                        <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                            All Records</span></a></div>
                </div>
                <div class="ExportSide">
                    <div style="margin-left: 90%;">
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
                    </div>
                </div>
            </div>
            
            <div class="GridViewArea">
                <dxwgv:ASPxGridView ID="GridCountry" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
                    KeyFieldName="cou_id" Width="100%" SkinID="OfficeSkin" OnHtmlEditFormCreated="GridCountry_HtmlEditFormCreated"
                    OnCustomCallback="GridCountry_CustomCallback">
                    <%--OnHtmlRowCreated="GridCountry_HtmlRowCreated"--%>
                    <Columns>
                        <dxwgv:GridViewDataTextColumn Caption="Country ID" FieldName="cou_id" ReadOnly="True"
                            Visible="False" VisibleIndex="0">
                            <EditCellStyle HorizontalAlign="Left">
                            </EditCellStyle>
                            <EditFormSettings Visible="False" VisibleIndex="1" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Country Name" FieldName="cou_country" VisibleIndex="1"
                            Width="8%">
                            <EditFormSettings Visible="True" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="NSE Code" FieldName="Country_NSECode" VisibleIndex="2"
                            Width="8%">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="BSE Code" FieldName="Country_BSECode" VisibleIndex="3"
                            Width="8%">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="MCX Code" FieldName="Country_MCXCode" VisibleIndex="4"
                            Width="8%">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="MCXSX Code" FieldName="Country_MCXSXCode"
                            VisibleIndex="5" Width="8%">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="NCDEX Code" FieldName="Country_NCDEXCode"
                            VisibleIndex="6" Width="8%">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="CDSL Code" FieldName="Country_CdslID" VisibleIndex="7"
                            Width="8%">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="NSDL Code" FieldName="Country_NsdlID" VisibleIndex="8"
                            Width="8%">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="NDML Code" FieldName="Country_NDMLId" VisibleIndex="9"
                            Width="8%">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="DOTEX Code" FieldName="Country_DotExID" VisibleIndex="10"
                            Width="8%">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="CVLID Code" FieldName="Country_CVLID" VisibleIndex="11"
                            Width="8%">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="CKYC Code" FieldName="Country_CKYCCode" VisibleIndex="11"
                            Width="8%">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn>
                            <HeaderTemplate>
                                <a href="javascript:void(0);" onclick="fn_PopUpOpen()"><span style="color: #000099;
                                    text-decoration: underline">Add New</span> </a>
                            </HeaderTemplate>
                            <DataItemTemplate>
                                <a href="javascript:void(0);" onclick="fn_EditCountry('<%#Container.KeyValue %>')">Edit</a>
                                <a href="javascript:void(0);" onclick="fn_DeleteCountry('<%#Container.KeyValue %>')">
                                    Delete</a>
                            </DataItemTemplate>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <ClientSideEvents EndCallback="function (s, e) {grid_EndCallBack();}" />
                </dxwgv:ASPxGridView>
            </div>
            
            <div class="PopUpArea">
                <dxpc:ASPxPopupControl ID="PopupCountry" runat="server" ClientInstanceName="cPopupCountry"
                    Width="400px" Height="420px" HeaderText="Add Country Details" PopupHorizontalAlign="Windowcenter"
                    PopupVerticalAlign="WindowCenter" CloseAction="closeButton" Modal="true">
                    <ContentCollection>
                        <dxpc:PopupControlContentControl ID="countryPopup" runat="server">
                            <div class="Top">
                                <div>
                                    <div class="stateDiv">
                                        Country &nbsp;</div>
                                    <div>
                                        <dxe:ASPxTextBox ID="txtCountryName" ClientInstanceName="ctxtCountryName" ClientEnabled="true"
                                            runat="server" Height="25px" Width="180px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="ContentDiv">
                                <div style="height: 20px; width: 280px; background-color: Gray; padding-left: 120px;">
                                    <h5>
                                        Static Code</h5>
                                </div>
                                <div style="height: 20px; width: 130px; padding-left: 70px; background-color: Gray;
                                    float: left;">
                                    Exchange</div>
                                <div style="height: 20px; width: 200px; background-color: Gray; text-align: left;">
                                    Value</div>
                                <div class="ScrollDiv">
                                    <div class="stateDiv" style="padding-top: 5px;">
                                        NSE Code</div>
                                    <div style="padding-top: 5px;">
                                        <dxe:ASPxTextBox ID="txtNseCode" ClientInstanceName="ctxtNseCode" ClientEnabled="true"
                                            runat="server" CssClass="StateTextbox">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <br style="clear: both;" />
                                    <div class="stateDiv">
                                        BSE Code</div>
                                    <div>
                                        <dxe:ASPxTextBox ID="txtBseCode" ClientInstanceName="ctxtBseCode" ClientEnabled="true"
                                            runat="server" CssClass="StateTextbox">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <br style="clear: both;" />
                                    <div class="stateDiv">
                                        MCX Code</div>
                                    <div>
                                        <dxe:ASPxTextBox ID="txtMcxCode" ClientInstanceName="ctxtMcxCode" ClientEnabled="true"
                                            runat="server" CssClass="StateTextbox">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <br style="clear: both;" />
                                    <div class="stateDiv">
                                        MCXSX Code</div>
                                    <div>
                                        <dxe:ASPxTextBox ID="txtMcsxCode" ClientInstanceName="ctxtMcsxCode" ClientEnabled="true"
                                            runat="server" CssClass="StateTextbox">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <br style="clear: both;" />
                                    <div class="stateDiv">
                                        NCDEX Code</div>
                                    <div>
                                        <dxe:ASPxTextBox ID="txtNcdexCode" ClientInstanceName="ctxtNcdexCode" ClientEnabled="true"
                                            runat="server" CssClass="StateTextbox">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <br style="clear: both;" />
                                    <div class="stateDiv">
                                        CDSL Code</div>
                                    <div>
                                        <dxe:ASPxTextBox ID="txtCdslCode" ClientInstanceName="ctxtCdslCode" ClientEnabled="true"
                                            runat="server" CssClass="StateTextbox">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <br style="clear: both;" />
                                    <div class="stateDiv">
                                        NSDL Code</div>
                                    <div>
                                        <dxe:ASPxTextBox ID="txtNsdlCode" ClientInstanceName="ctxtNsdlCode" ClientEnabled="true"
                                            runat="server" CssClass="StateTextbox">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <br style="clear: both;" />
                                    <div class="stateDiv">
                                        NDML Code</div>
                                    <div>
                                        <dxe:ASPxTextBox ID="txtNdmlCode" ClientInstanceName="ctxtNdmlCode" ClientEnabled="true"
                                            runat="server" CssClass="StateTextbox">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <br style="clear: both;" />
                                    <div class="stateDiv">
                                        DOTEXID Code</div>
                                    <div>
                                        <dxe:ASPxTextBox ID="txtDotexidCode" ClientInstanceName="ctxtDotexidCode" ClientEnabled="true"
                                            runat="server" CssClass="StateTextbox">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <br style="clear: both;" />
                                    <div class="stateDiv">
                                        CVLID Code</div>
                                    <div>
                                        <dxe:ASPxTextBox ID="txtCvlidCode" ClientInstanceName="ctxtCvlidCode" ClientEnabled="true"
                                            runat="server" CssClass="StateTextbox">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <br style="clear: both;" />
                                     <div class="stateDiv">
                                        CKYC Code</div>
                                     <div>
                                        <dxe:ASPxTextBox ID="txtCKYCCode" ClientInstanceName="ctxtCkycCode" ClientEnabled="true"
                                            runat="server" CssClass="StateTextbox">
                                        </dxe:ASPxTextBox>
                                    </div>
                                   
                                </div>
                                <br style="clear: both;" />
                                <div class="Footer">
                                    <div style="margin-left: 130px; width: 70px; float: left;">
                                        <dxe:ASPxButton ID="btnSave_Country" ClientInstanceName="cbtnSave_States" runat="server"
                                            AutoPostBack="False" Text="Save">
                                            <ClientSideEvents Click="function (s, e) {btnSave_Country();}" />
                                        </dxe:ASPxButton>
                                    </div>
                                    <div style="width: 200px;">
                                        <dxe:ASPxButton ID="btnCancel_Country" runat="server" AutoPostBack="False" Text="Cancel">
                                            <ClientSideEvents Click="function (s, e) {fn_btnCancel();}" />
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
                <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
                </dxwgv:ASPxGridViewExporter>
            </div>
            
            <div class="HiddenFieldArea" style="display: none;">
                <dxhf:ASPxHiddenField runat="server" ClientInstanceName="chfID" ID="hfID">
                </dxhf:ASPxHiddenField>
            </div>
        </div>
    </form>
</body>
</html>
