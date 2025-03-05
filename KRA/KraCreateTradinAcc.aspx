<%@ page language="C#" autoeventwireup="true" inherits="KRA_KraCreateTradinAcc, App_Web_l9bhfzmo" %>

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
    <title>Create Trading A/C</title>
    <!--External Scripts file-->
    <!--Other Script-->

    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>
    <script type="text/javascript" src="../CentralData/JSScript/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="../CentralData/JSScript/jquery.alerts.js"></script>
    <link type="text/css" href="../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
    <link type="text/css" href="../CentralData/CSS/jquery.alerts.css" rel="Stylesheet" />
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
    var RowID
    var Kycid
     function PageLoad()
      {
        HideShow('Row0','S');
        //HideShow('Row3','H');
        
        HideShow('Row3','S');
        if('<%=P_globvalue%>'=='Manual')
            HideShow('divbtnnext','H');
        else
            HideShow('divbtnnext','S');
            HideShow('divbtncreate','H');
      
      
      }
      function callpage()
        {
            alert("To Create Trading Code From KRA\n'Please Set UCC Pattern from Global Settings'");
            //jAlert('This is a custom alert box', 'Alert Dialog');
            window.frameElement.height = '150px';
            window.location='../management/frm_homePage.aspx';
            
        
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
            if((GetObjectID('divbtnnext').style.display=='inline') && (GetObjectID('divbtncreate').style.display=='none'))
                {
                 GetObjectID('hdnstore').value = "create";
                 cGvAuthRecord.SelectRows();
                }
                if((GetObjectID('divbtncreate').style.display=='inline') && (GetObjectID('divbtnnext').style.display=='none'))
                  {
                    GetObjectID('hdnstore').value = "next~next";
                    cGvAuthRecord.SelectRows();
                 }
        

        }
    else
        {
            if((GetObjectID('divbtnnext').style.display=='inline') && (GetObjectID('divbtncreate').style.display=='none'))
            {  
             GetObjectID('hdnstore').value = "create";
             cGvAuthRecord.UnselectRows();
            
            }
            if((GetObjectID('divbtncreate').style.display=='inline') && (GetObjectID('divbtnnext').style.display=='none'))
              {
                GetObjectID('hdnstore').value = "next~next";
                cGvAuthRecord.UnselectRows();
                
             }
        
         }
             

   }  

    function BtnShow_Click()
     {
        HideShow('Row0','H');
        HideShow('Row3','S');
        HideShow('divbtncreate','H');
        cCmbRecordChoser.SetValue("L");
        cGvAuthRecord.PerformCallback("Show");
 
     }
     function Btnupdate_Click()
      {
       if (RowID==undefined || RowID=='n')
           alert ('Please Select Atleast one Item !!..');
       else
        {
            cGvAuthRecord.PerformCallback("Next");
            HideShow('divbtncreate','S');
            HideShow('divbtnnext','H');
             HideShow('divimg1','H');
            HideShow('divimg2','H');
        }
      
      }
     function Btncreate_Click()
        {
        if (RowID==undefined || RowID=='n')
           alert ('Please Select Atleast one Item !!..');
         else
            {
                GetObjectID('hdnstore').value="create";
                cGvAuthRecord.PerformCallback("create");
                HideShow('divbtncreate','S');
                HideShow('divbtnnext','H');
            }
        
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
                 
             height();
             
        }
     function ShowHideFilter(obj)
      {
       if (obj=="back")
       {
           
            if((GetObjectID('divbtnnext').style.display=='inline') && (GetObjectID('divbtncreate').style.display=='none'))
            {
//                HideShow('Row0','S');
//                HideShow('Row3','H');
                window.location='../KRA/KraCreateTradinAcc.aspx';
            }
            
            if((GetObjectID('divbtnnext').style.display=='none') && (GetObjectID('divbtncreate').style.display=='none'))
             {
                HideShow('Row0','S');
                HideShow('Row3','H');
             }
             if((GetObjectID('divbtncreate').style.display=='inline') && (GetObjectID('divbtnnext').style.display=='none'))
              {
                
                HideShow('Row0','H');
                HideShow('Row3','S');
                HideShow('divbtncreate','H');
                HideShow('divbtnnext','S');
                HideShow('divimg1','S');
                HideShow('divimg2','S');
            }
           
        }
            if((GetObjectID('divbtnnext').style.display=='inline') && (GetObjectID('divbtncreate').style.display=='none'))
                {
                 GetObjectID('hdnstore').value = "create";
                
                }
                if((GetObjectID('divbtncreate').style.display=='inline') && (GetObjectID('divbtnnext').style.display=='none'))
                  {
//                    if (obj=="back")
//                        {
                        
                            if (GetObjectID('hdnstore').value=="next~next")
                                GetObjectID('hdnstore').value="next~next";
                            else
                                GetObjectID('hdnstore').value="next";
                                
//                       }
//                       else
//                            GetObjectID('hdnstore').value="next~next";
                    
                 }
         
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
        GetObjectID(obj).style.borderLeft='1px solid white';
        GetObjectID(obj).style.borderTop='1px solid white';
        GetObjectID(obj).style.borderRight='1px solid white';
      }
      function openpopupgrid(id)
        {
          Kycid=id;
          cPopUp_ScripAlert.Show();
          GetObjectID('spntxt').innerHTML="Client UCC";
          HideShow('divtxtauto','H');
          HideShow('divspanhint','H');
          HideShow('divspanvalidation','H');
          ccmbucc.SetValue("UIU");
          ctxtmanualbatch.SetEnabled(true);
          ctxtmanualbatch.SetText('');
          HideShow('divpopupbtn','S');
          SetStyle("spntxt","Color","000000");
            
        }
    function cmbucc_change(Val)
      {
        ctxtmanualbatch.SetText('');
        
        if(Val=="UIU")
            {
                document.getElementById('<%=cmbucc.ClientID %>').style.width=186+"px";
                HideShow('divtxttext','S');
                HideShow('divtxttextbox','S');
                HideShow('divtxtauto','H');
                HideShow('divspanhint','H');
                GetObjectID('spntxt').innerHTML="Client UCC";
                HideShow('divpopupbtn','S');
                ctxtmanualbatch.SetEnabled(true);
                HideShow('divspanvalidation','H');
            }
        if(Val=="SGU")
            {
                document.getElementById('<%=cmbucc.ClientID %>').style.width=186+"px";
                HideShow('divtxttext','S');
                HideShow('divtxttextbox','S');
                HideShow('divtxtauto','S');
                GetObjectID('spntxt').innerHTML="UCC Prefix";
                HideShow('divspanhint','H');
                HideShow('divpopupbtn','H');
                ctxtmanualbatch.SetEnabled(true);
                HideShow('divspanvalidation','H');
               
            }
            
      }
      function btnok_Click()
        {
            
            var txt=ctxtmanualbatch.GetText();
            if(ccmbucc.GetSelectedIndex()==1)
                {
                    if (txt.length>0)
                        {
                            cCbpSuggestdocument.PerformCallback("Generated~"+txt+"~"+Kycid);
                            HideShow('divspanvalidation','H');
                        }
                    else
                        {
                            GetObjectID('spanvalidation').innerHTML="Please Type UCC Prefix !!";
                            HideShow('divspanvalidation','S');
                        }
                }
            if(ccmbucc.GetSelectedIndex()==0)
                {
                    if (txt.length>0)
                        {
                            cCbpSuggestdocument.PerformCallback("Generated~"+txt+"~"+Kycid);
                            HideShow('divspanvalidation','H');
                        }
                    else
                        {
                            GetObjectID('spanvalidation').innerHTML="Please Type Client UCC !!";
                            HideShow('divspanvalidation','S');
                        }
                }
        } 
    
     
    function CbpSuggestdocument_EndCallBack()
        {
            if(cCbpSuggestdocument.cpSystemucc!=null)
             {
                if (cCbpSuggestdocument.cpSystemucc.split('~')[0]=="Systemucc")
                    ctxtmanualbatch.SetText(cCbpSuggestdocument.cpSystemucc.split('~')[1]);
                    GetObjectID('spntxt').innerHTML="Generated UCC Are";
                    SetStyle("spntxt","Color","317A00");
                    document.getElementById('<%=cmbucc.ClientID %>').style.width=240+"px";
                    ctxtmanualbatch.SetEnabled(false);
                    HideShow('divspanhint','H');
                    HideShow('divtxtauto','H');
                    HideShow('divspanvalidation','H');
                    
             }
             if(cCbpSuggestdocument.cpGenerated!=null)
             {
                if(cCbpSuggestdocument.cpGenerated.split('~')[0]=="Succ")
                    {
                      cPopUp_ScripAlert.Hide();
                      alert(cCbpSuggestdocument.cpGenerated.split('~')[1]);
                      cGvAuthRecord.PerformCallback("Show");
                    }
                else
                    {
                      GetObjectID('spntxt').innerHTML="Change UCC";
                      GetObjectID('spanvalidation').innerHTML=cCbpSuggestdocument.cpGenerated.split('~')[0];
                      HideShow('divtxtauto','H');
                      HideShow('divspanhint','H');
                      HideShow('divspanvalidation','S');
                      ccmbucc.SetValue("UIU");
                      ctxtmanualbatch.SetEnabled(true);
                      ctxtmanualbatch.SetText(cCbpSuggestdocument.cpGenerated.split('~')[1]);
                      HideShow('divpopupbtn','S');
                      SetStyle("spntxt","Color","Maroon");
                    }
                 
                    
             }
             
        }
    function Generateuccmanualy(Val)
        {
            var txt=ctxtmanualbatch.GetText();
                if (txt.length>0)
                    {
                        if (txt.length>=2)
                        {
                            cCbpSuggestdocument.PerformCallback("Systemucc~"+txt);
                            HideShow('divpopupbtn','S');
                            
                         }
                        else
                            {
                                HideShow('divspanhint','S');
                                GetObjectID('spanhint').innerHTML="Two Charecter Req.";
                                HideShow('divpopupbtn','H');
                            }
                            HideShow('divspanvalidation','H');
                    }
                else
                    {
                        HideShow('divpopupbtn','H');
                        GetObjectID('spanvalidation').innerHTML="Please Type UCC Prefix !!";
                        HideShow('divspanvalidation','S');
                    }
             
         
        }
     
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div id="MainFull">
            <div id="Header" class="Header">
                Create Trading A/C</div>
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
                        <dxe:ASPxButton ID="BtnShow" ClientInstanceName="cBtnShow" runat="server" AutoPostBack="False"
                            Text="SHOW" Width="85px">
                            <ClientSideEvents Click="function (s, e) {BtnShow_Click();}" />
                        </dxe:ASPxButton>
                    </div>
                </div>
            </div>
            <div id="Row3" class="Row" style="width: 995px;">
                <div class="left" style="padding: 3px 0px 3px 3px; background-color: #eee; border: 1px solid #aaa;
                    border-bottom: none; width: 994px;">
                    <div class="paging1 LFloat_Lable" id="divbtnnext">
                        <center>
                            <dxe:ASPxButton ID="Btnupdate" runat="server" AutoPostBack="False" Text="Click to Next"
                                Width="150px" Font-Size="12px">
                                <Paddings Padding="0"></Paddings>
                                <ClientSideEvents Click="function (s, e) {Btnupdate_Click();}" />
                            </dxe:ASPxButton>
                        </center>
                    </div>
                    <div class="paging1 LFloat_Lable" id="divbtncreate">
                        <center>
                            <dxe:ASPxButton ID="Btncreate" runat="server" AutoPostBack="False" Text="Click to Create"
                                Width="150px" Font-Size="12px">
                                <Paddings Padding="0"></Paddings>
                                <ClientSideEvents Click="function (s, e) {Btncreate_Click();}" />
                            </dxe:ASPxButton>
                        </center>
                    </div>
                    <div class="paging LFloat_Lable" style="width: 40px; border: 1px solid white;" id="divimg1">
                        <center>
                            <a href="javascript:ShowHideFilter('s');">
                                <img id="Img2" alt="" src="../CentralData/Images/filteron.png" onmouseover="fn_linkMouseOver('divimg1')"
                                    onmouseout="fn_linkMouseOut('divimg1')" title="Filter On" height="16px;" width="16px"
                                    onclick="changevalueandpicture('su3')" style="border: none;" /></a>
                        </center>
                    </div>
                    <div class="paging LFloat_Lable" style="width: 40px; border: 1px solid white;" id="divimg2">
                        <center>
                            <a href="javascript:ShowHideFilter('All');">
                                <img id="Img1" alt="" src="../CentralData/Images/filteroff.png" onmouseover="fn_linkMouseOver('divimg2')"
                                    onmouseout="fn_linkMouseOut('divimg2')" title="Filter Off" height="16px;" width="16px"
                                    onclick="changevalueandpicture('su3')" style="border: none;" /></a>
                        </center>
                    </div>
                    <div class="paging LFloat_Lable" style="width: 40px; border: 1px solid white;" id="divimg3">
                        <center>
                            <a href="javascript:ShowHideFilter('back');">
                                <img id="su3" alt="" src="../CentralData/Images/back.png" onmouseover="fn_linkMouseOver('divimg3')"
                                    onmouseout="fn_linkMouseOut('divimg3')" title="Back" height="24px;" width="24px"
                                    onclick="changevalueandpicture('su3')" style="border: none;" /></a>
                        </center>
                    </div>
                    <div class="paging1 LFloat_Lable" style="width: 170px; display: none;">
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
                <div id="Row5" class="Row1">
                    <dxwgv:ASPxGridView ID="GvAuthRecord" ClientInstanceName="cGvAuthRecord" runat="server"
                        KeyFieldName="kycmain_id" AutoGenerateColumns="False" Width="995px" OnHtmlRowCreated="GvAuthRecord_HtmlRowCreated"
                        OnCustomCallback="GvAuthRecord_CustomCallback">
                        <ClientSideEvents EndCallback="function(s, e) {GvAuthRecord_EndCallBack();}" />
                        <ClientSideEvents SelectionChanged="function(s, e) { OnGridFocusedRowChanged(); }" />
                        <Columns>
                            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" Width="75px" VisibleIndex="0"
                                FixedStyle="Left">
                                <HeaderTemplate>
                                    <dxe:ASPxCheckBox ID="cbAll" runat="server" ClientInstanceName="cbAll" ToolTip="Select/Deselect all rows"
                                        BackColor="White" OnInit="cbAll_Init">
                                        <ClientSideEvents CheckedChanged="OnAllCheckedChanged" />
                                    </dxe:ASPxCheckBox>
                                </HeaderTemplate>
                            </dxwgv:GridViewCommandColumn>
                           <dxwgv:GridViewDataColumn FieldName="createaccount"  Caption="Create"
                                VisibleIndex="0" Width="100px" FixedStyle="Left">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Application No"  FieldName="KYCMain_ApplicationNumber"
                                VisibleIndex="1" Width="120px" FixedStyle="Left">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataColumn FieldName="Appdate"  Caption="Application Dt"
                                VisibleIndex="2" Width="75px" FixedStyle="Left">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="Clientname"  Caption="Customer Name"
                                VisibleIndex="3" Width="175px" FixedStyle="Left">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="Dob"  Caption="DOB" VisibleIndex="4"
                                Width="75px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="Gender"  Caption="Gender" VisibleIndex="5"
                                Width="40px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="clienttype"  Caption="Type"
                                VisibleIndex="6" Width="80px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="fathername"  Caption="Father Name"
                                VisibleIndex="7" Width="200px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="exportdate"  Caption="Export Date"
                                VisibleIndex="9" Width="75px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="username"  Caption="Exported User"
                                VisibleIndex="10" Width="100px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="batchnumber"  Caption="Batch No."
                                VisibleIndex="8" Width="50px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="partner"  Caption="Is Partner?"
                                VisibleIndex="11" Width="70px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True"  AllowSort="false"/>
                        <Settings ShowGroupPanel="false" ShowHorizontalScrollBar="True" GridLines="Both" />
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
                <br class="clear" />
            </div>
            <div id="Row6" class="Row1">
                <dxpc:ASPxPopupControl ID="PopUp_ScripAlert" runat="server" ClientInstanceName="cPopUp_ScripAlert"
                    Width="380px" Height="250px" HeaderText="UCC Creation Details" PopupHorizontalAlign="Center"
                    PopupVerticalAlign="Middle" Modal="True" ShowCloseButton="true">
                    <ContentCollection>
                        <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                            <dxcp:ASPxCallbackPanel ID="CbpSuggestdocument" runat="server" ClientInstanceName="cCbpSuggestdocument"
                                BackColor="Silver" Border-BorderColor="Gray" Border-BorderWidth="1" Border-BorderStyle="solid"
                                OnCallback="CbpSuggestdocument_Callback" LoadingPanelText="Please Wait !!" LoadingPanelStyle-Font-Bold="true"
                                LoadingPanelStyle-Cursor="wait" LoadingPanelStyle-ForeColor="gray" Paddings-Padding="5">
                                <ClientSideEvents EndCallback="CbpSuggestdocument_EndCallBack" />
                                <PanelCollection>
                                    <dxp:panelcontent runat="server">
                                        <div id="divupper">
                                            <div>
                                                <dxe:ASPxComboBox ID="cmbucc" Border-BorderColor="black" Border-BorderStyle="Solid"
                                                    Border-BorderWidth="1" runat="server" ClientInstanceName="ccmbucc" EnableIncrementalFiltering="True"
                                                    EnableSynchronization="False" Width="186px" SelectedIndex="0" ValueType="System.String">
                                                    <Items>
                                                        <dxe:ListEditItem Text="User Input UCC" Value="UIU"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="System Generated UCC" Value="SGU"></dxe:ListEditItem>
                                                    </Items>
                                                    <%--<DropDownButton Text="UCC For">
                                                        </DropDownButton>--%>
                                                    <ClientSideEvents ValueChanged="function (s, e) {cmbucc_change(s.GetValue());}" />
                                                </dxe:ASPxComboBox>
                                            </div>
                                            <br class="clear" />
                                            <div class="left" id="divtxttext">
                                                <b><span id="spntxt"></span></b>
                                            </div>
                                            <div class="left" style="width: 5px;">
                                                &nbsp;
                                            </div>
                                            <div style="padding-left: 5px; margin-left: 10px; width: 130px;" id="divtxttextbox"
                                                class="left">
                                                <dxe:ASPxTextBox ID="txtmanualbatch" ClientInstanceName="ctxtmanualbatch" ForeColor="BlueViolet"
                                                    HorizontalAlign="Center" Border-BorderColor="black" Border-BorderStyle="Solid"
                                                    Border-BorderWidth="1" runat="server" Width="100px" MaxLength="8">
                                                    <ClientSideEvents KeyUp="function(s, e) {s.SetText(s.GetText().toUpperCase());}" />
                                                </dxe:ASPxTextBox>
                                            </div>
                                            <div id="divspanhint" style="width: 250px">
                                                <img id="wrng1" alt="" src="../CentralData/Images/Warning_16.png" />
                                                <span id="spanhint" style="color: Maroon;"></span>
                                            </div>
                                            <br class="clear" />
                                            <div id="divtxtauto" style="margin-left: 75px; margin-top: 3px;">
                                                <a href="javascript:Generateuccmanualy('ucc');"><span style="color: Blue; text-decoration: underline;
                                                    font-size: 10px; font-weight: bold">Click To Generate Systm Generated UCC</span></a>
                                                <br />
                                            </div>
                                            <br class="clear" />
                                            <div id="divspanvalidation" style="width: 250px">
                                                <img id="wrng2" alt="" src="../CentralData/Images/Warning_16.png" />
                                                <span id="spanvalidation" style="color: Maroon;"></span>
                                            </div>
                                            <br class="clear" />
                                            <div id="divpopupbtn">
                                                <dxe:ASPxButton ID="btnok" Border-BorderColor="BlueViolet" Border-BorderStyle="Solid"
                                                    Border-BorderWidth="1" runat="server" AutoPostBack="False" Text="Create">
                                                    <ClientSideEvents Click="function (s, e) {btnok_Click();}" />
                                                </dxe:ASPxButton>
                                            </div>
                                        </div>
                                        <br class="clear" />
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
        <asp:HiddenField ID="hdnstore" runat="server" />
        <asp:HiddenField ID="hdnid" runat="server" />
    </form>
</body>
</html>
