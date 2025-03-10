<%@ page language="C#" autoeventwireup="true" inherits="management_frm_ExportNsdlDematTransaction, App_Web__y0k_erv" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
    <%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <link href="../CSS/GenericCss.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
    
    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>
    <script language="javascript" type="text/javascript" src="../CentralData/JSScript/timeSolver.min.js"></script>

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
	
	</style>
<%--New Work 04/10/2024--%>
<%--</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="setInterval('blinkIt()',500)">--%>
<%--End of New Work 04/10/2024--%>
    <script language="javascript" type="text/javascript">

        function SignOff()
        {
            window.parent.SignOff();
        }
        function PageLoad()
        {
            FieldName='btnExport'; 
            document.getElementById('txtAccName_hidden').value='';  
            document.getElementById('txtAccName_hidden').style.display="none";
            trSummary.style.display = 'none';
            trEDIS.style.display = 'none';
            document.getElementById('hidNewBatchNum').value = '';
            
            tdBatch.style.display='none';
            trNextBatch.style.display='none';
//            trBatch.style.display='none';
//            trNsdlTransType.style.display='none';
            trNsdlSlip.style.display='none';
            trCdslTransType.style.display='none';
            trCdslSlip.style.display='none';   
            trOperatorId.style.display='none';
            trBtn.style.display='none';
//            New Work 04/10/2024
            trBtnNSDLUDIFF.style.display='none';
//            End of New Work 04/10/2024
            tblClientType.style.display='none';
            HideTrTd(trVersion);
            HideTrTd(trselectfile);
            HideTrTd(trselectfile_cdsl);
            InitializeNsdlSlips();            
            
            document.getElementById('hidAccId').value = '';
            document.getElementById('hidBatchToGenerate').value = '';
            document.getElementById('hidType').value = '';
//            New Work 25/11/2022
            document.getElementById('hidTransactionBatch').value = '';
//            End of New Work 25/11/2022
            
            height();
            document.getElementById('<%=txtAccName.ClientID %>').focus();
            
            //document.getElementById('<%=ddlselectfileCDSL.ClientID %>').disabled=true;
            
            SetStyle("DvExecDateValidation","Display","none");
        }
        
        function height()
        {
    
            if(document.body.scrollHeight>=400)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '400px';
            window.frameElement.Width = document.body.scrollWidth;
        } 
        function CallAjax(obj1,obj2,obj3)
        { 
            var param = document.getElementById('<%=ddlTrans.ClientID %>').value;
            ajax_showOptions(obj1, obj2, obj3, param, 'Main');
            
        }                 
        function keyVal(obj) {   
            if (document.getElementById('<%=ddlTrans.ClientID %>').value == '3') {
                trEDIS.style.display = 'inline';
                trBtn.style.display = 'inline';
            }
            else {
                trEDIS.style.display = 'none';
                trSummary.style.display = 'inline';
                //            trBatch.style.display='inline';
                trNextBatch.style.display = 'inline';

                trBtn.style.display = 'inline';
                dpid = obj.split('~')[1];
                accid = obj.split('~')[0];
                cmbpid = obj.split('~')[3];
                document.getElementById('hidAccId').value = accid;

                AssignHidType();

                document.getElementById('<%=Button1.ClientID %>').click();

                if (document.getElementById('<%=ddlTrans.ClientID %>').value == '1')
                // Normal Transaction
                {
                    if (dpid.substr(0, 2) == 'IN') {
                        //                    trNsdlTransType.style.display = 'inline';
                        trCdslTransType.style.display = 'none';
                        trCdslSlip.style.display = 'none';
                        trOperatorId.style.display = 'none';
                        trNsdlSlip.style.display = 'inline';
                        ShowTrTd(trVersion);
                        ShowTrTd(trselectfile);
                        HideTrTd(trselectfile_cdsl);
                        document.getElementById('<%=btnExport.ClientID %>').value = 'Export NSDL File';
                        var ddlSelectFile = document.getElementById("<%=ddlselectfile.ClientID%>");
                        ddlSelectFile.options[0].selected = true;
                        var ddlversion = document.getElementById("<%=ddlVersion.ClientID%>");
                        ddlversion.options[0].selected = true;
                        ddlversion.disabled = false;
                    }
                    else {
                        //                    trNsdlTransType.style.display = 'none';
                        trCdslTransType.style.display = 'inline';
                        trCdslSlip.style.display = 'inline';
                        trNsdlSlip.style.display = 'none';
                        HideTrTd(trVersion);
                        HideTrTd(trselectfile);
                        ShowTrTd(trselectfile_cdsl);
                        document.getElementById('<%=btnExport.ClientID %>').value = 'Export CDAS File';
                        var ddlSelectFile = document.getElementById("<%=ddlselectfileCDSL.ClientID%>");
                        ddlSelectFile.options[0].selected = true;
                        var ddlSelectFile = document.getElementById("<%=ddlselectfile.ClientID%>");
                        ddlSelectFile.options[0].selected = true;

                        if (document.getElementById('<%=rbtnInterDP.ClientID %>').checked)
                            trOperatorId.style.display = 'none';
                        else if (document.getElementById('<%=rbtnTrans.ClientID %>').checked || document.getElementById('<%=rbtnCombined.ClientID %>').checked) {
                            trOperatorId.style.display = 'inline';
                            document.getElementById('txtoperatorid').value = document.getElementById('hdn_OperatorID').value;
                        }
                    }
                }
                else if (document.getElementById('<%=ddlTrans.ClientID %>').value == '2')
                // POA Transaction
                {
                    if (document.getElementById('<%=rbtnCDSL.ClientID %>').checked)
                        trOperatorId.style.display = 'inline';
                    else
                        trOperatorId.style.display = 'none';
                    document.getElementById('txtoperatorid').value = document.getElementById('hdn_OperatorID').value;


                    if (document.getElementById('<%=rbtnCDSL.ClientID %>').checked) {
                        HideTrTd(trVersion);
                        HideTrTd(trselectfile);
                        ShowTrTd(trselectfile_cdsl);

                        if (dpid.substr(0, 2) != 'IN') {
                            document.getElementById('<%=ddlselectfileCDSL.ClientID %>').disabled = false;
                        }

                    }
                    else {
                        ShowTrTd(trVersion);
                        ShowTrTd(trselectfile);
                        HideTrTd(trselectfile_cdsl);
                    }
                }
            }
        
        }
        function AssignHidType()
        {
            InitializeNsdlSlips();
            
            if (document.getElementById('<%=ddlTrans.ClientID %>').value=='1') // Normal
            {
                if (dpid.substr(0,2)=='IN') //Normal-NSDL
                {
                    document.getElementById('hidType').value = 'NSDL';
                }
                else // Normal-CDSL
                {
                    if (document.getElementById('<%=rbtnCombined.ClientID %>').checked)
                        document.getElementById('hidType').value = 'Combined-CDSL';
                    else if (document.getElementById('<%=rbtnInterDP.ClientID %>').checked)                    
                        document.getElementById('hidType').value = 'InterDP-CDSL';
                    else
                        document.getElementById('hidType').value = 'OffMarket-CDSL';
                }
            }
            else if (document.getElementById('<%=ddlTrans.ClientID %>').value=='2') // POA
            {
                trCdslSlip.style.display = 'inline';
                
                if (document.getElementById('<%=rbtnNSDL.ClientID %>').checked)
                    document.getElementById('hidType').value = 'POA-NSDL';
                else
                    document.getElementById('hidType').value = 'POA-CDSL';
                
                
            }
            
        }
        function ShowTrTd(obj)
        {
//            document.getElementById(obj).style.display='inline';
            obj.style.display='inline';
            height();
        }
        function HideTrTd(obj)
        {
//            document.getElementById(obj).style.display='none';
            obj.style.display='none';
            height();
        }
        function CheckTypes()
        {
//            alert('CheckTypes');
            var grid = document.getElementById("<%= gridSummary.ClientID %>");
            
            var param = '';
            var transFlagMI = '';
            var transFlagIntra = '';
            var transFlagIntraPP = '';
            var transFlagInter = '';
            var transFlagIS = '';
            var slipMI = '';
            var slipIntra = '';
            var slipInter = '';
            var slipIS = '';
            
//            New Work 04/10/2024
            if (document.getElementById('<%=ddlTrans.ClientID %>').value!='2' && document.getElementById('<%=ddlselectfile.ClientID %>').value=='NSDLUDIFF')
            {
                alert('This combination only exists for POA/DDPI Transactions.');
                return false;
            } 
//            End of New Work 04/10/2024
            
            if (grid.rows.length > 0)
            {
                //loop starts from 1. rows[0] points to the header.
                for (i=1; i<grid.rows.length; i++)
                {
                    //get the reference of template column
                    cell = grid.rows[i].cells[0];
                    //loop according to the number of childNodes in the cell
                    for (j=0; j<cell.childNodes.length; j++)
                    {   
                        if (cell.childNodes[j].innerText == '')
                        {
                            if (cell.childNodes[j].innerHTML.indexOf('CHECKED')>=0)
                            {
//                                alert(i);
                                
                                if (grid.rows[i].cells[1].innerText == ' ')
                                {
                                    paramBatch = 'NA';
//                                    if (param = '')
//                                        param='NA'+ '~' + grid.rows[i].cells[2].innerText + '~' + grid.rows[i].cells[3].innerText + '~' + grid.rows[i].cells[4].innerText + ',';
//                                    else
//                                        param=param+'NA'+ '~' + grid.rows[i].cells[2].innerText + '~' + grid.rows[i].cells[3].innerText + '~' + grid.rows[i].cells[4].innerText + ',';
                                }
                                else 
                                {
                                    paramBatch = grid.rows[i].cells[1].innerText;
//                                    param = param + grid.rows[i].cells[1].innerText + '~' + grid.rows[i].cells[2].innerText + '~' + grid.rows[i].cells[3].innerText + '~' + grid.rows[i].cells[4].innerText + ',';
                                } 
                                if ((grid.rows[i].cells[2].innerText == '')||(grid.rows[i].cells[2].innerText == ' '))
                                    paramSlip = 'NA';                                
                                else 
                                    paramSlip = grid.rows[i].cells[2].innerText;
                                    
                                if (grid.rows[i].cells[3].innerText == ' ')
                                    paramTransaction = 'NA';                                
                                else 
                                    paramTransaction = grid.rows[i].cells[3].innerText;
                                       
                                if (grid.rows[i].cells[4].innerText == ' ')
                                    paramTransfer = 'NA';                                
                                else 
                                    paramTransfer = grid.rows[i].cells[4].innerText;
                                    
                                param = param + paramBatch + '~' + paramSlip + '~' + paramTransaction + '~' + paramTransfer + ',';
                                    
                            }                            
                            
                        }
                        
                    }
                }
               
                
                  
            }
//            alert(param);
            if (param == '')
            {
                alert('Invalid. Please select at least one batch to generate.');
                return false;
            }
                        
            if((cComboDISFrmtMI.GetValue()=='Y') && (document.getElementById('txtMI').value =='') &&  (trMI.style.display == 'inline'))
            {
                alert('Please enter Market Payin Slip No.');
                document.getElementById('txtMI').focus();
                return false;
            }  
            if((cComboDISFrmtIntra.GetValue()=='Y') && (document.getElementById('txtIntra').value =='') &&  (trIntra.style.display == 'inline'))
            {
                alert('Please enter Delivery To Client (Intra Depository) Slip No.');
                document.getElementById('txtIntra').focus();
                return false;
            }  
            if((cComboDISFrmtIntraPP.GetValue()=='Y') && (document.getElementById('txtIntraPP').value =='') &&  (trIntraPP.style.display == 'inline'))
            {
                alert('Please enter Delivery To Client (PoolToPool Intra-DP) Slip No.');
                document.getElementById('txtIntraPP').focus();
                return false;
            }  
            if((cComboDISFrmtInter.GetValue()=='Y') && (document.getElementById('txtInter').value =='') &&  (trInter.style.display == 'inline'))
            {
                alert('Please enter Delivery To Client (Inter Depository) Slip No.');
                document.getElementById('txtInter').focus();
                return false;
            }     
            if((cComboDISFrmtIS.GetValue()=='Y') && (document.getElementById('txtIS').value =='') &&  (trIS.style.display == 'inline'))
            {
                alert('Please enter InterSettlement Slip No.');
                document.getElementById('txtIS').focus();
                return false;
            }        
            document.getElementById('hidBatchToGenerate').value = param;
//            New Work 25/11/2022
            document.getElementById('hidTransactionBatch').value = paramTransaction;
//            End of New Work 25/11/2022
            if (document.getElementById('<%=rbtnAvlBatch.ClientID %>').checked)
                document.getElementById('hidNewBatchNum').value = document.getElementById('<%=txtNextBatch.ClientID %>').value;
            else if (document.getElementById('<%=rbtnNewBatch.ClientID %>').checked)
                document.getElementById('hidNewBatchNum').value = document.getElementById('<%=txtBatch.ClientID %>').value;
                

                            
            if (document.getElementById('<%=ddlTrans.ClientID %>').value=='1')
            {
            // Normal Transaction
                if (dpid.substr(0,2)=='IN')
                {                                   
                   return true;
                }
                
                else
                {
                                   
                     if (document.getElementById("<%= txtSlipCdsl.ClientID %>").value == '')
                     {
                        alert('Invalid. Please Enter Slip Number.');
                        return false;                 
                     }   
                     else if (document.getElementById('<%=rbtnCDSL.ClientID %>').checked)
                     {
                         if (document.getElementById('<%=rbtnTrans.ClientID %>').checked || document.getElementById('<%=rbtnCombined.ClientID %>').checked)
                         {
                             if (document.getElementById("<%= txtOperatorId.ClientID %>").value == '')
                             {
                                alert('Invalid. Please Enter OperatorID.');
                                return false;                 
                             }   
                             else
                                 return true;
                         }
                     }
                }
            }
            else if (document.getElementById('<%=ddlTrans.ClientID %>').value=='2')
            {
            // POA Transaction
                
                if (document.getElementById("<%= txtSlipCdsl.ClientID %>").value == '')
                 {
                    alert('Invalid. Please Enter Slip Number.');
                    document.getElementById("<%= txtSlipCdsl.ClientID %>").focus();
                    return false;                 
                 }  
                else if (document.getElementById('<%=rbtnCDSL.ClientID %>').checked)
                {
                    if (document.getElementById("<%= txtOperatorId.ClientID %>").value == '')
                    {
                        alert('Invalid. Please Enter OperatorID.');
                        document.getElementById("<%= txtOperatorId.ClientID %>").focus();
                        return false;
                    }
                    else
                        return true;
                }
            } 
            
            
            
        }
