<%@ page language="C#" autoeventwireup="true" inherits="Kra_KraAuthentication, App_Web_fok8amxh" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Authorize Kra</title>
    <!--External Scripts file-->
    <!--Other Script-->

    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>

    <link type="text/css" href="../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
    <!--JS Inline Method-->
    <style type="text/css">       
        #MainFull { padding:5px;}
         #Container1 { width: 500px;}
        .SplitCont {height:200px;overflow-y:scroll;}
        .tab{border:1px solid #555; padding:5px; vertical-align:bottom; background-color:#ddd; float:left;}
        .tab-Selected{border:1px solid #555; padding:7px; vertical-align:bottom; background-color:#aeaeae;; float:left;}
        .LableWidth { width:110px;}
        .ContentWidth { width:170px; height:21px;}
        .labelCont { font-size:13px; margin-top:7px;}      
        .btnRight { margin-right:18px; float:right;} 
        .txt_left { text-align:left;}
        .txt_right { text-align:right;} 
                                                   
   </style>

    <script language="javascript" type="text/javascript">
     function PageLoad()
      {
        HideShow('Row0','S');
        HideShow('Row3','H');
      
      }
       function SignOff()
       {
        window.parent.SignOff()
       }
       function height()
       {
       if(document.body.scrollHeight>=600)
        window.frameElement.height = document.body.scrollHeight;
       else
        window.frameElement.height = '600px';
        window.frameElement.Width = document.body.scrollWidth;
       }
        
    var RowID
    function OnGridFocusedRowChanged() 
    {
        cGvAuthRecord.GetSelectedFieldValues('kycmain_id', OnGetRowValues);
        
    }
    function OnGetRowValues(values) 
    {
    
        RowID = 'n';
        for(var j = 0; j < values.length; j ++) {
            if(RowID != 'n')
                RowID += ',' + values[j];
            else
            
                RowID = values[j];
               
        }
       
    }
   
    function OnAllCheckedChanged(s, e) 
    {

      if (s.GetChecked())
      {
        cGvAuthRecord.SelectRows();

      }
   
     else
     {
        cGvAuthRecord.UnselectRows();
     }

   }  

    function BtnShow_Click()
     {
        HideShow('Row0','H');
        HideShow('Row3','S');
        cCmbRecordChoser.SetValue("L");
        cGvAuthRecord.PerformCallback("Show");
 
     }
     function Btnupdate_Click()
      {
       if (RowID==undefined || RowID=='n')
           alert ('Please Select Atleast one Item !!..');
       else
            cGvAuthRecord.PerformCallback("Update");
      
      }
     function GvAuthRecord_EndCallBack()
        {
            
            if(cGvAuthRecord.cpEmpty=="nullvalue")
             {
                HideShow('Row0','S');
                HideShow('Row3','H');
                alert('No record Found !!');
                 
             }
             if(cGvAuthRecord.cpEmptyoth=="nullvalue")
                alert('No record Found !!');
                 
             if(cGvAuthRecord.cpopenpopup=="open")
                cPopUp_ScripAlert.Show();
            if(cGvAuthRecord.cpmsgshow!=null)
                {
                    HideShow('Row0','S');
                    HideShow('Row3','H');
                    alert(cGvAuthRecord.cpmsgshow);
                    cBtnShow.SetEnabled(false);
                    
                }
                 
             
             
        }
     function ShowHideFilter(obj)
      {
       if (obj=="back")
       {
            HideShow('Row0','S');
            HideShow('Row3','H');
        }
        else
            cGvAuthRecord.PerformCallback(obj);
            
      
      }
      
   function CmbRecordChoser_change(Val)
      {
        cGvAuthRecord.PerformCallback(Val);
            
      }    
           
      
      
      function fn_linkMouseOver(obj)
      {
        GetObjectID(obj).style.borderLeft='1px solid #aaa';
        GetObjectID(obj).style.borderTop='1px solid #aaa';
        GetObjectID(obj).style.borderRight='1px solid #aaa';
      }
      function fn_linkMouseOut(obj)
      {
        GetObjectID(obj).style.border='none';
      }
      function openpopupgrid(partnerid)
        {
            cgridpartner.PerformCallback(partnerid);
            
        }
        function gridpartner_EndCallBack()
        {
            if (cgridpartner.cpopencontrol != null)
                cPopUp_ScripAlert.Show();
                
        }
     
        
     
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div id="MainFull">
            <div id="Header" class="Header">
                Authorize KRA</div>
            <div id="Row0" class="Row">
                <div id="Container1" class="container">
                    <div id="Row1">
                        <div id="Row1_Col1" class="LFloat_Lable LableWidth">
                            Registration Date</div>
                        <div id="Row1_Col2" class="LFloat_Content ContentWidth">
                            <dxe:ASPxDateEdit ID="dtDate" runat="server" EditFormat="Custom" ClientInstanceName="dtDate"
                                EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" DateOnError="Today">
                                <DropDownButton Text="Regn.From ">
                                </DropDownButton>
                                <ClientSideEvents DateChanged="function(s,e){DateChangeForFrom(dtDate,dtToDate);}" />
                                <ClientSideEvents DateChanged="function(s,e){DateChange(dtDate);}"></ClientSideEvents>
                            </dxe:ASPxDateEdit>
                        </div>
                        <div id="Row1_Col3" class="LFloat_Content ContentWidth">
                            <dxe:ASPxDateEdit ID="dtToDate" runat="server" EditFormat="Custom" ClientInstanceName="dtToDate"
                                EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" DateOnError="Today">
                                <DropDownButton Text="Regn.To">
                                </DropDownButton>
                                <ClientSideEvents DateChanged="function(s,e){DateChangeForTo(dtDate,dtToDate);}" />
                                <ClientSideEvents DateChanged="function(s,e){DateChange(dtToDate);}"></ClientSideEvents>
                            </dxe:ASPxDateEdit>
                        </div>
                    </div>
                    <span class="clear" style="height: 5px;">&nbsp;</span>
                    <div id="Row2" class="Row btnRight">
                        <br class="clear" />
                        <dxe:ASPxButton ID="BtnShow" ClientInstanceName="cBtnShow" runat="server" AutoPostBack="False" Text="SHOW" Width="85px">
                            <ClientSideEvents Click="function (s, e) {BtnShow_Click();}" />
                        </dxe:ASPxButton>
                    </div>
                </div>
            </div>
            <div id="Row3" class="Row" style="width: 995px;">
                <div class="left">
                    <div class="paging1 LFloat_Lable" >
                        <center>
                            <dxe:ASPxButton ID="Btnupdate" runat="server" AutoPostBack="False" Text="Click to Authorize"
                                Width="150px" Font-Size="12px">
                                <Paddings Padding="0"></Paddings>
                                <ClientSideEvents Click="function (s, e) {Btnupdate_Click();}" />
                            </dxe:ASPxButton>
                        </center>
                    </div>
                    <div class="paging LFloat_Lable" style="width: 40px; border: 1px solid white;" id="divimg1">
                        <center>
                            <a href="javascript:ShowHideFilter('s');">
                                <img id="Img2" alt="" src="../CentralData/Images/filteron.png" onmouseover="fn_linkMouseOver('divimg1')"
                                    onmouseout="fn_linkMouseOut('divimg1')" title="Filter On" height="30px;" width="24px"
                                    onclick="changevalueandpicture('su3')" style="border: none;" /></a>
                        </center>
                    </div>
                    <div class="paging LFloat_Lable" style="width: 40px; border: 1px solid white;" id="divimg2">
                        <center>
                            <a href="javascript:ShowHideFilter('All');">
                                <img id="Img1" alt="" src="../CentralData/Images/filteroff.png" onmouseover="fn_linkMouseOver('divimg2')"
                                    onmouseout="fn_linkMouseOut('divimg2')" title="Filter Off" height="30px;" width="24px"
                                    onclick="changevalueandpicture('su3')" style="border: none;" /></a>
                        </center>
                    </div>
                    <div class="paging LFloat_Lable" style="width: 40px; border: 1px solid white;" id="divimg3">
                        <center>
                            <a href="javascript:ShowHideFilter('back');">
                                <img id="su3" alt="" src="../CentralData/Images/back.png" onmouseover="fn_linkMouseOver('divimg3')"
                                    onmouseout="fn_linkMouseOut('divimg3')" title="Back" height="30px;" width="30px"
                                    onclick="changevalueandpicture('su3')" style="border: none;" /></a>
                        </center>
                    </div>
                    <div class="paging1 LFloat_Lable" style="width: 170px;">
                        <dxe:ASPxComboBox ID="CmbRecordChoser" runat="server" ClientInstanceName="cCmbRecordChoser"
                            EnableIncrementalFiltering="True" EnableSynchronization="False" SelectedIndex="0"
                            ValueType="System.String">
                            <Items>
                                
                                <dxe:ListEditItem Text="All" Value="L"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="UnAuthorize" Value="U"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="Authorize" Value="A"></dxe:ListEditItem>
                            </Items>
                            <DropDownButton Text="Authorisation For">
                            </DropDownButton>
                            <ClientSideEvents ValueChanged="function (s, e) {CmbRecordChoser_change(s.GetValue());}" />
                        </dxe:ASPxComboBox>
                    </div>
                </div>
                <br class="clear" />
                <div id="Row5" class="Row">
                    <dxwgv:ASPxGridView ID="GvAuthRecord" ClientInstanceName="cGvAuthRecord" runat="server"
                        KeyFieldName="kycmain_id" AutoGenerateColumns="False" Width="995px" OnHtmlRowCreated="GvAuthRecord_HtmlRowCreated"
                        OnCustomCallback="GvAuthRecord_CustomCallback" >
                        <ClientSideEvents EndCallback="function(s, e) {GvAuthRecord_EndCallBack();}" />
                        <ClientSideEvents SelectionChanged="function(s, e) { OnGridFocusedRowChanged(); }" />
                        <Columns>
                            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" Width="10px" VisibleIndex="0">
                                <HeaderTemplate>
                                    <dxe:ASPxCheckBox ID="cbAll" runat="server" ClientInstanceName="cbAll" ToolTip="Select/Deselect all rows"
                                        BackColor="White" OnInit="cbAll_Init">
                                        <ClientSideEvents CheckedChanged="OnAllCheckedChanged" />
                                    </dxe:ASPxCheckBox>
                                </HeaderTemplate>
                            </dxwgv:GridViewCommandColumn>
                            
                            <dxwgv:GridViewDataTextColumn Caption="Doc No" FieldName="KYCMain_DocNo" VisibleIndex="1"
                                Width="75px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataColumn FieldName="KYCMain_ApplicationNumber" Caption="Application No"
                                VisibleIndex="2" Width="75px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="Clientname" Caption="Customer Name" VisibleIndex="3"
                                Width="75px">
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="verifieduser" Caption="Vrfy User" VisibleIndex="4"
                                Width="75px">
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="verifieddate" Caption="Vrfy Date" VisibleIndex="5"
                                Width="75px">
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="authorisedby" Caption="Authorized By" VisibleIndex="6"
                                Width="200px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="Status" Caption="Auth.Status" VisibleIndex="7"
                                Width="50px" SortOrder="descending">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="Pending" Caption="Pend.Auth." VisibleIndex="8"
                                Width="50px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="KYCMain_BatchNumber" Caption="Batch No." VisibleIndex="9"
                                Width="50px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="partner" Caption="Is Partner?" VisibleIndex="10"
                                Width="50px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Settings ShowGroupPanel="True" ShowHorizontalScrollBar="True" GridLines="Both" />
                        <Styles>
                            <FocusedRow HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FCA977">
                            </FocusedRow>
                            <AlternatingRow Enabled="True">
                            </AlternatingRow>
                        </Styles>
                        <SettingsPager NumericButtonCount="20" PageSize="10" ShowSeparators="True" AlwaysShowPager="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                    </dxwgv:ASPxGridView>
                </div>
                <div id="Row6" class="Row1">
                    <dxpc:ASPxPopupControl ID="PopUp_ScripAlert" runat="server" ClientInstanceName="cPopUp_ScripAlert"
                        Width="998px" HeaderText="Partner Record Details" PopupHorizontalAlign="Center"
                        PopupVerticalAlign="Middle" Modal="True" ShowCloseButton="true" >
                        <ContentCollection>
                            <dxpc:PopupControlContentControl runat="server">
                                <dxwgv:ASPxGridView ID="gridpartner" ClientInstanceName="cgridpartner" runat="server"
                                    KeyFieldName="kycdetail_id"  AutoGenerateColumns="False" Width="950px" OnCustomCallback="gridpartner_CustomCallback">
                                    <ClientSideEvents EndCallback="function(s, e) {gridpartner_EndCallBack();}" />
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Partner Name" FieldName="name" VisibleIndex="1"
                                            Width="75px" FixedStyle="Left">
                                            <CellStyle CssClass="gridcellleft" Wrap="true">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataColumn FieldName="relation" Caption="RelationShip" VisibleIndex="2"
                                            Width="100px" FixedStyle="Left">
                                            <CellStyle CssClass="gridcellleft" Wrap="true">
                                            </CellStyle>
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="pan" Caption="Pan No." VisibleIndex="3" Width="75px"
                                            FixedStyle="Left">
                                            <CellStyle CssClass="gridcellleft" Wrap="true">
                                            </CellStyle>
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="uidno" Caption="UID NO." VisibleIndex="4" Width="75px">
                                            <CellStyle Wrap="true">
                                            </CellStyle>
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="fulladd" Caption="Full Address" VisibleIndex="5"
                                            Width="225px">
                                            <CellStyle Wrap="true">
                                            </CellStyle>
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="phone" Caption="Phone No." VisibleIndex="6"
                                            Width="100px">
                                            <CellStyle Wrap="true">
                                            </CellStyle>
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="email" Caption="EmailID" VisibleIndex="7" Width="125px">
                                            <CellStyle Wrap="true">
                                            </CellStyle>
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="ipvdone" Caption="IPV" VisibleIndex="8" Width="40px">
                                            <CellStyle Wrap="false">
                                            </CellStyle>
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="ipvdate" Caption="IPV Date" VisibleIndex="9"
                                            Width="75px">
                                            <CellStyle Wrap="false">
                                            </CellStyle>
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="ipvdoneby" Caption="Done By" VisibleIndex="10"
                                            Width="55px">
                                            <CellStyle Wrap="true">
                                            </CellStyle>
                                        </dxwgv:GridViewDataColumn>
                                    </Columns>
                                    <SettingsBehavior AllowFocusedRow="True" />
                                    <Settings  ShowVerticalScrollBar="true"  />
                                    <Styles>
                                        <FocusedRow HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FCA977">
                                        </FocusedRow>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </Styles>
                                    <SettingsPager NumericButtonCount="5" PageSize="5" ShowSeparators="True" AlwaysShowPager="True">
                                        <FirstPageButton Visible="True">
                                        </FirstPageButton>
                                        <LastPageButton Visible="True">
                                        </LastPageButton>
                                    </SettingsPager>
                                </dxwgv:ASPxGridView>
                            </dxpc:PopupControlContentControl>
                        </ContentCollection>
                        <HeaderStyle BackColor="LightGray" ForeColor="Black" />
                    </dxpc:ASPxPopupControl>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
