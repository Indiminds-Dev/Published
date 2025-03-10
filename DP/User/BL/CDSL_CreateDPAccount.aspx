<%@ page language="C#" autoeventwireup="true" inherits="KRA_CDSL_CreateDPAccount, App_Web_nzcajgdr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Untitled Page</title>
    <script type="text/javascript" src= "../../../CentralData/JSScript/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="../../../CentralData/JSScript/init.js"></script>
    <script type="text/javascript" src="../../../CentralData/JSScript/GenericJScript.js"></script>
    <script type="text/javascript" src="../../../CentralData/JSScript/GenericAjaxList.js"></script>
    
    
    <link type="text/css" href="../../../CentralData/CSS/GenericAjaxStyle.css" rel="Stylesheet" />
    <link type="text/css" href="../../../CentralData/CSS/GenericCss.css" rel="Stylesheet" />

    <style type="text/css">
        .Header{height: 20px;padding-left: 10px;padding-right: 3px;background-image: url('../images/EHeaderBack.gif');background-repeat: repeat-x;
		        background-position: bottom;Margin-bottom:5px;text-align:center;font-weight:bold;color:#000099;}
        .Leftdiv{width:190px;height:25px;font-size:12px;}
        .DivHeader{background-color:#B8B8B8 ;width:99%; font-family:Calibri; font-weight:bold; padding-left:10px; margin-bottom:4px;}
        .Spanclass{color:Red;font-size:14px;}
        .DivName{height:25px;text-align:center;margin-left: 10px;}
        .frmleftContent{float:left; margin:2px; padding:2px; height:26px; border: solid 1px  #D1E0F3; font-size:14px;}
        .BtmMargin{margin-bottom:10px}
        .LeftMargin{margin-left:10px}
        .TopMargin{margin-top:10px}
        .heightDiv{Height:30px}
        .FontChange{font-family:Arial;font-size:9pt}
        .SetBorder{border: solid 1px  #D1E0F3;}
        .PopUpLable{background-color: #DDD;border: solid .1pt #aaa;}
        .BindDiv{font-weight:bold;font-size:13px;font-family:Calibri;}
    </style>
    <script type="text/javascript" language="javascript">
     //Global Variable
        FieldName = '';
        var AplicatnNo = '';
        var PrdctBind = '';
        var currentDateToset=new Date('<%=Session["ServerDate"] %>');
        
    //End



////////////////////////New DevExpress validation///////////////////////////////////
function DevE_Control_Empty(obj,ErrMsg)
{

  if(obj.GetText().trim()== "")
    {
        alert(ErrMsg);
        obj.Focus(); 
        return false;
    }
    else 
    {
        return true;
    } 
}
function DevE_MaskedControl_Empty(obj,ErrMsg)
{
    if(obj.GetValue()=='0')
    {
        alert(ErrMsg);
        obj.Focus(); 
        return false;
    }
    else 
    {
        return true;
    } 
}
function  DevE_Control_CompareText(obj,CompareText,ErrMsg)
{
   var TextToCompare='';
   var WhatReturn='true';
   for(var i=0;i<CompareText.split(',').length;i++)
   {
       TextToCompare=CompareText.split(',')[i];
       if(obj.GetValue().trim() == TextToCompare)
       {
            alert(ErrMsg);
            obj.Focus(); 
            WhatReturn='false';
        }
    }
    if(WhatReturn=='false')
        return false;
    else
        return true; 
}
//These Method When Compare Any Control and Focus On Other
function  DevE_Control_Empty_FocusOtherCntrl(obj,FcsObj,ErrMsg)
{
   if(obj.GetValue()== null)
   {
        alert(ErrMsg);
        FcsObj.Focus(); 
        return false;
    }
    else 
    {
        return true;
    } 
}
function  DevE_Control_CompareText_FocusOtherCntrl(obj,CompareText,FcsObj,ErrMsg)
{
   var TextToCompare='';
   var WhatReturn='true';
   for(var i=0;i<CompareText.split(',').length;i++)
   {
       TextToCompare=CompareText.split(',')[i];
       if(obj.GetValue().trim() == TextToCompare)
       {
            alert(ErrMsg);
            FcsObj.Focus();
            WhatReturn='false';
        }
    }
    if(WhatReturn=='false')
        return false;
    else
        return true; 
}

function SetinnerHTML(obj,Value)
{
    document.getElementById(obj).innerHTML=Value;
}
function OnCheckedShowHide(rdBtn,objShowHide)
{

     if (rdBtn == true)
     {
       HideShow(objShowHide,'S');
     }
     else
     {
       HideShow(objShowHide,'H'); 
     }
 
}
///////////////////////////////////End Of DevExpressValidation///////////////////////////////////

    
function PageLoad()
{   
  HideShow('DivEntryForm','H'); 
  HideShow('Div_FirstAccountHlder','H');  
  HideShow('Div_SecondAccountHlder','H');  
  HideShow('Div_ThirdAccountHlder','H');  
  HideShow('Div_ProductDetails','H');  
  HideShow('Div_POADetails','H'); 
  HideShow('Row65','H');
  HideShow('DivSaved','H'); 
  HideShow('Row18_Col2','H');
  HideShow('Row27_Col2','H');
  HideShow('Container2','H');
  document.getElementById('<%=txtClientName.ClientID%>').focus();
}

function CallAjax(obj1,obj2,obj3,Query)
{
    var CombinedQuery=new String(Query);
    var GenericAjaxListAspxPath = '../../../CentralData/Pages/GenericAjaxList.aspx';
    ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main',GenericAjaxListAspxPath);
} 
//------------------------------------Start GridView Fields------------------------------------------------
  
function OnLeftNav_Click()
{
    SetValue("hdn_GridBindOrNotBind","False"); 
    var i=GetObjectID("A1").innerText;
    GetObjectID('A1').className="number_box_selected";
   
    if(parseInt(i)>1)
    {
        cGridEntryRecord.PerformCallback("SearchByNavigation~"+GetObjectID("A1").innerText+"~LeftNav");
    }
    else 
    {
         alert('No More Pages.');   
    }     
}
 
function OnRightNav_Click()
{
    SetValue("hdn_GridBindOrNotBind","False"); 
    var TestEnd=GetObjectID("A10").innerText;       
    var TotalPage=GetObjectID("B_TotalPage").innerText;
    if(TestEnd=="" || TestEnd==TotalPage)
    {
         alert('No More Records.');
         return;
    }
    var i=GetObjectID("A1").innerText;
   
    if(parseInt(i)<TotalPage)
    {
        cGridEntryRecord.PerformCallback("SearchByNavigation~"+GetObjectID("A1").innerText+"~RightNav");
    }
    else
    {
        alert('You are at the End');
    }
}
 
function OnPageNo_Click(obj)
{
    SetValue("hdn_GridBindOrNotBind","False"); 
    var i=GetObjectID(obj).innerText;
    CurrentPg = i;
    cGridEntryRecord.PerformCallback("SearchByNavigation~"+i+"~PageNav");        
}
    
 
  function GridEntryRecord_EndCallBack()
  {
        if(cGridEntryRecord.cpRefreshNavPanel!=undefined)
        {
            GetObjectID("B_PageNo").innerText='';
            GetObjectID("B_TotalPage").innerText='';
            GetObjectID("B_TotalRows").innerText='';
            
            var NavDirection=cGridEntryRecord.cpRefreshNavPanel.split('~')[0];
            var PageNum=cGridEntryRecord.cpRefreshNavPanel.split('~')[1];
            var TotalPage=cGridEntryRecord.cpRefreshNavPanel.split('~')[2];
            var TotalRows=cGridEntryRecord.cpRefreshNavPanel.split('~')[3];
            
            if(NavDirection=="RightNav")
            {
                PageNum=parseInt(PageNum)+10;
                GetObjectID("B_PageNo").innerText=PageNum;
                GetObjectID("B_TotalPage").innerText=TotalPage;
                GetObjectID("B_TotalRows").innerText=TotalRows;
                var n=parseInt(TotalPage)-parseInt(PageNum)>10?parseInt(11):parseInt(TotalPage)-parseInt(PageNum)+2;
                for(r=1;r<n;r++)
                {
                    var obj = "A"+r;
                    GetObjectID(obj).innerText=" "+PageNum+++" ";
                }
                for(r=n;r<11;r++)
                {
                    var obj="A"+r;
                    GetObjectID(obj).innerText="";
                }
            }
            if(NavDirection=="LeftNav")
            {
                if(parseInt(PageNum)>1)
                {   
                    PageNum=parseInt(PageNum)-10;
                    GetObjectID("B_PageNo").innerText=PageNum;
                    GetObjectID("B_TotalPage").innerText=TotalPage;
                    GetObjectID("B_TotalRows").innerText=TotalRows;
                    for(l=1;l<11;l++)
                    {
                        var obj="A"+l;
                        GetObjectID(obj).innerText=" "+PageNum+++" ";                        
                    }
                }
                else
                {
                    alert('No More Pages.');
                }
            }
            if(NavDirection=="PageNav")
            {
                GetObjectID("B_PageNo").innerText=PageNum;
                GetObjectID("B_TotalPage").innerText=TotalPage;
                GetObjectID("B_TotalRows").innerText=TotalRows;
            }
            if(NavDirection=="ShowBtnClick")
            {
                GetObjectID("B_PageNo").innerText=PageNum;
                GetObjectID("B_TotalPage").innerText=TotalPage;
                GetObjectID("B_TotalRows").innerText=TotalRows;
                var n=parseInt(TotalPage)-parseInt(PageNum)>=10?parseInt(11):parseInt(TotalPage)-parseInt(PageNum)+2;
                for(r=1;r<n;r++)
                {
                    var obj="A"+r;
                    GetObjectID(obj).innerText=" "+PageNum+++" ";
                }                
                for(r=n;r<11;r++)
                {
                    var obj="A"+r;
                    GetObjectID(obj).innerText="";                    
                }      
                         
            }
        }
        if(cGridEntryRecord.cpSetGlobalFields!=undefined)
        { 
             SetValue("Hdn_PageSize",cGridEntryRecord.cpSetGlobalFields.split('~')[0]);
             SetValue("Hdn_PageNumber",cGridEntryRecord.cpSetGlobalFields.split('~')[1]);
                        
        }
        SetValue("hdn_GridBindOrNotBind","True"); 
                
        Height('350','350');
        
  }
  
 function BackToSearch()
 {
     window.location="../BL/CDSL_CreateDPAccount.aspx";  
 }
 function ForOpen(obj)
 {
     AplicatnNo = obj;
     cCbpFirstAccountHlder.PerformCallback('BindFrstHolder~'+obj);    
     
 }
    
 
//------------------------------------End GridView Fields--------------------------------------------------
    
     
    
//------------------------------------Start FrstHlder Details---------------------------------------------

function CbpFirstAccountHlder_EndCallBack() 
{
 if(cCbpFirstAccountHlder.cpBindFrstHlder != null)   
 {
    HideShow('DivGridRecord','H'); 
    HideShow('DivEntryForm','S'); 
    HideShow('Div_FirstAccountHlder','S');
    HideShow('Row11','H');  
    var Data = cCbpFirstAccountHlder.cpBindFrstHlder.split('~'); 
    SetinnerHTML("Row1_Col1",Data[0]);
    SetinnerHTML("Row1_Col2",Data[1]);
    SetinnerHTML("Row1_Col3",Data[2]);
    SetinnerHTML("Row3_Col1",Data[3]);
    SetinnerHTML("Row4_Col1_row0",Data[4]);
    SetinnerHTML("Row4_Col1_row1",Data[5]);
    SetinnerHTML("Row4_Col1_row2",Data[6]);
    SetinnerHTML("Row4_Col1_row3_col1",Data[7]);
    SetinnerHTML("Row4_Col1_row3_col3",Data[8]);
    SetinnerHTML("Row4_Col1_row5",Data[9]);
    SetinnerHTML("Row4_Col1_row7",Data[10]);
    if(Data[11]== 'Y')
    {
     cCbSame.SetChecked(true);
     cCbSame.SetEnabled(false); 
    }
    else if(Data[11]== 'N')
    {
     cCbSame.SetChecked(false);
     cCbSame.SetEnabled(false); 
    }
    SetinnerHTML("Row5_Col1_row0",Data[12]);
    SetinnerHTML("Row5_Col1_row1",Data[13]);
    SetinnerHTML("Row5_Col1_row2",Data[14]);
    SetinnerHTML("Row5_Col1_row3_col1",Data[15]);
    SetinnerHTML("Row5_Col1_row3_col3",Data[16]);
    SetinnerHTML("Row5_Col1_row5",Data[17]);
    SetinnerHTML("Row5_Col1_row7",Data[18]);
    
    SetinnerHTML("Row7_Col1_row0_col1",Data[19]);
    SetinnerHTML("Row7_Col1_row0_col3",Data[20]);
    SetinnerHTML("Row7_Col1_row1_col1",Data[21]);
    SetinnerHTML("Row7_Col1_row1_col3",Data[22]);
    SetinnerHTML("Row7_Col1_row3",Data[23]);
    if(Data[24]== 'Y')
    { 
      SetinnerHTML("Row8_Col1","Yes");
      HideShow('Row8_Col2','S'); 
    }
    else if(Data[24]== 'N')
    {
      SetinnerHTML("Row8_Col1","No"); 
      HideShow('Row8_Col2','H'); 
    }
    SetinnerHTML("Row9_Col1",Data[25]);
                 
   
    cCbpFirstAccountHlder.cpBindFrstHlder = null;
 }
 Height('350','350');
}

function OnInfoChecked()
{
 if(cCbChecked.GetChecked()== true)
   HideShow('Row11','S');
 else
   HideShow('Row11','H');     
}

function FrstHlderNxt()
{
  HideShow('Div_FirstAccountHlder','H');  
  HideShow('Div_SecondAccountHlder','S');  
  HideShow('Div_ThirdAccountHlder','H');  
  HideShow('Div_ProductDetails','H');  
  HideShow('Div_POADetails','H');
  Height('350','350'); 
    
}

 
//------------------------------------End FrstHlder Details-----------------------------------------------


//------------------------------------Start ScndHlder Details----------------------------------------------

function OnCheckedChanged()
{
    
}
function CbpSecondAccountHlder_EndCallBack()
{
  Height('350','350');  
}

function ScndHlderNxt() 
{
  HideShow('Div_FirstAccountHlder','H');  
  HideShow('Div_SecondAccountHlder','H');  
  HideShow('Div_ThirdAccountHlder','S');  
  HideShow('Div_ProductDetails','H');  
  HideShow('Div_POADetails','H');  
  Height('350','350'); 
}
function ScndHlderPrvs()  
{
  HideShow('Div_FirstAccountHlder','S');  
  HideShow('Div_SecondAccountHlder','H');  
  HideShow('Div_ThirdAccountHlder','H');  
  HideShow('Div_ProductDetails','H');  
  HideShow('Div_POADetails','H'); 
  Height('350','350'); 
}
//------------------------------------End ScndHlder Details------------------------------------------------

    
//-----------------------------------Start ThrdHlder Details-------------------------------------------------

function CbpThirdAccountHlder_EndCallBack()
{
  Height('350','350');   
}
function ThrdHlderNxt()
{
  HideShow('Div_FirstAccountHlder','H');  
  HideShow('Div_SecondAccountHlder','H');  
  HideShow('Div_ThirdAccountHlder','H');  
  HideShow('Div_ProductDetails','S');  
  HideShow('Div_POADetails','H');  
  Height('350','350');  
  if(PrdctBind != "T")
  {
    cCbpProductDtls.PerformCallback('BindProductDtls~'+AplicatnNo); 
    PrdctBind = "T";
  }
} 
function ThrdHlderPrvs()
{
  HideShow('Div_FirstAccountHlder','H');  
  HideShow('Div_SecondAccountHlder','S');  
  HideShow('Div_ThirdAccountHlder','H');  
  HideShow('Div_ProductDetails','H');  
  HideShow('Div_POADetails','H');
  Height('350','350');  
}

//------------------------------------End ThrdHlder Details--------------------------------------------------

//-----------------------------------Start Product Details-------------------------------------------------

function CbpProductDtls_EndCallBack()
{
 if(cCbpProductDtls.cpBindProductDtls != null)   
 {
    var Data = cCbpProductDtls.cpBindProductDtls.split('~');     
    SetinnerHTML("Row33_Col3",Data[0]);
    SetinnerHTML("Row34_Col1",Data[1]);
    SetinnerHTML("Row34_Col3",Data[2]);
    SetinnerHTML("Row36_Col3",Data[3]);
    SetinnerHTML("Row37_Col1",Data[4]);
    SetinnerHTML("Row37_Col3",Data[5]);
    
    cCbpProductDtls.cpBindProductDtls = null;
 }
  Height('350','350');  
}
function  ProdctDtlsNxt() 
{
  HideShow('Div_FirstAccountHlder','H');  
  HideShow('Div_SecondAccountHlder','H');  
  HideShow('Div_ThirdAccountHlder','H');  
  HideShow('Div_ProductDetails','H');  
  HideShow('Div_POADetails','S'); 
  HideShow('Row65','S');
  Height('350','350'); 
}
function ProdctDtlsPrvs() 
{
  HideShow('Div_FirstAccountHlder','H');  
  HideShow('Div_SecondAccountHlder','H');  
  HideShow('Div_ThirdAccountHlder','S');  
  HideShow('Div_ProductDetails','H');  
  HideShow('Div_POADetails','H'); 
  HideShow('Row65','H');
  Height('350','350'); 
}

//------------------------------------End Product Details--------------------------------------------------

//-----------------------------------Start POA Details-------------------------------------------------
function CbpPOADtls_EndCallBack() 
{
  Height('350','350');  
}
function POAPrvs()
{
  HideShow('Div_FirstAccountHlder','H');  
  HideShow('Div_SecondAccountHlder','H');  
  HideShow('Div_ThirdAccountHlder','H');  
  HideShow('Div_ProductDetails','S');  
  HideShow('Div_POADetails','H');
  Height('350','350');     
}

//------------------------------------End POA Details--------------------------------------------------

//---------------------------------------Start Pop-Up-----------------------------------------------------

function PopUp_StartPage_btnSearch_Click()
{    
    var ClName = document.getElementById('<%=txtClientName_Hidden.ClientID%>').value;
    var ClType = cComboClType.GetValue();
    var ApliNo = document.getElementById('<%=TxtApliNo_Hidden.ClientID%>').value;
    var ApliDate = cApliDt.GetValue();
    var Pan = document.getElementById('<%=TxtPanCrdNo.ClientID%>').value;
    var DOBDate = cDOBDt.GetValue();
    var EmlID = document.getElementById('<%=TxtEmlID.ClientID%>').value;
    
    
    if((document.getElementById('<%=txtClientName.ClientID%>').value == '') && (cComboClType.GetText() == 'Select') && (document.getElementById('<%=TxtApliNo.ClientID%>').value == '') && (cApliDt.GetText() == '01-01-0100') && (document.getElementById('<%=TxtPanCrdNo.ClientID%>').value == '') && (cDOBDt.GetText() == '01-01-0100') && (document.getElementById('<%=TxtEmlID.ClientID%>').value == ''))
    {
       alert("Please Enter Atleast One Item To Search The Corresponding Record ");
       document.getElementById('<%=txtClientName.ClientID%>').focus();
    }
    else if((document.getElementById('<%=txtClientName.ClientID%>').value != '') || (cComboClType.GetText() != 'Select') || (document.getElementById('<%=TxtApliNo.ClientID%>').value != '') ||  (cApliDt.GetText() != '01-01-0100') || (document.getElementById('<%=TxtPanCrdNo.ClientID%>').value != '') || (cDOBDt.GetText() != '01-01-0100') || (document.getElementById('<%=TxtEmlID.ClientID%>').value != ''))
    {
      cGridEntryRecord.PerformCallback('BindSearch~'+ClName+'~'+ClType+'~'+ApliNo+'~'+ApliDate+'~'+Pan+'~'+DOBDate+'~'+EmlID);    
      cPopUp_StartPage.Hide();
    } 
}

//-----------------------------------------------End Pop-Up---------------------------------------------------- 

function SaveButtonClick()
{
    window.location="../BL/CDSL_CreateDPAccount.aspx";  
}

    </script>
</head>
<body>
    <form id="form1" runat="server">
   
    <div>
    <div id="header" class="Header">
              CDSL Registration [BO SetUp] 
       
    </div>
        <div id="DivGridRecord" style="width: 99%; padding-top: 4px" align="center">
            
            
          
           <div id="DivEditGrdVw">
            <div id="lblGridHeader" class="paging textLeft left" style="font-size: 12pt;width:745px;margin-top:10px; height: 48px; margin-left:16px;">
                <span id="DivUnsaved" class="pagingContent">Search Result: </span>
                 <span id="DivSaved" class="pagingContent">Saved Records Of The Given Date Range:</span>
            </div>
              <div  class="left" style="margin-right: 5px; padding-top: 7px;" >
                 <dxe:ASPxButton ID="BtnBacktoSrch" runat="server" AutoPostBack="False"
                    ClientInstanceName="cBtnBacktoSrch" Text=" Back To Search" ToolTip="Back To Search Option"
                    Width="205px" Font-Bold="True">
                    <Border BorderColor="White" />
                    <ClientSideEvents Click="function(s, e) {BackToSearch();}" />
                     <Image Url="~/images/prev.gif" />
                </dxe:ASPxButton>
              </div>
            <div id="Container2" class="paging textLeft" style="width: 950px">
                <div class="right">
                    <div id="ShowFilteredRecords" style="float: left; width: 69px">
                        <a href="javascript:ShowHideFilter('s');"><span style="font-size: 12px; color: #000099;
                            text-decoration: underline">Show Filter</span></a>
                    </div>
                    <div id="ShowAllRecords" style="float: left; width: 72px">
                        <a href="javascript:ShowHideFilter('All');"><span style="font-size: 12px; color: #000099;
                            text-decoration: underline">All Records</span></a>
                    </div>
                </div>
                <div class="left pagingContent" style="vertical-align: bottom;">
                    Page <b id="B_PageNo" runat="server"></b>Of <b id="B_TotalPage" runat="server"></b>
                    ( <b id="B_TotalRows" runat="server"></b>items ) <span class="textLeft"><a id="A_LeftNav"
                        runat="server" href="javascript:void(0);" onclick="OnLeftNav_Click()">
                        <img align="middle" alt="" class="paging_nav" src="../../../images/LeftNav.gif" width="16" />
                    </a></span><a id="A1" runat="server" class="number_box" href="javascript:void(0);"
                        onclick="OnPageNo_Click('A1')">1 </a><a id="A2" runat="server" class="number_box"
                            href="javascript:void(0);" onclick="OnPageNo_Click('A2')">2 </a><a id="A3" runat="server"
                                class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A3')">3 </a>
                    <a id="A4" runat="server" class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A4')">
                        4 </a><a id="A5" runat="server" class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A5')">
                            5 </a><a id="A6" runat="server" class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A6')">
                                6 </a><a id="A7" runat="server" class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A7')">
                                    7 </a><a id="A8" runat="server" class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A8')">
                                        8 </a><a id="A9" runat="server" class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A9')">
                                            9 </a><a id="A10" runat="server" class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A10')">
                                                10 </a><span class="textRight"><a id="A_RightNav" runat="server" href="javascript:void(0);"
                                                    onclick="OnRightNav_Click()">
                                                    <img align="middle" alt="" class="paging_nav" src="../../../images/RightNav.gif" width="16" />
                                                </a></span><span class="clear"></span>
              </div>
            </div>
           <%-- OnHtmlEditFormCreated="GridEntryRecord_HtmlEditFormCreated"--%>
            <dxwgv:ASPxGridView ID="GridEntryRecord" runat="server" Width="950px" ClientInstanceName="cGridEntryRecord"
                Font-Size="Small" KeyFieldName="RowID" AutoGenerateColumns="False" Settings-ShowHorizontalScrollBar="true"
                OnCustomCallback="GridEntryRecord_CustomCallback" >
                <ClientSideEvents CustomButtonClick="function (s, e) {OnGridEditClick();}" EndCallback="function (s, e) {GridEntryRecord_EndCallBack();}" />
                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" />
                <Styles>
                    <Header CssClass="gridheader" ImageSpacing="5px" SortingImageSpacing="5px">
                    </Header>
                    <FocusedGroupRow CssClass="gridselectrow">
                    </FocusedGroupRow>
                    <FocusedRow CssClass="gridselectrow">
                    </FocusedRow>
                    <Footer CssClass="gridfooter">
                    </Footer>
                    <LoadingPanel ImageSpacing="10px">
                    </LoadingPanel>
                    <Row Wrap="False">
                    </Row>
                    <Cell HorizontalAlign="Left">
                    </Cell>
                </Styles>
             <%--   <a href="javascript:void(0);" onclick="Method('<%# Eval("ApplicationNumber") %>','<%# Eval("ApplicationDate") %>','<%# Eval("ClientID") %>' )"--%>
                <SettingsEditing Mode="EditForm" PopupEditFormShowHeader="False" />
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="View"  VisibleIndex="0" Width="70px" FixedStyle="Left">
                       <CellStyle CssClass="gridcellleft" Font-Size="11px" HorizontalAlign="center">
                        </CellStyle>
                        <DataItemTemplate>
                            <a href="javascript:void(0);" onclick="ForOpen('<%# Eval("ApplicatnNo") %>')"
                                tabindex="-1">
                                Open
                            </a>
                        </DataItemTemplate>
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ClientType" FieldName="ClientTypeText"
                        VisibleIndex="1" Width="80px" FixedStyle="Left">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px" HorizontalAlign="Right">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Client Name" FieldName="Name" VisibleIndex="2"
                        Width="180px" FixedStyle="Left">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="StatusText" VisibleIndex="3"
                        Width="170px">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="DOB" FieldName="DOB" VisibleIndex="4"
                        Width="170px">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Registered Address" FieldName="RegisteredAddress" VisibleIndex="5"
                        Width="250px">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Correspondence Address" FieldName="CorrespondenceAddress" VisibleIndex="6"
                        Width="250px">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                     <dxwgv:GridViewDataTextColumn Caption="ApplicatnNo" FieldName="ApplicatnNo" Visible="false"
                        VisibleIndex="7">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="RowID" FieldName="RowID" Visible="false"
                        VisibleIndex="8">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                   
                </Columns>
                <SettingsText EmptyDataRow="No Data To Display" />
                <Settings ShowHorizontalScrollBar="True" />
                <SettingsLoadingPanel Text="PleaseWait&amp;hellip;" />
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
            </dxwgv:ASPxGridView>
          </div> 
        </div>
        <br />
     <div id="DivEntryForm" >  
     <div id="Div_Container" class="container" style="width: 99%">
        <div id="Div_FirstAccountHlder"  style="width:99%">
            <dxcp:ASPxCallbackPanel ID="CbpFirstAccountHlder" runat="server" BackColor="Transparent"
                ClientInstanceName="cCbpFirstAccountHlder" OnCallback="CbpFirstAccountHlder_Callback" Width="100%">
                <PanelCollection>
                    <dxp:PanelContent runat="server">
                        <div class="DivHeader" style="width: 100%" >
                            FIRST ACCOUNT HOLDER DETAILS
                        </div>
                        <div id="Row00" class="Row">
                            <div id="Row00_Col0" class="LFloat_Lable Leftdiv BtmMargin">
                                Product Type:
                            </div>
                            <div id="Row00_Col1" class="LFloat_Row" style="height: 25px">
                                <asp:TextBox  ID="TxtProductType" runat="server" Width="100px"></asp:TextBox>
                            </div>
                        </div>
                        <div id="Row0" class="Row">
                            <div id="Row0_Col1" class="LFloat_Lable Leftdiv BtmMargin">
                                Title:
                            </div>
                            <div id="Row0_Col2" class="LFloat_Row" style="height: 25px">
                                <dxe:ASPxTextBox ID="TxtTitl1" runat="server" ClientInstanceName="cTxtTitl1" Width="100px">
                                </dxe:ASPxTextBox>
                            </div>
                        </div>
                        <div id="Row1" class="Row">
                            <div id="Row1_Col0" class="LFloat_Lable Leftdiv BtmMargin">
                                <span class="Spanclass"></span> Name Of The Applicant:
                            </div>
                            <div id="Row1_Col1" class="LFloat_Row BtmMargin DivName BindDiv">
                            </div>
                            <div id="Row1_Col2" class="LFloat_Row DivName BindDiv">
                            </div>
                            <div id="Row1_Col3" class="LFloat_Row DivName BindDiv">
                            </div>
                        </div>
                        <div id="Row2" class="Row">
                            <div id="Row2_Col0" class="LFloat_Lable Leftdiv BtmMargin">
                                Suffix:
                            </div>
                            <div id="Row2_Col1" class="LFloat_Row" style="height: 25px">
                                <dxe:ASPxTextBox ID="TxtSufx1" runat="server" ClientInstanceName="cTxtSufx1" Width="100px">
                                </dxe:ASPxTextBox>
                            </div>
                        </div>
                        <div id="Row3" class="Row">
                            <div id="Row3_Col0" class="LFloat_Lable Leftdiv">
                                <span class="Spanclass"></span>Father's / Spouse Name:
                            </div>
                            <div id="Row3_Col1" class="LFloat_Row BindDiv" style="height: 25px">
                            </div>
                        </div>
                        <div id="Row4" class="Row">
                            <div id="Row4_Col0" class="LFloat_Lable Leftdiv">
                                Correspondence Address:
                            </div>
                            <div id="Row4_Col1" class="LFloat_Row FontChange" style="width: 57%">
                                <div id="Row4_Col1_row0" class="LFloat_Row LeftMargin BindDiv" style="margin-bottom: 2px;
                                    width: 400px">
                                </div>
                                <div id="Row4_Col1_row1" class="LFloat_Row LeftMargin BindDiv" style="margin-bottom: 2px;
                                    width: 400px">
                                </div>
                                <div id="Row4_Col1_row2" class="LFloat_Row LeftMargin BindDiv" style="margin-bottom: 2px;
                                    width: 400px">
                                </div>
                  
                                <div id="Row4_Col1_row3" class="left BtmMargin TopMargin" style="width: 99%">
                                    <div id="Row4_Col1_row3_col0" class="left" style="height: 25px">
                                        City/Town/Village :
                                    </div>
                                    <div id="Row4_Col1_row3_col1" class="left  LeftMargin SetBorder BindDiv" style="height: 25px;
                                        width: 100px;">
                                    </div>
                                    <div id="Row4_Col1_row3_col2" class="left" style="height: 25px">
                                        PinCode :
                                    </div>
                                    <div id="Row4_Col1_row3_col3" class="left  LeftMargin SetBorder BindDiv" style="height: 25px;
                                        width: 100px;">
                                    </div>
                                </div>
                                <div id="Row4_Col1_row4" class="left" style="height: 25px">
                                    State:</div>
                                <div id="Row4_Col1_row5" class="left SetBorder BindDiv" style="height: 25px; margin-left: 4px;
                                    width: 100px;">
                                </div>
                                <div id="Row4_Col1_row6" class="left LeftMargin" style="height: 25px">
                                    Country:</div>
                                <div id="Row4_Col1_row7" class="left SetBorder BindDiv" style="height: 25px; margin-left: 4px;
                                    width: 100px;">
                                </div>
                            </div>
                        </div>
   
                        <div id="Row5" class="Row">
                            <div id="Row5_Col0" class="LFloat_Lable Leftdiv">
                                Permanent Address:
                            </div>
                            <div id="Row5_Col1" class="LFloat_Row FontChange" style="width: 57%">
                                <div id="Row5_Col1_row0" class="LFloat_Row LeftMargin BindDiv" style="margin-bottom: 2px;
                                    width: 400px">
                                </div>
                                <div id="Row5_Col1_row1" class="LFloat_Row LeftMargin BindDiv" style="margin-bottom: 2px;
                                    width: 400px">
                                </div>
                                <div id="Row5_Col1_row2" class="LFloat_Row LeftMargin BindDiv" style="margin-bottom: 2px;
                                    width: 400px">
                                </div>
                                <div id="Row5_Col1_row3" class="left BtmMargin TopMargin" style="width: 99%">
                                    <div id="Row5_Col1_row3_col0" class="left" style="height: 25px">
                                        City/Town/Village :
                                    </div>
                                    <div id="Row5_Col1_row3_col1" class="left LeftMargin SetBorder BindDiv" style="height: 25px; width: 100px;">
                                    </div>
                                    <div id="Row5_Col1_row3_col2" class="left" style="height: 25px">
                                        PinCode :
                                    </div>
                                    <div id="Row5_Col1_row3_col3" class="left LeftMargin SetBorder BindDiv" style="height: 25px; width: 100px;">
                                    </div>
                                </div>
                                <div id="Row5_Col1_row4" class="left" style="height: 25px">
                                    State:</div>
                                <div id="Row5_Col1_row5" class="left SetBorder BindDiv" style="height: 25px; margin-left: 4px;
                                    width: 100px;">
                                </div>
                                <div id="Row5_Col1_row6" class="left LeftMargin" style="height: 25px">
                                    Country:</div>
                                <div id="Row5_Col1_row7" class="left SetBorder BindDiv" style="height: 25px; margin-left: 4px;
                                    width: 100px;">
                                </div>
                            </div>
                        </div>

                        <div id="Row6" class="left" style="font-size: 12px">
                            <dxe:ASPxCheckBox ID="CbSame" runat="server" ClientInstanceName="cCbSame"
                                ToolTip="Same As The Corresponding Address">
                                <ClientSideEvents CheckedChanged="OnCheckedChanged" />
                            </dxe:ASPxCheckBox>
                            Same As The Correspondence Address
                        </div>
                        <div id="Row7" class="Row">
                            <div id="Row7_Col0" class="LFloat_Lable Leftdiv">
                                Contact Details:</div>
                            <div id="Row7_Col1" class="LFloat_Row FontChange" style="width: 57%">
                                <div id="Row7_Col1_row0" class="left TopMargin" style="width: 99%">
                                    <div id="Row7_Col1_row0_col0" class="left" style="height: 25px">
                                        Tel(Off) :
                                    </div>
                                    <div id="Row7_Col1_row0_col1" class="left SetBorder BindDiv" style="height: 25px; width: 100px;">
                                    </div>
                                    <div id="Row7_Col1_row0_col2" class="left" style="height: 25px">
                                        Tel(Res) :
                                    </div>
                                    <div id="Row7_Col1_row0_col3" class="left SetBorder BindDiv" style="height: 25px; width: 100px;">
                                    </div>
                                </div>
                                <div id="Row7_Col1_row1" class="left BtmMargin TopMargin" style="width: 99%">
                                    <div id="Row7_Col1_row1_col0" class="left" style="height: 25px">
                                        Fax No. :
                                    </div>
                                    <div id="Row7_Col1_row1_col1" class="left SetBorder BindDiv" style="height: 25px; width: 100px;">
                                    </div>
                                    <div id="Row7_Col1_row1_col2" class="left" style="height: 25px">
                                        Mobile No. :
                                    </div>
                                    <div id="Row7_Col1_row1_col3" class="left SetBorder BindDiv" style="height: 25px; width: 100px;">
                                    </div>
                                </div>
                                <div id="Row7_Col1_row2" class="left BtmMargin" style="height: 25px">
                                    Email ID:
                                </div>
                                <div id="Row7_Col1_row3" class="left SetBorder BtmMargin BindDiv" style="height: 25px; width: 250px;">
                                </div>
                            </div>
                        </div>
                        <div id="Row8" class="Row">
                            <div id="Row8_Col0" class="LFloat_Lable Leftdiv">
                                Is Pan Exempt:
                            </div>
                            <div id="Row8_Col1" class="LFloat_Row FontChange BindDiv" style="height: 35px">
                            </div>
                            <div id="Row8_Col2" class="LFloat_Row" style="margin-left: 10px; height: 35px">
                                <dxe:ASPxComboBox ID="ComboPanExempt1" runat="server" ClientInstanceName="cComboPanExempt1"
                                    EnableIncrementalFiltering="True" Font-Size="12px" Height="25px"
                                    ValueType="System.String" Width="250px">
                                    <DropDownButton Text="PanExemptionType">
                                    </DropDownButton>
                                </dxe:ASPxComboBox>
                            </div>
                        </div>
                        <div id="Row9" class="Row">
                            <div id="Row9_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                <span class="Spanclass">**</span> PAN / GIR:
                            </div>
                            <div id="Row9_Col1" class="LFloat_Row FontChange BindDiv" style="height: 35px">
                            </div>
                            <div id="Row9_Col2" class="LFloat_Row" style="margin-left: 10px; height: 35px">
                                <dxe:ASPxComboBox ID="ComboPanVerificatn1" runat="server" ClientInstanceName="cComboPanVerificatn1"
                                    EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                    ValueType="System.String" Width="200px">
                                    <Items>
                                        <dxe:ListEditItem Text="Select" Value="S" />
                                        <dxe:ListEditItem Text="PAN not verified" Value="0" />
                                        <dxe:ListEditItem Text="PAN verified" Value="1" />
                                        <dxe:ListEditItem Text="PAN verification reversed" Value="2" />
                                    </Items>
                                    <DropDownButton Text="PanVerification">
                                    </DropDownButton>
                                </dxe:ASPxComboBox>
                            </div>
                        </div>
                        <div id="Row10" class="Row">
                            <div id="Row10_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                IT Circle/Ward/District:</div>
                            <div id="Row10_Col1" class="LFloat_Row" style="height: 37px">
                                <dxe:ASPxTextBox ID="TxtDistrict1" runat="server" ClientInstanceName="cTxtDistrict1"
                                    Width="170px">
                                </dxe:ASPxTextBox>
                            </div>
                        </div>
                        <div id="Row100" class="Row">
                            <div id="Row100_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                UserText1:</div>
                            <div id="Row100_Col1" class="LFloat_Row" style="height: 37px">
                                <dxe:ASPxTextBox ID="TxtUsrTxt1" runat="server" ClientInstanceName="cTxtUsrTxt1"
                                    Width="270px">
                                </dxe:ASPxTextBox>
                            </div>
                        </div>
                        <div id="Row101" class="Row">
                            <div id="Row101_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                UserText2:</div>
                            <div id="Row101_Col1" class="LFloat_Row" style="height: 37px">
                                <dxe:ASPxTextBox ID="TxtUsrTxt2" runat="server" ClientInstanceName="cTxtUsrTxt2"
                                    Width="270px">
                                </dxe:ASPxTextBox>
                            </div>
                        </div>
                        <div id="Row102" class="Row">
                            <div id="Row102_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                User Field3:</div>
                            <div id="Row102_Col1" class="LFloat_Row" style="height: 37px">
                                <dxe:ASPxTextBox ID="TxtUsrFld3" runat="server" ClientInstanceName="cTxtUsrFld3"
                                    Width="120px">
                                </dxe:ASPxTextBox>
                            </div>
                        </div>
                        <br /> <br />
                        <div id="Row11" class="right" style="font-size: 12pt; margin-left: 10px;
                            margin-right: 10px">
                            <dxe:ASPxButton ID="BtnNext1" runat="server" AccessKey="i" AutoPostBack="False"
                                ClientInstanceName="cBtnNext1" Text="NEXT &gt;&gt;" ToolTip="Go to Next Page"
                                Width="100px">
                                <ClientSideEvents Click="function(s, e) {FrstHlderNxt();}" />
                                <Border BorderColor="White" />
                            </dxe:ASPxButton>
                        </div>
                       
                        <div id="Row12" class="right" style="font-size: 12pt; margin-left: 10px;
                            width: 143px;">
                            <dxe:ASPxCheckBox ID="CbChecked" runat="server" ClientInstanceName="cCbChecked"
                                ToolTip="Click If All The Informations Has Been Checked" Text="Information Checked">
                                <ClientSideEvents CheckedChanged="OnInfoChecked" />
                            </dxe:ASPxCheckBox>
                        </div>
                        <br /> <br />
                    </dxp:PanelContent>
                </PanelCollection>
                <ClientSideEvents EndCallback="function (s, e) {CbpFirstAccountHlder_EndCallBack();}" />
            </dxcp:ASPxCallbackPanel>
         
          </div>
          <div id="Div_SecondAccountHlder"  style="width:99%">
           <dxcp:ASPxCallbackPanel ID="CbpSecondAccountHlder" runat="server" BackColor="Transparent"
                     ClientInstanceName="cCbpSecondAccountHlder" OnCallback="CbpSecondAccountHlder_Callback" Width="100%">
                     <PanelCollection>
                         <dxp:PanelContent runat="server">
                             <div class="DivHeader" style="width: 100%" >
                                 &nbsp; SECOND ACCOUNT HOLDER DETAILS
                             </div>
                             <div id="Row13" class="Row">
                                 <div id="Row13_Col0" class="LFloat_Lable Leftdiv BtmMargin">
                                     Title:
                                 </div>
                                 <div id="Row13_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtTitl2" runat="server" ClientInstanceName="cTxtTitl2"
                                         Width="100px">
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Div1" class="right" style="margin-right: 10px;">
                                <dxe:ASPxCheckBox ID="ASPxCheckBox1" runat="server" ClientInstanceName="cCbSkip1"
                                    ToolTip="Skip Second Account Holder Details" Checked="False" Text="Skip This Section">
                                    <ClientSideEvents CheckedChanged="OnCheckedChanged" />
                                </dxe:ASPxCheckBox>
                             </div><div id="Row14" class="right" style="margin-right: 10px;">
                                 &nbsp;<span style="font-size: 10pt; color: #ff0000">**</span> <span style="font-size: 8pt">
                                     Mandatory Fields To Be Filled</span>
                             </div>
                             <div id="Row15" class="Row">
                                 <div id="Row15_Col0" class="LFloat_Lable Leftdiv BtmMargin">
                                     <span class="Spanclass">**</span> Name Of The Applicant:
                                 </div>
                                 <div id="Row15_Col1" class="LFloat_Row BtmMargin" style="height: 25px; text-align: center">
                                     <dxe:ASPxTextBox ID="TxtFName1" runat="server" ClientInstanceName="cTxtFName1"
                                         ForeColor="Silver" HorizontalAlign="Center" NullText="First Name" Width="155px">
                                         <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}" />
                                     </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row15_Col2" class="LFloat_Row DivName">
                                     <dxe:ASPxTextBox ID="TxtMName1" runat="server" ClientInstanceName="cTxtMName1"
                                         ForeColor="Silver" HorizontalAlign="Center" NullText="Middle Name" Width="155px">
                                         <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}" />
                                     </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row15_Col3" class="LFloat_Row DivName">
                                     <dxe:ASPxTextBox ID="TxtLName1" runat="server" ClientInstanceName="cTxtLName1"
                                         ForeColor="Silver" HorizontalAlign="Center" NullText="Last Name" Width="155px">
                                         <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}" />
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row16" class="Row">
                                 <div id="Row16_Col0" class="LFloat_Lable Leftdiv BtmMargin">
                                     Suffix:
                                 </div>
                                 <div id="Row16_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtSufx2" runat="server" ClientInstanceName="cTxtSufx2"
                                         Width="100px">
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row17" class="Row">
                                 <div id="Row17_Col0" class="LFloat_Lable Leftdiv">
                                     Father's / Spouse Name:
                                 </div>
                                 <div id="Row17_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtFthrName1" runat="server" ClientInstanceName="cTxtFthrName1"
                                         Width="500px">
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row18" class="Row">
                                 <div id="Row18_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                     Is Pan Exempt:
                                 </div>
                                 <div id="Row18_Col1" class="LFloat_Row FontChange" style="height: 35px">
                                     <dxe:ASPxRadioButton ID="rdPanxmptY1" runat="server" ClientInstanceName="crdPanxmptY1"
                                         GroupName="z">
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdPanxmptY1.GetChecked(),'Row18_Col2');}"/>
                                              
                                     </dxe:ASPxRadioButton>
                                     YES
                                     <dxe:ASPxRadioButton ID="rdPanxmptN1" runat="server" Checked="True" ClientInstanceName="crdPanxmptN1"
                                         GroupName="z">
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdPanxmptY1.GetChecked(),'Row18_Col2');}"/>
                                            
                                     </dxe:ASPxRadioButton>
                                     NO
                                 </div>
                                 <div id="Row18_Col2" class="LFloat_Row" style="margin-left: 10px; height: 35px">
                                     <dxe:ASPxComboBox ID="ComboPanExempt2" runat="server" ClientInstanceName="cComboPanExempt2"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="200px">
                                         
                                         <DropDownButton Text="PanExempt">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                 </div>
                             </div>
                             <div id="Row19" class="Row">
                                 <div id="Row19_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                     <span class="Spanclass">**</span> PAN / GIR:
                                 </div>
                                 <div id="Row19_Col1" class="LFloat_Row FontChange" style="height: 35px">
                                     <dxe:ASPxTextBox ID="TxtPan1" runat="server" ClientInstanceName="cTxtPan1" MaxLength="10"
                                         Width="150px">
                                     </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row19_Col2" class="LFloat_Row" style="margin-left: 10px; height: 35px">
                                     <dxe:ASPxComboBox ID="ComboPanVerificatn2" runat="server" ClientInstanceName="cComboPanVerificatn2"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="200px">
                                         <Items>
                                             <dxe:ListEditItem  Text="PAN not verified" Value="0"/>
                                             <dxe:ListEditItem  Text="PAN verified" Value="1"/>
                                             <dxe:ListEditItem  Text="PAN verification reversed" Value="2"/>
                                         </Items>
                                         <DropDownButton Text="PanVerification">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                 </div>
                             </div>
                             <div id="Row20" class="Row">
                                 <div id="Row20_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                     IT Circle/Ward/District:</div>
                                 <div id="Row20_Col1" class="LFloat_Row" style="height: 37px">
                                     <dxe:ASPxTextBox ID="TxtDistrict2" runat="server" ClientInstanceName="cTxtDistrict2" 
                                         MaxLength="12" Width="170px">
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <br /> <br />
                             <div id="Row21" class="right" style="font-size: 12pt; margin-left: 10px;
                                 margin-right: 10px">
                                 <dxe:ASPxButton ID="BtnNext2" runat="server" AccessKey="i" AutoPostBack="False"
                                     ClientInstanceName="cBtnNext2" Text="NEXT &gt;&gt;" ToolTip="Save Entered Data"
                                     Width="100px">
                                     <ClientSideEvents Click="function(s, e) {ScndHlderNxt();}" />
                                     <Border BorderColor="White" />
                                 </dxe:ASPxButton>
                             </div>
                             <div id="Row22" class="right" style="font-size: 12pt; margin-left: 10px">
                                 <dxe:ASPxButton ID="BtnPrvs1" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs1"
                                     Text="&lt;&lt; PREVIOUS" ToolTip="Edit Entered Data" Width="100px">
                                     <ClientSideEvents Click="function(s, e) {ScndHlderPrvs();}" />
                                     <Border BorderColor="White" />
                                 </dxe:ASPxButton>
                             </div>
                             <br />
                             <br />
                         </dxp:PanelContent>
                     </PanelCollection>
                     <ClientSideEvents EndCallback="function (s, e) {CbpSecondAccountHlder_EndCallBack();}" />
                 </dxcp:ASPxCallbackPanel>
          </div> 
          <div id="Div_ThirdAccountHlder"  style="width:99%">
           <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanel3" runat="server" BackColor="Transparent"
                     ClientInstanceName="cCbpIdntty" OnCallback="CbpThirdAccountHlder_Callback" Width="100%">
                     <PanelCollection>
                         <dxp:PanelContent runat="server">
                             <div class="DivHeader" style="width: 100%">
                                 &nbsp; THIRD ACCOUNT HOLDER DETAILS
                             </div>
                             <div id="Row23" class="Row">
                                 <div id="Row23_Col0" class="LFloat_Lable Leftdiv BtmMargin">
                                     Title:
                                 </div>
                                 <div id="Row23_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtTitl3" runat="server" ClientInstanceName="cTxtTitl3"
                                         Width="100px">
                                     </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row23_Col2" class="right" style="margin-right: 10px">
                                     <dxe:ASPxCheckBox ID="CbSkip2" runat="server" ClientInstanceName="cCbSkip2"
                                    ToolTip="Skip Third Account Holder Details" Checked="False" Text="Skip This Section">
                                         <ClientSideEvents CheckedChanged="OnCheckedChanged" />
                                     </dxe:ASPxCheckBox>
                                 </div>
                             </div>
                             <div id="Row24" class="Row">
                                 <div id="Row24_Col0" class="LFloat_Lable Leftdiv BtmMargin">
                                     <span class="Spanclass">**</span> Name Of The Applicant:
                                 </div>
                                 <div id="Row24_Col1" class="LFloat_Row BtmMargin" style="height: 25px; text-align: center">
                                     <dxe:ASPxTextBox ID="TxtFName2" runat="server" ClientInstanceName="cTxtFName2"
                                         ForeColor="Silver" HorizontalAlign="Center" NullText="First Name" Width="155px">
                                         <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}" />
                                     </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row24_Col2" class="LFloat_Row DivName">
                                     <dxe:ASPxTextBox ID="TxtMName2" runat="server" ClientInstanceName="cTxtMName2"
                                         ForeColor="Silver" HorizontalAlign="Center" NullText="Middle Name" Width="155px">
                                         <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}" />
                                     </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row24_Col3" class="LFloat_Row DivName">
                                     <dxe:ASPxTextBox ID="TxtLName2" runat="server" ClientInstanceName="cTxtLName2"
                                         ForeColor="Silver" HorizontalAlign="Center" NullText="Last Name" Width="155px">
                                         <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}" />
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row25" class="Row">
                                 <div id="Row25_Col0" class="LFloat_Lable Leftdiv BtmMargin">
                                     Suffix:
                                 </div>
                                 <div id="Row25_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtSufx3" runat="server" ClientInstanceName="cTxtSufx3"
                                         Width="100px">
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row26" class="Row">
                                 <div id="Row26_Col0" class="LFloat_Lable Leftdiv">
                                     <span class="Spanclass"></span>Father's / Spouse Name:
                                 </div>
                                 <div id="Row26_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtFthrName2" runat="server" ClientInstanceName="cTxtFthrName2"
                                         Width="500px">
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row27" class="Row">
                                 <div id="Row27_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                     Is Pan Exempt:
                                 </div>
                                 <div id="Row27_Col1" class="LFloat_Row FontChange" style="height: 35px">
                                     <dxe:ASPxRadioButton ID="rdPanxmptY2" runat="server" ClientInstanceName="crdPanxmptY2"
                                         GroupName="z">
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdPanxmptY2.GetChecked(),'Row27_Col2');}"/>
                                              
                                     </dxe:ASPxRadioButton>
                                     YES
                                     <dxe:ASPxRadioButton ID="rdPanxmptN2" runat="server" Checked="True" ClientInstanceName="crdPanxmptN2"
                                         GroupName="z">
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdPanxmptY2.GetChecked(),'Row27_Col2');}"/>
                                     
                                     </dxe:ASPxRadioButton>
                                     NO
                                 </div>
                                 <div id="Row27_Col2" class="LFloat_Row" style="margin-left: 10px; height: 35px">
                                     <dxe:ASPxComboBox ID="ComboPanExempt3" runat="server" ClientInstanceName="cComboPanExempt3"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="200px">
                                         
                                         <DropDownButton Text="PanExempt">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                 </div>
                             </div>
                             <div id="Row28" class="Row">
                                 <div id="Row28_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                     <span class="Spanclass">**</span> PAN / GIR:
                                 </div>
                                 <div id="Row28_Col1" class="LFloat_Row FontChange" style="height: 35px">
                                     <dxe:ASPxTextBox ID="TxtPan2" runat="server" ClientInstanceName="cTxtPan2" MaxLength="10"
                                         Width="150px">
                                     </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row28_Col2" class="LFloat_Row" style="margin-left: 10px; height: 35px">
                                     <dxe:ASPxComboBox ID="ComboPanVerification3" runat="server" ClientInstanceName="cComboPanVerification3"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="200px">
                                         <Items>
                                             <dxe:ListEditItem  Text="PAN not verified" Value="0"/>
                                             <dxe:ListEditItem  Text="PAN verified" Value="1"/>
                                             <dxe:ListEditItem  Text="PAN verification reversed" Value="2"/>
                                         </Items>
                                         <DropDownButton Text="PanVerification">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                 </div>
                                 
                             </div>
                             <div id="Row29" class="Row">
                                 <div id="Row29_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                     IT Circle/Ward/District:</div>
                                 <div id="Row29_Col1" class="LFloat_Row" style="height: 37px">
                                     <dxe:ASPxTextBox ID="TxtDistrict3" runat="server" ClientInstanceName="cTxtDistrict3" 
                                         MaxLength="12" Width="170px">
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <br /> <br />
                             <div id="Row30" class="right" style="font-size: 12pt; margin-left: 10px;
                                 margin-right: 10px">
                                 <dxe:ASPxButton ID="BtnNext3" runat="server" AccessKey="i" AutoPostBack="False"
                                     ClientInstanceName="cBtnNext3" Text="NEXT &gt;&gt;" ToolTip="Save Entered Data"
                                     Width="100px">
                                     <ClientSideEvents Click="function(s, e) {ThrdHlderNxt();}" />
                                     <Border BorderColor="White" />
                                 </dxe:ASPxButton>
                             </div>
                             <div id="Row31" class="right" style="font-size: 12pt; margin-left: 10px">
                                 <dxe:ASPxButton ID="BtnPrvs2" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs2"
                                     Text="&lt;&lt; PREVIOUS" ToolTip="Edit Entered Data" Width="100px">
                                     <ClientSideEvents Click="function(s, e) {ThrdHlderPrvs();}" />
                                     <Border BorderColor="White" />
                                 </dxe:ASPxButton>
                             </div>
                             <br />
                             <br />
                         </dxp:PanelContent>
                     </PanelCollection>
                     <ClientSideEvents EndCallback="function (s, e) {CbpThirdAccountHlder_EndCallBack();}" />
                 </dxcp:ASPxCallbackPanel>
          </div>
          <div id="Div_ProductDetails">
              <dxcp:ASPxCallbackPanel ID="CbpProductDtls" runat="server" ClientInstanceName="cCbpProductDtls"
                    OnCallback="CbpProductDtls_Callback" BackColor="Transparent" Width="100%">
                   <PanelCollection>
                       <dxp:panelcontent runat="server"> 
                             <div class="DivHeader" style="width: 100%" >&nbsp; PRODUCT DETAILS 
                             </div>
                             <div id="Row32" class="Row">
                                 <div id="Row32_Col0" class="LFloat_Lable Leftdiv BtmMargin">
                                    DP Internal Ref No:
                                 </div>
                                 <div id="Row32_Col1" class="LFloat_Row BtmMargin" style="height: 25px; ">
                                   <dxe:ASPxTextBox ID="TxtIntrnlRef" runat="server" ClientInstanceName="cTxtIntrnlRef"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                              </div>
                             <div id="Row33" class="Row">
                                 <div id="Row33_Col0" class="LFloat_Lable Leftdiv BtmMargin">
                                    Date Of Maturity:
                                 </div>
                                 <div id="Row33_Col1" class="LFloat_Row BtmMargin" style="height: 25px;">
                                   <dxe:ASPxDateEdit ID="MaturityDt" runat="server" ClientInstanceName="cMaturityDt" DateOnError="Today"
                                          EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                          Font-Size="11px" TabIndex="0">
                                   </dxe:ASPxDateEdit>
                                 </div>
                                 <div id="Row33_Col2" class="LFloat_Lable Leftdiv BtmMargin LeftMargin">
                                    Date Of Birth:
                                 </div>
                                 <div id="Row33_Col3" class="LFloat_Row BtmMargin BindDiv" style="height: 25px;">
                                  
                                 </div>
                             </div>
                             <div id="Row34" class="Row">
                                 <div id="Row34_Col0" class="LFloat_Lable Leftdiv">
                                     Gender:
                                 </div>
                                 <div id="Row34_Col1" class="LFloat_Row FontChange BindDiv" style="height: 25px">
                                     <%--<asp:RadioButton ID="rdMale" runat="server" Checked="True"  Text="Male" GroupName="a" TabIndex="0" />
                                     
                                     <asp:RadioButton ID="rdFemale" runat="server" Checked="False"  Text="Female" GroupName="a" TabIndex="0" />--%>
                                 </div>
                                 <div id="Row34_Col2" class="LFloat_Lable Leftdiv LeftMargin" style="margin-left: 135px">
                                     Occupation:
                                 </div>
                                 <div id="Row34_Col3" class="LFloat_Row FontChange BindDiv" style="height: 25px">
                                    <%--<dxe:ASPxComboBox ID="ComboOccupatn" runat="server" ClientInstanceName="cComboOccupatn"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="150px">
                                    </dxe:ASPxComboBox>--%>
                                 </div>
                             </div>
                             
                             <div id="Row35" class="Row">
                                 <div id="Row35_Col0" class="LFloat_Lable Leftdiv">
                                     Life Style:
                                 </div>
                                 <div id="Row35_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtLifeStyle" runat="server" ClientEnabled="false" ClientInstanceName="cTxtLifeStyle"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row35_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Geographical Code:
                                 </div>
                                 <div id="Row35_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                     <asp:TextBox ID="TxtGeoCode" runat="server" Width="145px"></asp:TextBox>
                                 </div>
                             </div>
                             <div id="Row36" class="Row">
                                 <div id="Row36_Col0" class="LFloat_Lable Leftdiv">
                                     Education /Degree:
                                 </div>
                                 <div id="Row36_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <asp:TextBox ID="TxtEduDegree" runat="server" Width="145px"></asp:TextBox>
                                 </div>
                                 <div id="Row36_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Annual Income Code:
                                 </div>
                                 <div id="Row36_Col3" class="LFloat_Row FontChange BindDiv" style="height: 25px">
                                   
                                 </div>
                             </div>
                             <div id="Row37" class="Row">
                                 <div id="Row37_Col0" class="LFloat_Lable Leftdiv">
                                    Nationality:
                                 </div>
                                 <div id="Row37_Col1" class="LFloat_Row FontChange BindDiv" style="height: 25px">
                                     
                                 </div>
                                 <div id="Row37_Col2" class="LFloat_Lable Leftdiv  LeftMargin" style="margin-left: 135px">
                                     Status:
                                 </div>
                                 <div id="Row37_Col3" class="LFloat_Row FontChange BindDiv" style="height: 25px">
                                    
                                 </div>
                             </div>
                             <div id="Row38" class="Row">
                                 <div id="Row38_Col0" class="LFloat_Lable Leftdiv">
                                    BO Fee Type:
                                 </div>
                                 <div id="Row38_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtBoFee" runat="server" ClientInstanceName="cTxtBoFee"
                                        Width="150px" ClientEnabled="False">
                                    </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row38_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Language Code:
                                 </div>
                                 <div id="Row38_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                     <asp:TextBox ID="TxtLang" runat="server" Width="145px"></asp:TextBox>
                                 </div>
                             </div>
                             <div id="Row39" class="Row">
                                 <div id="Row39_Col0" class="LFloat_Lable Leftdiv">
                                    Catagory 4 Code:
                                 </div>
                                 <div id="Row39_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtCatg4" runat="server" ClientInstanceName="cTxtCatg4"
                                        Width="150px" ClientEnabled="False">
                                    </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row39_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Bank Option 5:
                                 </div>
                                 <div id="Row39_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtBnkOptn5" runat="server"  ClientEnabled="false" ClientInstanceName="cTxtBnkOptn5"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row40" class="Row">
                                 <div id="Row40_Col0" class="LFloat_Lable Leftdiv">
                                   Staff/Relative:
                                 </div>
                                 <div id="Row40_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <asp:TextBox ID="TxtStaffRel" runat="server" Width="145px"></asp:TextBox>
                                 </div>
                                 <div id="Row40_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Staff Code:
                                 </div>
                                 <div id="Row40_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtStafCode" runat="server" ClientInstanceName="cTxtStafCode"
                                        Width="150px" ClientEnabled="False">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row41" class="Row">
                                 <div id="Row41_Col0" class="LFloat_Lable Leftdiv">
                                   RGESS Flag:
                                 </div>
                                 <div id="Row41_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <dxe:ASPxComboBox ID="ComboRGESS" runat="server" ClientInstanceName="cComboRGESS"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="150px">
                                         <Items>
                                             <dxe:ListEditItem  Text="Yes" Value="Y"/>
                                             <dxe:ListEditItem  Text="No" Value="N"/>
                                         </Items>
                                    </dxe:ASPxComboBox>
                                 </div>
                                 <div id="Row41_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Annual Report Flag:
                                 </div>
                                 <div id="Row41_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxComboBox ID="ComboAnualReprt" runat="server" ClientInstanceName="cComboAnualReprt"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="150px">
                                         <Items>
                                             <dxe:ListEditItem  Text="Physical Annual Report" Value="1"/>
                                             <dxe:ListEditItem  Text="Electronic Annual Report" Value="2"/>
                                             <dxe:ListEditItem  Text="Both Physical and Electronic Annual Report" Value="3"/>
                                         </Items>
                                    </dxe:ASPxComboBox>
                                 </div>
                             </div> 
                             <div id="Row42" class="Row">
                                 <div id="Row42_Col0" class="LFloat_Lable Leftdiv">
                                   Pledge Standing Instruction Flag:
                                 </div>
                                 <div id="Row42_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <dxe:ASPxComboBox ID="ComboPledge" runat="server" ClientInstanceName="cComboPledge"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="150px">
                                         <Items>
                                             <dxe:ListEditItem  Text="Yes" Value="Y"/>
                                             <dxe:ListEditItem  Text="No" Value="N"/>
                                         </Items>
                                    </dxe:ASPxComboBox>
                                 </div>
                                 <div id="Row42_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Email RTA Download Flag:
                                 </div>
                                 <div id="Row42_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxComboBox ID="ComboRTA" runat="server" ClientInstanceName="cComboRTA"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="150px">
                                         <Items>
                                             <dxe:ListEditItem  Text="Yes" Value="Y"/>
                                             <dxe:ListEditItem  Text="No" Value="N"/>
                                         </Items>
                                    </dxe:ASPxComboBox>
                                 </div>
                             </div> 
                             <div id="Row43" class="Row">
                                 <div id="Row43_Col0" class="LFloat_Lable Leftdiv">
                                   Basic Services Demat A/C Flag:
                                 </div>
                                 <div id="Row43_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <dxe:ASPxComboBox ID="ComboBSDA" runat="server" ClientInstanceName="cComboBSDA"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="150px">
                                         <Items>
                                             <dxe:ListEditItem  Text="Yes" Value="Y"/>
                                             <dxe:ListEditItem  Text="No" Value="N"/>
                                         </Items>
                                    </dxe:ASPxComboBox>
                                 </div>
                                 <div id="Row43_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Security Access Code:
                                 </div>
                                 <div id="Row43_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                     <asp:TextBox ID="TxtSecAccess" runat="server" Width="145px"></asp:TextBox>
                                 </div>
                             </div>
                             <div id="Row44" class="Row">
                                 <div id="Row44_Col0" class="LFloat_Lable Leftdiv">
                                     <span style="font-size: 10pt; color: #ff0000">**</span>BO Category:
                                 </div>
                                 <div id="Row44_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                    <asp:TextBox  ID="TxtBoCatg" runat="server" Width="145px"></asp:TextBox>
                                 </div>
                                 <div id="Row44_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     <span style="font-size: 10pt; color: #ff0000">**</span>BO Settlement Planning Flag:
                                 </div>
                                 <div id="Row44_Col3" class="LFloat_Row FontChange" style="height: 25px"><dxe:ASPxComboBox ID="ComboBOsett" runat="server" ClientInstanceName="cComboBOsett"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="150px">
                                     <Items>
                                         <dxe:ListEditItem  Text="Yes" Value="Y"/>
                                         <dxe:ListEditItem  Text="No" Value="N"/>
                                     </Items>
                                 </dxe:ASPxComboBox>
                                 </div>
                             </div>
                             
                             <div id="Row45" class="Row">
                                 <div id="Row45_Col0" class="LFloat_Lable Leftdiv">
                                     Dividend Bank IFSC Code:
                                 </div>
                                 <div id="Row45_Col1" class="LFloat_Row FontChange" style="height: 25px"><dxe:ASPxTextBox ID="TxtIFSC" runat="server" ClientInstanceName="cTxtIFSC"
                                        Width="150px" ClientEnabled="False">
                                 </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row45_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     RBI Refference Number:
                                 </div>
                                 <div id="Row45_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtRBIRef" runat="server" ClientInstanceName="cTxtRBIRef"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row46" class="Row">
                                 <div id="Row46_Col0" class="LFloat_Lable Leftdiv">
                                  RBI Approval Date:
                                 </div>
                                 <div id="Row46_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <dxe:ASPxDateEdit ID="RBIaprvDt" runat="server" ClientInstanceName="cRBIaprvDt" DateOnError="Today"
                                              EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                              Font-Size="11px" TabIndex="0">
                                     </dxe:ASPxDateEdit>
                                 </div>
                                 <div id="Row46_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                    SEBI Registration Number:
                                 </div>
                                 <div id="Row46_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtSebiReg" runat="server" ClientInstanceName="cTxtSebiReg"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row47" class="Row">
                                 <div id="Row47_Col0" class="LFloat_Lable Leftdiv">
                                     Beneficiary Tax Deductation Status:
                                 </div>
                                 <div id="Row47_Col1" class="LFloat_Row FontChange">
                                    <asp:TextBox  ID="TxtBenTaxStatus" runat="server" Width="145px"></asp:TextBox>
                                 </div>
                                 <div id="Row47_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Smart Card Required:
                                 </div>
                                 <div id="Row47_Col3" class="LFloat_Row FontChange"><dxe:ASPxComboBox ID="ComboSmartCrd" runat="server" ClientInstanceName="cComboSmartCrd"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="150px">
                                     <Items>
                                         <dxe:ListEditItem  Text="Yes" Value="Y"/>
                                         <dxe:ListEditItem  Text="No" Value="N"/>
                                     </Items>
                                 </dxe:ASPxComboBox>
                                 </div>
                             </div>
                             <div id="Row48" class="Row">
                                 <div id="Row48_Col0" class="LFloat_Lable Leftdiv">
                                     Smart Card Number:
                                 </div>
                                 <div id="Row48_Col1" class="LFloat_Row FontChange" style="height: 25px"><dxe:ASPxTextBox ID="TxtSmartCrd" runat="server" ClientInstanceName="cTxtSmartCrd"
                                        Width="150px">
                                 </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row48_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Smart Card PIN:
                                 </div>
                                 <div id="Row48_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtSmrtCrdPin" runat="server" ClientInstanceName="cTxtSmrtCrdPin"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row49" class="Row">
                                 <div id="Row49_Col0" class="LFloat_Lable Leftdiv">
                                  ECS/MANDATE:
                                 </div>
                                 <div id="Row49_Col1" class="LFloat_Row FontChange" style="height: 25px"><dxe:ASPxComboBox ID="ComboEcsMandate" runat="server" ClientInstanceName="cComboEcsMandate"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="150px">
                                     <Items>
                                         <dxe:ListEditItem  Text="Yes" Value="Y"/>
                                         <dxe:ListEditItem  Text="No" Value="N"/>
                                     </Items>
                                 </dxe:ASPxComboBox>
                                 </div>
                                 <div id="Row49_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Electronic Confirmation:
                                 </div>
                                 <div id="Row49_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtElectronicConfrmatn" runat="server" ClientInstanceName="cTxtElectronicConfrmatn"
                                        Width="150px" ClientEnabled="False">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row50" class="Row">
                                 <div id="Row50_Col0" class="LFloat_Lable Leftdiv">
                                     Dividend Currency:
                                 </div>
                                 <div id="Row50_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                    <asp:TextBox  ID="TxtDividndCurncy" runat="server" Width="145px"></asp:TextBox>
                                 </div>
                                 <div id="Row5_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Group Code:
                                 </div>
                                 <div id="Row5_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtGrpCode" runat="server" ClientInstanceName="cTxtGrpCode"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row51" class="Row">
                                 <div id="Row51_Col0" class="LFloat_Lable Leftdiv">
                                     <span style="font-size: 10pt; color: #ff0000">**</span>BO Sub Satus:
                                 </div>
                                 <div id="Row51_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                    <asp:TextBox  ID="TxtBoSubstatus" runat="server" Width="145px"></asp:TextBox>
                                 </div>
                                 <div id="Row51_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Clearing Corporation ID:
                                 </div>
                                 <div id="Row51_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                     <asp:TextBox ID="TxtClrngCorpID" runat="server" Width="145px"></asp:TextBox>
                                 </div>
                             </div>
                             <div id="Row52" class="Row">
                                 <div id="Row52_Col0" class="LFloat_Lable Leftdiv">
                                     Clearing Member ID:
                                 </div>
                                 <div id="Row52_Col1" class="LFloat_Row FontChange" style="height: 25px"><dxe:ASPxTextBox ID="TxtClrngMmbrID" runat="server" ClientInstanceName="cTxtClrngMmbrID"
                                        Width="150px">
                                 </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row52_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Stock Exchange:
                                 </div>
                                 <div id="Row52_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtStckExchng" runat="server" ClientInstanceName="cTxtStckExchng"
                                        Width="150px" ClientEnabled="False">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             
                             <div id="Row53" class="Row">
                                 <div id="Row53_Col0" class="LFloat_Lable Leftdiv">
                                     Confirmation Waived:
                                 </div>
                                 <div id="Row53_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <dxe:ASPxComboBox ID="ComboConfrmatnWavd" runat="server" ClientInstanceName="cComboConfrmatnWavd"
                                             EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                             ValueType="System.String" Width="150px">
                                         <Items>
                                             <dxe:ListEditItem  Text="Yes" Value="Y"/>
                                             <dxe:ListEditItem  Text="No" Value="N"/>
                                         </Items>
                                     </dxe:ASPxComboBox>
                                 </div>
                                 <div id="Row53_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Trading ID:
                                 </div>
                                 <div id="Row53_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtTtradngID" runat="server" ClientInstanceName="cTxtTtradngID"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row54" class="Row">
                                 <div id="Row54_Col0" class="LFloat_Lable Leftdiv">
                                     <span style="font-size: 10pt; color: #ff0000">**</span>BO Statement Cycle Code:
                                 </div>
                                 <div id="Row54_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                    <asp:TextBox  ID="TxtBOStatemntCycle" runat="server" Width="145px"></asp:TextBox>
                                 </div>
                                 <div id="Row54_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     BENF Bank Code:
                                 </div>
                                 <div id="Row54_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtBENFBnkCode" runat="server" ClientInstanceName="cTxtBENFBnkCode"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row55" class="Row">
                                 <div id="Row55_Col0" class="LFloat_Lable Leftdiv">
                                     BENF Bank Account Type:
                                 </div>
                                 <div id="Row55_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                    <asp:TextBox  ID="TxtBENFBnkAcType" runat="server" Width="145px"></asp:TextBox>
                                 </div>
                                 <div id="Row55_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     BENF Bank Account Number:
                                 </div>
                                 <div id="Row55_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtBENFBnkAcNo" runat="server" ClientInstanceName="cTxtStafCode"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row56" class="Row">
                                 <div id="Row56_Col0" class="LFloat_Lable Leftdiv">
                                     BENF Bank CCY:
                                 </div>
                                 <div id="Row56_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                    <asp:TextBox  ID="TxtBENFBnkCCY" runat="server" Width="145px"></asp:TextBox>
                                 </div>
                                 <div id="Row56_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     DIVND Bank Account TYPE:
                                 </div>
                                 <div id="Row56_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                     <asp:TextBox ID="TxtDIVNDBnkAcType" runat="server" Width="145px"></asp:TextBox>
                                 </div>
                             </div>
                             <div id="Row57" class="Row">
                                 <div id="Row57_Col0" class="LFloat_Lable Leftdiv">
                                     DIVND Bank CODE:
                                 </div>
                                 <div id="Row57_Col1" class="LFloat_Row FontChange" style="height: 25px"><dxe:ASPxTextBox ID="TxtDIVNDBnkCode" runat="server" ClientInstanceName="cTxtDIVNDBnkCode"
                                        Width="150px">
                                 </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row57_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     DIVND Account Number:
                                 </div>
                                 <div id="Row57_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtDIVNDBnkAcNo" runat="server" ClientInstanceName="cTxtDIVNDBnkAcNo"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row58" class="Row">
                                 <div id="Row58_Col0" class="LFloat_Lable Leftdiv">
                                     DIVND Bank CCY:
                                 </div>
                                 <div id="Row58_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                    <asp:TextBox  ID="TxtDIVNDBnkCCY" runat="server" Width="145px"></asp:TextBox>
                                 </div>
                                 
                            </div>
                            <br /> <br />
                            
                            <div id="Row580" class="right" style="font-size: 12pt; margin-left: 10px;
                                 margin-right: 10px">
                                 <dxe:ASPxButton ID="BtnNext4" runat="server" AccessKey="i" AutoPostBack="False"
                                     ClientInstanceName="cBtnNext4" Text="NEXT &gt;&gt;" ToolTip="Save Entered Data"
                                     Width="100px">
                                     <ClientSideEvents Click="function(s, e) {ProdctDtlsNxt();}" />
                                     <Border BorderColor="White" />
                                 </dxe:ASPxButton>
                             </div>
                             <div id="Row581" class="right" style="font-size: 12pt; margin-left: 10px">
                                 <dxe:ASPxButton ID="BtnPrvs3" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs3"
                                     Text="&lt;&lt; PREVIOUS" ToolTip="Edit Entered Data" Width="100px">
                                     <ClientSideEvents Click="function(s, e) {ProdctDtlsPrvs();}" />
                                     <Border BorderColor="White" />
                                 </dxe:ASPxButton>
                             </div>
                             <br />
                             <br />
                       </dxp:panelcontent>
                   </PanelCollection>
                  <ClientSideEvents EndCallback="function (s, e) {CbpProductDtls_EndCallBack();}" />
              </dxcp:ASPxCallbackPanel>
         </div>
         <div id="Div_POADetails">
          <dxcp:ASPxCallbackPanel ID="CbpPOADtls" runat="server" ClientInstanceName="cCbpPOADtls"
                OnCallback="CbpPOADtls_Callback" BackColor="Transparent" Width="100%">
           <PanelCollection>
           <dxp:panelcontent runat="server"> 
           
              <div class="DivHeader" style="width: 100%" >&nbsp; POA DETAILS 
               </div>
               
                <div id="Row59" class="Row">
                     <div id="Row59_Col0" class="LFloat_Lable Leftdiv">
                         <span style="font-size: 10pt; color: #ff0000">**</span>POA ID:
                     </div>
                     <div id="Row59_Col1" class="LFloat_Row FontChange" style="height: 25px">
                         <asp:TextBox ID="TxtPoaId" runat="server" Width="146px"></asp:TextBox>
                     </div>
                     <div id="Row59_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                         <span style="font-size: 10pt; color: #ff0000">**</span>POA Registration Number:
                     </div>
                     <div id="Row59_Col3" class="LFloat_Row FontChange" style="height: 25px">
                        <dxe:ASPxTextBox ID="TxtPoaRegNo" runat="server" ClientInstanceName="cTxtPoaRegNo"
                            Width="150px">
                        </dxe:ASPxTextBox>
                     </div><div id="Row59_Col4" class="right" style="margin-right: 10px">
                         <dxe:ASPxCheckBox ID="ASPxCheckBox2" runat="server" ClientInstanceName="cCbSkip1"
                                    ToolTip="Skip Second Account Holder Details" Checked="False" Text="Skip This Section">
                             <ClientSideEvents CheckedChanged="OnCheckedChanged" />
                         </dxe:ASPxCheckBox>
                     </div>
                 </div>
                 <div id="Row60" class="Row">
                     <div id="Row60_Col0" class="LFloat_Lable Leftdiv">
                         <span style="font-size: 10pt; color: #ff0000">**</span>Purpose Code:
                     </div>
                     <div id="Row60_Col1" class="LFloat_Row FontChange" style="height: 25px">
                        <dxe:ASPxComboBox ID="ComboPurposeCode" runat="server" ClientInstanceName="cComboPurposeCode"
                                 EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                 ValueType="System.String" Width="150px">
                             <Items>
                                 <dxe:ListEditItem  Text="All Holders" Value="0"/>
                                 <dxe:ListEditItem  Text="First Holder" Value="1"/>
                                 <dxe:ListEditItem  Text="Second Holder" Value="2"/>
                                 <dxe:ListEditItem  Text="Third Holder" Value="3"/>
                             </Items>
                         </dxe:ASPxComboBox>  
                     </div>
                     <div id="Row60_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                         <span style="font-size: 10pt; color: #ff0000">**</span>GPA/BPA:
                     </div>
                     <div id="Row60_Col3" class="LFloat_Row FontChange" style="height: 25px">
                        <dxe:ASPxTextBox ID="TxtGpaBpa" runat="server" ClientInstanceName="cTxtGpaBpa"
                            Width="150px">
                        </dxe:ASPxTextBox>
                     </div>
                 </div>
                 <div id="Row61" class="Row">
                     <div id="Row61_Col0" class="LFloat_Lable Leftdiv">
                         <span style="font-size: 10pt; color: #ff0000">**</span>Form Date:
                     </div>
                     <div id="Row61_Col1" class="LFloat_Row FontChange" style="height: 25px">
                         <dxe:ASPxDateEdit ID="FormDt" runat="server" ClientInstanceName="cFormDt" DateOnError="Today"
                                  EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                  Font-Size="11px" TabIndex="0">
                         </dxe:ASPxDateEdit>
                     </div>
                     <div id="Row61_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                        To Date:
                     </div>
                     <div id="Row61_Col3" class="LFloat_Row FontChange" style="height: 25px">
                        <dxe:ASPxDateEdit ID="ToDt" runat="server" ClientInstanceName="cToDt" DateOnError="Today"
                                  EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                  Font-Size="11px" TabIndex="0">
                         </dxe:ASPxDateEdit>
                     </div>
                 </div>
                 <div id="Row62" class="Row">
                     <div id="Row62_Col0" class="LFloat_Lable Leftdiv">
                       User Field1:
                     </div>
                     <div id="Row62_Col1" class="LFloat_Row FontChange" style="height: 25px">
                         <dxe:ASPxTextBox ID="TxtUsrFld1" runat="server" ClientInstanceName="cTxtUsrFld1"
                            Width="150px">
                        </dxe:ASPxTextBox> 
                     </div>
                     <div id="Row62_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                       User Field2:
                     </div>
                     <div id="Row62_Col3" class="LFloat_Row FontChange" style="height: 25px">
                        <dxe:ASPxTextBox ID="TxtUsrFld2" runat="server" ClientInstanceName="cTxtUsrFld2"
                            Width="150px">
                        </dxe:ASPxTextBox>
                     </div>
                 </div>
                 <div id="Row63" class="Row">
                     <div id="Row63_Col0" class="LFloat_Lable Leftdiv">
                       Remarks:
                     </div>
                     <div id="Row63_Col1" class="LFloat_Row FontChange" style="height: 25px">
                         <dxe:ASPxTextBox ID="TxtRemarks" runat="server" ClientInstanceName="cTxtRemarks"
                            Width="150px">
                        </dxe:ASPxTextBox> 
                     </div>
                 </div>
                 
                 <div id="Row64" class="right" style="font-size: 12pt; margin-right: 20px;">
                     <dxe:ASPxButton ID="BtnPrvs4" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs4"
                         Text="&lt;&lt; PREVIOUS" ToolTip="Edit Entered Data" Width="100px">
                         <ClientSideEvents Click="function(s, e) {POAPrvs();}" />
                         <Border BorderColor="White" />
                     </dxe:ASPxButton>
                 </div>
                 <br />
                 <br />
              </dxp:panelcontent>
             </PanelCollection>
            <ClientSideEvents EndCallback="function (s, e) {CbpPOADtls_EndCallBack();}" />
          </dxcp:ASPxCallbackPanel>  
         </div>
       </div>
      </div>
    
      <div id="Row65" style="FLOAT: left; WIDTH: 100%;text-align:center" >
          <div class="left" style="width:49%;text-align:right;">
              <dxe:ASPxButton accessKey="S" id="btnSave" tabIndex="0" runat="server" Width="130px" ToolTip="Click To Submit The Whole Entered  Data." Text="[S]ubmit" AutoPostBack="false">
                <Border BorderColor="White" ></Border>
                <ClientSideEvents Click="function(s, e) {SaveButtonClick();}" ></ClientSideEvents>
              </dxe:ASPxButton> 
          </div>
          <div id="DivBtnReset" class="left" style="width:49%;text-align:left;margin-left:5px">
               <dxe:ASPxButton accessKey="R" id="btnReset" tabIndex="0" runat="server" Width="130px" ToolTip="Reset Entered Data." Text="[R]eset" AutoPostBack="false">
                <Border BorderColor="White" ></Border>
                <ClientSideEvents Click="function(s, e) {ResetButtonClick();}" ></ClientSideEvents>
              </dxe:ASPxButton> 
          </div>
      </div>
    
   <asp:HiddenField ID="hdn_GridBindOrNotBind" runat="server" />
   <asp:HiddenField ID="Hdn_PageSize" runat="server" />
   <asp:HiddenField ID="Hdn_PageNumber" runat="server" />
    
    <dxpc:ASPxPopupControl ID="PopUp_StartPage" runat="server" ClientInstanceName="cPopUp_StartPage" 
                CloseAction="None" HeaderText="CDSL Registration" Modal="True" PopupHorizontalAlign="LeftSides"
                PopupVerticalAlign="TopSides" ShowOnPageLoad="True" ShowSizeGrip="False" Width="840px">
                <ClientSideEvents PopUp="function(s, e)
                                                    {
                                                     setTimeout('cComboClType.Focus()', 50);
                                                    
                                                    }" 
                                                     />
                <ContentCollection>
                   <dxpc:PopupControlContentControl runat="server">
                   
                    <dxp:ASPxPanel ID="Panel_Start" runat="server" DefaultButton="btnSearch" Width="99%">
                     <PanelCollection>
                       <dxp:panelcontent runat="server">
                         <div  class="TopMargin" style="text-align:center;width:99%"> 
                          [Search To Find Entered KRA Record] <br /> <br /> 
                          <div id="PpRow0" class="left BtmMargin">
                                <div id="PpRow0_Col0" class="left LeftMargin PopUpLable" style="width: 115px; text-align: center;Height:25px">
                                     Client Name:
                                </div>
                                <div id="PpRow0_Col1" class="left heightDiv" style="font-size:12px; margin-left: 10px;">
                                      <asp:TextBox ID="txtClientName" runat="server" Font-Size="12px" Height="20px" Width="300px"></asp:TextBox>
                                </div>
                                <div id="PpRow0_Col3" class="left LeftMargin heightDiv" style="font-size:12px; margin-left: 20px;">
                                    <dxe:ASPxComboBox ID="ComboClType" runat="server" ClientInstanceName="cComboClType"
                                        EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                        ValueType="System.String" Width="187px">
                                        <Items>
                                            <dxe:ListEditItem Text="Select" Value="0" />
                                            <dxe:ListEditItem Text="Individual" Value="I" />
                                            <dxe:ListEditItem Text="NonIndividual" Value="N" />
                                        </Items>
                                        <DropDownButton Text="ClientType">
                                        </DropDownButton>
                                    </dxe:ASPxComboBox>
                                </div>      
                            </div>
                            <div id="PpRow1" class="left BtmMargin">
                                <div id="PpRow1_Col0" class="left LeftMargin PopUpLable" style="width: 115px; text-align: center;Height:25px">
                                    KRA
                                    AppliCation No:
                                </div>
                                <div id="PpRow1_Col1" class="left LeftMargin  heightDiv" style="font-size:12px">
                                    <asp:TextBox ID="TxtApliNo" runat="server" Font-Size="12px" Height="20px" Width="136px"></asp:TextBox>
                                </div>
                                <div id="PpRow1_Col2" class="left LeftMargin  heightDiv" style="font-size:12px; margin-left: 20px;">
                                     <dxe:ASPxDateEdit ID="ApliDt" runat="server" ClientInstanceName="cApliDt" 
                                          EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="236px"
                                          Font-Size="11px" Height="25px">
                                         <DropDownButton Text="Application Date">
                                         </DropDownButton>
                                      </dxe:ASPxDateEdit> 
                                </div>
                            </div>
                            <div id="PpRow2" class="left" style="width: 69%">
                                <div id="PpRow2_Col0" class="left LeftMargin TopMargin PopUpLable" style="width: 115px; text-align: center;Height:25px">
                                    Pan Card No:
                                </div>
                                <div id="PpRow2_Col1" class="left LeftMargin TopMargin  heightDiv" style="font-size:12px">
                                   <asp:TextBox ID="TxtPanCrdNo" runat="server" Font-Size="12px" Height="20px" Width="136px"></asp:TextBox>
                                </div>
                                <div id="PpRow2_Col2" class="left LeftMargin TopMargin  heightDiv" style="font-size:12px; margin-left: 20px;">
                                    <dxe:ASPxDateEdit ID="DOBDt" runat="server" ClientInstanceName="cDOBDt" 
                                          EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="236px"
                                          Font-Size="11px" Height="25px">
                                        <DropDownButton Text="Date Of Birth">
                                        </DropDownButton>
                                    </dxe:ASPxDateEdit>
                                </div>
                            </div>
                            <div id="PpRow3" class="left BtmMargin" style="width: 69%">
                                <div id="PpRow3_Col0" class="left LeftMargin TopMargin PopUpLable" style="width: 115px; text-align: center;Height:25px">
                                   Email ID:
                                </div>
                                <div id="PpRow3_Col1" class="left LeftMargin TopMargin  heightDiv" style="font-size:12px">
                                   <asp:TextBox ID="TxtEmlID" runat="server" Font-Size="12px" Height="20px" Width="136px"></asp:TextBox>
                                </div>
                                
                            </div>
                            <div class="Info TopMargin" style="width:400px; margin-top: 10px;">If You Have Not done The KRA Registration Please Do That First</div>
                            <div class="left" style="text-align:center;width:100%;margin-top:10px">
                                <dxe:ASPxButton ID="btnSearch" runat="server" AutoPostBack="False" Text="Search" Width="85px"  ClientInstanceName="cbtnSearch" >
                                    <ClientSideEvents Click="function (s, e) {PopUp_StartPage_btnSearch_Click(); }" />
                                </dxe:ASPxButton>
                            </div>
                        
                        </div>
                        <div style="display:none">
                            <asp:HiddenField ID="txtClientName_Hidden" runat="server" />
                            <asp:HiddenField ID="TxtApliNo_Hidden" runat="server" />
                           
                        </div>
                        </dxp:panelcontent>
                        </PanelCollection>
                       </dxp:ASPxPanel>
                      </dxpc:PopupControlContentControl>
                </ContentCollection>
                <HeaderStyle BackColor="LightGray" ForeColor="Black" Font-Names="Calibri" />
         </dxpc:ASPxPopupControl>
     
        
         <dxpc:ASPxPopupControl ID="ConfirmPopUp1" runat="server" ClientInstanceName="cConfirmPopUp1"
            CloseAction="None" HeaderText="Confirmation Message(1)" Left="200" Modal="True" PopupHorizontalAlign="Center"
            PopupHorizontalOffset="500" PopupVerticalAlign="BottomSides" PopupVerticalOffset="2000"
            RenderIFrameForPopupElements="True" ShowSizeGrip="False" Top="100" Width="387px">
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
                    <table class="style1">
                        <tr>
                            <td colspan="5">
                                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<span style="font-family: Calibri">If You Reset All Your Entered Data Will Be Lost<br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Do You Still Want To Reset???</span></td>
                        </tr>
                        <tr>
                            <td style="height: 41px">
                            </td>
                            <td style="width: 3px; height: 41px;">
                                <dxe:ASPxButton ID="btnCnfrmYs1" runat="server" AutoPostBack="False" Height="6px"
                                    meta:resourceKey="btnContinueResource1" Text="Yes" Width="192px">
                                    <ClientSideEvents Click="function (s, e) { ConfirmPopUpClickYes1(); cConfirmPopUp1.Hide(); }" />
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 3px; height: 41px;">
                                <dxe:ASPxButton ID="btnCnfrmYNo1" runat="server" AutoPostBack="False" Text="No" Width="140px">
                                    <ClientSideEvents Click="function (s, e) { cConfirmPopUp1.Hide(); }" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        
        <dxpc:ASPxPopupControl ID="ConfirmPopUp2" runat="server" ClientInstanceName="cConfirmPopUp2"
            CloseAction="None" HeaderText="Confirmation Message(2)" Left="700" Modal="True" PopupHorizontalAlign="Center"
            PopupHorizontalOffset="500" PopupVerticalAlign="BottomSides" PopupVerticalOffset="2000"
            RenderIFrameForPopupElements="True" ShowSizeGrip="False" Top="100" Width="387px">
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl4"  runat="server">
                    <table class="style1">
                        <tr>
                            <td colspan="5">
                                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<span style="font-family: Calibri">If You Reset All Your Entered Data Will Be Lost<br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Are You Sure You Want To Reset It???</span></td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td style="width: 3px">
                                <dxe:ASPxButton ID="btnCnfrmYs2" runat="server" AutoPostBack="False" Height="6px"
                                    meta:resourceKey="btnContinueResource1" Text="Yes" Width="192px">
                                    <ClientSideEvents Click="function (s, e) { ConfirmPopUpClickYes2(); cConfirmPopUp2.Hide(); }" />
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 3px">
                                <dxe:ASPxButton ID="btnCnfrmYNo2" runat="server" AutoPostBack="False" Text="No" Width="140px">
                                    <ClientSideEvents Click="function (s, e) { cConfirmPopUp2.Hide(); }" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
      </div>
    </form>
</body>
</html>


