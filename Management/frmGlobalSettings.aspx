<%@ page language="C#" autoeventwireup="true" inherits="management_frmGlobalSettings, App_Web_e81qjzgk" %>

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
    <title>Global Settings</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

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
    function Validate()
    {
    
   
        if((document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_EXCHSEBIFEE") || 
        (document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_EXCHTRANCHARGE") || 
        (document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_EXCHTRANCHARGEST") || 
        (document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_EXCHOBLACCOUNT")||
        (document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_EXCHCLCHARGE")||
         (document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_EXCHCLCHARGEST")||
        (document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_EXCHEFCHARGE")||
         (document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_EXCHEFCHARGEST"))
        { 
              
            document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblTValue").style.display="none";
            document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTValue").style.display="none";
            
            document.getElementById('tdDateControl').style.display='none';
            if(document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbValu").value=="1")
                {
                   
                     document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRAC").style.display="inline";
                    document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit").style.display="inline";
                    document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblDTAC").style.display="inline";
                    document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit").style.display="inline";
                    document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").style.display="inline";
                    document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").innerHTML="Default Narration:";    
            
                    document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNarr").style.display="inline";
                   if(document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit_hidden").value !="")
                    {
                       
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="inline";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="inline";
                        document.getElementById('tdDateControl').style.display='none';
                    
                    }
                    else
                    {
                       
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
                        document.getElementById('tdDateControl').style.display='none';
                  
                    }
                    if(document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit_hidden").value !="")
                    {
                        
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="inline";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="inline";
                        document.getElementById('tdDateControl').style.display='none';
                    
                     }
                     else
                     {
                       
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
                        document.getElementById('tdDateControl').style.display='none';
                     }
                 }
                 else
                    {
                       
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRAC").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblDTAC").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").style.display="none";
                                  
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNarr").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
                    }
                 
        }
        else if((document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_DORMANCY" || 
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_HIGHVALUETRNDP" || 
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_COMPANYNETWORTH" || 
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_SEBIBRKG" || 
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKBNK" || 
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKJV" || 
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKTRADE" || 
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKDEMAT" || 
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKALL") && (document.getElementById("Hiddenaddoredit").value)=="old" )
        {
           
        alert ('1');
      
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblDTAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblTValue").style.display="inline";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTValue").style.display="inline";        
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNarr").style.display="none";
        document.getElementById('tdDateControl').style.display='none';
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").disabled=true;
       var ddlValue = document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbValu").value;
       var ddlType=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value;
       alert(ddlValue);
       alert(ddlType);
        //if (document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKBNK" || document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKJV" || document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKTRADE" || document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKDEMAT" || document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKALL" && document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbValu").value==2)
        
        if (((ddlType=="GS_LCKBNK") || (ddlType=="GS_LCKJV") || (ddlType=="GS_LCKTRADE") || (ddlType=="GS_LCKDEMAT") || (ddlType =="GS_LCKALL")) && (ddlValue== "2"))
        {
        alert ('2')
       //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").disabled=true;
           document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblDTAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblTValue").style.display="inline";
        //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTValue").style.display="none";        
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNarr").style.display="none";
             //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_dtptoDate").style.display="inline";
           // document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_tdTextControl").dispaly='none';
           
           // document.getElementById("tdTextControl").dispaly='none';
            //document.getElementById("tdDateControl").dispaly='inline';
           
            
            document.getElementById('tdDateControl').style.display='inline';
            
            document.getElementById('tdTextControl').style.display='none';
            
        }
        else
        {
        alert ('2 else');
//      document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").disable=true;
//      alert ('mjhg');
        //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").disabled=true;
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblDTAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblTValue").style.display="inline";
        //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTValue").style.display="inline";        
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNarr").style.display="none";
        //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_tdTextControl").dispaly='inline';
        
        
             //document.getElementById("tdTextControl").dispaly='inline';
            
            //dtpDate.style.visibility= "visible";
            document.getElementById('tdDateControl').style.display='none';
            document.getElementById('tdTextControl').style.display='inline';
           
        }
            
        
               
        }
         else if(document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_DORMANCY" || 
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_HIGHVALUETRNDP" || 
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_COMPANYNETWORTH" || 
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_SEBIBRKG" || 
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKBNK" || 
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKJV" || 
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKTRADE" || 
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKDEMAT" || 
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKALL" )
        {
           
        alert ('3');
      
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblDTAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblTValue").style.display="inline";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTValue").style.display="inline";        
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNarr").style.display="none";
        document.getElementById('tdDateControl').style.display='none';
        //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").disabled=true;
       var ddlValue = document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbValu").value;
       var ddlType=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value;
       //alert(ddlValue);
      // alert(ddlType);
        //if (document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKBNK" || document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKJV" || document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKTRADE" || document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKDEMAT" || document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_LCKALL" && document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbValu").value==2)
        
        if (((ddlType=="GS_LCKBNK") || (ddlType=="GS_LCKJV") || (ddlType=="GS_LCKTRADE") || (ddlType=="GS_LCKDEMAT") || (ddlType =="GS_LCKALL")) && (ddlValue== "2"))
        {
        alert ('3 if')
       //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").disabled=true;
           document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblDTAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblTValue").style.display="inline";
        //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTValue").style.display="none";        
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNarr").style.display="none";
             //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_dtptoDate").style.display="inline";
           // document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_tdTextControl").dispaly='none';
           
           // document.getElementById("tdTextControl").dispaly='none';
            //document.getElementById("tdDateControl").dispaly='inline';
           
            
            document.getElementById('tdDateControl').style.display='inline';
            
            document.getElementById('tdTextControl').style.display='none';
            
        }
        else
        {
        alert ('3 else');
//      document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").disable=true;
//      alert ('mjhg');
        //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").disabled=true;
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblDTAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblTValue").style.display="inline";
        //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTValue").style.display="inline";        
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNarr").style.display="none";
        //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_tdTextControl").dispaly='inline';
        
        
             //document.getElementById("tdTextControl").dispaly='inline';
            
            //dtpDate.style.visibility= "visible";
            document.getElementById('tdDateControl').style.display='none';
            document.getElementById('tdTextControl').style.display='inline';
           
        }
            
        
               
        }
        else if(document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_CDSLOPERATORID")
        {   
        //alert ('c');
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblValue").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbValu").style.display="none";
            
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblDTAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblTValue").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTValue").style.display="none";        
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").style.display="inline";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").innerHTML="Value";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNarr").style.display="inline";
        document.getElementById('tdDateControl').style.display='none';
        
        } 
        else if(document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_CLMARGINAC")
            {
               
                 if(document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbValu").value=="1")
                    {
                       
                         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRAC").style.display="inline";
                         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit").style.display="inline";
                         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
                         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
                         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblDTAC").style.display="inline";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit").style.display="inline";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblTValue").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTValue").style.display="none";        
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNarr").style.display="none";
                        document.getElementById('tdDateControl').style.display='none';
                   }
                 else
                    {
                       
                         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRAC").style.display="none";
                         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit").style.display="none";
                         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
                         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
                         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblDTAC").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblTValue").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTValue").style.display="none";        
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").style.display="none";
                        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNarr").style.display="none";
                        document.getElementById('tdDateControl').style.display='none';
                    
                    }
            }       
        else
        {   
       //alert ('d');     
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblDTAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblTValue").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTValue").style.display="none";        
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNarr").style.display="none";
        document.getElementById('tdDateControl').style.display='none';
        }
        
   
    }
    
    function Pageload()
    {
    //alert ('e');
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblDTAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblTValue").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTValue").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNarr").style.display="none";
        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_dtptoDate").style.display='none';
        
        document.getElementById('tdDateControl').style.display='none';
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
                   if(document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_CLMARGINAC")
                        {
                         strQuery_WhereClause = " MainAccount_SubLedgerType='Customers' and (MainAccount_Name Like \'%RequestLetter%' or MainAccount_AccountCode like \'%RequestLetter%')";
                        }
                    else
                        {
                            strQuery_WhereClause = " MainAccount_AccountCode not like 'SYS%' and (MainAccount_Name Like \'%RequestLetter%' or MainAccount_AccountCode like \'%RequestLetter%')";
                            
                            if(document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit_hidden").value!='')
                            {
                            
                               debitacc= document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit_hidden").value;
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
                   
                    if(document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_CLMARGINAC")
                        {
                            strQuery_WhereClause = " MainAccount_SubLedgerType='Customers' and (MainAccount_Name Like \'%RequestLetter%' or MainAccount_AccountCode like \'%RequestLetter%')";
                           
                         }
                    else
                        {
                              strQuery_WhereClause = " MainAccount_AccountCode not like 'SYS%' and (MainAccount_Name Like \'%RequestLetter%' or MainAccount_AccountCode like \'%RequestLetter%')";
                              if(document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit_hidden").value!='')
                                {
                                
                                   creditacc= document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit_hidden").value;
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
            obj4= document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit_hidden").value;
            
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
            obj4= document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit_hidden").value;
            
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
            if(document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_CLMARGINAC")
                {
                     document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
                      document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
                      document.getElementById('hidHasCreditSub').value='NONE';
                
                }
            else
                {
                    if(data[1] !='NONE')
                    {
                      document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="inline";
                      document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="inline";
                      document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").focus();
                    
                    }
                    else
                    {
                      document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
                      document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
                    
                    } 
                    document.getElementById('hidHasCreditSub').value=data[1];
                }
            document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit_hidden").value="";     
            
        }
        else if(MainAc =='ForDebit')
        {
           var data=obj.split('~');
           if(document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value=="GS_CLMARGINAC")
                {
                      document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
                      document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
                      document.getElementById('hidHasDebitSub').value='NONE';
                }
           else
                {
                    if(data[1] !='NONE')
                    {
                          document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="inline";
                          document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="inline";
                          document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").focus();
                    }
                    else
                    {
                          document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
                          document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
                    
                    }  
                    document.getElementById('hidHasDebitSub').value=data[1];
                }
            document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit_hidden").value="";
        }
        else if(MainAc =='ForSCredit')
        {
              document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="inline";
              document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="inline";
        
        }
        else if(MainAc =='ForSDebit')
        {
                  document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="inline";
                  document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="inline";
        
        }
        else
        {
         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").style.display="none";
         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNarr").style.display="none";
        
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
    
           grid.PerformCallback();
    } 
       
    function OnAddEditClick(obj)
    {
   
//         FieldName='ASPxPopupControl1_ASPxCallbackPanel1_drpBranch';
//        Filter='N';
//        RowID='';
//        var data=obj.split('~');
//        if(data.length>1)
//            RowID=data[1];
//        popup.Show();
//        if(obj=='AddNew')
//        {
//        //window.location='../management/frmGlobalSettings.aspx';
//            document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtCredit_hidden').value='';
//            document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit_hidden').value='';
//            document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtDebit_hidden').value='';
//            document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit_hidden').value='';
//        
//            Validate();
//        }
//       
//        popPanel.PerformCallback(obj);
  var URL="changeglobalsetting.aspx?id="+obj;
      //editwin=dhtmlmodal.open("Editbox", "iframe", URL, "Add/Edit Global Settings", "width=995px,height=350px,center=0,resize=1,top=-1", "recal");                 
      parent.OnMoreInfoClick(URL,"Add/Edit Global Settings",'650px','350px',"Y");	
      editwin.onclose=function()
             {
                 grid.PerformCallback();
             }
       
    }
    
        function callback()
        {
//               var applicant=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtApplicant_hidden").value;
//               AppBank.PerformCallback(applicant);
//               cmbSubSequentBank.PerformCallback(applicant);
grid.PerformCallback();
        } 
        
       function PopulateGrid(obj)
 {
 
   grid.PerformCallback(obj);
 }
     function OnDeleteClick(e,obj)
    {
    //alert('del');
        if(confirm('Are You Sure you want to Delete This Transaction?')==true)
        {
////       var ddltype=  document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_cmbType');
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
        
                
                if(((document.getElementById('hidHasCreditSub').value!='NONE' && document.getElementById('hidHasCreditSub').value!='') && (document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit_hidden').value=='' || document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit').value=='')) || ((document.getElementById('hidHasDebitSub').value!='NONE' && document.getElementById('hidHasDebitSub').value!='') && (document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit_hidden').value=='' || document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit').value=='')))
                alert('Please Select Sub Account!');
            else
                {
                var obj='SaveNew';
                popPanel.PerformCallback(obj);
                }
//          var TargetName=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTarget_hidden").value; 
//          var SourceName=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSource_hidden").value; 
//          var BrokerAcc=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbCompSeg").value; 
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
            
            if(((document.getElementById('hidHasCreditSub').value!='NONE' && document.getElementById('hidHasCreditSub').value!='') && (document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit_hidden').value=='' || document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit').value=='')) || ((document.getElementById('hidHasDebitSub').value!='NONE' && document.getElementById('hidHasDebitSub').value!='') && (document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit_hidden').value=='' || document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit').value=='')))
                alert('Please Select Sub Account!');
            else
                {
                    var obj='SaveOld~'+RowID+'~'+document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbValu").value;
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
                        
                document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtCredit_hidden').value='';
                document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit_hidden').value='';
                document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtDebit_hidden').value='';
                document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit_hidden').value='';
                var ddltype=  document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_cmbType');
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
        
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRAC").style.display="none";
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit").style.display="none"; 
        
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
////         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
       
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblDTAC").style.display="none";
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit").style.display="none";
       
        //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblTValue").style.display="inline";
        //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTValue").style.display="none";        
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").style.display="none";
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNarr").style.display="none";
             //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_dtptoDate").style.display="inline";
           // document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_tdTextControl").dispaly='none';
           
           // document.getElementById("tdTextControl").dispaly='none';
            //document.getElementById("tdDateControl").dispaly='inline';
            //alert('kip');
            
            var  typevalue=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value;
          if(typevalue=='GS_LCKBNK' || typevalue=='GS_LCKJV' || typevalue=='GS_LCKTRADE' || typevalue=='GS_LCKDEMAT' || typevalue=='GS_LCKALL')  
            document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbValu").value = "2";     
            //alert('k');
            document.getElementById('tdDateControl').style.display='inline';
            //alert('kip');
            document.getElementById('tdTextControl').style.display='none';
        }
        else
          {
          
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRAC").style.display="none";
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtCredit").style.display="none"; 
        
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblCRSAC").style.display="none";
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubCredit").style.display="none";
////         document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lbDTSAC").style.display="none";
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSubDebit").style.display="none";
        
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblDTAC").style.display="none";
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtDebit").style.display="none";
       
        //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblTValue").style.display="inline";
        //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTValue").style.display="inline";        
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_lblNarr").style.display="none";
////        document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtNarr").style.display="none";
        //document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_tdTextControl").dispaly='inline';
        
         var  typevalue=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value;
          if(typevalue=='GS_LCKBNK' || typevalue=='GS_LCKJV' || typevalue=='GS_LCKTRADE' || typevalue=='GS_LCKDEMAT' || typevalue=='GS_LCKALL')  
            document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbValu").value = "1";     
             //document.getElementById("tdTextControl").dispaly='inline';
            
            //dtpDate.style.visibility= "visible";
            document.getElementById('tdDateControl').style.display='none';
            document.getElementById('tdTextControl').style.display='inline';
        }
            
        
    document.getElementById("Hiddenaddoredit").value=popPanel.cpaddoredit;
   // alert (document.getElementById("Hiddenaddoredit").value); 
    }

   function calldispose()
    {
      var  type=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value;
            var y=(screen.availHeight-450)/2;
        var x=(screen.availWidth-900)/2;
        var str = 'frm_TemplateReservedWord.aspx?Type='+type;
        window.open(str,"Search_Conformation_Box","height=350,width=700,top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=no,resizable=no,dependent=no");       
      

    }
    
    
   function btnCancel_Click()
    {
        popup.Hide();
        var cmbType=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType");
        cmbType.value='0';

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
               <%-- <tr>
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
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="gridContract" ClientInstanceName="grid" Width="100%" KeyFieldName="GlobalSettings_ID"
                            DataSourceID="gridStatusDataSource" runat="server" AutoGenerateColumns="False"
                            OnCustomCallback="gridStatus_CustomCallback">
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                            <Styles>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <FocusedRow BackColor="#FEC6AB">
                                </FocusedRow>
                            </Styles>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Visible="False" FieldName="GlobalSettings_ID" Caption="ID">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="GlobalSettingsName" Caption="Type">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="GlobSetValue" Caption="Value">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                 <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="GlobalSettings_DefaultNarration" Caption="Narration Value">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="5">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnAddEditClick('<%# Container.KeyValue %>')">
                                            <u>More Info</u> </a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="OnDeleteClick(this,'Delete~'+'<%# Container.KeyValue %>')">
                                                <u>Delete</u> </a>
                                    </DataItemTemplate>
                                    <EditFormSettings Visible="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="OnAddEditClick('AddNew')"><u>Add New</u>
                                        </a>
                                    </HeaderTemplate>
                                    <HeaderStyle Wrap="False" />
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                            <SettingsBehavior AllowFocusedRow="True" AllowSort="False" AllowMultiSelection="True" />
                            <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True"
                                PageSize="15">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <SettingsText Title="Template" />
                            <Settings ShowGroupedColumns="True" ShowGroupPanel="True" />
                        </dxwgv:ASPxGridView>
                        <asp:SqlDataSource ID="gridStatusDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="">
                            <SelectParameters>
                                <asp:SessionParameter Name="userlist" SessionField="userchildHierarchy" Type="string" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <dxpc:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="popup" runat="server"
                                    AllowDragging="True" PopupHorizontalAlign="OutsideRight" HeaderText="Global Variable Setup"
                                    EnableHotTrack="False" BackColor="#DDECFE" Width="920px" CloseAction="CloseButton">
                                    <ContentCollection>
                                        <dxpc:PopupControlContentControl runat="server">
                                            <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="920px" ClientInstanceName="popPanel"
                                                OnCallback="ASPxCallbackPanel1_Callback" OnCustomJSProperties="ASPxCallbackPanel1_CustomJSProperties">
                                                <PanelCollection>
                                                    <dxp:PanelContent runat="server">
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
                                                                        
                                                                        <asp:ListItem Text="Generate SEBI/ESCA Fee for Exchange" Value="GS_EXCHSEBIFEE"></asp:ListItem>
                                                                        <asp:ListItem Text="Generate TranCharges/SettlementFee for Exchange" Value="GS_EXCHTRANCHARGE"></asp:ListItem>
                                                                        <asp:ListItem Text="Generate STax/GST/VAT on TranCharges/SettlementFee for Exchange" Value="GS_EXCHTRANCHARGEST"></asp:ListItem>
                                                                        <asp:ListItem Text="Generate Clearing Charges for Exchange" Value="GS_EXCHCLCHARGE"></asp:ListItem>
                                                                        <asp:ListItem Text="Generate STax/GST/VAT on Clearing Charges for Exchange" Value="GS_EXCHCLCHARGEST"></asp:ListItem>

                                                                        <asp:ListItem Text="Generate Exchange/Trading Fee for Exchange" Value="GS_EXCHEFCHARGE"></asp:ListItem>
                                                                        <asp:ListItem Text="Generate STax/GST/VAT on Exchange/Trading Fee for Exchange" Value="GS_EXCHEFCHARGEST"></asp:ListItem>

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
                                                                    <asp:DropDownList ID="cmbValu" runat="server" onchange="Validate()" Width="300px"
                                                                        >
                                                                    </asp:DropDownList>
                                                                    
                                                                </td>
                                                              
                                                                <td class="gridcellleft">
                                                                    <span class="Ecoheadtxt">
                                                                        <asp:Label ID="lblTValue" runat="server" Text="Type Value:"></asp:Label>
                                                                    </span>
                                                                </td>
                                                                <td class="gridcellleft" id="tdTextControl">
                                                                    <asp:TextBox ID="txtTValue" onkeypress="return onlyNumbers();" runat="server" Width="100px"></asp:TextBox>
                                                                    
                                                                </td>
                                                                <td>
                                                                    <td id="tdDateControl">
            
                                                                       <dxe:ASPxDateEdit ID="dtptoDate" runat="server"  ClientInstanceName="dtpDate"  
                                                                       Width="157px" EditFormat="Custom" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy">
                                                                             <DropDownButton text="Upto Date"></DropDownButton>
                                                                            </dxe:ASPxDateEdit>
                                                                            
                                                                           
                                                                            
                                                                    </td>
                                                                </td>
                                                                
                                                            </tr>
                                                            <%--   <tr id="trType" runat="server">
                              
                            </tr>--%>
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
                                                            <tr>
                                                                <td>
                                                                </td>
                                                                <td colspan="2" class="gridcellleft">
                                                                    <input id="Button1" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()"
                                                                        style="width: 60px" tabindex="41" />
                                                                    <input id="Button2" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_Click()"
                                                                        style="width: 60px" tabindex="42" />
                                                                        
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </dxp:PanelContent>
                                                </PanelCollection>
                                                <ClientSideEvents EndCallback="function(s, e) {
	                                                    EndCallBack(s.cpLast,s.cpfast);
                                                    }" />
                                            </dxcp:ASPxCallbackPanel>
                                        </dxpc:PopupControlContentControl>
                                    </ContentCollection>
                                    <HeaderStyle HorizontalAlign="Left">
                                        <Paddings PaddingRight="6px" />
                                    </HeaderStyle>
                                    <SizeGripImage Height="16px" Width="16px" />
                                    <CloseButtonImage Height="12px" Width="13px" />
                                    <ClientSideEvents CloseButtonClick="function(s, e) {
	 popup.Hide();
}" />
                                </dxpc:ASPxPopupControl>
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