//        New Work 04/10/2024
        function CheckTypesNSDLUDIFF()
        {
//            alert('CheckTypes');
            var grid = document.getElementById("<%= gridSummary.ClientID %>");
            
            var param = '';
            var transFlagMI = '';
            var transFlagIntra = '';
            var transFlagIntraPP = '';
            var transFlagInter = '';
            var transFlagIS = '';
            var slipMI = '';
            var slipIntra = '';
            var slipInter = '';
            var slipIS = '';
            
            if (document.getElementById('<%=ddlTrans.ClientID %>').value!='2' && document.getElementById('<%=ddlselectfile.ClientID %>').value=='NSDLUDIFF')
            {
                alert('This combination only exists for POA/DDPI Transactions.');
                return false;
            } 
            
            if (grid.rows.length > 0)
            {
                //loop starts from 1. rows[0] points to the header.
                for (i=1; i<grid.rows.length; i++)
                {
                    //get the reference of template column
                    cell = grid.rows[i].cells[0];
                    //loop according to the number of childNodes in the cell
                    for (j=0; j<cell.childNodes.length; j++)
                    {   
                        if (cell.childNodes[j].innerText == '')
                        {
                            if (cell.childNodes[j].innerHTML.indexOf('CHECKED')>=0)
                            {                               
                                if (grid.rows[i].cells[1].innerText == ' ')
                                {
                                    paramBatch = 'NA';
                                }
                                else 
                                {
                                    paramBatch = grid.rows[i].cells[1].innerText;
                                } 
                                if ((grid.rows[i].cells[2].innerText == '')||(grid.rows[i].cells[2].innerText == ' '))
                                    paramSlip = 'NA';                                
                                else 
                                    paramSlip = grid.rows[i].cells[2].innerText;
                                    
                                if (grid.rows[i].cells[3].innerText == ' ')
                                    paramTransaction = 'NA';                                
                                else 
                                    paramTransaction = grid.rows[i].cells[3].innerText;
                                       
                                if (grid.rows[i].cells[4].innerText == ' ')
                                    paramTransfer = 'NA';                                
                                else 
                                    paramTransfer = grid.rows[i].cells[4].innerText;
                                    
                                param = param + paramBatch + '~' + paramSlip + '~' + paramTransaction + '~' + paramTransfer + ',';
                            }                            
                            
                        }                        
                    }
                }                  
            }
//            alert(param);
            if (param == '')
            {
                alert('Invalid. Please select at least one batch to generate.');
                return false;
            }
                        
            if((cComboDISFrmtMI.GetValue()=='Y') && (document.getElementById('txtMI').value =='') &&  (trMI.style.display == 'inline'))
            {
                alert('Please enter Market Payin Slip No.');
                document.getElementById('txtMI').focus();
                return false;
            }  
            if((cComboDISFrmtIntra.GetValue()=='Y') && (document.getElementById('txtIntra').value =='') &&  (trIntra.style.display == 'inline'))
            {
                alert('Please enter Delivery To Client (Intra Depository) Slip No.');
                document.getElementById('txtIntra').focus();
                return false;
            }  
            if((cComboDISFrmtIntraPP.GetValue()=='Y') && (document.getElementById('txtIntraPP').value =='') &&  (trIntraPP.style.display == 'inline'))
            {
                alert('Please enter Delivery To Client (PoolToPool Intra-DP) Slip No.');
                document.getElementById('txtIntraPP').focus();
                return false;
            }  
            if((cComboDISFrmtInter.GetValue()=='Y') && (document.getElementById('txtInter').value =='') &&  (trInter.style.display == 'inline'))
            {
                alert('Please enter Delivery To Client (Inter Depository) Slip No.');
                document.getElementById('txtInter').focus();
                return false;
            }     
            if((cComboDISFrmtIS.GetValue()=='Y') && (document.getElementById('txtIS').value =='') &&  (trIS.style.display == 'inline'))
            {
                alert('Please enter InterSettlement Slip No.');
                document.getElementById('txtIS').focus();
                return false;
            }        
            document.getElementById('hidBatchToGenerate').value = param;
//            New Work 25/11/2022
            document.getElementById('hidTransactionBatch').value = paramTransaction;
//            End of New Work 25/11/2022
            if (document.getElementById('<%=rbtnAvlBatch.ClientID %>').checked)
                document.getElementById('hidNewBatchNum').value = document.getElementById('<%=txtNextBatch.ClientID %>').value;
            else if (document.getElementById('<%=rbtnNewBatch.ClientID %>').checked)
                document.getElementById('hidNewBatchNum').value = document.getElementById('<%=txtBatch.ClientID %>').value;                
                            
            if (document.getElementById('<%=ddlTrans.ClientID %>').value=='1')
            {
            // Normal Transaction
                if (dpid.substr(0,2)=='IN')
                {                                   
                   return true;
                }
                
                else
                {                                   
                     if (document.getElementById("<%= txtSlipCdsl.ClientID %>").value == '')
                     {
                        alert('Invalid. Please Enter Slip Number.');
                        return false;                 
                     }   
                     else if (document.getElementById('<%=rbtnCDSL.ClientID %>').checked)
                     {
                         if (document.getElementById('<%=rbtnTrans.ClientID %>').checked || document.getElementById('<%=rbtnCombined.ClientID %>').checked)
                         {
                             if (document.getElementById("<%= txtOperatorId.ClientID %>").value == '')
                             {
                                alert('Invalid. Please Enter OperatorID.');
                                return false;                 
                             }   
                             else
                                 return true;
                         }
                     }
                }
            }
            else if (document.getElementById('<%=ddlTrans.ClientID %>').value=='2')
            {
            // POA Transaction
                
                if (document.getElementById("<%= txtSlipCdsl.ClientID %>").value == '')
                 {
                    alert('Invalid. Please Enter Slip Number.');
                    document.getElementById("<%= txtSlipCdsl.ClientID %>").focus();
                    return false;                 
                 }  
                else if (document.getElementById('<%=rbtnCDSL.ClientID %>').checked)
                {
                    if (document.getElementById("<%= txtOperatorId.ClientID %>").value == '')
                    {
                        alert('Invalid. Please Enter OperatorID.');
                        document.getElementById("<%= txtOperatorId.ClientID %>").focus();
                        return false;
                    }
                    else
                        return true;
                }
            }
        }
