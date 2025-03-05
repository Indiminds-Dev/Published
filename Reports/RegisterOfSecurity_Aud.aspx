<%@ page language="C#" autoeventwireup="true" inherits="Reports_RegisterOfSecurity_Aud, App_Web_7htzac9n" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
    
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Demat Transaction </title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="../CSS/GenericCss.css" rel="Stylesheet" />
    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	/* Never change this one */
		width:50px;	/* Width of box */
		height:auto;	/* Height of box */
		overflow:auto;	/* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:32767;
	}
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and .optionDivSelected */
		margin:1px;		
		padding:1px;
		cursor:pointer;
		font-size:0.9em;
	}
	#ajax_listOfOptions .optionDiv{	/* Div for each item in list */
		
	}
	#ajax_listOfOptions .optionDivSelected{ /* Selected item in the list */
		background-color:#DDECFE;
		color:Blue;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:3000;
	}
	
	form{
		display:inline;
	}
	.grid_scroll
    {
        overflow-y: scroll;  
        overflow-x: scroll; 
        width:60%;
        scrollbar-base-color: #C0C0C0;
    
    }
  
	</style>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>

    <script language="javascript" type="text/javascript" src="../CentralData/JSScript/timeSolver.min.js"></script>
    
    <script language="javascript" type="text/javascript">
    

  
function Page_Load()///Call Into Page Load
{
     cDdlSettlements.SetValue('For');
     FnReportStyle('A');
     FnSettlements(cDdlSettlements.GetValue());
     Hide('TdFilter');
     document.getElementById('hiddencount').value=0;
     Hide('Tab_Records');
     cDdlSettlements.SetValue("All");
     Hide('Td_Settlemnets');
     NewChange_20181127();
     height();
}
function NewChange_20181127()//Circular_INSP38743
{
    FnGenerateType('Export');
    Hide('Tr_Settlements');
    Hide('TdShowOnlyTransaction');
    Hide('Tr_TranType');
    Hide('Tr_For');
    Hide('Td_Screen');
    Hide('Td_Email');
    Hide("divLoading");
}
function DateChange(DateObj)
{ 
        // alert(DateObj.GetText());
        var Lck ='<%=Session["LCKBNK"] %>';
        var FYS ='<%=Session["FinYearStart"]%>';
        var FYE ='<%=Session["FinYearEnd"]%>'; 
        var LFY ='<%=Session["LastFinYear"]%>';
        var GetDate='<%=Session["ServerDate"]%>';
        
        DevE_CheckForLockDate(DateObj,Lck);
        DevE_CheckForFinYear(DateObj,FYS,FYE,LFY);
}
function OnMoreInfoClick()
{
     var dateString = timeSolver.getString(DTBatch.GetDate(), "YYYY-MM-DD");
     var SqlWhere="(DATEADD(dd, 0, DATEDIFF(dd, 0, ExportFiles_CreateDatetime)))='"+dateString+"'";
     var url="../GenericRoutines/Batch/GenericBatchMaintenance.aspx?FileType=ROSReporting&SqlWhere="+SqlWhere;
     parent.OnMoreInfoClick(url,"ROS Batch Detail",'1150px','480px',"Y");
}

function GnrcCallBackPanel_Methods(WhichCall)
{
    Show("divLoading");
    cBtnExcel.SetEnabled(false);
    cBatchCreate.SetEnabled(false);
    cGnrcCallBackPanel.PerformCallback(WhichCall+'~');
}
function GnrcCallBackPanel_EndCallBack()
{
    Hide("divLoading");
    cBtnExcel.SetEnabled(true);
    cBatchCreate.SetEnabled(true);
    if(cGnrcCallBackPanel.cpIsSpData!=undefined)
    {
        if(cGnrcCallBackPanel.cpIsSpData=="Export")
            GetObjectID('btnExcelExport').click();
        if(cGnrcCallBackPanel.cpIsSpData=="Batch")
            GetObjectID('btnBatchExport').click();
    }
    Height('350','350'); 
}

/////////////////////////////////////////////////////////////////Old Section////////////////////////////////////////////////////
function height()
{
        if(document.body.scrollHeight>=350)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '350px';
        window.frameElement.Width = document.body.scrollWidth;
 }   
function Hide(obj)
{
    document.getElementById(obj).style.display='none';
}
function Show(obj)
{
    document.getElementById(obj).style.display='inline';
}
function FnReportStyle(Obj)
{
        if(Obj=="B")/////B. Scrip Wise
        {
            Show('Tr_DatePeriod');
            Show('Tr_Segment');
            Show('Tr_DpAccount');
            //Show('Tr_Settlements');
            Show('Tr_SearchScrip');
            Hide('Tr_GroupBy');
            cDdlSettlements.SetValue("All");
            Hide('Td_Settlemnets');
        }
        if(Obj=="C")/////C. Client + Scrip
        {
            Show('Tr_DatePeriod');
            Show('Tr_Segment');
            Show('Tr_DpAccount');
            //Hide('Tr_Settlements');
            Show('Tr_SearchScrip');
            document.getElementById('ChkForClients').checked=true;
            document.getElementById('ChkForExchange').checked=false
            FnFor();
        }
        
        height();
        
}

