<%@ page language="C#" autoeventwireup="true" inherits="management_changeglobalsetting, App_Web_6yanuau_" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>Add/Edit Global Settings</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

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
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and 

.optionDivSelected */
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
	
	</style>

    <script language="javascript" type="text/javascript">
    FieldName='btnCancel';
    MainAc='None';
    function CallAjax(obj1,obj2,obj3,Query)
    {
        var CombinedQuery=new String(Query);
        var GenericAjaxListAspxPath ="../CentralData/Pages/GenericAjaxList.aspx";
        ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main',GenericAjaxListAspxPath);
    } 
    function Validate()
    {
    
  
        if((document.getElementById("cmbType").value=="GS_EXCHSEBIFEE") || 
        (document.getElementById("cmbType").value=="GS_EXCHTRANCHARGE") || 
        (document.getElementById("cmbType").value=="GS_EXCHTRANCHARGEST") || 
        (document.getElementById("cmbType").value=="GS_EXCHOBLACCOUNT")||
        (document.getElementById("cmbType").value=="GS_EXCHCLCHARGE")||
         (document.getElementById("cmbType").value == "GS_EXCHCLCHARGEST") ||
        (document.getElementById("cmbType").value=="GS_EXCHEFCHARGE")||
         (document.getElementById("cmbType").value == "GS_EXCHEFCHARGEST")

//        || (document.getElementById("cmbType").value == "GS_EXCHRMSFEE") ||
//         (document.getElementById("cmbType").value == "GS_EXCHRMSFEESTAX")
         
         
         )
        { 
              
            document.getElementById("lblTValue").style.display="none";
            document.getElementById("txtTValue").style.display="none";
            document.getElementById("trUser").style.display="none";
            
            document.getElementById('tdDateControl').style.display='none';
            if(document.getElementById("cmbValu").value=="1")
                {
                   
                     document.getElementById("lblCRAC").style.display="inline";
                    document.getElementById("txtCredit").style.display="inline";
                    document.getElementById("lblDTAC").style.display="inline";
                    document.getElementById("txtDebit").style.display="inline";
                    document.getElementById("lblNarr").style.display="inline";
                    document.getElementById("lblNarr").innerHTML="Default Narration:";    
            
                    document.getElementById("txtNarr").style.display="inline";
                   if(document.getElementById("txtSubCredit_hidden").value !="")
                    {
                       
                        document.getElementById("lblCRSAC").style.display="inline";
                        document.getElementById("txtSubCredit").style.display="inline";
                        document.getElementById('tdDateControl').style.display='none';
                    
                    }
                    else
                    {
                       
                        document.getElementById("lblCRSAC").style.display="none";
                        document.getElementById("txtSubCredit").style.display="none";
                        document.getElementById('tdDateControl').style.display='none';
                  
                    }
                    if(document.getElementById("txtSubDebit_hidden").value !="")
                    {
                        
                        document.getElementById("lbDTSAC").style.display="inline";
                        document.getElementById("txtSubDebit").style.display="inline";
                        document.getElementById('tdDateControl').style.display='none';
                    
                     }
                     else
                     {
                       
                        document.getElementById("lbDTSAC").style.display="none";
                        document.getElementById("txtSubDebit").style.display="none";
                        document.getElementById('tdDateControl').style.display='none';
                     }
                 }
                 else
                    {
                       
                        document.getElementById("lblCRAC").style.display="none";
                        document.getElementById("txtCredit").style.display="none";
                        document.getElementById("lblDTAC").style.display="none";
                        document.getElementById("txtDebit").style.display="none";
                        document.getElementById("lblNarr").style.display="none";
                                  
                        document.getElementById("txtNarr").style.display="none";
                        document.getElementById("lblCRSAC").style.display="none";
                        document.getElementById("txtSubCredit").style.display="none";
                        document.getElementById("lbDTSAC").style.display="none";
                        document.getElementById("txtSubDebit").style.display="none";
                    }
                 
        }
        else if((document.getElementById("cmbType").value=="GS_DORMANCY" || 
        document.getElementById("cmbType").value=="GS_HIGHVALUETRNDP" || 
        document.getElementById("cmbType").value=="GS_COMPANYNETWORTH" || 
        document.getElementById("cmbType").value=="GS_SEBIBRKG" || 
        document.getElementById("cmbType").value=="GS_LCKBNK" || 
        document.getElementById("cmbType").value=="GS_LCKJV" || 
        document.getElementById("cmbType").value=="GS_LCKTRADE" || 
        document.getElementById("cmbType").value=="GS_LCKDEMAT" || 
        document.getElementById("cmbType").value=="GS_LCKALL") && (document.getElementById("Hiddenaddoredit").value)=="old" )
        {
        document.getElementById("lblCRAC").style.display="none";
        document.getElementById("txtCredit").style.display="none";
        document.getElementById("lblCRSAC").style.display="none";
        document.getElementById("txtSubCredit").style.display="none";
        document.getElementById("lblDTAC").style.display="none";
        document.getElementById("txtDebit").style.display="none";
        document.getElementById("lbDTSAC").style.display="none";
        document.getElementById("txtSubDebit").style.display="none";
        document.getElementById("lblTValue").style.display="inline";
        document.getElementById("txtTValue").style.display="inline";        
        document.getElementById("lblNarr").style.display="none";
        document.getElementById("txtNarr").style.display="none";
        document.getElementById("trUser").style.display="none";
        document.getElementById('tdDateControl').style.display='none';
        document.getElementById("cmbType").disabled=true;
        
       var ddlValue = document.getElementById("cmbValu").value;
       
       var ddlType=document.getElementById("cmbType").value;
      // alert(ddlValue);
      // alert(ddlType);
        //if (document.getElementById("cmbType").value=="GS_LCKBNK" || document.getElementById("cmbType").value=="GS_LCKJV" || document.getElementById("cmbType").value=="GS_LCKTRADE" || document.getElementById("cmbType").value=="GS_LCKDEMAT" || document.getElementById("cmbType").value=="GS_LCKALL" && document.getElementById("cmbValu").value==2)
        
        if (((ddlType=="GS_LCKBNK") || (ddlType=="GS_LCKJV") || (ddlType=="GS_LCKTRADE") || (ddlType=="GS_LCKDEMAT") || (ddlType =="GS_LCKALL")) && (ddlValue== "2"))
        {
        
       //document.getElementById("cmbType").disabled=true;
           document.getElementById("lblCRAC").style.display="none";
        document.getElementById("txtCredit").style.display="none";
        document.getElementById("lblCRSAC").style.display="none";
        document.getElementById("txtSubCredit").style.display="none";
        document.getElementById("lblDTAC").style.display="none";
        document.getElementById("txtDebit").style.display="none";
        document.getElementById("lbDTSAC").style.display="none";
        document.getElementById("txtSubDebit").style.display="none";
        document.getElementById("lblTValue").style.display="inline";
        //document.getElementById("txtTValue").style.display="none";        
        document.getElementById("lblNarr").style.display="none";
        document.getElementById("txtNarr").style.display="none";
        document.getElementById("trUser").style.display="none";
             document.getElementById("dtptoDate").style.display="inline";
           // document.getElementById("tdTextControl").dispaly='none';
           
           // document.getElementById("tdTextControl").dispaly='none';
            //document.getElementById("tdDateControl").dispaly='inline';
           
            
            document.getElementById('tdDateControl').style.display='inline';
            
            document.getElementById('tdTextControl').style.display='none';
            
        }
        else
        {
        
//      document.getElementById("cmbType").disable=true;
//      alert ('mjhg');
        //document.getElementById("cmbType").disabled=true;
        document.getElementById("lblCRAC").style.display="none";
        document.getElementById("txtCredit").style.display="none";
        document.getElementById("lblCRSAC").style.display="none";
        document.getElementById("txtSubCredit").style.display="none";
        document.getElementById("lblDTAC").style.display="none";
        document.getElementById("txtDebit").style.display="none";
        document.getElementById("lbDTSAC").style.display="none";
        document.getElementById("txtSubDebit").style.display="none";
        document.getElementById("lblTValue").style.display="inline";
        //document.getElementById("txtTValue").style.display="inline";        
        document.getElementById("lblNarr").style.display="none";
        document.getElementById("txtNarr").style.display="none";
        document.getElementById("trUser").style.display="none";
        //document.getElementById("tdTextControl").dispaly='inline';
        
        
             //document.getElementById("tdTextControl").dispaly='inline';
            
            //dtpDate.style.visibility= "visible";
            document.getElementById('tdDateControl').style.display='none';
            document.getElementById('tdTextControl').style.display='inline';
           
        }
            
        
               
        }
         else if(document.getElementById("cmbType").value=="GS_DORMANCY" || 
        document.getElementById("cmbType").value=="GS_HIGHVALUETRNDP" || 
        document.getElementById("cmbType").value=="GS_COMPANYNETWORTH" || 
        document.getElementById("cmbType").value=="GS_SEBIBRKG" || 
        document.getElementById("cmbType").value=="GS_LCKBNK" || 
        document.getElementById("cmbType").value=="GS_LCKJV" || 
        document.getElementById("cmbType").value=="GS_LCKTRADE" || 
        document.getElementById("cmbType").value=="GS_LCKDEMAT" || 
        document.getElementById("cmbType").value=="GS_LCKALL" )
        {
           
        //alert ('3');
      
        document.getElementById("lblCRAC").style.display="none";
        document.getElementById("txtCredit").style.display="none";
        document.getElementById("lblCRSAC").style.display="none";
        document.getElementById("txtSubCredit").style.display="none";
        document.getElementById("lblDTAC").style.display="none";
        document.getElementById("txtDebit").style.display="none";
        document.getElementById("lbDTSAC").style.display="none";
        document.getElementById("txtSubDebit").style.display="none";
        document.getElementById("lblTValue").style.display="inline";
        document.getElementById("txtTValue").style.display="inline";        
        document.getElementById("lblNarr").style.display="none";
        document.getElementById("txtNarr").style.display="none";
        document.getElementById("trUser").style.display="none";
        document.getElementById('tdDateControl').style.display='none';
        //document.getElementById("cmbType").disabled=true;
       var ddlValue = document.getElementById("cmbValu").value;
       var ddlType=document.getElementById("cmbType").value;
       //alert(ddlValue);
      // alert(ddlType);
        //if (document.getElementById("cmbType").value=="GS_LCKBNK" || document.getElementById("cmbType").value=="GS_LCKJV" || document.getElementById("cmbType").value=="GS_LCKTRADE" || document.getElementById("cmbType").value=="GS_LCKDEMAT" || document.getElementById("cmbType").value=="GS_LCKALL" && document.getElementById("cmbValu").value==2)
        
        if (((ddlType=="GS_LCKBNK") || (ddlType=="GS_LCKJV") || (ddlType=="GS_LCKTRADE") || (ddlType=="GS_LCKDEMAT") || (ddlType =="GS_LCKALL")) && (ddlValue== "2"))
        {
        //alert ('3 if')
       //document.getElementById("cmbType").disabled=true;
           document.getElementById("lblCRAC").style.display="none";
        document.getElementById("txtCredit").style.display="none";
        document.getElementById("lblCRSAC").style.display="none";
        document.getElementById("txtSubCredit").style.display="none";
        document.getElementById("lblDTAC").style.display="none";
        document.getElementById("txtDebit").style.display="none";
        document.getElementById("lbDTSAC").style.display="none";
        document.getElementById("txtSubDebit").style.display="none";
        document.getElementById("lblTValue").style.display="inline";
        //document.getElementById("txtTValue").style.display="none";        
        document.getElementById("lblNarr").style.display="none";
        document.getElementById("txtNarr").style.display="none";
        document.getElementById("trUser").style.display="none";
             //document.getElementById("dtptoDate").style.display="inline";
           // document.getElementById("tdTextControl").dispaly='none';
           
           // document.getElementById("tdTextControl").dispaly='none';
            //document.getElementById("tdDateControl").dispaly='inline';
           
            
            document.getElementById('tdDateControl').style.display='inline';
            
            document.getElementById('tdTextControl').style.display='none';
            
        }
        else
        {
        //alert ('3 else');
//      document.getElementById("cmbType").disable=true;
//      alert ('mjhg');
        //document.getElementById("cmbType").disabled=true;
        document.getElementById("lblCRAC").style.display="none";
        document.getElementById("txtCredit").style.display="none";
        document.getElementById("lblCRSAC").style.display="none";
        document.getElementById("txtSubCredit").style.display="none";
        document.getElementById("lblDTAC").style.display="none";
        document.getElementById("txtDebit").style.display="none";
        document.getElementById("lbDTSAC").style.display="none";
        document.getElementById("txtSubDebit").style.display="none";
        document.getElementById("lblTValue").style.display="inline";
        //document.getElementById("txtTValue").style.display="inline";        
        document.getElementById("lblNarr").style.display="none";
        document.getElementById("txtNarr").style.display="none";
        document.getElementById("trUser").style.display="none";
        //document.getElementById("tdTextControl").dispaly='inline';
        
        
             //document.getElementById("tdTextControl").dispaly='inline';
            
            //dtpDate.style.visibility= "visible";
            document.getElementById('tdDateControl').style.display='none';
            document.getElementById('tdTextControl').style.display='inline';
           
        }
            
        
               
        }
        else if(document.getElementById("cmbType").value=="GS_CDSLOPERATORID")
        {   
        //alert ('c');
        document.getElementById("lblValue").style.display="none";
        document.getElementById("cmbValu").style.display="none";
            
        document.getElementById("lblCRAC").style.display="none";
        document.getElementById("txtCredit").style.display="none";
        document.getElementById("lblCRSAC").style.display="none";
        document.getElementById("txtSubCredit").style.display="none";
        document.getElementById("lblDTAC").style.display="none";
        document.getElementById("txtDebit").style.display="none";
        document.getElementById("lbDTSAC").style.display="none";
        document.getElementById("txtSubDebit").style.display="none";
        document.getElementById("lblTValue").style.display="none";
        document.getElementById("txtTValue").style.display="none";        
        document.getElementById("lblNarr").style.display="inline";
        document.getElementById("lblNarr").innerHTML="Value";
        document.getElementById("txtNarr").style.display="inline";
        document.getElementById('tdDateControl').style.display='none';
        document.getElementById("trUser").style.display="none";
        
        } 
        else if(document.getElementById("cmbType").value=="GS_MAKER" ||document.getElementById("cmbType").value=="GS_CHECKER"||document.getElementById("cmbType").value=="GS_VERIFIER")
        {   
        //alert ('c');
        document.getElementById("lblValue").style.display="none";
        document.getElementById("cmbValu").style.display="none";
            
        document.getElementById("lblCRAC").style.display="none";
        document.getElementById("txtCredit").style.display="none";
        document.getElementById("lblCRSAC").style.display="none";
        document.getElementById("txtSubCredit").style.display="none";
        document.getElementById("lblDTAC").style.display="none";
        document.getElementById("txtDebit").style.display="none";
        document.getElementById("lbDTSAC").style.display="none";
        document.getElementById("txtSubDebit").style.display="none";
        document.getElementById("lblTValue").style.display="none";
        document.getElementById("txtTValue").style.display="none";        
        document.getElementById("lblNarr").style.display="none";        
        document.getElementById("lblNarr").style.display="none";        
        document.getElementById("txtNarr").style.display="none";        
        document.getElementById('tdDateControl').style.display='none';
        document.getElementById("lblNarr").style.display="none";        
        document.getElementById("txtNarr").style.display="none";
        document.getElementById("trUser").style.display="inline";
        
        } 
        else if(document.getElementById("cmbType").value=="GS_CLMARGINAC")
            {
               
                 if(document.getElementById("cmbValu").value=="1")
                    {
                       
                         document.getElementById("lblCRAC").style.display="inline";
                         document.getElementById("txtCredit").style.display="inline";
                         document.getElementById("lblCRSAC").style.display="none";
                         document.getElementById("txtSubCredit").style.display="none";
                         document.getElementById("lblDTAC").style.display="inline";
                        document.getElementById("txtDebit").style.display="inline";
                        document.getElementById("lbDTSAC").style.display="none";
                        document.getElementById("txtSubDebit").style.display="none";
                        document.getElementById("lblTValue").style.display="none";
                        document.getElementById("txtTValue").style.display="none";        
                        document.getElementById("lblNarr").style.display="none";
                        document.getElementById("txtNarr").style.display="none";
                        document.getElementById("trUser").style.display="none";
                        document.getElementById('tdDateControl').style.display='none';
                   }
                 else
                    {
                       
                         document.getElementById("lblCRAC").style.display="none";
                         document.getElementById("txtCredit").style.display="none";
                         document.getElementById("lblCRSAC").style.display="none";
                         document.getElementById("txtSubCredit").style.display="none";
                         document.getElementById("lblDTAC").style.display="none";
                        document.getElementById("txtDebit").style.display="none";
                        document.getElementById("lbDTSAC").style.display="none";
                        document.getElementById("txtSubDebit").style.display="none";
                        document.getElementById("lblTValue").style.display="none";
                        document.getElementById("txtTValue").style.display="none";        
                        document.getElementById("lblNarr").style.display="none";
                        document.getElementById("txtNarr").style.display="none";
                        document.getElementById("trUser").style.display="none";
                        document.getElementById('tdDateControl').style.display='none';
                    
                    }
            }       
        else
        {   
       //alert ('d');     
        document.getElementById("lblCRAC").style.display="none";
        document.getElementById("txtCredit").style.display="none";
        document.getElementById("lblCRSAC").style.display="none";
        document.getElementById("txtSubCredit").style.display="none";
        document.getElementById("lblDTAC").style.display="none";
        document.getElementById("txtDebit").style.display="none";
        document.getElementById("lbDTSAC").style.display="none";
        document.getElementById("txtSubDebit").style.display="none";
        document.getElementById("lblTValue").style.display="none";
        document.getElementById("txtTValue").style.display="none";        
        document.getElementById("lblNarr").style.display="none";
        document.getElementById("txtNarr").style.display="none";
        document.getElementById("trUser").style.display="none";
        document.getElementById('tdDateControl').style.display='none';
        }
        
        if (document.getElementById("cmbType").value=="GS_UCCPATTERN")
        {
            if(document.getElementById("cmbValu").value=="2")
               {
                  document.getElementById("cmbrange").style.display="inline";
                  document.getElementById("lbltxt").style.display="inline";
                }
            else
              {
                document.getElementById("cmbrange").style.display="none";
                document.getElementById("lbltxt").style.display="none";
             }
        }
        else
          {
            document.getElementById("lbltxt").style.display="none";
            document.getElementById("cmbrange").style.display="none";
          }
        
   
    }
    
    function Pageload()
    {
    //alert ('e');
        document.getElementById("lblCRAC").style.display="none";
        document.getElementById("txtCredit").style.display="none";
        document.getElementById("lblCRSAC").style.display="none";
        document.getElementById("txtSubCredit").style.display="none";
        document.getElementById("lblDTAC").style.display="none";
        document.getElementById("txtDebit").style.display="none";
        document.getElementById("lbDTSAC").style.display="none";
        document.getElementById("txtSubDebit").style.display="none";
        document.getElementById("lblTValue").style.display="none";
        document.getElementById("txtTValue").style.display="none";
        document.getElementById("lblNarr").style.display="none";
        document.getElementById("txtNarr").style.display="none";
        document.getElementById("trUser").style.display="none";
        document.getElementById("dtptoDate").style.display='none';
        
        document.getElementById('tdDateControl').style.display='none';
        document.getElementById("cmbrange").style.display="none";
        document.getElementById("lbltxt").style.display="none";
        //dtpDate.SetDate(new Date());
        
       
    }
     function CallListCredit(objID,objEvent)
     {
            MainAc='ForCredit';
             var strQuery_Table = '';
           var strQuery_FieldName = '';
           var strQuery_WhereClause = '';
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery='';
            var debitacc='';
           
           strQuery_Table = "master_mainaccount";
                    strQuery_FieldName = " TOP 10 MainAccount_Name +'['+ isnull(MainAccount_AccountCode,'') +']',MainAccount_AccountCode +'~'+ isnull(MainAccount_SubLedgerType,'') ";
                   if(document.getElementById("cmbType").value=="GS_CLMARGINAC")
                        {
                         strQuery_WhereClause = " MainAccount_SubLedgerType='Customers' and (MainAccount_Name Like \'%RequestLetter%' or MainAccount_AccountCode like \'%RequestLetter%')";
                        }
                    else
                        {
                            strQuery_WhereClause = " MainAccount_AccountCode not like 'SYS%' and (MainAccount_Name Like \'%RequestLetter%' or MainAccount_AccountCode like \'%RequestLetter%')";
                            
                            if(document.getElementById("txtDebit_hidden").value!='')
                            {
                            
                               debitacc= document.getElementById("txtDebit_hidden").value;
                               debitacc=debitacc.split('~');
                               strQuery_WhereClause=" MainAccount_AccountCode!='"+debitacc[0]+"' and" + strQuery_WhereClause;
                            }
                        }
                    CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
                  
           ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery),'Main');
            //ajax_showOptions(obj1,obj2,obj3,MainAc,'Main')
     }
    function CallListDebit(objID,objEvent)
     {
            MainAc='ForDebit';
             var strQuery_Table = '';
           var strQuery_FieldName = '';
           var strQuery_WhereClause = '';
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery='';
           var creditacc='';
          
           strQuery_Table = "master_mainaccount";
                    strQuery_FieldName = " TOP 10 MainAccount_Name +'['+ isnull(MainAccount_AccountCode,'') +']',MainAccount_AccountCode +'~'+ isnull(MainAccount_SubLedgerType,'') ";
                   
                    if(document.getElementById("cmbType").value=="GS_CLMARGINAC")
                        {
                            strQuery_WhereClause = " MainAccount_SubLedgerType='Customers' and (MainAccount_Name Like \'%RequestLetter%' or MainAccount_AccountCode like \'%RequestLetter%')";
                           
                         }
                    else
                        {
                              strQuery_WhereClause = " MainAccount_AccountCode not like 'SYS%' and (MainAccount_Name Like \'%RequestLetter%' or MainAccount_AccountCode like \'%RequestLetter%')";
                              if(document.getElementById("txtCredit_hidden").value!='')
                                {
                                
                                   creditacc= document.getElementById("txtCredit_hidden").value;
                                   creditacc=creditacc.split('~');
                                   strQuery_WhereClause=" MainAccount_AccountCode!='"+creditacc[0]+"' and" + strQuery_WhereClause;
                                }
                        }
                    
                    CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
                  
           ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery),'Main');
            
           // ajax_showOptions(obj1,obj2,obj3,MainAc,'Main')
     }
     function CallListCRSubAccount(objID,objEvent)
     {
            MainAc='ForSCredit';
            obj4= document.getElementById("txtCredit_hidden").value;
            
             var strQuery_Table = '';
           var strQuery_FieldName = '';
           var strQuery_WhereClause = '';
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery='';
          var crmainacc='';
          crmainacc=obj4.split('~');
           strQuery_Table = "master_subaccount";
                    strQuery_FieldName = "TOP 10  SubAccount_Name + '['+ isnull(SubAccount_Code,'') +']',SubAccount_Code  ";
                    strQuery_WhereClause = " subaccount_mainacreferenceid='" + crmainacc[0] + "'  and (SubAccount_Name Like \'%RequestLetter%' or SubAccount_Code like \'%RequestLetter%')";
                               
                    
                    CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
                  
           ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery),'Main');
   
            
            
           // ajax_showOptions(obj1,obj2,obj3,obj4,'Main')
     }
    function CallListDTSubAccount(objID,objEvent)
     {
            MainAc='ForSDebit';
            obj4= document.getElementById("txtDebit_hidden").value;
            
             var strQuery_Table = '';
           var strQuery_FieldName = '';
           var strQuery_WhereClause = '';
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery='';
          var dbmainacc='';
          dbmainacc=obj4.split('~');
           strQuery_Table = "master_subaccount";
                    strQuery_FieldName = "TOP 10  SubAccount_Name + '['+ isnull(SubAccount_Code,'') +']',SubAccount_Code  ";
                    strQuery_WhereClause = " subaccount_mainacreferenceid='" + dbmainacc[0] + "'  and (SubAccount_Name Like \'%RequestLetter%' or SubAccount_Code like \'%RequestLetter%')";
                               
                    
                    CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
                  
           ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery),'Main');
   
            
            //ajax_showOptions(obj1,obj2,obj3,obj4,'Main')
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
     
    function keyVal(obj)
    {
        
        
         if(MainAc =='ForCredit')
        {
            var data=obj.split('~');
            if(document.getElementById("cmbType").value=="GS_CLMARGINAC")
                {
                     document.getElementById("lblCRSAC").style.display="none";
                      document.getElementById("txtSubCredit").style.display="none";
                      document.getElementById('hidHasCreditSub').value='NONE';
                
                }
            else
                {
                    if(data[1] !='NONE')
                    {
                      document.getElementById("lblCRSAC").style.display="inline";
                      document.getElementById("txtSubCredit").style.display="inline";
                      document.getElementById("txtSubCredit").focus();
                    
                    }
                    else
                    {
                      document.getElementById("lblCRSAC").style.display="none";
                      document.getElementById("txtSubCredit").style.display="none";
                    
                    } 
                    document.getElementById('hidHasCreditSub').value=data[1];
                }
            document.getElementById("txtSubCredit_hidden").value="";     
            
        }
        else if(MainAc =='ForDebit')
        {
           var data=obj.split('~');
           if(document.getElementById("cmbType").value=="GS_CLMARGINAC")
                {
                      document.getElementById("lbDTSAC").style.display="none";
                      document.getElementById("txtSubDebit").style.display="none";
                      document.getElementById('hidHasDebitSub').value='NONE';
                }
           else
                {
                    if(data[1] !='NONE')
                    {
                          document.getElementById("lbDTSAC").style.display="inline";
                          document.getElementById("txtSubDebit").style.display="inline";
                          document.getElementById("txtSubDebit").focus();
                    }
                    else
                    {
                          document.getElementById("lbDTSAC").style.display="none";
                          document.getElementById("txtSubDebit").style.display="none";
                    
                    }  
                    document.getElementById('hidHasDebitSub').value=data[1];
                }
            document.getElementById("txtSubDebit_hidden").value="";
        }
        else if(MainAc =='ForSCredit')
        {
              document.getElementById("lblCRSAC").style.display="inline";
              document.getElementById("txtSubCredit").style.display="inline";
        
        }
        else if(MainAc =='ForSDebit')
        {
                  document.getElementById("lbDTSAC").style.display="inline";
                  document.getElementById("txtSubDebit").style.display="inline";
        
        }
        else
        {
         document.getElementById("lblCRSAC").style.display="none";
         document.getElementById("txtSubCredit").style.display="none";
         document.getElementById("lbDTSAC").style.display="none";
         document.getElementById("txtSubDebit").style.display="none";
         document.getElementById("lblNarr").style.display="none";
         document.getElementById("txtNarr").style.display="none";
        
        }
    }
    
     function onlyNumbers(evt)
        {
	        var e = event || evt; // for trans-browser compatibility
	        var charCode = e.which || e.keyCode;
            
	        if (charCode  != 46 && charCode  > 31 && (charCode < 48 || charCode > 57))
		        return false;

	        return true;

        }
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
     {
  
        if(document.body.scrollHeight>=600)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '700px';
        window.frameElement.Width = document.body.scrollWidth;
    }
  function DeleteRow(keyValue)
    {
    alert('1');
             doIt=confirm('Are You Want To Delete This Record ???');
            if(doIt)
                {
                   grid.PerformCallback('Delete~'+ keyValue);
                   height();
                }
            else{
                  
                }
                Validate();
   
    }

    function ShowHideFilter(obj)
    {
    
           grid.PerformCallback(obj);
    } 
       
    function OnAddEditClick(e,obj)
    {
   
//         FieldName='drpBranch';
//        Filter='N';
//        RowID='';
//        var data=obj.split('~');
//        if(data.length>1)
//            RowID=data[1];
//        popup.Show();
//        if(obj=='AddNew')
//        {
//        //window.location='../management/frmGlobalSettings.aspx';
//            document.getElementById('txtCredit_hidden').value='';
//            document.getElementById('txtSubCredit_hidden').value='';
//            document.getElementById('txtDebit_hidden').value='';
//            document.getElementById('txtSubDebit_hidden').value='';
//        
//            Validate();
//        }
//       
//        popPanel.PerformCallback(obj);
  var URL="changeglobalsetting.aspx?id="+obj;
      editwin=dhtmlmodal.open("Editbox", "iframe", URL, "Add/Edit Global Settings", "width=995px,height=300px,center=0,resize=1,top=-1", "recal");                 
      editwin.onclose=function()
             {
                 grid.PerformCallback();
             }
       
    }
    
        function callback()
        {
               var applicant=document.getElementById("txtApplicant_hidden").value;
               AppBank.PerformCallback(applicant);
               cmbSubSequentBank.PerformCallback(applicant);
        } 
        
       
     function OnDeleteClick(e,obj)
    {
    //alert('del');
        if(confirm('Are You Sure you want to Delete This Type?')==true)
        {
////       var ddltype=  document.getElementById('cmbType');
////                ddltype.value='0';
////                Validate();
            grid.PerformCallback(obj);
             //
        }
    }
    function btnSave_Click()
    {
     
        Filter='Y';
        
        if(RowID=='')
        {
        
                
                if(((document.getElementById('hidHasCreditSub').value!='NONE' && document.getElementById('hidHasCreditSub').value!='') && (document.getElementById('txtSubCredit_hidden').value=='' || document.getElementById('txtSubCredit').value=='')) || ((document.getElementById('hidHasDebitSub').value!='NONE' && document.getElementById('hidHasDebitSub').value!='') && (document.getElementById('txtSubDebit_hidden').value=='' || document.getElementById('txtSubDebit').value=='')))
                alert('Please Select Sub Account!');
            else
                {
                var obj='SaveNew';
                popPanel.PerformCallback(obj);
                }
//          var TargetName=document.getElementById("txtTarget_hidden").value; 
//          var SourceName=document.getElementById("txtSource_hidden").value; 
//          var BrokerAcc=document.getElementById("cmbCompSeg").value; 
//              if(TargetName=='')
//              {
//                 alert('Target Client can not be blank.')
//                 return false;
//              }
//              else if(SourceName=='')
//              {
//                 alert('Source can not be blank.')
//                 return false;
//              }
//              else if(BrokerAcc=='')
//              {
//                 alert('Broker A/C can not be blank.')
//                 return false;
//              }
//               else
//              {
//                var obj='SaveNew';
//                popPanel.PerformCallback(obj);
//                   
//            }
             
        }
        else
        {
            
            if(((document.getElementById('hidHasCreditSub').value!='NONE' && document.getElementById('hidHasCreditSub').value!='') && (document.getElementById('txtSubCredit_hidden').value=='' || document.getElementById('txtSubCredit').value=='')) || ((document.getElementById('hidHasDebitSub').value!='NONE' && document.getElementById('hidHasDebitSub').value!='') && (document.getElementById('txtSubDebit_hidden').value=='' || document.getElementById('txtSubDebit').value=='')))
                alert('Please Select Sub Account!');
            else
                {
                    var obj='SaveOld~'+RowID+'~'+document.getElementById("cmbValu").value;
                    popPanel.PerformCallback(obj);
                }
        }
       
    }
    function EndCallBack(obj,obj1)
    {
       // alert (obj);
       var addstat=popPanel.cpaddoredit;
      
       if(addstat=='savenod' || addstat=='savenw')
            {
                        
                document.getElementById('txtCredit_hidden').value='';
                document.getElementById('txtSubCredit_hidden').value='';
                document.getElementById('txtDebit_hidden').value='';
                document.getElementById('txtSubDebit_hidden').value='';
                var ddltype=  document.getElementById('cmbType');
                ddltype.value='0';      
            }
       
        Validate();
        if(obj1=='Y')
        {
         alert("Already Exists!..");
         return false;
        }
   
        if(obj !='')
        {
            var data=obj.split('~');
            if(data[0]=='Edit')
            {
                
            }
        }
        if(Filter=='Y')
        {
            popup.Hide();
            grid.PerformCallback();
            
                 
          
        }
        if (popPanel.cphideshow == "2")
        {
        

            
            var  typevalue=document.getElementById("cmbType").value;
          if(typevalue=='GS_LCKBNK' || typevalue=='GS_LCKJV' || typevalue=='GS_LCKTRADE' || typevalue=='GS_LCKDEMAT' || typevalue=='GS_LCKALL')  
            document.getElementById("cmbValu").value = "2";     
            
            document.getElementById('tdDateControl').style.display='inline';
           
            document.getElementById('tdTextControl').style.display='none';
        }
        else
          {
               
        
         var  typevalue=document.getElementById("cmbType").value;
          if(typevalue=='GS_LCKBNK' || typevalue=='GS_LCKJV' || typevalue=='GS_LCKTRADE' || typevalue=='GS_LCKDEMAT' || typevalue=='GS_LCKALL')  
            document.getElementById("cmbValu").value = "1";     
         
            document.getElementById('tdDateControl').style.display='none';
            document.getElementById('tdTextControl').style.display='inline';
        }
            
        
    document.getElementById("Hiddenaddoredit").value=popPanel.cpaddoredit;

    }

   function calldispose()
    {
      var  type=document.getElementById("cmbType").value;
            var y=(screen.availHeight-450)/2;
        var x=(screen.availWidth-900)/2;
        var str = 'frm_TemplateReservedWord.aspx?Type='+type;
        window.open(str,"Search_Conformation_Box","height=350,width=700,top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=no,resizable=no,dependent=no");       
      

    }
  
    
    
   function btnCancel_Click()
    {
//        popup.Hide();
//        var cmbType=document.getElementById("cmbType");
//        cmbType.value='0';
        parent.editwin.close();
       
    }
    function save()
    {
        window.opener.PopulateGrid('p1');
        window.close();
        parent.editwin.close();
        alert ('aaa');
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Global Variable Setup</span></strong>
                    </td>
                </tr>
            </table>
            <%--<tr>
                    <td>
                        <table>
                            <tr>
                                <td id="Td1" align="left">
                                    <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                        Show Filter</span></a> || <a href="javascript:ShowHideFilter('All');"><span style="color: #000099;
                                            text-decoration: underline">All Records</span></a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>--%>
            <table width="400px" align="center" style="border: solid 1px white;">
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table class="TableMain100">
                                    <tr>
                                        <td class="gridcellleft">
                                            <span class="Ecoheadtxt">Type:</span>
                                        </td>
                                        <td class="gridcellleft" colspan="3">
                                            <asp:DropDownList ID="cmbType" runat="server" Width="300px" OnSelectedIndexChanged="cmbType_SelectedIndexChanged"
                                                AutoPostBack="true">
                                                <asp:ListItem Text="-Select-" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Default Brokerage Decimal Places" Value="GS_BRKDECIMAL"></asp:ListItem>
                                                <asp:ListItem Text="Default Brokerage Round-Off Pattern" Value="GS_BRKGROUND"></asp:ListItem>
                                                <asp:ListItem Text="Default Trade Average Pattern" Value="GS_AVGPATTERN"></asp:ListItem>
                                                <asp:ListItem Text="Default Market Rate Decimal" Value="GS_MKTDECIMAL"></asp:ListItem>
                                                <asp:ListItem Text="Default Market Rate Round-Off Pattern" Value="GS_MKTROUND"></asp:ListItem>
                                                <asp:ListItem Text="Exchange Obligation Round-Off Pattern" Value="GS_EXCHOBLROUND"></asp:ListItem>
                                                <asp:ListItem Text="STT Accounting Pattern" Value="GS_STTACCOUNTING"></asp:ListItem>
                                                <asp:ListItem Text="FO Segment Daily Billing Style" Value="GS_FOACCOUNTINGJV"></asp:ListItem>
                                                <asp:ListItem Text="FO Margin Composition For Quarterly Fund Release" Value="GS_FOMARGINCOMP"></asp:ListItem>
                                                <asp:ListItem Text="Generate SEBI Fee for Exchange" Value="GS_EXCHSEBIFEE"></asp:ListItem>
                                                <asp:ListItem Text="Generate Transaction Charges for Exchange" Value="GS_EXCHTRANCHARGE"></asp:ListItem>
                                                <asp:ListItem Text="Generate Service Tax on Tran. Charges for Exchange" Value="GS_EXCHTRANCHARGEST"></asp:ListItem>
                                                <asp:ListItem Text="Generate Clearing Charges for Exchange" Value="GS_EXCHCLCHARGE"></asp:ListItem>
                                                <asp:ListItem Text="Generate Service Tax on Clearing Charges for Exchange" Value="GS_EXCHCLCHARGEST"></asp:ListItem>
                                                <asp:ListItem Text="Generate Exchange Fee for Exchange" Value="GS_EXCHEFCHARGE"></asp:ListItem>
                                                <asp:ListItem Text="Generate Service Tax on Exchange/SEBI Fee for Exchange" Value="GS_EXCHEFCHARGEST"></asp:ListItem>
                                                <asp:ListItem Text="Exchange Obligation Account" Value="GS_EXCHOBLACCOUNT"></asp:ListItem>
                                                <asp:ListItem Text="Set Client Account Dormancy Period " Value="GS_DORMANCY"></asp:ListItem>
                                                <asp:ListItem Text="Set High Value DP Transaction Amount" Value="GS_HIGHVALUETRNDP"></asp:ListItem>
                                                <asp:ListItem Text="Round Off Exchange Transaction Charges" Value="GS_EXCHTRANRND"></asp:ListItem>
                                                <asp:ListItem Text="Number Of Authorizations For High Value Slips" Value="GS_HGVLAUTHORIZATIONS"></asp:ListItem>
                                                <asp:ListItem Text="Batch Operator ID" Value="GS_CDSLOPERATORID"></asp:ListItem>
                                                <asp:ListItem Text="Company Net Worth" Value="GS_COMPANYNETWORTH"></asp:ListItem>
                                                <asp:ListItem Text="Brokerage not to exceed SEBI limit of" Value="GS_SEBIBRKG"></asp:ListItem>
                                                <asp:ListItem Text="Lock Cash Bank Entries" Value="GS_LCKBNK"></asp:ListItem>
                                                <asp:ListItem Text="Lock Journal Voucher Entries" Value="GS_LCKJV"></asp:ListItem>
                                                <asp:ListItem Text="Lock Trade Entries" Value="GS_LCKTRADE"></asp:ListItem>
                                                <asp:ListItem Text="Lock Demat Entries" Value="GS_LCKDEMAT"></asp:ListItem>
                                                <asp:ListItem Text="Lock ALL Data entry & edit task" Value="GS_LCKALL"></asp:ListItem>
                                                <asp:ListItem Text="Post Daily Client Margin in Accounts" Value="GS_CLMARGINAC"></asp:ListItem>
                                                <asp:ListItem Text="Cm Bill Posting Day" Value="GS_CMBILLDATE"></asp:ListItem>
                                                <asp:ListItem Text="Server Debuger" Value="GS_DEBUGSTATE"></asp:ListItem>
                                                <asp:ListItem Text="Number Of Authorizations For Requisitions" Value="GS_NOOFREQAUTH"></asp:ListItem>
                                                <asp:ListItem Text="Number Of Authorizations For KYC" Value="GS_KYCAUTH"></asp:ListItem>
                                                <asp:ListItem Text="UCC Pattern For KYC Client" Value="GS_UCCPATTERN"></asp:ListItem>
                                                <asp:ListItem Text="Number of CDSL client opening Authorization" Value="GS_CDSLCLNTOPAUTH"></asp:ListItem>
                                                <asp:ListItem Text="Exchange PayOut Method" Value="GS_NSEPAYOUT"></asp:ListItem>
                                                <asp:ListItem Text="Exchange Clearing Charge Calculation Basis" Value="GS_EXCHCLCHARGETRADE"></asp:ListItem>
                                                <asp:ListItem Text="Maker ID" Value="GS_MAKER"></asp:ListItem>
                                                <asp:ListItem Text="Checker ID" Value="GS_CHECKER"></asp:ListItem>
                                                <asp:ListItem Text="Verifier ID" Value="GS_VERIFIER"></asp:ListItem>
                                                <asp:ListItem Text="Generate RMS Fee for Exchange" Value="GS_EXCHRMSFEE"></asp:ListItem>
                                                <asp:ListItem Text="Generate Service Tax on RMS Fee for Exchange" Value="GS_EXCHRMSFEESTAX"></asp:ListItem>
                                                <asp:ListItem Text="Apply Encryption For CDSL Batch" Value="GS_CDSLENCRYPTION"></asp:ListItem>
                                                <asp:ListItem Text="EarlyPayin Credit Account" Value="GS_EPICREDIT"></asp:ListItem>
                                                <%--New Work 08/03/2022--%>
                                                <asp:ListItem Text="Prices to be considered in" Value="GS_DGCXINRPRICE"></asp:ListItem>
                                                <asp:ListItem Text="Generate bills in respective trade currencies" Value="GS_MULTICURRENCYACT"></asp:ListItem>
                                                <%--End of New Work 08/03/2022--%>
                                                <%--New Work 30/04/2022--%>
                                                <asp:ListItem Text="Consider Trading/Margin Ledger Balances For Collateral Allocation" Value="GS_CONSIDERLEDGERFORCOLLATALLOC"></asp:ListItem>
                                                <%--End of New Work 30/04/2022--%>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="gridcellleft">
                                            <span class="Ecoheadtxt">
                                                <asp:Label ID="lblValue" runat="server" Text="Value"></asp:Label>
                                            </span>
                                        </td>
                                        <td class="gridcellleft">
                                            <asp:DropDownList ID="cmbValu" runat="server" onchange="Validate()" Width="300px">
                                            
                                                
                                            </asp:DropDownList>
                                        </td>
                                        <td class="gridcellleft">
                                            <span class="Ecoheadtxt">
                                                <asp:Label ID="lblTValue" runat="server" Text="Set Value:"></asp:Label>
                                            </span>
                                        </td>
                                        <td class="gridcellleft" id="tdTextControl">
                                            <asp:TextBox ID="txtTValue" onkeypress="return onlyNumbers();" runat="server" Width="100px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <td id="tdDateControl">
                                                <dxe:ASPxDateEdit ID="dtptoDate" runat="server" ClientInstanceName="dtpDate" Width="157px"
                                                    EditFormat="Custom" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy">
                                                    <DropDownButton Text="Upto Date">
                                                    </DropDownButton>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </td>
                                    </tr>
                                    <%--   <tr id="trType" runat="server">
                              
                            </tr>--%>
                                    <tr>
                                    <td class="gridcellleft">
                                            <span class="Ecoheadtxt">
                                                <asp:Label ID="lbltxt" runat="server" Text="Length"></asp:Label>
                                            </span></td>
                                        <td class="gridcellleft">
                                            <asp:DropDownList ID="cmbrange" runat="server" onchange="Validate()" Width="235px">
                                               
                                               <%-- <asp:ListItem Text="Prefix + 2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Prefix + 3" Value="3"></asp:ListItem>--%>
                                                <asp:ListItem Text="Name's First Letter + 4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="Name's First Letter + 5" Value="5"></asp:ListItem>
                                                <asp:ListItem Text="Name's First Letter + 6" Value="6"></asp:ListItem>
                                                <asp:ListItem Text="Name's First Letter + 7" Value="7"></asp:ListItem>
                                                <asp:ListItem Text="Name's First Letter + 8" Value="8"></asp:ListItem>
                                                <asp:ListItem Text="Name's First Letter + 9" Value="9"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr id="trCRAC" runat="server">
                                        <td class="gridcellleft">
                                            <span class="Ecoheadtxt">
                                                <asp:Label ID="lblCRAC" runat="server" Text="Credit Side A/C:"></asp:Label>
                                            </span>
                                        </td>
                                        <td class="gridcellleft">
                                            <asp:TextBox ID="txtCredit" runat="server" Width="300px"></asp:TextBox>
                                            <asp:HiddenField ID="txtCredit_hidden" runat="server" />
                                        </td>
                                        <td class="gridcellleft">
                                            <span class="Ecoheadtxt">
                                                <asp:Label ID="lblCRSAC" runat="server" Text=" Credit Side sub A/C:"></asp:Label>
                                            </span>
                                        </td>
                                        <td class="gridcellleft">
                                            <asp:TextBox ID="txtSubCredit" runat="server" Width="300px"></asp:TextBox>
                                            <asp:HiddenField ID="txtSubCredit_hidden" runat="server" />
                                        </td>
                                    </tr>
                                    <%-- <tr id="trCRSAC" runat="server">
                               
                            </tr>--%>
                                    <tr id="trDTAC" runat="server">
                                        <td class="gridcellleft">
                                            <span class="Ecoheadtxt">
                                                <asp:Label ID="lblDTAC" runat="server" Text=" Debit Side A/C:"></asp:Label></span>
                                        </td>
                                        <td class="gridcellleft">
                                            <asp:TextBox ID="txtDebit" runat="server" Width="300px"></asp:TextBox>
                                            <asp:HiddenField ID="txtDebit_hidden" runat="server" />
                                        </td>
                                        <td class="gridcellleft">
                                            <span class="Ecoheadtxt">
                                                <asp:Label ID="lbDTSAC" runat="server" Text=" Debit  Side sub A/C:"></asp:Label>
                                            </span>
                                        </td>
                                        <td class="gridcellleft">
                                            <asp:TextBox ID="txtSubDebit" runat="server" Width="300px"></asp:TextBox>
                                            <asp:HiddenField ID="txtSubDebit_hidden" runat="server" />
                                        </td>
                                    </tr>
                                    <%-- <tr id="trDTSAC" runat="server">
                              
                            </tr >--%>
                                    <tr id="trNarr" runat="server">
                                        <td class="gridcellleft">
                                            <span class="Ecoheadtxt">
                                                <asp:Label ID="lblNarr" runat="server"></asp:Label>
                                            </span>
                                        </td>
                                        <td class="gridcellleft">
                                            <asp:TextBox ID="txtNarr" runat="server" Width="300px" MaxLength="50"></asp:TextBox>
                                        </td>
                                        <td colspan="2">
                                        </td>
                                    </tr>
                                    <tr id="trUser" runat="server">
                                        <td class="gridcellleft">
                                            <span class="Ecoheadtxt">
                                                <asp:Label ID="Label1" Text="Value:" runat="server"></asp:Label>
                                            </span>
                                        </td>
                                        <td class="gridcellleft">
                                            <asp:TextBox ID="txtUser" runat="server" Width="300px"></asp:TextBox>
                                            <asp:HiddenField ID="txtUser_hidden" runat="server" />
                                        </td>
                                        <td colspan="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td colspan="2" class="gridcellleft">
                                            <%-- <input id="Button1" runat="server" type="button"  value="Save" class="btnUpdate" onclick="btnSave_Click()"
                                                style="width: 60px" tabindex="41" />--%>
                                            <asp:Button ID="btnsave" runat="server" Text="Save" class="btnUpdate" Style="width: 60px"
                                                OnClick="btnsave_Click" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input id="Button2" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_Click()"
                                                style="width: 60px" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <%--<asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>--%>
                            </Triggers>
                        </asp:UpdatePanel>
                        <asp:HiddenField ID="Hiddenaddoredit" runat="server" />
                        <asp:HiddenField ID="hidHasCreditSub" runat="Server" />
                        <asp:HiddenField ID="hidHasDebitSub" runat="Server" />
                        
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
