<%@ page language="C#" autoeventwireup="true" inherits="DP_CDSL_User_BL_CDSL_ExportDPAccount, App_Web_vyh5vrg3" %>

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
    <title>CDSL EXPORT</title>
    <!--External Scripts file-->
    <!--Other Script-->

    <script type="text/javascript" src="../../../../CentralData/JSScript/GenericJScript.js"></script>

    <link type="text/css" href="../../../../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
    <!--JS Inline Method-->
    <style type="text/css">       
        #MainFull { padding:5px;}
         #Container1 { width: 520px;}
        .SplitCont {height:200px;overflow-y:scroll;}
        .tab{border:1px solid #555; padding:5px; vertical-align:bottom; background-color:#ddd; float:left;}
        .tab-Selected{border:1px solid #555; padding:7px; vertical-align:bottom; background-color:#aeaeae;; float:left;}
        .LableWidth { width:130px;}
        .ContentWidth { width:170px; height:21px;}
        .labelCont { font-size:13px; margin-top:7px;}      
        .btnRight { margin-right:18px; float:right;} 
        .txt_left { text-align:left;}
        .txt_right { text-align:right;}
        .Row{Margin-bottom:25px;clear:both;}            
        .lable_left{float:left;border: solid 1px #aaa;padding:2px;height:18px;width:200px; margin-right:10px;font-size:12px;line-height:18px;}
        .content_left{float:left;margin-right:3px;border: solid 1px #aaa;padding:2px 10px 2px 10px; background-color:#FFD4AA;height:18px;line-height:18px;}                       
   </style>
    <%-- <style type="text/css">
    .AccordionTitle, .AccordionContent, .AccordionContainer
{
  position:relative;
  /*width:950px;*/
}

.AccordionTitle
{
  height:20px;
  overflow:hidden;
  cursor:pointer;
  font-family:Arial;
  font-size:12pt;
  font-weight:bold;
  vertical-align:middle;
  width:99.8%;
  background-repeat:repeat-x;
  display:table-cell;
  background-color: #D2D2D2;
  -moz-user-select:none;
  border:1px solid #333;
  Margin:1px;
}

.AccordionContent
{
  height:0px;
  overflow:hidden;
  /*overflow-y:scroll;*/
  display:block; 
}

.AccordionContainer
{
  /*border-top: solid 1px #C1C1C1;
  border-bottom: solid 1px #C1C1C1;
  border-left: solid 2px #C1C1C1;
  border-right: solid 2px #C1C1C1;*/
}
    </style>--%>

    <script language="javascript" type="text/javascript">    
    
    function message(msg)
        {
            alert(msg+' has already using this routine.\nMore than one user can not use this routine at a time !! ');
            
            cBtnupdate.SetText(msg+' has already using this routine.More than one user can not use this Export at a time');
            cBtnupdate.SetEnabled(false);
//            window.location='../management/home.aspx';
        }
     function PageLoad()
     {
        HideShow('Row0','S');
        HideShow('Row4','S');
        HideShow('Row6','S');
        HideShow('Row7','H');
        height();
      }
      function SignOff()
      {
        window.parent.SignOff()
      }
      function height()
      {
       if(document.body.scrollHeight>=650)
        window.frameElement.height = document.body.scrollHeight;
       else
        window.frameElement.height = '650px';
        window.frameElement.Width = document.body.scrollWidth;
      }        
    var RowID
    var batchnumber
    var updatebatchnumber
    function OnGridFocusedRowChanged() 
    {
        cGvAuthRecord.GetSelectedFieldValues('CdslOfflineAccount_ID', OnGetRowValues);
    }
    function OnGetRowValues(values) 
    {        
        RowID = 'n';
        for(var j = 0; j < values.length; j ++) 
        {
            if(RowID != 'n')
                RowID += ',' + values[j];
            else
                RowID = values[j];
        }
    }
      
    function OnAllCheckedChanged(s, e) 
    {        
      if (s.GetChecked())
        cGvAuthRecord.SelectRows();
      else
        cGvAuthRecord.UnselectRows(); 
   }  
   function cbatchcancelgrid_EndCallBack()
    {            
       //alert('cbatchcancelgrid_EndCallBack');    
       height(); 
    } 
   function BtnShow_Click()
   {        
        GetObjectID('hdngridbindornot').value="";
        //cCmbRecordChoser.SetSelectedIndex(0);
        cCmbRecordChoser.SetValue("U");
        HideShow('Row6','S');
        HideShow('Row7','H');
        HideShow('divbuton','S');
        cGvAuthRecord.PerformCallback("Show~");        
    }     
    function btncancelpopup_Click()
    {
        cpopup_export.Hide();
        cCmbRecordChoser.SetSelectedIndex(0);
        //cGvAuthRecord.PerformCallback("Show~");     
    }
    function btnnext_Click()
    {
        GetObjectID('hdngridbindornot').value="";
        if (RowID==undefined || RowID=='n')
           alert ('Please Select Atleast one Item !!..');
        else
            cGvAuthRecord.PerformCallback("Next");      
    }
    function GvAuthRecord_EndCallBack()
    {
         GetObjectID('hdngridbindornot').value="";
         if(cGvAuthRecord.cpexportidentifier=="open")
            {
            cpopup_export.Show();
            HideShow('Row9','S');
            HideShow('Row10','S');
            HideShow('Row11','H');
            }
         if ((cGvAuthRecord.cptotaldoc != null) && (cGvAuthRecord.cpexportdoc != null))
         {                    
            GetObjectID('<%=B_cptotaldoc.ClientID %>').innerHTML=cGvAuthRecord.cptotaldoc;
            GetObjectID('<%=B_cpexportdoc.ClientID %>').innerHTML=cGvAuthRecord.cpexportdoc;
            HideShow('divtxtauto','S');
            HideShow('divtxttext','S');
            ctxtmanualbatch.SetEnabled(false);
            ctxtmanualbatch.SetText('');
            GetObjectID('<%=chkparamucc.ClientID %>').checked=false;                    
         }
         if (cGvAuthRecord.cpbatchnumber != null) 
         {
            GetObjectID('<%=B_auto.ClientID %>').innerHTML=cGvAuthRecord.cpbatchnumber;
            GetObjectID('hdnbatch').value=cGvAuthRecord.cpbatchnumber;
         }
    } 
    function ShowHideFilter(obj)
    {
        if(document.getElementById('Row6').style.display=='inline')
            {
                 if (obj=="back")
                    window.location="../BL/CDSL_ExportDPAccount.aspx";
                else
                    cGvAuthRecord.PerformCallback(obj);
            
            }
            
        else
            {
                if (obj=="back")
                    window.location="../BL/CDSL_ExportDPAccount.aspx";
                else
                    cbatchcancelgrid.PerformCallback(obj);
            }
      
    }       
    function CmbRecordChoser_change(Val)
    {
        GetObjectID('hdngridbindornot').value="";
        //alert('1-'+Val);
        if(Val=="A")
        {
            HideShow('Row6','H');
            HideShow('Row7','S');
            HideShow('divbuton','H');
            cbatchcancelgrid.PerformCallback("Show~");
        }
        else
        {
            HideShow('Row7','H');
            HideShow('Row6','S');
            HideShow('divbuton','S');
            cGvAuthRecord.PerformCallback("Show");
        }   
    }
    function fn_linkMouseOver(obj)
    {
        GetObjectID(obj).style.borderLeft='1px solid #aaa';
        GetObjectID(obj).style.borderTop='1px solid #aaa';
        GetObjectID(obj).style.borderRight='1px solid #aaa';
        GetObjectID(obj).style.borderBottom='1px solid #aaa';
    }
    function fn_linkMouseOut(obj)
    {
        GetObjectID(obj).style.border='none';
    }
    function divshowhide()
    {        
        if(GetObjectID('<%=chkparamucc.ClientID %>').checked==true)
            {
               HideShow('divtxtauto','H');
               HideShow('divtxttext','H');
               ctxtmanualbatch.SetEnabled(true);
               
             }
            else
            {
               HideShow('divtxtauto','S');
               HideShow('divtxttext','S');
               ctxtmanualbatch.SetEnabled(false);
               ctxtmanualbatch.SetText('');
            }
    }
    function btnno_Click()
        {
            cpopup_export.Hide();
        }
    function btnyes_Click()
        {
            cCbpSuggestdocument.PerformCallback("Cancelbatch~"+batchnumber);
        }
    function openpopupgrid(cancelbatchnumber,cancelclient)
    {
        //alert(cancelclient);
        GetObjectID('<%=sapn_totalcancelbatch.ClientID %>').innerHTML=cancelclient;
        batchnumber=cancelbatchnumber;
        cpopup_export.Show();
        //document.getElementById('cCbpSuggestdocument').style.height = "150px";
        HideShow('Row9','H');
        HideShow('Row10','H');
        HideShow('Row11','S');
              
    }
    
    function CbpSuggestdocument_EndCallBack()
    {
        //HideShow('Row10','H');
        if (cCbpSuggestdocument.cpcancelbatch == 'successfullycancel')
        {
            cpopup_export.Hide();
            GetObjectID('hdngridbindornot').value="cancel";
            cbatchcancelgrid.PerformCallback("Show~");
        }
        if (cCbpSuggestdocument.cpdownload == 'downloadcomplete')
        {
//            cpopup_export.Hide();
//            cGvAuthRecord.Refresh();
//            GetObjectID('BtnForExportEvent').click();
            cpopup_export.Hide();
            GetObjectID('hdnbatchnumber').value=updatebatchnumber;
            GetObjectID('BtnForExportEvent').click();
            GetObjectID('hdngridbindornot').value=updatebatchnumber;
            cGvAuthRecord.Refresh();
            
        }
        if (cCbpSuggestdocument.cperror == 'batchexists')
        {
            
////////            alert('This batch number Already Exists !!');
////////            cpopup_export.Hide();
            alert('Batch No already Exists!please try another');                
//            GetObjectID('<%=B_cptotaldoc.ClientID %>').innerHTML=totrecord;
//            GetObjectID('<%=B_cpexportdoc.ClientID %>').innerHTML=totcnt;
            HideShow('divtxtauto','H');
            HideShow('divtxttext','H');
            HideShow('Row11','H');
            ctxtmanualbatch.SetEnabled(true);
            ctxtmanualbatch.SetText('');
            GetObjectID('<%=chkparamucc.ClientID %>').checked=true;
//            HideShow('divtxtauto','H');
//            HideShow('divtxttext','H');
//            ctxtmanualbatch.SetEnabled(true);
//            ctxtmanualbatch.SetText('');
//            ctxtmanualbatch.Focus();
        }
    }
    function btnproceed_Click()
    { 
        if(GetObjectID('<%=chkparamucc.ClientID %>').checked==false)
            {
                updatebatchnumber=GetObjectID('<%=B_auto.ClientID %>').innerHTML;
                cCbpSuggestdocument.PerformCallback("Export~"+updatebatchnumber);
            }
        else
            {
               //if()
                var txtbatch=ctxtmanualbatch.GetText();
                if(txtbatch.trim().length==0)
                    {
                        alert('Please Type Batch Number !!')
                    }
                else if(parseInt(txtbatch.trim())==0)
                    {
                        alert('Invalid Batch Number !!')
                    }
                else
                    {
//                        updatebatchnumber=txtbatch
//                        cCbpSuggestdocument.PerformCallback("Export~"+updatebatchnumber);
                            if (txtbatch.trim().length<3)
                                {
                                    var Zero='0';
                                    updatebatchnumber=Zero.repeat(3-txtbatch.length)+txtbatch;
                                    GetObjectID('hdnbatchnumber').value=updatebatchnumber;
                                    cCbpSuggestdocument.PerformCallback("Export~"+updatebatchnumber);
                                }
                            else
                                {
                                    updatebatchnumber=txtbatch;
                                    GetObjectID('hdnbatchnumber').value=updatebatchnumber;
                                    cCbpSuggestdocument.PerformCallback("Export~"+updatebatchnumber);
                                }
                    }
                
            }
        
    }
   function ShowHideFilterLast(obj)
    {
        if(obj=='export')
        {
           if(document.getElementById('invalid').disabled==false)
            {
                GetObjectID('BtnForExportEvent1').click();
            }
           else
                alert('You dont Have Any Error Record To Show !!');               
        }
        if(obj=='download')
        {
            if(document.getElementById('download').disabled==false)
                GetObjectID('BtnForExportEvent').click();
           else
                alert('You dont Have Any Record To Download !!');
        }
    }
    </script>

</head>
<body>
    <%--style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">--%>
    <form id="form1" runat="server" autocomplete="off">
        <div id="MainFull">
            <div id="Header" class="Header">
                CDSL EXPORT</div>
            <div id="Row0" class="Row">
                <div id="Container1" class="container">
                    <div id="Row1">
                        <div id="Row1_Col1" class="LFloat_Lable LableWidth">
                            Date</div>
                        <div id="Row1_Col2" class="LFloat_Content ContentWidth">
                            <dxe:ASPxDateEdit ID="dtDate" runat="server" EditFormat="Custom" ClientInstanceName="dtDate"
                                EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" DateOnError="Today">
                                <DropDownButton Text="Application From ">
                                </DropDownButton>
                            </dxe:ASPxDateEdit>
                        </div>
                        <div id="Row1_Col3" class="LFloat_Content ContentWidth">
                            <dxe:ASPxDateEdit ID="dtToDate" runat="server" EditFormat="Custom" ClientInstanceName="dtToDate"
                                EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" DateOnError="Today">
                                <DropDownButton Text="Application To">
                                </DropDownButton>
                            </dxe:ASPxDateEdit>
                        </div>
                    </div>
                    <span class="clear" style="height: 5px;">&nbsp;</span>
                    <div id="Row4" class="Row btnRight">
                        <br class="clear" />
                        <dxe:ASPxButton ID="BtnShow" runat="server" AutoPostBack="False" Text="SHOW" Width="85px">
                            <ClientSideEvents Click="function (s, e) {BtnShow_Click();}" />
                        </dxe:ASPxButton>
                    </div>
                </div>
            </div>
            <br class="clear" />
            <div id="Row5" class="Row">
                <div class="left" style="padding: 3px 0px 3px 3px; background-color: #eee; border: 1px solid #aaa;
                    border-bottom: none; width: 986px;">
                    <div class="left" style="margin-left: 5px; margin-right: 5px;" id="divbuton">
                        <center>
                            <dxe:ASPxButton ID="Btnupdate" runat="server" ClientInstanceName="cBtnupdate" AutoPostBack="False" Text="&nbsp;&nbsp;&nbsp;&nbsp;Click to Ne[x]t&nbsp;&nbsp;&nbsp;&nbsp;"
                                 Font-Size="12px" AccessKey="X">
                                <Paddings Padding="0"></Paddings>
                                <ClientSideEvents Click="function (s, e) {btnnext_Click();}" />
                            </dxe:ASPxButton>
                        </center>
                    </div>
                    <div class="paging LFloat_Lable" style="width: 40px; border: 1px solid white;" id="divimg1">
                        <center>
                            <a href="javascript:ShowHideFilter('s');">
                                <img id="Img2" alt="" src="../../../../CentralData/Images/filteron.png" onmouseover="fn_linkMouseOver('divimg1')"
                                    onmouseout="fn_linkMouseOut('divimg1')" title="Filter On" height="16px;" width="16px"
                                    onclick="changevalueandpicture('su3')" style="border: none;" /></a>
                        </center>
                    </div>
                    <div class="paging LFloat_Lable" style="width: 40px; border: 1px solid white;" id="divimg2">
                        <center>
                            <a href="javascript:ShowHideFilter('All');">
                                <img id="Img1" alt="" src="../../../../CentralData/Images/filteroff.png" onmouseover="fn_linkMouseOver('divimg2')"
                                    onmouseout="fn_linkMouseOut('divimg2')" title="Filter Off" height="16px;" width="16px"
                                    onclick="changevalueandpicture('su3')" style="border: none;" /></a>
                        </center>
                    </div>
                    <div class="paging LFloat_Lable" style="width: 40px; border: 1px solid white;" id="divimg3">
                        <center>
                            <a href="javascript:ShowHideFilter('back');">
                                <img id="su3" alt="" src="../../../../CentralData/Images/reload.png" onmouseover="fn_linkMouseOver('divimg3')"
                                    onmouseout="fn_linkMouseOut('divimg3')" title="Reload" height="24px;" width="24px"
                                    onclick="changevalueandpicture('su3')" style="border: none;" /></a>
                        </center>
                    </div>
                    <div class="left" style="width: 170px;">
                        <dxe:ASPxComboBox ID="CmbRecordChoser" runat="server" ClientInstanceName="cCmbRecordChoser"
                            SelectedIndex="0" ValueType="System.String">
                            <Items>
                                <dxe:ListEditItem Text="To Be Export" Value="U" />
                                <dxe:ListEditItem Text="Already Exported" Value="A" />
                            </Items>
                            <DropDownButton Text="ExportFor">
                            </DropDownButton>
                            <ClientSideEvents SelectedIndexChanged="function (s, e) {CmbRecordChoser_change(s.GetValue());}" />
                        </dxe:ASPxComboBox>
                    </div>
                    <br class="clear" />
                </div>
                <br class="clear" />
                <div id="Row6" class="Row1">
                    <dxwgv:ASPxGridView ID="GvAuthRecord" ClientInstanceName="cGvAuthRecord" runat="server"
                        KeyFieldName="CdslOfflineAccount_ID" AutoGenerateColumns="False" Width="986px"
                        OnHtmlRowCreated="GvAuthRecord_HtmlRowCreated" 
                        OnCustomCallback="GvAuthRecord_CustomCallback"
                        OnProcessColumnAutoFilter="GvAuthRecord_ProcessColumnAutoFilter">
                        <ClientSideEvents EndCallback="function(s, e) {GvAuthRecord_EndCallBack();}" />
                        <ClientSideEvents SelectionChanged="function(s, e) { OnGridFocusedRowChanged(); }" />
                        <Columns>
                            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" Width="15px" VisibleIndex="0"
                                FixedStyle="Left">
                                <HeaderTemplate>
                                    <dxe:ASPxCheckBox ID="cbAll" runat="server" ClientInstanceName="cbAll" ToolTip="Select/Deselect all rows"
                                        BackColor="White" OnInit="cbAll_Init">
                                        <ClientSideEvents CheckedChanged="OnAllCheckedChanged" />
                                    </dxe:ASPxCheckBox>
                                </HeaderTemplate>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Application No" FieldName="CdslOfflineAccount_ApplicationNumber"
                                VisibleIndex="1" Width="120px" FixedStyle="Left">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataColumn FieldName="AppDate" Caption="Application Dt" VisibleIndex="2"
                                Width="75px" FixedStyle="Left">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="Clientname" Caption="Customer Name" VisibleIndex="3"
                                Width="175px" FixedStyle="Left">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="DOB" Caption="DOB" VisibleIndex="4" Width="75px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="fathername" Caption="Father Name" VisibleIndex="5"
                                Width="175px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="Verifyuser" Caption="Verify User" VisibleIndex="6"
                                Width="80px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="authorisedby" Caption="Authorized User" VisibleIndex="7"
                                Width="200px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" AllowGroup="false" AllowSort="false"/>
                        <Settings ShowGroupPanel="True" ShowHorizontalScrollBar="true" GridLines="Both" />
                        <Styles>
                            <FocusedRow HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FCA977">
                            </FocusedRow>
                            <AlternatingRow Enabled="True">
                            </AlternatingRow>
                        </Styles>
                        <SettingsPager NumericButtonCount="20" PageSize="10" Mode="ShowAllRecords" ShowSeparators="True" AlwaysShowPager="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                    </dxwgv:ASPxGridView>
                </div>
                <div id="Row7" class="Row1">
                    <dxwgv:ASPxGridView ID="batchcancelgrid" ClientInstanceName="cbatchcancelgrid" runat="server"
                        KeyFieldName="batchnumber" Width="986px" OnCustomCallback="batchcancelgrid_CustomCallback"
                        OnHtmlRowCreated="batchcancelgrid_HtmlRowCreated">
                        <SettingsLoadingPanel Text="Please Wait .." />
                        <%--<SettingsPager PageSize="10000000" SEOFriendly="Enabled" />--%>
                        <ClientSideEvents EndCallback="function(s, e) {cbatchcancelgrid_EndCallBack();}" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Cancel Batches" FieldName="Cancelbatch" VisibleIndex="0"
                                Width="75px" FixedStyle="Left">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Batch Number" FieldName="batchnumber" VisibleIndex="1"
                                Width="75px" FixedStyle="Left">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Client Exists" FieldName="counting" VisibleIndex="2"
                                Width="75px" FixedStyle="Left">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            
                           
                        </Columns>
                        <Templates>
                            <DetailRow>
                                <dxwgv:ASPxGridView ID="detailGrid" runat="server" KeyFieldName="CdslOfflineAccount_ID"
                                    ClientInstanceName="cdetailGrid" Width="95%" OnInit="detailGrid_Init">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Application No" FieldName="CdslOfflineAccount_ApplicationNumber"
                                            VisibleIndex="1" Width="120px" FixedStyle="Left">
                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataColumn FieldName="AppDate" Caption="Application Dt" VisibleIndex="2"
                                            Width="75px" FixedStyle="Left">
                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                            </CellStyle>
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Clientname" Caption="Customer Name" VisibleIndex="3"
                                            Width="175px" FixedStyle="Left">
                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                            </CellStyle>
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="DOB" Caption="DOB" VisibleIndex="4" Width="75px">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="fathername" Caption="Father Name" VisibleIndex="5"
                                            Width="175px">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Verifyuser" Caption="Verify User" VisibleIndex="6"
                                            Width="80px">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="authorisedby" Caption="Authorized User" VisibleIndex="7"
                                            Width="200px">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dxwgv:GridViewDataColumn>
                                    </Columns>
                                </dxwgv:ASPxGridView>
                            </DetailRow>
                        </Templates>
                        <SettingsDetail ShowDetailRow="true" />
                        <%--<Settings ShowVerticalScrollBar="true" />--%>
                        <%--<SettingsPager NumericButtonCount="20" PageSize="1" ShowSeparators="True" AlwaysShowPager="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>--%>
                    </dxwgv:ASPxGridView>
                </div>
            </div>
            <br class="clear" />
            <div>
                <dxpc:ASPxPopupControl ID="popup_export" runat="server" ClientInstanceName="cpopup_export"
                    Width="350px" HeaderText="Export Detail" PopupHorizontalAlign="Center" PopupVerticalAlign="Middle"
                    Modal="True" ShowCloseButton="false">
                    <ContentCollection>
                        <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                            <dxcp:ASPxCallbackPanel ID="CbpSuggestdocument" Height="230px" runat="server" ClientInstanceName="cCbpSuggestdocument"
                                OnCallback="CbpSuggestdocument_Callback" LoadingPanelText="Please Wait !!" LoadingPanelStyle-Font-Bold="true"
                                LoadingPanelStyle-Cursor="wait" LoadingPanelStyle-ForeColor="gray">
                                <ClientSideEvents EndCallback="CbpSuggestdocument_EndCallBack" />
                                <PanelCollection>
                                    <dxp:panelcontent runat="server">
                                        <div style="border: 1px solid gray; background-color: #DDD;">
                                            <br class="clear" />
                                            <br class="clear" />
                                            <div id="Row9" style="border: 1 px solid gray;">
                                                <div class="Row">
                                                    <div class="lable_left" style="background: #D3D3D3;">
                                                        Total No of Records :
                                                    </div>
                                                    <div class="content_left">
                                                        <b style="text-align: right" id="B_cptotaldoc" runat="server"></b>
                                                    </div>
                                                    <br class="clear" />
                                                </div>
                                                <div class="Row">
                                                    <div class="lable_left" style="background: #D3D3D3;">
                                                        Select Records To Be Export :
                                                    </div>
                                                    <div class="content_left">
                                                        <b style="text-align: right" id="B_cpexportdoc" runat="server"></b>
                                                    </div>
                                                    <br class="clear" />
                                                </div>
                                            </div>
                                            <br class="clear" />
                                            <div id="Row10" style="border: 1 px solid gray;">
                                                <div class="Row" id="divtxttext">
                                                    <div class="lable_left" style="background: #D3D3D3;">
                                                        Batch Number :
                                                    </div>
                                                    <div id="divtxtauto" class="content_left">
                                                        <span style="text-align: right; color: Maroon" id="B_auto" runat="server"></span>
                                                    </div>
                                                    <br class="clear" />
                                                </div>
                                                <br class="clear" />
                                                <div class="Row">
                                                    <div class="lable_left" style="background: #D3D3D3;">
                                                        <asp:CheckBox ID="chkparamucc" runat="server" Checked="false" onclick="divshowhide()" />
                                                        Other Batch Number :</div>
                                                    <div class="content_left" id="divtxtmanual" style="height: 20px;">
                                                        <dxe:ASPxTextBox ID="txtmanualbatch" ClientInstanceName="ctxtmanualbatch" runat="server"
                                                            Width="80px" MaxLength="5" MaskSettings-ErrorText="for mannual" Onkeypress="return isNumberKey(event)"
                                                            Height="16px">
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                    <br class="clear" />
                                                </div>
                                                <div class="left" id="dvbtnproceed" style="width: 80px; margin-left: 10px; margin-top: 20px;
                                                    margin-right: 15px;">
                                                    <dxe:ASPxButton ID="btnproceed" runat="server" AutoPostBack="False" Text="[E]xport"
                                                        AccessKey="E">
                                                        <ClientSideEvents Click="function (s, e) {btnproceed_Click();}" />
                                                    </dxe:ASPxButton>
                                                </div>
                                                <div class="left" id="btnback" style="margin-left: 10px; margin-top: 20px; margin-right: 25px;">
                                                    <dxe:ASPxButton ID="btncancelpopup" runat="server" AutoPostBack="False" Text="[B]ack"
                                                        AccessKey="B">
                                                        <ClientSideEvents Click="function (s, e) {btncancelpopup_Click();}" />
                                                    </dxe:ASPxButton>
                                                </div>
                                                <br class="clear" />
                                            </div>
                                            <div id="Row11" style="border: 1px solid gray;">
                                                <div>
                                                    <span id="sapn_totalcancelbatch" runat="server" style="color: Maroon; font-weight: bold;
                                                        font-size: 12px; background: #D3D3D3;"></span><span style="color: Black; font-weight: bold;
                                                            font-size: 12px; background: #D3D3D3;">&nbsp; Client Already Exists in This Batch
                                                        </span>
                                                    <br class="clear" />
                                                    <br class="clear" />
                                                    <span id="cancelbatch" style="color: Black; font-weight: bold; font-size: 12px; background: #D3D3D3;">
                                                        Do You Really Want To Cancel The Batch ?? </span>
                                                </div>
                                                <div class="left" style="width: 80px; margin-left: 10px; margin-top: 20px; margin-right: 15px;">
                                                    <dxe:ASPxButton ID="btnyes" runat="server" AutoPostBack="False" Text="[Y]es" AccessKey="Y">
                                                        <ClientSideEvents Click="function (s, e) {btnyes_Click();}" />
                                                    </dxe:ASPxButton>
                                                </div>
                                                <div class="left" style="margin-top: 20px; margin-right: 25px;">
                                                    <dxe:ASPxButton ID="btnno" runat="server" AutoPostBack="False" Text="[N]o" AccessKey="N">
                                                        <ClientSideEvents Click="function (s, e) {btnno_Click();}" />
                                                    </dxe:ASPxButton>
                                                </div>
                                            </div>
                                        </div>
                                        <br class="clear" />
                                    </dxp:panelcontent>
                                </PanelCollection>
                            </dxcp:ASPxCallbackPanel>
                        </dxpc:PopupControlContentControl>
                    </ContentCollection>
                    <HeaderStyle BackColor="LightGray" ForeColor="Black" />
                </dxpc:ASPxPopupControl>
            </div>
        </div>
        <asp:HiddenField ID="hdnbatch" runat="server" />
        <asp:HiddenField ID="hdnbatchnumber" runat="server" />
         <asp:HiddenField ID="hdngridbindornot" runat="server" />
        <asp:Button ID="BtnForExportEvent" runat="server" OnClick="cmbExport_SelectedIndexChanged"
            BackColor="#DDECFE" BorderStyle="None" />
    </form>
</body>
</html>