function FnSegment(obj)
{
         if(obj=="a")
            Hide('showFilter');
	     else if(obj=="c")
         {
            Hide('showFilter');
            
         }
         else
         {
              var cmb=document.getElementById('cmbsearchOption').value='Segment';
              Show('showFilter');
         }
         if(cDdlReportStyle.GetValue() == "D")
         {
            cDdlSettlements.SetValue("For");
            Show('Td_Settlemnets');
            document.getElementById('rdbSegmentAll').checked=false;
            document.getElementById('rdbSegmentSpecific').checked=true;
            document.getElementById('rdSegmentSelected').checked=false;
            
         }
            
} 
function FnDpAccount(obj)
{
         if(obj=="a")
            Hide('showFilter');
         else
         {
              var cmb=document.getElementById('cmbsearchOption').value='DpAccount';
              Show('showFilter');
         }
}  
function FnSettlements(obj)
{
        if(obj!="All")
            Show('Td_Settlemnets');
        else
            Hide('Td_Settlemnets');
        
        if(cDdlReportStyle.GetValue() == "D")
        {
            cDdlSettlements.SetValue('For');
            Show('Td_Settlemnets');
            document.getElementById('rdbSegmentAll').checked=false;
            document.getElementById('rdbSegmentSpecific').checked=true;
            document.getElementById('rdSegmentSelected').checked=false;
        }
} 
function fnNoRecord(obj)
{
     if(obj=='4')
            alert("Mail Sent Successfully !!");
        if(obj=='5')
        {
             alert("Error on sending!Try again.. !!");
        }
     Page_Load();
}
function FnFor()
{
//        if(document.getElementById('ChkForClients').checked==true && document.getElementById('ChkForExchange').checked==false)
//             Show('Tr_GroupBy');
//        else
//             Hide('Tr_GroupBy');
} 
function FnGroupBy(obj)
{
         if(obj=="Group")
         {
           Show('Td_Group');
//           document.getElementById('BtnGroup').click();
         }
          else
             Hide('Td_Group');
             
        Hide('showFilter');
}   

function FnAll(obj)
{
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  document.getElementById('cmbsearchOption').value=cDdlGroupBy.GetValue();
                  Show('showFilter');
             }
            
}
function FnSearchScrip(obj)
{
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  document.getElementById('cmbsearchOption').value=cDdlSearchScripBy.GetValue();
                  Show('showFilter');
             }
            
}   
   
