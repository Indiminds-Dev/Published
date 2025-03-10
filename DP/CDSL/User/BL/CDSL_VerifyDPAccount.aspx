<%@ page language="C#" autoeventwireup="true" inherits="DP_CDSL_User_BL_CDSL_VerifyDPAccount, App_Web_f9t-z9uf" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>CDSL Verification Page</title>
    <%-- start dhtml link--%>
    <link rel="stylesheet" href="../../../../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../../../../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../../../../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../../../../modalfiles/modal.js"></script>

    <%-- end dhtml link--%>
    <!--JS Script-->

    <script type="text/javascript" src="../../../../CentralData/JSScript/GenericJScript.js"></script>

    <script type="text/javascript" language="javascript">
        function OnMoreInfoClick(url,HeaderText,Width,Height,anyKey) //AnyKey will help to call back event to child page, if u have to fire more that one function 
        {
             editwin=dhtmlmodal.open("Editbox", "iframe", url,HeaderText , "width="+Width+",height="+Height+",center=1,resize=1,scrolling=2,top=500", "recal")
             editwin.onclose=function()
             {
                 if(anyKey=='Y')
                 {
                    document.getElementById('IFRAME_ForAllPages').contentWindow.callback();
                 }
             }
        }
        function Page_Load()
        {            
             HideShow('divHeaderCont','H'); 
             HideShow('divSplit','H'); 
             HideShow('divTabCont','H');
             HideShow('Row0','S');                              
             HideShow('Row1','H');
             HideShow('Row2','H');
             SetValue('hdn_CheckerOpen','');
             SetValue('hdn_MakerOpen','');
             cDtFrom.Focus();   
             Height('300','300');                        
        }
        function ChangeDateFormat_CalToDB(obj)
        {
            var SelectedDate = new Date(obj);            
            var monthnumber = SelectedDate.getMonth() + 1;
            var monthday    = SelectedDate.getDate();
            var year        = SelectedDate.getYear();            
            var changedDateValue=year+'-'+monthnumber+'-'+monthday;
            return changedDateValue;
        }
	    function Split(obj)
        {
           HideShow('Row0','H');
           HideShow('Row1','H');
           HideShow('Row2','S');
           HideShow('SingleCont','H');
           HideShow('divSeperatorCM','S');
           if(obj=='Expand')
           {
                cbtnSplit.SetText('Split');
                GetObjectID('ChekerCont').className ='frmContent';
                GetObjectID('TabCheker').className ='active_Tab left';
                GetObjectID('TabMaker').className='inActive_Tab left';                
                HideShow('ChekerCont','S');
                HideShow('MakerCont','H');
                HideShow('divTabCont','S'); 
                HideShow('divSeperatorCM','H');                                   
           }
           else
           {
                cbtnSplit.SetText('Expand');  
                HideShow('ChekerCont','S');
                GetObjectID('ChekerCont').className ='frmContent splitCont';               
                HideShow('MakerCont','S');
                GetObjectID('MakerCont').className = 'frmContent splitCont';                
                HideShow('divTabCont','H');
                if((GetValue('hdn_ApplCmpID')!=undefined) && (GetValue('hdn_MatchStatus')!=undefined) )
                {
                    if(GetValue("hdn_MakerOpen")!="Open")
                    {
                        SetValue("hdn_MakerOpen","Open");
                        GetObjectID('IFRAME_ForMaker').src='../BL/CDSL_VerifyEditDPAccount.aspx?flid=Double_'+GetValue('hdn_ApplCmpID')+'_M&mtch='+GetValue('hdn_MatchStatus')+'&clt='+GetValue('hdn_ClientType')+'&frm='+GetValue('hdn_FormNo'); 
                    }
                    if(GetValue("hdn_CheckerOpen")!="Open")
                    {
                        SetValue("hdn_CheckerOpen","Open");
                        GetObjectID('IFRAME_ForChecker').src='../BL/CDSL_VerifyEditDPAccount.aspx?flid=Double_'+GetValue('hdn_ApplCmpID')+'_C&mtch='+GetValue('hdn_MatchStatus')+'&clt='+GetValue('hdn_ClientType')+'&frm='+GetValue('hdn_FormNo'); 
                    }    
                }               
           }   
           Height('500','500');                            
        }
        function tabCont_click(obj)
        {   
            HideShow('divSeperatorCM','H');
            if(obj=='C')
            {
                HideShow('ChekerCont','S');
                GetObjectID('ChekerCont').className ='frmContent';                
                HideShow('MakerCont','H');
                GetObjectID('TabCheker').className='active_Tab left';
                GetObjectID('TabMaker').className='inActive_Tab left';
                if((GetValue('hdn_ApplCmpID')!=undefined) && (GetValue('hdn_MatchStatus')!=undefined) )
                {
                     if(GetValue("hdn_CheckerOpen")!="Open")
                     {
                        SetValue("hdn_CheckerOpen","Open");
                        GetObjectID('IFRAME_ForChecker').src='../BL/CDSL_VerifyEditDPAccount.aspx?flid=Double_'+GetValue('hdn_ApplCmpID')+'_C&mtch='+GetValue('hdn_MatchStatus')+'&clt='+GetValue('hdn_ClientType')+'&frm='+GetValue('hdn_FormNo');                                                    
                     }   
                }    
            }
            if(obj=='M')
            {
                HideShow('ChekerCont','H');                
                HideShow('MakerCont','S');
                GetObjectID('MakerCont').className = 'frmContent';
                GetObjectID('TabCheker').className='inActive_Tab left';
                GetObjectID('TabMaker').className='active_Tab left'; 
                if((GetValue('hdn_ApplCmpID')!=undefined) && (GetValue('hdn_MatchStatus')!=undefined) )
                { 
                     if(GetValue("hdn_MakerOpen")!="Open")
                     {
                        SetValue("hdn_MakerOpen","Open");
                        GetObjectID('IFRAME_ForMaker').src='../BL/CDSL_VerifyEditDPAccount.aspx?flid=Double_'+GetValue('hdn_ApplCmpID')+'_M&mtch='+GetValue('hdn_MatchStatus')+'&clt='+GetValue('hdn_ClientType')+'&frm='+GetValue('hdn_FormNo');                                                    
                     }
                }    
            }
            Height('500','500');     
        }
        function btnShow_Click()
        { 
            SetValue('hdn_CheckerOpen','');
            SetValue('hdn_MakerOpen','');
            HideShow('divHeaderCont','H'); 
            var authProfileType='<%=Session["EntryProfileType"]%>';
            if(authProfileType=='C')
            {                
               GetObjectID('TabSingleVerify').className='inActive_Tab';
               GetObjectID('TabDoubleVerify').className='active_Tab';               
               HideShow('TabSingleVerify','H');       
               cGvVerified.PerformCallback("ShowData~DoubleVerification");                         
            }
            else if(authProfileType=="F")
            { 
               HideShow('TabSingleVerify','S');                      
               if(GetObjectID('TabSingleVerify').className=='active_Tab')
               {
                    cGvVerified.PerformCallback("ShowData~SingleVerification");          
               }
               else if(GetObjectID('TabDoubleVerify').className=='active_Tab')
               {
                    cGvVerified.PerformCallback("ShowData~DoubleVerification");          
               }
               else
               {
                   GetObjectID('TabSingleVerify').className='active_Tab';
                   GetObjectID('TabDoubleVerify').className='inActive_Tab';      
                   cGvVerified.PerformCallback("ShowData~SingleVerification");          
               }
           }
           Height('300','300');     
        }
        function SingleVerifyList_click()
        {
            GetObjectID('TabSingleVerify').className='active_Tab';
            GetObjectID('TabDoubleVerify').className='inActive_Tab';      
            cGvVerified.PerformCallback("ShowData~SingleVerification");      
            Height('300','300');
        }
        function DoubleVerifyList_click()
        {
            GetObjectID('TabSingleVerify').className='inActive_Tab';
            GetObjectID('TabDoubleVerify').className='active_Tab';
            cGvVerified.PerformCallback("ShowData~DoubleVerification");      
            Height('300','300');
        }    
        function GvVerified_EndCallBack()
        {
             HideShow('Row0','H');
             HideShow('Row1','S');
             HideShow('Row2','H');
             HideShow('divSplit','H');
             Height('300','300'); 
             if(cGvVerified.cpAfterVerify!=undefined)
             {
                if(cGvVerified.cpAfterVerify=="T")
                    btnShow_Click();
                else
                    alert('Record Not Verified!! Please Verify Again.');    
             }                   
             if(cGvVerified.cpSingleVerifyDetail!=undefined)
             {
                 if(cGvVerified.cpSingleVerifyDetail=='Y')
                 {   
                     HideShow('divHeaderCont','S');
                     HideShow('divBack','S'); 
                     HideShow('divSplit','H');    
                     HideShow('divTabCont','H');
                     HideShow('Row1','H');
                     HideShow('Row2','S'); 
                     HideShow('ChekerCont','H');                    
                     HideShow('MakerCont','H');
                     HideShow('SingleCont','S'); 
                     SetValue('hdn_ApplCmpID',cGvVerified.cpApplCmpID);
                     GetObjectID('IFRAME_ForSingle').src='../BL/CDSL_VerifyEditDPAccount.aspx?flid=Single_'+cGvVerified.cpApplCmpID+'_S';                             
                     Height('500','500');   
                 } 
             }
             if(cGvVerified.cpDoubleVerifyDetail!=undefined)
             {
                 if(cGvVerified.cpDoubleVerifyDetail=='Y')
                 {             
                     HideShow('divHeaderCont','S'); 
                     HideShow('divSplit','S');    
                     HideShow('divTabCont','S');
                     HideShow('Row1','H');
                     HideShow('Row2','S');      
                     Split('Expand'); 
                     HideShow('SingleCont','H');
                     SetValue('hdn_ApplCmpID',cGvVerified.cpApplCmpID); 
                     SetValue('hdn_MatchStatus',cGvVerified.cpMatchStatus);                     
                     SetValue('hdn_FormNo',cGvVerified.cpFormNo); 
                     SetValue("hdn_CheckerOpen","Open");                   
                     GetObjectID('IFRAME_ForChecker').src='../BL/CDSL_VerifyEditDPAccount.aspx?flid=Double_'+cGvVerified.cpApplCmpID+'_C&mtch='+cGvVerified.cpMatchStatus+'&frm='+cGvVerified.cpFormNo;     
                     Height('500','500');                        
                 }                    
             }                        
        }
        function OnEditClick(applID,cmpID,matchStatus,formNo)
        {                   
            HideShow('Row0','H');
            HideShow('Row1','H');                     
            if(GetObjectID('TabSingleVerify').className=='active_Tab')
            {
                cGvVerified.PerformCallback('SingleVerifyDetail~'+applID+'~'+cmpID); 
            }
            else
            {
               cGvVerified.PerformCallback('DoubleVerifyDetail~'+applID+'~'+cmpID+'~'+matchStatus+'~'+formNo); 
            }
            Height('300','300');                  
        }
        function Back_click()
        {
            HideShow('divHeaderCont','H'); 
            btnShow_Click(); 
        }
        function Reset_click()
        {
            Page_Load();
        }
        function OnVerifyClick(obj1,obj2,obj3,obj4)
        {          
           if(obj1=="Single")
                cGvVerified.PerformCallback('SingleFormVerify~'+obj2+"~"+obj3);
           else if(obj1=="Matched")
                cGvVerified.PerformCallback('DoubleFormVerify~'+obj2+"~"+obj3);    
        }
        function OnVerifyPDFClick(obj1,obj2,obj3)
        {          
            GetObjectID('hdn_PDFDetail').value=obj1+"~"+obj2+"~"+obj3;
            GetObjectID('btnPDF').click();          
        }
    </script>

    <!--Page Style-->
    <link type="text/css" href="../../../../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
    <style type="text/css">       
         #MainFull { padding:5px; }
         #Container1 { width: 500px;}       
         .header_Content{height:18px; width:250px; }
         .frmContent{width:99.8%;Float:left; overflow-x:hidden;overflow-y:scroll; height:500px; }
         .splitCont {height:300px;  padding:5px;}
         .inActive_Tab{border:1px solid #777; font-size:11px;font-Weight:normal; padding:0px 3px; line-height:1.5; background-color:#eee; color:#555; }
         .active_Tab{border:1px solid #000; font-size:12px;font-Weight:bold; padding:0px 3px; line-height:1.5; background-color:#FCA977; color:#000;}
         .LableWidth { width:110px;}
         .ContentWidth { width:170px; height:21px;}
         .LabelCont { font-size:13px; margin-top:7px;}
         .txt_left { text-align:left;}
         .txt_right { text-align:right;}
         .btnRight{Margin-right:18px;} 
         #divMatched{background-color:#ccc;border: 1px solid #ddd; padding:5px;}    
         
         a.tip {text-decoration: none }
         a.tip:hover {cursor: pointer;position: relative }
         a.tip span {display: none }
         a.tip:hover span { border: #c0c0c0 1px solid;background:#FFE0C0;padding: 3px;display: block;z-index: 100;
                            width:100px;left: 0px;margin: 15px;position: absolute;top: 10px;text-decoration: none; }                      
   </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="MainFull">
            <div id="header" class="Header">
                <div id="divReset" class="inActive_Tab right">
                    <a href="javascript:void();" onclick="Reset_click()" title="Reset Search">Reset</a>
                </div>
                <div id="divHeaderCont" class="header_Content right">
                    <div id="divBack" class="inActive_Tab left">
                        <a href="javascript:void();" onclick="Back_click()" title="Back To List">&lt;Back</a>
                    </div>
                    <div class="left" style="width: 10px">
                    </div>
                    <div id="divSplit" class="left">
                        <dxe:ASPxButton ID="btnSplit" runat="server" ClientInstanceName="cbtnSplit" AutoPostBack="false"
                            Text="Split" Font-Size="7.1" TabIndex="0" Height="18px" ToolTip="Split To Show Checker & Maker Form">
                            <clientsideevents click="function(s,e){Split(cbtnSplit.GetText());}" />
                            <paddings padding="0" />
                        </dxe:ASPxButton>
                    </div>
                    <div class="left" style="width: 10px">
                    </div>
                    <div id="divTabCont" class="left">
                        <div id="TabCheker" class="active_Tab left">
                            <a href="javascript:void();" onclick="tabCont_click('C')" title="Show Checker Form">
                                Checker</a></div>
                        <div id="TabMaker" class="inActive_Tab left">
                            <a href="javascript:void();" onclick="tabCont_click('M')" title="Show Maker Form">Maker</a></div>
                    </div>
                    <span class="clear"></span>
                </div>
                CDSL Verification <span class="clear"></span>
            </div>
            <div id="Row0" class="Row">
                <div id="Container1" class="container">
                    <div id="C1_Row0" class="Row">
                        <div id="C1_Row0_Col1" class="LFloat_Lable LableWidth">
                            Date Range :
                        </div>
                        <div id="C1_Row0_Col2" class="LFloat_Content ContentWidth">
                            <dxe:ASPxDateEdit ID="DtFrom" runat="server" ClientInstanceName="cDtFrom" DateOnError="Today"
                                EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" TabIndex="0">
                                <dropdownbutton text="From">
                                </dropdownbutton>
                            </dxe:ASPxDateEdit>
                        </div>
                        <div id="C1_Row0_Col3" class="LFloat_Content ContentWidth">
                            <dxe:ASPxDateEdit ID="DtTo" runat="server" ClientInstanceName="cDtTo" DateOnError="Today"
                                EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" TabIndex="0">
                                <dropdownbutton text="To">
                                </dropdownbutton>
                            </dxe:ASPxDateEdit>
                        </div>
                        <span class="clear"></span>
                    </div>
                    <br class="clear" />
                    <div id="C1_Row6" class="Row btnRight right">
                        <dxe:ASPxButton ID="btnShow" runat="server" AutoPostBack="false" ClientInstanceName="cbtnShow"
                            Text="Show" Width="100px">
                            <clientsideevents click="function(s,e){btnShow_Click();}" />
                        </dxe:ASPxButton>
                    </div>
                </div>
            </div>
            <div id="Row1" class="Row">
                <div id="divMatched" class="left">
                    <a href="javascript:void(0)" id="TabSingleVerify" class="active_Tab" onclick="SingleVerifyList_click()">
                        Single Verified Records</a> <a href="javascript:void(0)" id="TabDoubleVerify" class="inActive_Tab"
                            onclick="DoubleVerifyList_click()">Double Verified Records</a>
                </div>
                <br class="clear" />
                <dxwgv:ASPxGridView ID="GvVerified" ClientInstanceName="cGvVerified" runat="server"
                    KeyFieldName="KRAAplicatnNo" AutoGenerateColumns="False" Width="900px" OnCustomCallback="GvVerified_CustomCallback">
                    <ClientSideEvents EndCallback="function(s, e) {GvVerified_EndCallBack();}" />
                    <Columns>
                        <dxwgv:GridViewDataTextColumn VisibleIndex="0" Width="25px">
                            <DataItemTemplate>
                                <%#Container.ItemIndex+1 %>
                            </DataItemTemplate>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn VisibleIndex="1" Width="60px">
                            <DataItemTemplate>
                                <center>
                                    <%#GetEditToMatch((string)Eval("KRAAplicatnNo"),(string)Eval("CompanyID"),(string)Eval("MatchStatus"),(string)Eval("KRAFormNO"))%>
                                </center>
                            </DataItemTemplate>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataColumn Caption="Application No." VisibleIndex="2" Width="150px">
                            <DataItemTemplate>
                                <%#Eval("KRAAplicatnNo")%>
                            </DataItemTemplate>
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="Company" VisibleIndex="3" Width="300px">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="MatchStatus" VisibleIndex="4" Width="100px">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataTextColumn VisibleIndex="5" Width="80px">
                            <DataItemTemplate>
                                <center>
                                    <%#GetVerifyStatus((string)Eval("MatchStatus"),(string)Eval("KRAAplicatnNo"),(string)Eval("CompanyID"))%>
                                </center>
                            </DataItemTemplate>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn VisibleIndex="6" Width="80px">
                            <HeaderTemplate>
                                <center>
                                    PDF</center>
                            </HeaderTemplate>
                            <DataItemTemplate>
                                <center>
                                    <%#GetVerifyPDF("FP",(string)Eval("KRAAplicatnNo"),(string)Eval("CompanyID"))%>
                                </center>
                            </DataItemTemplate>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn VisibleIndex="7" Width="80px">
                            <HeaderTemplate>
                                <center>
                                    PDF</center>
                            </HeaderTemplate>
                            <DataItemTemplate>
                                <center>
                                    <%#GetVerifyPDF("C",(string)Eval("KRAAplicatnNo"),(string)Eval("CompanyID"))%>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%#GetVerifyPDF("M",(string)Eval("KRAAplicatnNo"),(string)Eval("CompanyID"))%>
                                </center>
                            </DataItemTemplate>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Settings ShowGroupPanel="True" ShowHorizontalScrollBar="True" />
                    <SettingsLoadingPanel Text="Please Wait..." />
                    <Styles>
                        <FocusedRow HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FCA977">
                        </FocusedRow>
                        <AlternatingRow Enabled="True">
                        </AlternatingRow>
                    </Styles>
                </dxwgv:ASPxGridView>
                <br class="clear" />
            </div>
            <div id="Row2" class="Row">
                <div id="ChekerCont" class="frmContent">
                    <div style="border: 1px solid #777; background-color: #eee; margin-bottom: 3px; text-align: center;">
                        Checker Registration Detail</div>
                    <iframe id="IFRAME_ForChecker" scrolling="no" name="IFRAME_ForChecker" frameborder="0"
                        width="99.8%"></iframe>
                </div>
                <br class="clear" />
                <center>
                    <div id="divSeperatorCM" style="padding: 2px; background-color: #aaa; font-size: 12px;
                        border: 1px solid #555; display: none;">
                        <b>Above Data For Checker</b> -------- Red Bordered Items are Mismatched Between
                        Checker and Maker Entries. Edit and Match Between Them To Verify -------- <b>Below Data
                            For Maker</b>
                    </div>
                </center>
                <br class="clear" />
                <div id="MakerCont" class="frmContent">
                    <br class="clear" />
                    <div style="border: 1px solid #777; background-color: #eee; margin-bottom: 3px; text-align: center;">
                        Maker Registration Detail</div>
                    <iframe id="IFRAME_ForMaker" scrolling="no" name="IFRAME_ForMaker" frameborder="0"
                        width="99.8%"></iframe>
                </div>
                <div id="SingleCont" class="frmContent">
                    <div style="border: 1px solid #777; background-color: #eee; margin-bottom: 3px; text-align: center;">
                        Single Registration Detail</div>
                    <iframe id="IFRAME_ForSingle" scrolling="no" name="IFRAME_ForSingle" frameborder="0"
                        width="99.8%"></iframe>
                </div>
                <br class="clear" />
            </div>
        </div>
        <div style="display: none">
            <asp:HiddenField ID="hdn_ApplCmpID" runat="server" />
            <asp:HiddenField ID="hdn_MatchStatus" runat="server" />
            <asp:HiddenField ID="hdn_ClientType" runat="server" />
            <asp:HiddenField ID="hdn_FormNo" runat="server" />
            <asp:HiddenField ID="hdn_CheckerOpen" runat="server" />
            <asp:HiddenField ID="hdn_MakerOpen" runat="server" />
            <asp:HiddenField ID="hdn_PDFDetail" runat="server" />
            <asp:Button ID="btnPDF" runat="server" OnClick="btnPDF_Click" />
        </div>
    </form>
</body>
</html>