//        End of New Work 04/10/2024
        function EnterSlip(transtype)
        {
            var slip = prompt("Enter Slip Number for "+ transtype,"");

            if ((slip == '')||(slip == null)||(slip == ' '))
            {
                EnterSlip(transtype);
                return '';
            }
            else
                return slip;
                                    
        }
        function OnDateChanged()
        {
            if (document.getElementById('<%=ddlTrans.ClientID %>').value != '3') {
                var Date1 = e1.GetDate();
                var Date2 = new Date('01-01-2005');
                if (CompareDate_TrueFalse(Date1, Date2, 'GT')) {
                    alert('Invalid Date!!!.');
                    DevE_SetDateTime(e1, '<%=Session["ServerDate"] %>');
                }
                else {
                    if (e2.GetDate() < e1.GetDate()) {
                        alert('Execution Date cannot be earlier than Transaction Date.');
                        e2.SetDate(e1.GetDate());
                    }
                }
                AssignHidType();
                document.getElementById('<%=Button1.ClientID %>').click();
                trSummary.style.display = 'inline';
            }
        }
        function OnExecDateChanged()
        {
            if (document.getElementById('<%=ddlTrans.ClientID %>').value != '3') {
                var DateObjectFrm = e1.GetDate();
                var DateObjectTo = e2.GetDate();
                var SelectedDate = new Date(DateObjectFrm);
                var monthnumber = SelectedDate.getMonth();
                var monthday = SelectedDate.getDate();
                var year = SelectedDate.getYear();
                var SelectedDateValueFrm = new Date(year, monthnumber, monthday);

                var SelectedDate = new Date(DateObjectTo);
                monthnumber = SelectedDate.getMonth();
                monthday = SelectedDate.getDate();
                year = SelectedDate.getYear();
                var SelectedDateValueTo = new Date(year, monthnumber, monthday);
                var SelectedDateNumericValueFrm = SelectedDateValueFrm.getTime();
                var SelectedDateNumericValueTo = SelectedDateValueTo.getTime();

                if (SelectedDateNumericValueTo - SelectedDateNumericValueFrm > 86400000) {
                    var NoOfDayDiff = (SelectedDateNumericValueTo - SelectedDateNumericValueFrm) / 86400000;
                    var DiffBetweenDates = "Execution Date is " + NoOfDayDiff + " Days Greater Than Transaction Date!!!.";
                    SetinnerHTML("DvExecDateValidation", DiffBetweenDates);
                    SetStyle("DvExecDateValidation", "Display", "inline");
                }
                else {
                    SetinnerHTML("DvExecDateValidation", "");
                    SetStyle("DvExecDateValidation", "Display", "none");
                }

                if (e2.GetDate() < e1.GetDate()) {
                    alert('Invalid. Execution Date cannot be earlier than Transaction Date.');
                    e2.SetDate(e1.GetDate());
                }
            }
            else {
                if (e2.GetDate() > e1.GetDate()) {
                    alert('Invalid. Execution Date cannot be bigger than Transaction Date.');
                    e2.SetDate(e1.GetDate());
                }
            }
        }
        
        function CheckAccid()
        {
        
            if (document.getElementById('hidAccId').value == '')
            {
                trSummary.style.display='none';
                return false;
            }
            else
            {
                trSummary.style.display='inline';
                return true;
            }
        }  
        function OnSelectedValueChanged1()
        {
            //alert('hi');
            document.getElementById('<%=txtAccName.ClientID %>').value = '';
            document.getElementById('<%=txtAccName_hidden.ClientID %>').value = '';
            InitializeNsdlSlips();
            HideTrTd(trNextBatch);
            if (document.getElementById('<%=ddlTrans.ClientID %>').value == 1 || document.getElementById('<%=ddlTrans.ClientID %>').value == 3)
            {
                tblClientType.style.display='none';
//                trBatch.style.display='none';
                trCdslSlip.style.display='none';
                trNsdlSlip.style.display='none';
//            New Work 04/10/2024
            trBtnNSDLUDIFF.style.display='none';
//            End of New Work 04/10/2024
            }
            else
            {
                document.getElementById('<%=ddlselectfile.ClientID %>').selectedIndex=0;
                tblClientType.style.display='inline';
//                trBatch.style.display='none';
                trCdslSlip.style.display='none';
                trNsdlSlip.style.display='none';
                trBtn.style.display='none';
                trSummary.style.display='none';
//                trNsdlTransType.style.display='none';
                trCdslTransType.style.display='none';
                trOperatorId.style.display='none';
//               New Work 04/10/2024
               trBtnNSDLUDIFF.style.display='none';
//               End of New Work 04/10/2024
            }
            
            ///Code For NSDL-Ekool
            Initialize_NSDLEKool();
        }
        function OnTypeChange(obj)
        {
           
            document.getElementById('<%=txtAccName.ClientID %>').value = '';
            document.getElementById('<%=txtAccName_hidden.ClientID %>').value = '';
            
            HideTrTd(trNextBatch);
            
            trSummary.style.display='none';
//            trBatch.style.display='none';
            trCdslSlip.style.display='none';
            trBtn.style.display='none';
            
            if (document.getElementById('<%=rbtnCombined.ClientID %>').checked)
            {
                trOperatorId.style.display = 'inline';
                document.getElementById('txtoperatorid').value=document.getElementById('hdn_OperatorID').value;
                document.getElementById('<%=ddlselectfileCDSL.ClientID %>').disabled=true;
                document.getElementById('<%=ddlselectfileCDSL.ClientID %>').selectedIndex=0;
            }
            if (document.getElementById('<%=rbtnInterDP.ClientID %>').checked)
            {
                trOperatorId.style.display = 'none';
                document.getElementById('<%=ddlselectfileCDSL.ClientID %>').disabled=false;
            }
            if (document.getElementById('<%=rbtnTrans.ClientID %>').checked)
            {
                trOperatorId.style.display = 'inline';
                document.getElementById('txtoperatorid').value=document.getElementById('hdn_OperatorID').value;
                document.getElementById('<%=ddlselectfileCDSL.ClientID %>').disabled=false;
            }
           
            document.getElementById('<%=txtSlipCdsl.ClientID %>').value = '';
            document.getElementById('<%=txtOperatorId.ClientID %>').value = '';
            
            document.getElementById('hidType').value = obj;
            
            if (document.getElementById('<%=ddlTrans.ClientID %>').value=='2')
            {
               // POA Transaction
               if (document.getElementById('<%=rbtnCDSL.ClientID %>').checked)
               {
                   trOperatorId.style.display = 'inline';
                   HideTrTd(trVersion);
                   HideTrTd(trselectfile);
               }
               else 
               {
                   trOperatorId.style.display = 'none';
                   ShowTrTd(trVersion);
                   ShowTrTd(trselectfile);
               }
            }
        }
        function InitializeNsdlSlips()
        {
            trMI.style.display = 'none';
            trIntra.style.display = 'none';
            trIntraPP.style.display = 'none';
            trInter.style.display = 'none';
            trIS.style.display = 'none';
//            New Work 04/10/2024
            if(document.getElementById('<%=ddlselectfile.ClientID %>').value=='NSDLUDIFF')
            {
                document.getElementById('txtAccName_hidden').value='';  
                document.getElementById('txtAccName_hidden').style.display="none";
                trCdslTransType.style.display = 'none';
                trEDIS.style.display = 'none';
                trOperatorId.style.display = 'none';
                HideTrTd(trselectfile_cdsl);
                var ddlversion = document.getElementById("<%=ddlVersion.ClientID%>");
                ddlversion.options[0].selected=true; 
                ddlversion.disabled=true;
                trBtn.style.display='none';
                HideShow("CSB_Row1_Col1","H");
            }
//            End of New Work 04/10/2024

            document.getElementById('<%=txtMI.ClientID %>').value = '';
            document.getElementById('<%=txtIntra.ClientID %>').value = '';
            document.getElementById('<%=txtIntraPP.ClientID %>').value = '';
            document.getElementById('<%=txtInter.ClientID %>').value = '';
            document.getElementById('<%=txtIS.ClientID %>').value = '';

            document.getElementById('<%=txtBatch.ClientID %>').value = '';
//            document.getElementById('<%=txtBatch.ClientID %>').focus();
            
            countMI = 0;
            countIntra = 0;
            countIntraPP = 0;
            countInter = 0;
            countIS = 0;
            
            //Execute Date Validation
            HideShow("Row2_Col1","H");
        }
        function RegenBatch(obj)
        {
//        alert(obj.id.substr(15,(obj.id.substr(15).indexOf('_'))));

            var selRow = eval(obj.id.substr(15,(obj.id.substr(15).indexOf('_'))));

            var grid = document.getElementById("<%= gridSummary.ClientID %>");

            var transaction = grid.rows[selRow-1].cells[3].innerText;
            var transfer = grid.rows[selRow-1].cells[4].innerText;

            if (obj.checked)
            {
            
                if (transaction.indexOf('Market PayIn')>=0)
                    countMI = eval(countMI)+1;
                else if ((transaction.indexOf('Delivery To Client')>=0)&&(transfer.indexOf('Intra-Depository')>=0))
                    countIntra = eval(countIntra)+1;
                else if ((transaction.indexOf('Delivery To Client')>=0)&&(transfer.indexOf('PoolToPool Intra-DP')>=0))
                    countIntraPP = eval(countIntraPP)+1;
                else if ((transaction.indexOf('Delivery To Client')>=0)&&(transfer.indexOf('Inter-Depository')>=0))
                    countInter = eval(countInter)+1;
                else if (transaction.indexOf('InterSettlement')>=0)
                    countIS = eval(countIS)+1;
            }
            else
            {
                if (transaction.indexOf('Market PayIn')>=0)
                    countMI = eval(countMI)-1;
                else if ((transaction.indexOf('Delivery To Client')>=0)&&(transfer.indexOf('Intra-Depository')>=0))
                    countIntra = eval(countIntra)-1;
                else if ((transaction.indexOf('Delivery To Client')>=0)&&(transfer.indexOf('PoolToPool Intra-DP')>=0))
                    countIntraPP = eval(countIntraPP)-1;
                else if ((transaction.indexOf('Delivery To Client')>=0)&&(transfer.indexOf('Inter-Depository')>=0))
                    countInter = eval(countInter)-1;
                else if (transaction.indexOf('InterSettlement')>=0)
                    countIS = eval(countIS)-1;
            }

            if (countMI > 0)
                trMI.style.display = 'inline';
            else
                trMI.style.display = 'none';

            if (countIntra > 0)
                trIntra.style.display = 'inline';
            else
                trIntra.style.display = 'none';
                
            if (countIntraPP > 0)
                trIntraPP.style.display = 'inline';
            else
                trIntraPP.style.display = 'none';

            if (countInter > 0)
                trInter.style.display = 'inline';
            else
                trInter.style.display = 'none';
                
            if (countIS > 0)
                trIS.style.display = 'inline';
            else
                trIS.style.display = 'none'; 
                
            
            ///Code For NSDL-Ekool
            Initialize_NSDLEKool();
            height();
                
        }
        function BatchExists()
        {
            alert('Invalid. New BatchNumber Already Exists.');
            InitializeNsdlSlips();
            document.getElementById('<%=txtBatch.ClientID %>').focus();
            
        }
        
        function Download()
        {
            document.getElementById("<%= btnDownload.ClientID %>").click();        
        }
        function OnAvlBatchChange(obj)
        {
        
            if (obj == 'UseAvlBatch')
            {
                tdBatch.style.display='none';
                document.getElementById('hidNewBatchNum').value = document.getElementById('txtNextBatch').value;
            }
                
            else if (obj == 'NewBatch') 
            {
                tdBatch.style.display='inline';
                document.getElementById('<%=txtBatch.ClientID %>').value = '';
                document.getElementById('<%=txtBatch.ClientID %>').focus();
//              
            }
            
       
        }
        function EnterNewBatch()
        {
            alert('Invalid. Please enter new Batch Number.');
            document.getElementById('<%=txtBatch.ClientID %>').focus();
        }
        function OnSelectedValueChanged(obj)
        {
              /////Code For NSDL-Ekool
            Initialize_NSDLEKool();
            
            var ddlvalue=obj;
            //alert(ddlvalue);
            if(ddlvalue =='NSDL') //NSDL
            {
              var ddlversion = document.getElementById("<%=ddlVersion.ClientID%>");
              ddlversion.options[0].selected=true; 
              ddlversion.disabled=false;
//            New Work 04/10/2024
              trBtn.style.display='inline';
              trBtnNSDLUDIFF.style.display='none';
//            End of New Work 04/10/2024
              document.getElementById('<%=btnExport.ClientID %>').value = 'Export NSDL File';
            }
            if(ddlvalue =='SPEED-E' || ddlvalue =='EKOOL' ) //SPEEDE || Ekool
            {
              var ddlversion = document.getElementById("<%=ddlVersion.ClientID%>");
              ddlversion.options[1].selected=true; 
              ddlversion.disabled=true;
//            New Work 04/10/2024
              trBtn.style.display='inline';
              trBtnNSDLUDIFF.style.display='none';
//            End of New Work 04/10/2024              
              if(ddlvalue =='SPEED-E')
                document.getElementById('<%=btnExport.ClientID %>').value = 'Export SPEED-E File';
              else
                document.getElementById('<%=btnExport.ClientID %>').value = 'Export Ekool File';
            }
            if (ddlvalue == "SPICE")
            {
//            New Work 04/10/2024
              trBtn.style.display='inline';
              trBtnNSDLUDIFF.style.display='none';
//            End of New Work 04/10/2024            
                document.getElementById('<%=btnExport.ClientID %>').value = 'Export SPICE File';
            }
//            New Work 04/10/2024
            if (ddlvalue == "NSDLUDIFF")
            {
              var ddlversion = document.getElementById("<%=ddlVersion.ClientID%>");
              ddlversion.options[0].selected=true; 
              ddlversion.disabled=true;
              trBtn.style.display='none';
              trBtnNSDLUDIFF.style.display='inline';
            }
//            End of New Work 04/10/2024
            if(ddlvalue !='NSDL') //NSDL
            {
                cComboDISFrmtMI.SetValue('N'); 
                cComboDISFrmtIntra.SetValue('N');  
                cComboDISFrmtInter.SetValue('N');  
                cComboDISFrmtIS.SetValue('N'); 
                cComboDISFrmtMI.SetEnabled(false); 
                cComboDISFrmtIntra.SetEnabled(false);  
                cComboDISFrmtInter.SetEnabled(false);  
                cComboDISFrmtIS.SetEnabled(false);
                 
            }
            else
            {
                cComboDISFrmtMI.SetValue('Y'); 
                cComboDISFrmtIntra.SetValue('Y');  
                cComboDISFrmtInter.SetValue('Y');  
                cComboDISFrmtIS.SetValue('Y'); 
                cComboDISFrmtMI.SetEnabled(true); 
                cComboDISFrmtIntra.SetEnabled(true);  
                cComboDISFrmtInter.SetEnabled(true);  
                cComboDISFrmtIS.SetEnabled(true);
            }
         }
         function ddlSelectfileCDSL_OnSelectedValueChanged()
         {
            if (document.getElementById('<%=ddlselectfileCDSL.ClientID %>').value == 1)
            {
                document.getElementById('<%=btnExport.ClientID %>').value = 'Export CDAS File';
            }
            if (document.getElementById('<%=ddlselectfileCDSL.ClientID %>').value == 2)
            {
                document.getElementById('<%=btnExport.ClientID %>').value = 'Export EASIEST File';
            }
            if (document.getElementById('<%=ddlselectfileCDSL.ClientID %>').value == 3)
            {
                if (document.getElementById('<%=rbtnCombined.ClientID %>').checked)
                {
                    alert("This Facility not Available in Combined Format!!!");
                    document.getElementById('<%=ddlselectfileCDSL.ClientID %>').selectedIndex=0;
                    document.getElementById('<%=btnExport.ClientID %>').value = 'Export CDAS File';
                }
                else
                    document.getElementById('<%=btnExport.ClientID %>').value = 'Export Ekool File';
            }
           
            
        }
        BatchNumber='';
        TotalInstruction='';
        function imgSplitbatch_Click(batchNumber,NoOfInstruction)
        {
           BatchNumber=batchNumber;
           TotalInstruction=NoOfInstruction;
           SetinnerHTML("Row0_Col1","Batch Number : "+BatchNumber +" . No Of Instrunction : "+ TotalInstruction+ ".");
           //Initialize PopUp
           HideShow("Row2_Col1","H");
           ctxtRatio1.SetText('0000000000000');
           ctxtRatio2.SetText('0000000000000');
           cPopUpSplitBatch.Show();
        }
        function BtnSplit_Click()
        {
            var Ratio1=ctxtRatio1.GetText();
            var Ratio2=ctxtRatio2.GetText();
            if(TotalInstruction==1)
            {
                SetinnerHTML("Row2_Col1","This Batch Can Not Be Splitted!!!.");
                HideShow("Row2_Col1","S");
            }
            else if(parseInt(Ratio1)+parseInt(Ratio2)==TotalInstruction)
            {
                cCbp_SplitBatch.PerformCallback("BatchSplit~"+BatchNumber);
                HideShow("Row2_Col1","H");
            }
            else
            {
                SetinnerHTML("Row2_Col1","Given Ratio is Not Properly Created.Please Try Again!!!.");
                HideShow("Row2_Col1","S");
            }
        }
        function Cbp_SplitBatch_EndCallBack()
        {
             cPopUpSplitBatch.Hide();
        }
        function NSDLEkool_MultipleBatchChecking()
        {
            InitializeNsdlSlips();
            HideShow("CSB_Row1_Col1","S");
            SetinnerHTML("CSB_Row1_Col1","Please Select Same (Transactions Type and Transfer Type) At One Time in NSDL Ekool Batch Export!!!.");
        }
        function Initialize_NSDLEKool()
        {
            ///Code For NSDL-Ekool
            HideShow("CSB_Row1_Col1","H");
            SetinnerHTML("CSB_Row1_Col1","");  
        }
    </script>