function FunCallAjaxList(objID,objEvent,ObjType)
{
       var strQuery_Table = '';
               var strQuery_FieldName = '';
               var strQuery_WhereClause = '';
               var strQuery_OrderBy='';
               var strQuery_GroupBy='';
               var CombinedQuery='';
            
           
            if (ObjType=='SettNo')
            {
                strQuery_Table = "Master_Settlements";
                strQuery_FieldName = "distinct top 10 RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)+'  ' + REPLACE(CONVERT(VARCHAR(9), settlements_StartDateTime, 6), ' ', '-') AS [DD-Mon-YY],RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)";
                strQuery_WhereClause = " settlements_exchangesegmentid in (1,4,15) and Settlements_FinYear='<%=Session["LastFinYear"]%>' and ((RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)) like (\'%RequestLetter%') or CONVERT(VARCHAR(9), settlements_StartDateTime, 6) like (\'%RequestLetter%')) ";

            } 
            else
            { 
               
                if(document.getElementById('cmbsearchOption').value=="Segment")
                {
                   strQuery_Table = "(select A.EXCH_INTERNALID AS SEGMENTID ,isnull((TME.EXH_ShortName +\'-'\ + A.EXCH_SEGMENTID),exch_membershipType) AS EXCHANGENAME from (SELECT TMCE.* FROM TBL_MASTER_COMPANYEXCHANGE AS TMCE Where  TMCE.EXCH_COMPID=\'<%=Session["LastCompany"]%>'\) AS A LEFT OUTER JOIN   TBL_MASTER_EXCHANGE AS TME ON TME.EXH_CNTID=A.EXCH_EXCHID)as TAB";
                   strQuery_FieldName = "distinct top 10 EXCHANGENAME,SEGMENTID";
                   strQuery_WhereClause = " EXCHANGENAME like (\'RequestLetter%')";
                }
                if(document.getElementById('cmbsearchOption').value=="DpAccount")
                {
                   strQuery_Table = "master_dpaccounts";
                   strQuery_FieldName = "distinct top 10 rtrim(ltrim(dpaccounts_ShortName)),DpAccounts_id";
                   strQuery_WhereClause = " dpaccounts_ShortName like (\'RequestLetter%') and dpaccounts_Companyid='<%=Session["LastCompany"]%>'";
                }
                if(document.getElementById('cmbsearchOption').value=="Clients")
                {
                      strQuery_Table = "tbl_master_contact,tbl_master_contactexchange,tbl_master_branch";
                      strQuery_FieldName = "distinct top 10 isnull(rtrim(cnt_firstName),'')+' '+isnull(rtrim(cnt_middlename),'')+' '+isnull(rtrim(cnt_lastName),'')+' ['+isnull(rtrim(crg_tcode),'')+'] ['+isnull(rtrim( BRANCH_DESCRIPTION),'')+']' ,cnt_internalID";
                      strQuery_WhereClause = "  branch_id=cnt_branchid and crg_exchange in ('NSE - CM','BSE - CM','CSE - CM') and crg_cntid=cnt_internalid  and cnt_internalid like 'CL%' and (crg_tcode Like (\'RequestLetter%') or CNT_FIRSTNAME like (\'RequestLetter%')) and cnt_branchid in (<%=Session["userbranchHierarchy"]%>)";
                }
                if(document.getElementById('cmbsearchOption').value=="Branch")
                {
                   strQuery_Table = "tbl_master_branch";
                   strQuery_FieldName = "top 10 branch_description+'-'+branch_code,branch_id";
                   strQuery_WhereClause = " (branch_description Like (\'%RequestLetter%') or branch_code like (\'%RequestLetter%')) and branch_id in (<%=Session["userbranchHierarchy"]%>)";
                }
                if(document.getElementById('cmbsearchOption').value=="Group")
                {
                   strQuery_Table = "tbl_master_groupmaster";
                   strQuery_FieldName = "top 10 gpm_description+'-'+gpm_code ,gpm_id";
                   strQuery_WhereClause = " (gpm_description Like (\'%RequestLetter%') or gpm_code like (\'%RequestLetter%')) and gpm_type='"+document.getElementById('DdlGrpType').value+"'";
                }
                if(document.getElementById('cmbsearchOption').value=="Company")
                {
                     strQuery_Table = "master_products";
                     strQuery_FieldName = "distinct top 10 ltrim(rtrim(products_name))+\' [\'+rtrim(products_shortname)+\']\',rtrim(products_id)";
                     strQuery_WhereClause = " products_producttypeid=1 and (products_name like (\'RequestLetter%') or products_shortname like (\'RequestLetter%')) ";
                } 
                if(document.getElementById('cmbsearchOption').value=="Symbol")
                {
                    strQuery_Table = "(select isnull(rtrim(ltrim(Equity_TickerSymbol)),'')+' '+isnull(rtrim(ltrim(Equity_Series)),Equity_TickerCode) as TickerSymbol,Equity_SeriesID from Master_Equity  WHERE Equity_ExchSegmentID in (1,4,15))as tb";
                    strQuery_FieldName = "distinct top 10 TickerSymbol,Equity_SeriesID";
                    strQuery_WhereClause = " (TickerSymbol like (\'RequestLetter%') )";
                } 
                if(document.getElementById('cmbsearchOption').value=="ISIN")
                {
                    strQuery_Table = "Master_Isin";
                    strQuery_FieldName = "distinct top 10 ltrim(rtrim(Isin_Number)),ltrim(rtrim(Isin_Number))";
                    strQuery_WhereClause = " ltrim(rtrim(Isin_Number)) like (\'RequestLetter%') and Isin_Productid in  (Select products_id From master_products Where products_producttypeid=1)";
                } 
                if(document.getElementById('cmbsearchOption').value=="Email")
                {
                    strQuery_Table = "tbl_master_email INNER JOIN tbl_master_contact ON tbl_master_email.eml_cntId = tbl_master_contact.cnt_internalId ";
                    strQuery_FieldName = "distinct top 10 isnull(rtrim(cnt_firstName),'')+' '+isnull(rtrim(cnt_middlename),'')+' '+isnull(rtrim(cnt_lastName),'') + '< '+ tbl_master_email.eml_email + '>' as name,cnt_internalId as contactid ";
                    strQuery_WhereClause = " (tbl_master_email.eml_email <> '') AND cnt_contacttype ='EM'  and (cnt_firstName like (\'RequestLetter%') or cnt_ucc like (\'RequestLetter%') or tbl_master_email.eml_email like (\'RequestLetter%'))";
                }
                if(document.getElementById('cmbsearchOption').value=="TranType")
                {
                    strQuery_Table = "(Select 'Market-Payin' Textfield,'MI' Valuefield Union "+
                                    "Select 'Market PayOut' ,'MO'   Union "+
                                    "Select 'Client-Payin' ,'CI'   Union "+
                                    "Select 'Client-PayOut' ,'CO'   Union "+
                                    "Select 'Loan','LN'   Union "+
                                    "Select 'Inter-Settlement','IS'   Union "+
                                    "Select 'Margin','MG'  Union "+
                                    "Select 'HoldBack','HB'  Union "+
                                    "Select 'Pledge','PL'   Union "+
                                    "Select 'Un-Pledge','PU'   Union "+
                                    "Select 'Off-Market','OM'  Union "+
                                    "Select 'Third Party','TP'  Union "+
                                    "Select 'Inter-Account Transfer','IA'  Union "+
                                    "Select 'CA-Bonus','CB'  Union "+
                                    "Select 'CA-Split','CS'  Union "+
                                    "Select 'CA-Merger','CM'  Union "+
                                    "Select 'CA-DeMerger ','CD'  Union "+
                                    "Select 'CA-Amalgamation','CA'  Union "+
                                    "Select 'CA-Other','CX'  Union "+
                                    "Select 'Inter-Exchange','XE'  Union "+
                                    "Select 'Alien Transfers','XX' ) as T1";
                    strQuery_FieldName = "Top 10 *";
                    strQuery_WhereClause = "Textfield like '%RequestLetter%'";
                }      
            }
            CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
            ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery));
}

function replaceChars(entry) 
{
            out = "+"; // replace this
            add = "--"; // with this
            temp = "" + entry; // temporary holder

            while (temp.indexOf(out)>-1) {
            pos= temp.indexOf(out);
            temp = "" + (temp.substring(0, pos) + add + 
            temp.substring((pos + out.length), temp.length));
            }
            return temp;
} 
   
function btnAddsubscriptionlist_click()
{
            
            var cmb=document.getElementById('cmbsearchOption');
            var userid = document.getElementById('txtSelectionID');
            if(userid.value != '')
            {
                var ids = document.getElementById('txtSelectionID_hidden');
                var listBox = document.getElementById('lstSlection');
                var tLength = listBox.length;
               
                
                var no = new Option();
                no.value = ids.value;
                no.text = userid.value;
                listBox[tLength]=no;
                var recipient = document.getElementById('txtSelectionID');
                recipient.value='';
            }
            else
                alert('Please search name and then Add!')
            var s=document.getElementById('txtSelectionID');
            s.focus();
            s.select();
                   
}
        