<%--New Work 04/10/2024--%>
</head>    
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
<%--End of New Work 04/10/2024--%>
    <form id="form1" runat="server" autocomplete="off">
        <%--New Work 04/10/2024--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
        </asp:ScriptManager>
        <%--End of New Work 04/10/2024--%>
        <div>        
            <table class="TableMain100" border="1">
                <tr>
                    <td colspan="4" style="text-align: center; vertical-align: top; " class="EHEADER">
                        <span style="color: #3300cc"><strong>Export Demat Transactions</strong></span>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top;  background-color: #b7ceec; text-align: left">
                        Select Transaction Type :
                    </td>
                    <td align="left" style="vertical-align: top" width="28%">
                                    <asp:DropDownList ID="ddlTrans" runat="server" AutoPostBack="false" onchange="OnSelectedValueChanged1();">
                                        <asp:ListItem Text="Normal Transactions" Value="1" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="POA/DDPI Transactions" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Pay-In Instructions On Speed-E [e-DIS format]" Value="3"></asp:ListItem>
                                    </asp:DropDownList></td>
                    <td colspan="2" style="vertical-align: top">
                                    <table id="tblClientType" width="100%">
                                        <tr>
                                            <td width="25%" style="vertical-align: top;  background-color: #b7ceec; text-align: left">
                                                Select POA/DDPI Client Type :
                                            </td>
                                            <td width="2%">
                                                <asp:RadioButton ID="rbtnNSDL" runat="server" Checked="true" onclick="OnTypeChange('POA-NSDL');"
                                                    GroupName="Trans" />
                                            </td>
                                            <td width="5%" style="vertical-align: top;  background-color: #b7ceec; text-align: left">
                                                NSDL</td>
                                            <td width="2%">
                                                <asp:RadioButton ID="rbtnCDSL" runat="server" onclick="OnTypeChange('POA-CDSL');"
                                                    GroupName="Trans" />
                                            </td>
                                            <td>
                                                CDSL</td>
                                        </tr>
                                    </table>
                    </td>
                </tr>
                <tr id="trAcc">
                    <td style="text-align: left; vertical-align: top;  background-color: #b7ceec;">
                        Enter Account :
                    </td>
                    <td align="left" width="28%" style="vertical-align: top">
                        <asp:TextBox ID="txtAccName" runat="server" TabIndex="0" Width="329px"
                            onkeyup="CallAjax(this,'DPAccountsID_DPID_ClientId_CMBPID',event);"></asp:TextBox>
                        <asp:TextBox ID="txtAccName_hidden" runat="server" Width="14px"></asp:TextBox>
                    </td>
                    <td colspan="2" style="vertical-align: top" >
                        <blink><div id="DvExecDateValidation" class="Info" height></div></blink>
                    </td>
                </tr>
                <tr id="trDate">
                    <td style="text-align: left; vertical-align: top;  background-color: #b7ceec;">
                        Enter Transaction Date :
                    </td>
                    <td align="left" style="vertical-align: top">
                        
                        <dxe:ASPxDateEdit ID="txtDate" runat="server" ClientInstanceName="e1" Width="130px"
                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" AllowNull="False"
                            Height="25px">
                            <buttonstyle width="13px"></buttonstyle>
                            <clientsideevents valuechanged="function(s, e) {OnDateChanged();}" LostFocus="function(s, e) {OnExecDateChanged();}"  />
                        </dxe:ASPxDateEdit>
                       
                    </td>
                    <td style="text-align: left; vertical-align: top;  background-color: #b7ceec;">
                        Enter Execution Date :
                    </td>
                    <td align="left" style="width: 397px">
                    
                        
                        <dxe:ASPxDateEdit ID="txtExecDate"  runat="server" ClientInstanceName="e2" Width="130px"
                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" AllowNull="False"
                            Height="25px">
                            <buttonstyle width="13px"></buttonstyle>
                            <clientsideevents ValueChanged="function(s, e) {OnExecDateChanged();}" />
                        </dxe:ASPxDateEdit>
                        
                        
                    </td>
                </tr>
                <tr id="trCdslTransType">
                    <td colspan="4">
                        <table width="100%" border="1">
                            <tr>
                                
                                <td width="20%" style="vertical-align: top;  background-color: #b7ceec; text-align: left; height: 57px;">
                                    Select CDSL Transaction Type :
                                </td>
                                 <td width="2%" style="height: 57px">
                                    <asp:RadioButton ID="rbtnCombined" runat="server" Checked="true" onclick="OnTypeChange('Combined-CDSL');"
                                        GroupName="cdsl" />
                                </td>
                                <td width="10%" style="vertical-align: top;  background-color: #b7ceec; text-align: left; height: 57px;">
                                    Combined</td>
                                <td width="2%" style="height: 57px">
                                    <asp:RadioButton ID="rbtnInterDP" runat="server" onclick="OnTypeChange('InterDP-CDSL');"
                                        GroupName="cdsl" />
                                </td>
                                <td width="10%" style="vertical-align: top;  background-color: #b7ceec; text-align: left; height: 57px;">
                                    Inter Depository</td>
                                <td width="2%" style="height: 57px">
                                    <asp:RadioButton ID="rbtnTrans" runat="server" onclick="OnTypeChange('OffMarket-CDSL');"
                                        GroupName="cdsl" />
                                </td>
                                <td style="vertical-align: top;  background-color: #b7ceec; text-align: left; height: 57px;">
                                    Off Market</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="display: none">
                    <td colspan="4">
                        <asp:Button ID="Button1" runat="server" Text="" OnClientClick="return CheckAccid();"
                            OnClick="Button1_Click" />
                        <%--<dxcp:ASPxCallbackPanel ID="Cbp_SplitBatch" runat="server" ClientInstanceName="cCbp_SplitBatch" 
                            LoadingPanelText="BatchSpliting in Progress Please Wait...…" OnCallback="Cbp_SplitBatch_Callback">
                            <ClientSideEvents EndCallback="function(s, e) {Cbp_SplitBatch_EndCallBack(); }" />
                            <PanelCollection>
                                <dxp:PanelContent runat="server">
                                  
                                </dxp:PanelContent>
                            </PanelCollection>
                        </dxcp:ASPxCallbackPanel>--%>
                    </td>
                </tr>
                <tr id="trSummary">
                    <td style="vertical-align: top;  background-color: #b7ceec; text-align: left">
                        Select Batch to Generate :
                    </td>
                    <td colspan="3">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gridSummary" runat="server" AutoGenerateColumns="False" DataKeyNames="DematTransactions_BatchNumber"
                                    BackColor="PeachPuff" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px"
                                    EmptyDataText="No Record Found." OnRowCommand="gridSummary_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Select Batch To Generate" ControlStyle-Width="10%"
                                            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="center">
                                            <ItemTemplate>
                                                <%--<img id="imgSplitbatch" width="20px" height="20px" src="../images/split1.jpg" onclick="imgSplitbatch_Click('<%# Eval("DematTransactions_BatchNumber") %>','<%# Eval("count_batch") %>');"  />--%>
                                                <asp:CheckBox ID="chb1" runat="server" onclick="RegenBatch(this);" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Batch Number" DataField="DematTransactions_BatchNumber" />
                                        <asp:BoundField HeaderText="Slip Number" DataField="DematTransactions_SlipNumber" />
                                        <asp:BoundField HeaderText="Transactions Type" DataField="DematTransactions_Type" />
                                        <asp:BoundField HeaderText="Transfer Type" DataField="DematTransactions_TransferType" />
                                        <asp:BoundField HeaderText="Number of Instructions" DataField="count_batch" />
                                        <asp:BoundField HeaderText="Batch Export DateTime" DataField="DematTransactions_BatchExportDate" />
                                        <asp:ButtonField CommandName="Select" Text="Print" ControlStyle-Font-Underline="true"
                                            ControlStyle-ForeColor="blue" />
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Button1" />
                                <asp:AsyncPostBackTrigger ControlID="btnExport" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr id="trNextBatch">
                    <td style="vertical-align: top;  background-color: #b7ceec; text-align: left">
                        Next Available Batch Number :
                    </td>
                    <td style="vertical-align: top;  background-color: #b7ceec; text-align: left">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txtNextBatch" runat="server" MaxLength="7" Width="250px" Font-Size="12px"
                                    ReadOnly="true" BackColor="peachPuff"></asp:TextBox>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Button1" />
                                <asp:AsyncPostBackTrigger ControlID="btnExport" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                    <td colspan="2" style="vertical-align: top;  background-color: #b7ceec; text-align: left">
                        <table id="tblBatchNumber" width="100%" border="1">
                            <tr>
                                <td width="2%" align="left">
                                    <asp:RadioButton ID="rbtnAvlBatch" runat="server" Checked="true" onclick="OnAvlBatchChange('UseAvlBatch');"
                                        GroupName="Batch" />
                                </td>
                                <td width="10%" align="left" style="vertical-align: top;  background-color: #b7ceec; text-align: left">
                                    Use it</td>
                                <td width="2%" align="left">
                                    <asp:RadioButton ID="rbtnNewBatch" runat="server" onclick="OnAvlBatchChange('NewBatch');"
                                        GroupName="Batch" />
                                </td>
                                <td align="left" style="vertical-align: top;  background-color: #b7ceec; text-align: left">
                                    Enter another Batch Number
                                </td>
                                <td id="tdBatch">
                                    <asp:TextBox ID="txtBatch" runat="server" MaxLength="7" Width="250px" Font-Size="12px" onkeypress="return onlyNumbers();"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="trNsdlSlip">
                    <td colspan="3">
                        <table width="100%" border="1">
                            <tr id="trMI">
                                <td width="20%" style="vertical-align: top;  background-color: #b7ceec; text-align: left">
                                    Market PayIn Slip No :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMI" runat="server" Text="" Width="250px"></asp:TextBox>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="ComboDISFrmtMI" runat="server" ClientInstanceName="cComboDISFrmtMI"
                                        EnableIncrementalFiltering="True" EnableSynchronization="False" SelectedIndex="0"
                                        TabIndex="0" ValueType="System.String" Width="100px" Font-Size="11px">
                                        <Items>
                                            <dxe:ListEditItem Text="New" Value="Y"></dxe:ListEditItem>
                                            <dxe:ListEditItem Text="Old" Value="N"></dxe:ListEditItem>
                                        </Items>
                                        <DropDownButton Text="DIS Format">
                                        </DropDownButton>
                                    </dxe:ASPxComboBox>
                                </td>
                                <td >
                                    <dxe:ASPxComboBox ID="ComboIsLoosedMI" runat="server" ClientInstanceName="cComboIsLoosedMI"
                                        EnableIncrementalFiltering="True" EnableSynchronization="False" SelectedIndex="0"
                                        TabIndex="0" ValueType="System.String" Width="100px" Font-Size="11px">
                                        <Items>
                                            <dxe:ListEditItem Text="No" Value="0"></dxe:ListEditItem>
                                            <dxe:ListEditItem Text="Yes" Value="1"></dxe:ListEditItem>
                                        </Items>
                                        <DropDownButton Text="Is Slip Loosed">
                                        </DropDownButton>
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr id="trIntra">
                                <td width="20%" style="vertical-align: top;  background-color: #b7ceec; text-align: left">
                                    Delivery To Client (Intra Depository) Slip No :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtIntra" runat="server" Text="" Width="250px"></asp:TextBox>
                                </td>
                                <td >
                                <dxe:ASPxComboBox ID="ComboDISFrmtIntra" runat="server" ClientInstanceName="cComboDISFrmtIntra"
                                        EnableIncrementalFiltering="True" EnableSynchronization="False" SelectedIndex="0"
                                        TabIndex="0" ValueType="System.String" Width="100px" Font-Size="11px">
                                            <Items>
                                                <dxe:ListEditItem Text="New" Value="Y"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Old" Value="N"></dxe:ListEditItem>
                                            </Items>
                                         <DropDownButton Text="DIS Format">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                </td>
                                <td >
                                <dxe:ASPxComboBox ID="ComboIsLoosedIntra" runat="server" ClientInstanceName="cComboIsLoosedIntra"
                                        EnableIncrementalFiltering="True" EnableSynchronization="False" SelectedIndex="0"
                                        TabIndex="0" ValueType="System.String" Width="100px" Font-Size="11px">
                                            <Items>
                                                <dxe:ListEditItem Text="No" Value="0"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Yes" Value="1"></dxe:ListEditItem>
                                            </Items>
                                            <DropDownButton Text="Is Slip Loosed">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                </td>
                            </tr>

                            <tr id="trIntraPP">
                                <td width="20%" style="vertical-align: top;  background-color: #b7ceec; text-align: left">
                                    Delivery To Client (PoolToPool Intra-DP) Slip No :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtIntraPP" runat="server" Text="" Width="250px"></asp:TextBox>
                                </td>
                                <td >
                                <dxe:ASPxComboBox ID="ComboDISFrmtIntraPP" runat="server" ClientInstanceName="cComboDISFrmtIntraPP"
                                        EnableIncrementalFiltering="True" EnableSynchronization="False" SelectedIndex="0"
                                        TabIndex="0" ValueType="System.String" Width="100px" Font-Size="11px">
                                            <Items>
                                                <dxe:ListEditItem Text="New" Value="Y"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Old" Value="N"></dxe:ListEditItem>
                                            </Items>
                                         <DropDownButton Text="DIS Format">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                </td>
                                <td >
                                <dxe:ASPxComboBox ID="ComboIsLoosedIntraPP" runat="server" ClientInstanceName="cComboIsLoosedIntraPP"
                                        EnableIncrementalFiltering="True" EnableSynchronization="False" SelectedIndex="0"
                                        TabIndex="0" ValueType="System.String" Width="100px" Font-Size="11px">
                                            <Items>
                                                <dxe:ListEditItem Text="No" Value="0"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Yes" Value="1"></dxe:ListEditItem>
                                            </Items>
                                            <DropDownButton Text="Is Slip Loosed">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                </td>
                            </tr>

                            <tr id="trInter">
                                <td width="20%" style="vertical-align: top;  background-color: #b7ceec; text-align: left">
                                    Delivery To Client (Inter Depository) Slip No :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtInter" runat="server" Text="" Width="250px"></asp:TextBox>
                                </td>
                                <td>
                                <dxe:ASPxComboBox ID="ComboDISFrmtInter" runat="server" ClientInstanceName="cComboDISFrmtInter"
                                        EnableIncrementalFiltering="True" EnableSynchronization="False" SelectedIndex="0"
                                        TabIndex="0" ValueType="System.String" Width="100px" Font-Size="11px">
                                            <Items>
                                                <dxe:ListEditItem Text="New" Value="Y"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Old" Value="N"></dxe:ListEditItem>
                                            </Items>
                                             <DropDownButton Text="DIS Format">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                </td>
                                <td>
                                <dxe:ASPxComboBox ID="ComboIsLoosedInter" runat="server" ClientInstanceName="cComboIsLoosedInter"
                                        EnableIncrementalFiltering="True" EnableSynchronization="False" SelectedIndex="0"
                                        TabIndex="0" ValueType="System.String" Width="100px" Font-Size="11px">
                                            <Items>
                                                <dxe:ListEditItem Text="No" Value="0"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Yes" Value="1"></dxe:ListEditItem>
                                            </Items>
                                            <DropDownButton Text="Is Slip Loosed">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                </td>
                            </tr>


                            <tr id="trIS">
                                <td width="20%" style="vertical-align: top;  background-color: #b7ceec; text-align: left">
                                    InterSettlement Slip No :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtIS" runat="server" Text="" Width="250px"></asp:TextBox>
                                </td>
                                 <td>
                                 <dxe:ASPxComboBox ID="ComboDISFrmtIS" runat="server" ClientInstanceName="cComboDISFrmtIS"
                                        EnableIncrementalFiltering="True" EnableSynchronization="False" SelectedIndex="0"
                                        TabIndex="0" ValueType="System.String" Width="100px" Font-Size="11px">
                                            <Items>
                                                <dxe:ListEditItem Text="New" Value="Y"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Old" Value="N"></dxe:ListEditItem>
                                            </Items>
                                             <DropDownButton Text="DIS Format">
                                            </DropDownButton>
                                     </dxe:ASPxComboBox>
                                </td>
                                <td>
                                <dxe:ASPxComboBox ID="ComboIsLoosedIS" runat="server" ClientInstanceName="cComboIsLoosedIS"
                                        EnableIncrementalFiltering="True" EnableSynchronization="False" SelectedIndex="0"
                                        TabIndex="0" ValueType="System.String" Width="100px" Font-Size="11px">
                                            <Items>
                                                <dxe:ListEditItem Text="No" Value="0"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Yes" Value="1"></dxe:ListEditItem>
                                            </Items>
                                            <DropDownButton Text="Is Slip Loosed">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="trCdslSlip">
                    <td style="text-align: left; vertical-align: top;  background-color: #b7ceec;">
                        Enter Slip Number :
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtSlipCdsl" runat="server" TabIndex="3" Width="250px" Font-Size="12px"></asp:TextBox>
                    </td>
                    <td>
                        <dxe:ASPxComboBox ID="ComboDISFrmtCDSL" runat="server" ClientInstanceName="cComboDISFrmtCDSL"
                            EnableIncrementalFiltering="True" EnableSynchronization="False" SelectedIndex="0"
                            TabIndex="0" ValueType="System.String" Width="100px" Font-Size="11px">
                                <Items>
                                    <dxe:ListEditItem Text="New" Value="Y"></dxe:ListEditItem>
                                    <dxe:ListEditItem Text="Old" Value="N"></dxe:ListEditItem>
                                </Items>
                                 <DropDownButton Text="DIS Format">
                                </DropDownButton>
                         </dxe:ASPxComboBox>
                    </td>
                    <td style="width: 397px">
                        <dxe:ASPxComboBox ID="ComboIsLoosedCDSL" runat="server" ClientInstanceName="cComboIsLoosedCDSL"
                            EnableIncrementalFiltering="True" EnableSynchronization="False" SelectedIndex="0"
                            TabIndex="0" ValueType="System.String" Width="100px" Font-Size="11px">
                                <Items>
                                    <dxe:ListEditItem Text="No" Value="0"></dxe:ListEditItem>
                                    <dxe:ListEditItem Text="Yes" Value="1"></dxe:ListEditItem>
                                </Items>
                                <DropDownButton Text="Is Slip Loosed">
                             </DropDownButton>
                         </dxe:ASPxComboBox>
                    </td>
                </tr>
                <tr id="trEDIS">
                    <td style="text-align: left; vertical-align: top;  background-color: #b7ceec;">
                        Enter E-DIS Slip Number :
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtEDIS" runat="server" TabIndex="0" Width="250px" Font-Size="12px"></asp:TextBox>
                    </td>
                </tr>
                <tr id="trOperatorId">
                    <td style="text-align: left; vertical-align: top;  background-color: #b7ceec;">
                        Enter OperatorID :
                    </td>
                    <td>
                        <asp:TextBox ID="txtOperatorId" Text="" Width="250px" runat="server" MaxLength="6"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                    <td style="width: 397px">
                    </td>
                </tr>
                <tr id="trVersion">
                    <td style="vertical-align: top;  background-color: #b7ceec; text-align: left">
                        Select Batch Export Version :
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlVersion" runat="server" Width="90px">
                            <asp:ListItem Text="E-DPM" Value="E-DPM"></asp:ListItem>
                            <asp:ListItem Text="DPM (Old)" Value="DPM(Old)"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                    <td style="width: 397px">
                    </td>
                </tr>
                <tr id="trselectfile">
                    <td style="vertical-align: top;  background-color: #b7ceec; text-align: left">
                        Select File Type</td>
                    <td>
                        <asp:DropDownList ID="ddlselectfile" runat="server" onchange="OnSelectedValueChanged(this.value);"
                            Width="100px">
                            <asp:ListItem>NSDL</asp:ListItem>
                            <asp:ListItem>SPEED-E</asp:ListItem>
                            <asp:ListItem>EKOOL</asp:ListItem>
                            <asp:ListItem>SPICE</asp:ListItem>
                            <%--New Work 04/10/2024--%>
                            <asp:ListItem>NSDLUDIFF</asp:ListItem>
                            <%--End of New Work 04/10/2024--%>
                        </asp:DropDownList></td>
                    <td>
                    </td>
                    <td style="width: 397px">
                    </td>
                </tr>
                <tr id="trselectfile_cdsl">
                    <td style="vertical-align: top;  background-color: #b7ceec; text-align: left">
                        Select File Type</td>
                    <td>
                        <asp:DropDownList ID="ddlselectfileCDSL" runat="server" onchange="ddlSelectfileCDSL_OnSelectedValueChanged()"
                            Width="90px">
                            <asp:ListItem Text="CDAS" Value="1"></asp:ListItem>
                            <asp:ListItem Text="EASIEST" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Ekool" Value="3"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                    </td>
                    <td style="width: 397px">
                    </td>
                </tr>
                <tr id="trBtn">
                    <td colspan="4" align="left">
                        <asp:Button ID="btnExport" CssClass="btnUpdate" runat="server" Text="Export" OnClientClick="return CheckTypes();"
                            OnClick="btnExport_Click" />
                    </td>
                </tr>
                <%--New Work 04/10/2024--%>
                <tr id="trBtnNSDLUDIFF">
                    <td colspan="4" align="left">
                        <asp:Button ID="btnExportNSDLUDIFF" CssClass="btnUpdate" runat="server" Text="Export NSDLUDIFF File" OnClientClick="return CheckTypesNSDLUDIFF();"
                            OnClick="btnExportNSDLUDIFF_Click" />
                    </td>
                </tr>
                <%--End of New Work 04/10/2024--%>
                <tr id="trDownload" style="display: none">
                    <td colspan="2" align="left">
                        <asp:Button ID="btnDownload" runat="server" Text="" OnClick="btnDownload_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="lblMessage" Text="" ForeColor="red" runat="server" />
                        
                    </td>
                </tr>
            </table>
            <%--<asp:Button ID="test" runat="server" Text="test" OnClick="test_Click" />--%>
            <asp:HiddenField ID="hidAccId" runat="server" />
            <asp:HiddenField ID="hidBatchToGenerate" runat="server" />
            <asp:HiddenField ID="hidNewBatchNum" runat="server" />
            <asp:HiddenField ID="hidType" runat="server" />
            <asp:HiddenField ID="hdn_OperatorID" runat="server" />
            <%--New Work 25/11/2022--%>
            <asp:HiddenField ID="hidTransactionBatch" runat="server" />
            <%--End of New Work 25/11/2022--%>
            
        </div>
        <div>
         <dxpc:ASPxPopupControl id="PopUpSplitBatch" runat="server" Height="140px" Width="515px" ClientInstanceName="cPopUpSplitBatch" HeaderText="Split Batch">
            <ContentCollection>
                <dxpc:PopupControlContentControl runat="server">
                     <div id="Row0_Col1" class="Header">
                        
                    </div>
                    <div id="Row1_Col1" class="LFloat_Lable" style="width: 100px">
                        Enter Ratio :
                    </div>
                    <div id="Row1_Col2" class="LFloat_Content" style="width: 100px">
                        <dxe:aspxtextbox runat="server" id="txtRatio1" clientinstancename="ctxtRatio1" width="95px">
                            <masksettings mask="&lt;0..999g&gt;" />
                        </dxe:aspxtextbox>
                    </div>
                    <div id="Row1_Col3" class="LFloat_Content" style="width: 100px">
                        <dxe:aspxtextbox runat="server" id="txtRatio2" clientinstancename="ctxtRatio2" width="95px">
                            <masksettings mask="&lt;0..999g&gt;" />
                        </dxe:aspxtextbox>
                    </div>
                    <div id="Row1_Col4" class="Content" style="width: 100px">
                        <dxe:ASPxButton accessKey="G" id="BtnSplit" runat="server" ClientInstanceName="cBtnSplit" Text="Split" CssClass="Button" UseSubmitBehavior="False" AutoPostBack="False" width="95%">
                            <clientsideevents click="function(s, e) {BtnSplit_Click();}"></clientsideevents>
                        </dxe:ASPxButton>
                    </div>
                    <br />
                    <div id="Row2_Col1" class="Info" style="display:none;height:auto" >
                        
                    </div>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        </div>
        <div class="Error" id="CSB_Row1_Col1" style="display:none;">
            </div>
    </form>
</body>
</html>