function clientselectionfinal()
{
        var listBoxSubs = document.getElementById('lstSlection');
      
        var cmb=document.getElementById('cmbsearchOption');
        var listIDs='';
        var i;
        if(listBoxSubs.length > 0)
        {  
                   
            for(i=0;i<listBoxSubs.length;i++)
            {
                if(listIDs == '')
                    listIDs = listBoxSubs.options[i].value+';'+listBoxSubs.options[i].text;
                else
                    listIDs += ',' + listBoxSubs.options[i].value+';'+listBoxSubs.options[i].text;
            }
            var sendData = cmb.value + '~' + listIDs;
            CallServer(sendData,"");
           
        }
        var i;
        for(i=listBoxSubs.options.length-1;i>=0;i--)
        {
            listBoxSubs.remove(i);
        }
    
        Hide('showFilter');
        document.getElementById('BtnScreen').disabled=false;
}
	     
	        
function btnRemovefromsubscriptionlist_click()
{
                
                var listBox = document.getElementById('lstSlection');
                var tLength = listBox.length;
                
                var arrTbox = new Array();
                var arrLookup = new Array();
                var i;
                var j = 0;
                for (i = 0; i < listBox.options.length; i++) 
                {
                    if (listBox.options[i].selected && listBox.options[i].value != "") 
                    {
                        
                    }
                    else 
                    {
                        arrLookup[listBox.options[i].text] = listBox.options[i].value;
                        arrTbox[j] = listBox.options[i].text;
                        j++;
                    }
                }
                listBox.length = 0;
                for (i = 0; i < j; i++) 
                {
                    var no = new Option();
                    no.value = arrLookup[arrTbox[i]];
                    no.text = arrTbox[i];
                    listBox[i]=no;
                }
}
 
function FnTranTypeChange(obj)
{
    if(obj=="S")
    {
        Show('showFilter');
        var cmb=document.getElementById('cmbsearchOption');
        cmb.value='TranType';
    }
    else
    {
        Hide('showFilter');
    }
    }
    function FnGenerateType(obj)
    {
        if(obj=="Export")
        {
            Hide('showFilter');
            Show('Tr_ShowAllColumn');
            Hide('tr_MailSendOption');
            Show('Td_Export');
            Hide('Td_Batch');
        }
        else
        {
            Hide('showFilter');
            Show('Tr_ShowAllColumn');
            Hide('tr_MailSendOption');
            Hide('Td_Export');
            Show('Td_Batch');
        }
        height();
    }
function heightlight(obj)
{
      
        var colorcode=obj.split('&');
        
         if((document.getElementById('hiddencount').value)==0)
         {
            prevobj='';
            prevcolor='';
            document.getElementById('hiddencount').value=1;
         }
          document.getElementById(obj).style.backgroundColor='#ffe1ac';
         
          if(prevobj!='')
          {
            document.getElementById(prevobj).style.backgroundColor=prevcolor;
          }
          prevobj=obj;
          prevcolor=colorcode[1];

} 
function selecttion()
{
     var combo=document.getElementById('cmbExport');
     combo.value='Ex'; 
} 
function FnAlert(obj,colcount)
{
    
    if(obj=='DisPlay')
    {
        Hide('Tab_Selection');
        Show('Tab_Records');
        Show('TdFilter');
        
    }
    else
    {
        Show('Tab_Selection');
        Hide('Tab_Records');
        Hide('TdFilter');
        document.getElementById('ddlGeneration').value='Screen';
        
        
        if(obj!='3')
        {
          alert(obj);
          window.location = "../reports/RegisterOfSecurity_Aud.aspx";
        }
          
        //Page_Load();
       
    }
    
    Hide('showFilter'); 
    height();  
}
function FnAlertFilter()
{
   Show('Tab_Selection');
   Hide('showFilter'); 
   Hide('TdFilter');
   height();  
}
function mailoption(objval)
{
   if(cDdlReportStyle.GetValue()!="C")
    {
         cddloptionformail.SetValue("1");
         cddloptionformail.SetText("User");
    }
    
   if(cddloptionformail.GetValue() =='1')
   {
        Show('showFilter');
        
   }
   else
   {
        Hide('showFilter');
   }

}
    FieldName='lstSlection';
    
    

function OnlyTransaction_Click()
{
    if(document.getElementById('ChkOnlyTransaction').checked)
        Show('Tr_TranType');
    else
        Hide('Tr_TranType');
        
    height();
}


function OnLeftNav_Click()
{
       SetValue("hdn_GridBindOrNotBind","False"); 
        var i=GetObjectID("A1").innerText;
         GetObjectID('A1').className="number_box_selected";
        //SetValue("hdn_cGvEmployeeDtl","False"); //To Stop Bind On Page Load
        if(parseInt(i)>1)
        {
             cGvTransactionDtl.PerformCallback("SearchByNavigation~"+GetObjectID("A1").innerText+"~LeftNav");
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
        //SetValue("hdn_cGvEmployeeDtl","False"); //To Stop Bind On Page Load
        var TotalPage=GetObjectID("B_TotalPage").innerText;
        if(TestEnd=="" || TestEnd==TotalPage)
        {
             alert('No More Records.');
             return;
        }
        var i=GetObjectID("A1").innerText;
       
        if(parseInt(i)<TotalPage)
        {
            cGvTransactionDtl.PerformCallback("SearchByNavigation~"+GetObjectID("A1").innerText+"~RightNav");
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
       cGvTransactionDtl.PerformCallback("SearchByNavigation~"+i+"~PageNav");        
}
    

function ShowGrid()
{
    selecttion();
    cGvTransactionDtl.PerformCallback('ShowRecords~'+cDdlReportStyle.GetValue());
    height();
}
function GvTransactionDtl_EndCallBack()
{
        if(cGvTransactionDtl.cpShowHideFilter !=undefined)
        {
            Hide('Tab_Selection');
            Show('Tab_Records');
            Show('TdFilter');
            document.getElementById('DivHeaderr').innerHTML = cGvTransactionDtl.cpShowHideFilter ;
            cGvTransactionDtl.cpShowHideFilter =null;
        }
        if( cGvTransactionDtl.cpNoRecordFound == "T")
        {
            Hide('Tab_Records');
            cGvTransactionDtl.cpNoRecordFound = null;
        }
         if(cGvTransactionDtl.cpRefreshNavPanel!=undefined)
        {
            GetObjectID("B_PageNo").innerText='';
            GetObjectID("B_TotalPage").innerText='';
            GetObjectID("B_TotalRows").innerText='';
            
            var NavDirection=cGvTransactionDtl.cpRefreshNavPanel.split('~')[0];
            var PageNum=cGvTransactionDtl.cpRefreshNavPanel.split('~')[1];
            var TotalPage=cGvTransactionDtl.cpRefreshNavPanel.split('~')[2];
            var TotalRows=cGvTransactionDtl.cpRefreshNavPanel.split('~')[3];
            if(NavDirection=="RightNav")
            {   
                PageNum=parseInt(PageNum)+10;
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
                var n=parseInt(TotalPage)-parseInt(PageNum)>10?parseInt(11):parseInt(TotalPage)-parseInt(PageNum)+2;
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
        if(cGvTransactionDtl.cpSetGlobalFields!=undefined)
        { 
             SetValue("Hdn_PageSize",cGvTransactionDtl.cpSetGlobalFields.split('~')[0]);
             SetValue("Hdn_PageNumber",cGvTransactionDtl.cpSetGlobalFields.split('~')[1]);
             SetValue("Hdn_DateFrom",cGvTransactionDtl.cpSetGlobalFields.split('~')[2]);
             SetValue("Hdn_DateTo",cGvTransactionDtl.cpSetGlobalFields.split('~')[3]);
             
        }
        SetValue("hdn_GridBindOrNotBind","True");
        height();
}
function ShowHideFilter(obj)
{
    cGvTransactionDtl.PerformCallback('ShowRecordsFilter~'+obj); 
}  

function FnChngGrpBy(obj)
{

}

    </script>

    <script type="text/ecmascript">   
function ReceiveServerData(rValue)
{
   var j=rValue.split('~');
   
   if(j[0]=='Company' || j[0]=='Symbol' || j[0]=='ISIN')
        document.getElementById('HiddenField_SearchScrip').value = j[1];
   else if(j[0]=='DpAccount')
        document.getElementById('HiddenField_DpAccount').value = j[1];
   else if(j[0]=='Email')
        document.getElementById('HiddenField_Email').value = j[1];
   else if(j[0]=='Segment')
        document.getElementById('HiddenField_Segment').value = j[1];
   else if(j[0]=='TranType')
        document.getElementById('HiddenField_TranType').value = j[1];
   else
        document.getElementById('HiddenField_ALL').value = j[1];
}
       
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" >
        
       <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                        <strong><span id="SpanHeader" style="color: #000099">Register Of Security</span></strong>
                    </td>
                    <td class="EHEADER" width="15%" id="TdFilter" style="height: 22px">
                        <a href="javascript:void(0);" onclick="FnAlertFilter();"><span style="color: Blue; text-decoration: underline;
                            font-size: 8pt; font-weight: bold">Filter</span></a>
                        <asp:DropDownList ID="cmbExport" runat="server" AutoPostBack="True" Font-Size="10px" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged" >
                            <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                            <asp:ListItem Value="E">Excel</asp:ListItem>
                        </asp:DropDownList>
                        
                    </td>
                </tr>
            </table>
            <table id="Tab_Selection" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td class="gridcellleft">
                        <table>
                            <tr>
                                 <td valign="top" class="gridcellleft">
                                                <table border="10" cellpadding="1" cellspacing="1">
                                                    <tr valign="top" style="display:none">
                                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                                            Report Style :
                                                        </td>
                                                        <td>
                                                            <dxe:ASPxComboBox ID="DdlReportStyle" runat="server" ClientInstanceName="cDdlReportStyle"
                                                             EnableIncrementalFiltering="True"  Font-Size="10px" SelectedIndex="0" ValueType="System.String"
                                                             Width="200px">
                                                                     <Items>
                                                                         <dxe:ListEditItem Text="Scrip Wise" Value="B" />
                                                                         <dxe:ListEditItem Text="Client + Scrip" Value="C" />
                                                                     </Items>
                                                              <ClientSideEvents SelectedIndexChanged="function(s,e){FnReportStyle(cDdlReportStyle.GetValue())}" />
                                                             </dxe:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                            </tr>
                             <tr  id="Tr_DatePeriod">
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                For The Period :
                                            </td>
                                            <td class="gridcellleft">
                                                <dxe:ASPxDateEdit ID="DtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="DtFrom">
                                                    <dropdownbutton text="From">
                                                </dropdownbutton>
                                                <ClientSideEvents DateChanged="function(s,e){DateChange(DtFrom);}" />
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td class="gridcellleft">
                                                <dxe:ASPxDateEdit ID="DtTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="DtTo">
                                                    <dropdownbutton text="To">
                                                </dropdownbutton>
                                                 <ClientSideEvents DateChanged="function(s,e){DateChange(DtTo);}" />
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="Tr_Segment">
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Segment :</td>
                                            <td>
                                                <asp:RadioButton ID="rdbSegmentAll" runat="server" GroupName="bb" onclick="FnSegment('a')" />All
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="rdbSegmentSpecific" runat="server" Checked="True" GroupName="bb"
                                                    onclick="FnSegment('c')" />Specific
                                            </td>
                                            <td>
                                                [ <span id="litSegmentMain" runat="server" style="color: Maroon"></span>]</td>
                                            <td id="Td_SegmentSelected">
                                                <asp:RadioButton ID="rdSegmentSelected" runat="server" GroupName="bb" onclick="FnSegment('b')" />Selected
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                              <tr id="Tr_DpAccount">
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC" style="height: 38px">
                                                DP Accounts  :</td>
                                            <td style="height: 38px">
                                                <asp:RadioButton ID="RdbDpAccountAll" runat="server" Checked="True" GroupName="bc" onclick="FnDpAccount('a')" />All
                                            </td>
                                            <td style="height: 38px">
                                                <asp:RadioButton ID="RdbDpAccountSelected" runat="server"  GroupName="bc"
                                                    onclick="FnDpAccount('c')" />Selected
                                            </td>
                                            
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="Tr_Settlements">
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr valign="top">
                                            <td class="gridcellleft" bgcolor="#B7CEEC" style="height: 23px">
                                                Settlements:
                                            </td>
                                            <td style="height: 23px">
                                                 <dxe:ASPxComboBox ID="DdlSettlements" runat="server" ClientInstanceName="cDdlSettlements"
                                                 EnableIncrementalFiltering="True"  Font-Size="10px" SelectedIndex="0" ValueType="System.String"
                                                 Width="100px">
                                                         <Items>
                                                             <dxe:ListEditItem Text="For" Value="For" />
                                                             <dxe:ListEditItem Text="All" Value="All" />
                                                             <dxe:ListEditItem Text="UpTo" Value="UpTo" />
                                                         </Items>
                                                        <ClientSideEvents SelectedIndexChanged="function(s,e){FnSettlements(cDdlSettlements.GetValue())}" />
                                                 </dxe:ASPxComboBox>
                                            </td>
                                            <td id="Td_Settlemnets" style="width:155px; height: 23px;">
                                                <asp:TextBox ID="txtSettlements" runat="server" Font-Size="10px" onkeyup="FunCallAjaxList(this,event,'SettNo')"
                                                    Width="150Px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                             <tr>
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC" id="TdShowOnlyTransaction"><asp:CheckBox ID="ChkOnlyTransaction" runat="server" Checked="true" onclick="OnlyTransaction_Click()"/>Show
                                                Only Transactions For The Period</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="Tr_TranType" style="display:none">
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr valign="top">
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                TransactionTypes:
                                            </td>
                                            <td>
                                                <dxe:ASPxComboBox ID="ddlTrantype" runat="server" ClientInstanceName="cddlTrantype"
                                                 EnableIncrementalFiltering="True"  Font-Size="10px" SelectedIndex="0" ValueType="System.String"
                                                 Width="100px">
                                                         <Items>
                                                             <dxe:ListEditItem Text="All" Value="A" />
                                                             <dxe:ListEditItem Text="Specific" Value="S" />
                                                         </Items>
                                                        <ClientSideEvents SelectedIndexChanged="function(s,e){FnTranTypeChange(cddlTrantype.GetValue())}" />
                                                 </dxe:ASPxComboBox>
                                                <%--<asp:DropDownList ID="ddlTrantype" runat="server" Width="100px" Font-Size="10px"
                                                    onchange="FnTranTypeChange(this.value)">
                                                    <asp:ListItem Value="A">All</asp:ListItem>
                                                    <asp:ListItem Value="S">Specific</asp:ListItem>
                                                </asp:DropDownList>--%>
                                            </td>
                                           
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                           
                            <tr  id="Tr_For">
                                <td valign="top" class="gridcellleft">
                                                <table border="10" cellpadding="1" cellspacing="1">
                                                    <tr valign="top">
                                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                                            For:
                                                        </td>
                                                        <td class="gridcellleft">
                                                            <asp:CheckBox ID="ChkForClients" runat="server" Checked="true" onclick="FnFor()"/>Clients
                                                        </td>
                                                        <td class="gridcellleft">
                                                            <asp:CheckBox ID="ChkForExchange" runat="server" Checked="true" onclick="FnFor()"/>Exchange
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                            </tr>
                            <tr  id="Tr_GroupBy">
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Group By</td>
                                            <td>
                                                <%--<asp:DropDownList ID="DdlGroupBy" runat="server" Width="100px" Font-Size="10px" onchange="FnGroupBy(this.value)">
                                                    <asp:ListItem Value="Clients">Clients</asp:ListItem>
                                                    <asp:ListItem Value="Branch">Branch</asp:ListItem>
                                                    <asp:ListItem Value="Group">Group</asp:ListItem>
                                                </asp:DropDownList>--%>
                                                <dxe:ASPxComboBox ID="DdlGroupBy" runat="server" ClientInstanceName="cDdlGroupBy"
                                                     EnableIncrementalFiltering="True"  Font-Size="10px" SelectedIndex="0" ValueType="System.String"
                                                     Width="100px">
                                                     <Items>
                                                         <dxe:ListEditItem Text="Clients" Value="Clients" />
                                                         <dxe:ListEditItem Text="Branch" Value="Branch" />
                                                         <dxe:ListEditItem Text="Group" Value="Group" />
                                                        </Items>
                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){FnChngGrpBy(cDdlGroupBy.GetValue())}" />
                                               </dxe:ASPxComboBox>
                                            </td>
                                            <td id="Td_Group" style="display: none;" colspan="2">
                                                <table>
                                                    <tr>
                                                        <td>
                                                         <dxe:ASPxComboBox ID="DdlGrpType" runat="server" ClientInstanceName="cDdlGrpType"
                                                             EnableIncrementalFiltering="True"  Font-Size="10px" SelectedIndex="0" ValueType="System.String">
                                                         </dxe:ASPxComboBox>
                                                            <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:DropDownList ID="DdlGrpType" runat="server" Font-Size="10px">
                                                                    </asp:DropDownList>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="BtnGroup" EventName="Click"></asp:AsyncPostBackTrigger>
                                                                </Triggers>
                                                            </asp:UpdatePanel>--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:RadioButton ID="rdAll" runat="server" Checked="True" GroupName="a" onclick="FnAll('a')" />
                                                            All
                                                        </td>
                                                        <td style="width: 103px">
                                                            <asp:RadioButton ID="rdSelected" runat="server" GroupName="a" onclick="FnAll('b')" />Selected
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                               <tr id="Tr_SearchScrip">
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Search Scrip By :</td>
                                            <td>
                                              <%--  <asp:DropDownList ID="DdlSearchScripBy" runat="server" Width="150px" Font-Size="10px" >
                                                    <asp:ListItem Value="Company">Company Name</asp:ListItem>
                                                    <asp:ListItem Value="Symbol">Symbol</asp:ListItem>
                                                    <asp:ListItem Value="ISIN">ISIN</asp:ListItem>
                                                </asp:DropDownList>--%>
                                                 <dxe:ASPxComboBox ID="DdlSearchScripBy" runat="server" ClientInstanceName="cDdlSearchScripBy"
                                                     EnableIncrementalFiltering="True"  Font-Size="10px" SelectedIndex="0" ValueType="System.String"
                                                     Width="150px">
                                                     <Items>
                                                         <dxe:ListEditItem Text="Company Name" Value="Company" />
                                                         <dxe:ListEditItem Text="Symbol" Value="Symbol" />
                                                         <dxe:ListEditItem Text="ISIN" Value="ISIN" />
                                                        </Items>
                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){FnGenerateType(cDdlSearchScripBy.GetValue())}" />
                                               </dxe:ASPxComboBox>
                                            </td>
                                           
                                            <td >
                                                <asp:RadioButton ID="RdSearchScripByAll" runat="server" Checked="True" GroupName="b" onclick="FnSearchScrip('a')" />
                                                All
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="RdSearchScripBySelected" runat="server" GroupName="b" onclick="FnSearchScrip('b')" />Selected
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                          
                          
                            <tr>
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Generate Type :</td>
                                            <td>
                                               <%-- <asp:DropDownList ID="ddlGeneration" runat="server" Width="200px" Font-Size="10px"
                                                    onchange="FnGenerateType(this.value)">
                                                    <asp:ListItem Value="Screen">Screen</asp:ListItem>
                                                    <asp:ListItem Value="Export">Export</asp:ListItem>
                                                    <asp:ListItem Value="EMail">E-Mail</asp:ListItem>
                                                </asp:DropDownList>--%>
                                                <dxe:ASPxComboBox ID="ddlGeneration" runat="server" ClientInstanceName="cddlGeneration"
                                                     EnableIncrementalFiltering="True"  Font-Size="10px" SelectedIndex="0" ValueType="System.String"
                                                     Width="200px">
                                                     <Items>
                                                         <dxe:ListEditItem Text="Export To Excel" Value="Export" />
                                                         <dxe:ListEditItem Text="Create Batch" Value="Batch" />
                                                      </Items>
                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){FnGenerateType(cddlGeneration.GetValue())}" />
                                               </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="Tr_ShowAllColumn" style="display: none">
                                <td class="gridcellleft" style="display: none">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr valign="top">
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Show All Column
                                            </td>
                                            <td class="gridcellleft">
                                                <asp:CheckBox ID="ChkShowAllColumn" runat="server" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="tr_MailSendOption">
                            <td class="gridcellleft">
                              <%-- <asp:UpdatePanel ID="upanelRespective" runat="Server" UpdateMode="Conditional">
                               <ContentTemplate>--%>
                                <table id="tabRespective" runat="Server" border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Respective :</td>
                                        <td>
                                            <%--<asp:DropDownList ID="ddloptionformail" onchange="mailoption(this.value)" runat="server" Width="100px" Font-Size="10px">
                                                
                                            </asp:DropDownList>--%>
                                             <dxe:ASPxComboBox ID="ddloptionformail" runat="server" ClientInstanceName="cddloptionformail"
                                                     EnableIncrementalFiltering="True"  Font-Size="10px" SelectedIndex="0" ValueType="System.String"
                                                     Width="100px">
                                                     <Items>
                                                         <dxe:ListEditItem Text="User" Value="1" />
                                                         <dxe:ListEditItem Text="Client" Value="2" />
                                                        </Items>
                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){mailoption(cddloptionformail.GetValue())}" />
                                             </dxe:ASPxComboBox>
                                        </td>
                                    </tr>
                                </table>
                                <%--</ContentTemplate>
                                <Triggers> <asp:AsyncPostBackTrigger ControlID="Button1" /> </Triggers>
                                </asp:UpdatePanel>--%>
                            </td>
                        </tr>
                            <tr>
                                <td class="gridcellleft">
                                    <table>
                                        <tr>
                                            <td id="Td_Screen" style="height: 30px">
                                                 <dxe:ASPxButton ID="BtnScreen" runat="server" AutoPostBack="False"  ClientInstanceName="cBtnScreen"  Text="Screen" >
                                                     <ClientSideEvents Click="function(s,e){ShowGrid();}" />
                                                  </dxe:ASPxButton>
                                            </td>
                                            <td id="Td_Export" style="height: 30px">
                                                
                                                            <dxe:ASPxButton ID="BtnExcel" runat="server" AutoPostBack="False" ClientInstanceName="cBtnExcel"
                                                                Text="Export To Excel">
                                                                <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('Export');}" />
                                                            </dxe:ASPxButton>
                                            
                                            </td>
                                            
                                            <td id="Td_Batch" style="display:none">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <dxe:ASPxDateEdit ID="DTBatch" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                                Font-Size="10px" Width="150px" ClientInstanceName="DTBatch">
                                                                <DropDownButton Text="Batch Info Date">
                                                                </DropDownButton>
                                                                <ClientSideEvents DateChanged="function(s,e){DateChange(DtFrom);}" />
                                                            </dxe:ASPxDateEdit>
                                                        </td>
                                                        <td>
                                                            <dxe:ASPxButton ID="Abtn_BatchInfo" runat="server" AutoPostBack="False" ClientInstanceName="cBatchInfo"
                                                                Text="Batch Info">
                                                                <ClientSideEvents Click="function(s,e){OnMoreInfoClick();}" />
                                                            </dxe:ASPxButton>
                                                        </td>
                                                        <td>
                                                            <dxe:ASPxButton ID="Abtn_BatchCreate" runat="server" AutoPostBack="False" ClientInstanceName="cBatchCreate"
                                                                Text="Batch Create">
                                                                 <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('Batch');}" />
                                                            </dxe:ASPxButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td id="Td_Email" style="height: 30px">
                                                    <dxe:ASPxButton ID="BtnEmail" runat="server" AutoPostBack="False" ClientInstanceName="cBtnEmail"  Text="Send Email" OnClick="BtnEmail_Click">
                                                    <ClientSideEvents Click="function(s,e){selecttion();}" />
                                                     </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td valign="top" align="left">
                        <table border="10" cellpadding="1" cellspacing="1" id="showFilter">
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="320px" onkeyup="FunCallAjaxList(this,event,'Other')"></asp:TextBox></td>
                                <td>
                                    <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                        Enabled="false">
                                        <asp:ListItem Value="Branch">Branch</asp:ListItem>
                                        <asp:ListItem Value="Clients">Clients</asp:ListItem>
                                        <asp:ListItem Value="Group">Group</asp:ListItem>
                                        <asp:ListItem Value="Company">Company</asp:ListItem>
                                        <asp:ListItem Value="Symbol">Symbol</asp:ListItem>
                                        <asp:ListItem Value="ISIN">ISIN</asp:ListItem>
                                        <asp:ListItem Value="Segment">Segment</asp:ListItem>
                                        <asp:ListItem Value="Email">Email</asp:ListItem>
                                        <asp:ListItem Value="DpAccount">DpAccount</asp:ListItem>
                                        <asp:ListItem Value="TranType">TranType</asp:ListItem>
                                    </asp:DropDownList>
                                    
                                </td>
                                <td>
                                    <a id="P4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                        style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                            style="color: #009900; font-size: 8pt;"> </span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:ListBox ID="lstSlection" runat="server" Font-Size="10px" Height="120px" Width="400px">
                                    </asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center; height: 32px;">
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <a id="P1" href="javascript:void(0);" onclick="clientselectionfinal()" style=""><span style="color: #000099;
                                                    text-decoration: underline; font-size: 10pt;">Done</span></a>&nbsp;&nbsp;
                                            </td>
                                            <td>
                                                <a id="P2" href="javascript:void(0);" onclick="btnRemovefromsubscriptionlist_click()">
                                                    <span style="color: #cc3300; text-decoration: underline; font-size: 8pt;">Remove</span></a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        
            
            <table>
                <tr>
                    <td style="display: none;">
                        <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                        <asp:HiddenField ID="hiddencount" runat="server" />
                        <asp:Button ID="BtnGroup" runat="server" Text="BtnGroup" OnClick="BtnGroup_Click" />
                        <asp:HiddenField ID="HiddenField_ALL" runat="server" />
                        <asp:HiddenField ID="HiddenField_SearchScrip" runat="server" />
                        <asp:HiddenField ID="HiddenField_Segment" runat="server" />
                        <asp:HiddenField ID="HiddenField_DpAccount" runat="server" />
                        <asp:HiddenField ID="HiddenField_Email" runat="server" />
                        <asp:HiddenField ID="HiddenField_TranType" runat="server" />
                        <asp:TextBox ID="txtSettlements_hidden" runat="server" Font-Size="10px" Width="200Px"></asp:TextBox>
                    </td>
                </tr>
            </table>
           
          
        </div>
        <table width="100%" border="1" id="Tab_Records">
            <tr>
                <td>
                    <div id="DivHeaderr" runat="server">
                    </div>
                </td>
            </tr>
            <tr style="display: none;">
                <td>
                    <asp:DropDownList ID="cmbclient" runat="server" Font-Size="10px" Width="300px" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <div id="Container2" class="paging textLeft" style="width: 994px;visibility:hidden">
            <div class="right">
                &nbsp;<span style="color: #555555; background-color: #ededed"></span>&nbsp;<span
                    style="color: #555555; background-color: #ededed"></span>
                <div id="ShowFilter" style="width: 69px; float: left">
                    <a id="S" href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline;
                        font-size: 12px">Show Filter</span></a>
                </div>
                <div id="ShowAllRecords" style="width: 72px; float: left">
                    <a id="H" href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline;
                        font-size: 12px;">All Records</span></a>
                </div>
            </div>
        </div>
        <div id="divLoading">
        <dxcp:ASPxCallbackPanel ID="GnrcCallBackPanel" runat="server" ClientInstanceName="cGnrcCallBackPanel"
            BackColor="White" OnCallback="GnrcCallBackPanel_Callback" LoadingPanelText="Please Wait Until File Not Generated.." LoadingPanelStyle-Font-Size="Medium">
            <PanelCollection>
                <dxp:panelcontent>
                </dxp:panelcontent>
            </PanelCollection>
            <ClientSideEvents EndCallback="function(s, e) {
	                                                    GnrcCallBackPanel_EndCallBack(); }" />
        </dxcp:ASPxCallbackPanel>
        </div>
        <div style="display: none">
            <asp:Button ID="btnExcelExport" runat="server" BackColor="#DDECFE" BorderStyle="None"
                OnClick="btnExcelExport_Click" />
            <asp:Button ID="btnBatchExport" runat="server" BackColor="#DDECFE" BorderStyle="None"
                OnClick="btnBatchExport_Click" />
        </div>
        <asp:HiddenField ID="hdn_GridBindOrNotBind" runat="server" />
        <asp:HiddenField ID="Hdn_PageSize" runat="server" />
        <asp:HiddenField ID="Hdn_PageNumber" runat="server" />
        <asp:HiddenField ID="Hdn_DateFrom" runat="server" />
        <asp:HiddenField ID="Hdn_DateTo" runat="server" />
    </form>
</body>
</html>