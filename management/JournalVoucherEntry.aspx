
<%@ page language="C#" autoeventwireup="true" inherits="management_journalvoucherentry, App_Web_kqhq1k1d" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Journal</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

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
		z-index:100;
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
		position:absolute ;
		z-index:5;
	}
	
	form{
		display:inline;
	}
	


	</style>

    <script language="javascript" type="text/javascript">
        function SignOff()
        {
         window.parent.SignOff();
        }
        var isCtrl = false;
        document.onkeyup=function(e)
        {
	        if(event.keyCode == 17) 
	        {
	            isCtrl=false;
	        }
	        if(event.keyCode == 27)
	        {
	            btnCancel_Click();
	        }
        }
        document.onkeydown=function(e)
        {
	        if(event.keyCode == 17) isCtrl=true;
	        if(event.keyCode == 83 && isCtrl == true) 
	        {
		        //run code for CTRL+S -- ie, save!
		        var debit=document.getElementById('txtTDebit').value;
		        var credit=document.getElementById('txtTCredit').value;
		        if(debit==credit)
		        {
		            document.getElementById('btnSave').click();    
		            return false;
		        }
		        else
		        {
		            alert('Credit And Debit Must Be Same');
		            return false
		        }
	        }
        } 
        function height()
        {
            if(document.body.scrollHeight>=300)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '300px';
            window.frameElement.Width = document.body.scrollWidth;
        }     
        function CallList(obj1,obj2,obj3)
         {
            ajax_showOptions(obj1,obj2,obj3);    
         }  
         function updateEditorText() 
         {
            var code=txtAccountCode.GetText().toUpperCase();
            if(code=='X' || code=='Y' || code=='Z' || code=='V' || code=='U' || code=='T' || code=='R' || code=='Q' || code=='R' || code=='S')
            {
                alert('{T,U,V,W,X,Y,Z,P,Q,R,S} are Reserved Key');
                txtAccountCode.SetText('JV');
            }
         }
         function CallMainAccount(obj1,obj2,obj3)
         {
            ajax_showOptions(obj1,obj2,obj3,null,'Main');
         }
         function CallSubAccount(obj1,obj2,obj3)
         {
            var valSub;
            var HdVal=document.getElementById("hddnEdit").value;
            if(HdVal=='Edit')
            {
               var BranchID=document.getElementById("ddlBranch").value;
               valSub=val+'~'+BranchID;
            }
            else
               valSub=val+'~'+'N'; 
            ajax_showOptions(obj1,obj2,obj3,valSub,'Main');
         } 
         function CallMainAccountE(obj1,obj2,obj3)
         {
           ajax_showOptions(obj1,obj2,obj3,null,'Main');
         }
         function CallSubAccountE(obj1,obj2,obj3)
         {
            var valSub;
            valSub=valE+'~'+'N'; 
            ajax_showOptions(obj1,obj2,obj3,valSub,'Main');
         } 
         function keyVal(obj)
         {
            //alert(obj);
            var spObj=obj.split('~');
            var WhichQuery=spObj[2];
            
            //alert(WhichQuery);
            if(WhichQuery=='MAINAC')
            {
                document.getElementById('txtsubaccount').value='';
                if(spObj[3]!='Edit')
                {
                    val=spObj[0];
                    valLedgerType=spObj[1];                
                    document.getElementById("txtMainAccount_hidden").value=val;  
                }
                else
                {
                    valE=spObj[0];
                    valLedgerTypeE=spObj[1]; 
                    document.getElementById("txtMainAccountE_hidden").value=val;  
                }
                if(valLedgerType.toUpperCase()=='NONE')
                {
                    document.getElementById('tdSubAccount').value='';
                    document.getElementById('tdSubAccount').style.display='none';
                    document.getElementById('tdlblSubAccount').style.display='none';
                    document.getElementById('hdn_MainAcc_Type').value='None';
                    document.getElementById('hdn_Brch_NonBrch').value='NAB';
                    document.getElementById('txtSubAccount_hidden').value='';
                }
                else
                {
                    document.getElementById('tdSubAccount').style.display='inline';
                    document.getElementById('tdlblSubAccount').style.display='inline';
                    document.getElementById('hdn_MainAcc_Type').value='NotNone';
                }
            }
            else if(WhichQuery=="SUBAC")
            {
                var Branch=spObj[1];
                document.getElementById('hdn_Brch_NonBrch').value=Branch;
                var MainAcCode=document.getElementById('txtMainAccount_hidden').value;
                var SubAc=document.getElementById('txtSubAccount_hidden').value;
                cCbpAcBalance.PerformCallback('AcBalance~'+MainAcCode+'~'+SubAc);
                //alert(Branch);
            }
            else
            {
                document.getElementById('hdn_Brch_NonBrch').value='NAB';
            }
         }
         function SubAccountCheck()
         {
            if(valLedgerType.toUpperCase()!='NONE')
            {
                var testSubAcc1=document.getElementById("txtSubAccount");
                if(testSubAcc1.value=='' || testSubAcc1.value=='No Record Found')
                {
                    alert('SubAccount Name Required !!!');
                    testSubAcc1.focus();
                    testSubAcc1.select();
                    return false;    
                }
             }
             var Withdraw=ctxtdebit.GetValue();
             var Receipt=ctxtcredit.GetValue();
             var WithReceipt=parseFloat(Withdraw)+parseFloat(Receipt);
             if(WithReceipt=="0")
             {
                alert('Debit/Credit  Required !!!');
                ctxtdebit.Focus();
                return false;    
             }
             tdadd.style.display='none'
             tdnew.style.display='inline'
             document.getElementById('btnnew').focus();
             var SubAccountBranch=document.getElementById('hdn_Brch_NonBrch').value;
             cDetailsGrid.PerformCallback('Add~'+SubAccountBranch);
         }
         function SubAccountCheckUpdate(obj)
         {
            var obj1=obj.split('_');
            if(valLedgerType.toUpperCase()!='NONE')
            {
                var obj2='grdAdd'+'_'+obj1[1]+'_'+'txtEditSubAccount';
                var testSubAcc1=document.getElementById(obj2);
                if(testSubAcc1.value=='')
                {
                    alert('SubAccount Name Required !!!');
                    testSubAcc1.focus();
                    testSubAcc1.select();
                    return false;    
                }
             }
             var Withdraw=txtEditWithdraw.GetValue();
             var Receipt=txtEditRecpt.GetValue();
             var WithReceipt=parseFloat(Withdraw)+parseFloat(Receipt);
             if(WithReceipt=="0")
             {
                alert('Debit/Credit  Required !!!');
                return false;    
             }
         }
         function btnCancel_Click()
         {
            var answer = confirm ("Do you Want To Close This Window?");
            if (answer)
                parent.editwin.close();
         }
         function Page_Load()
         {
            document.getElementById("btnSave").disabled=true;
            document.getElementById("btnInsert").disabled=true;
         }
         function Page_Load1()
         {
            document.getElementById("tdSeg1").style.display="none";
            document.getElementById("tdSeg2").style.display="none";
         }
         function Button_Click()
         {
            document.getElementById("btnSave").disabled=false;
            document.getElementById("btnInsert").disabled=false;
         }
         function SetSubAcc1(obj)
         {
            var s=document.getElementById('txtSubAccount');
            s.focus();
            s.select();
         }
//         function keyVal1(obj)
//         {s
//            alert(obj);
//            val=obj
//         }
         function PopulateData()
            {
                parent.RefreshGrid();
            }
         function Narration(obj)
         {
            document.getElementById("txtNarration1").value=obj;
         }
         function Narration1()
         {
            document.getElementById("txtNarration1").value='';
         }
         function overChange(obj)
         {
            obj.style.backgroundColor = "#FFD497";
         }
         function OutChange(obj)
         {
            obj.style.backgroundColor = "#DDECFE";
         }
         function focusval(obj)
         {
            if(obj!='0.00')
            {
               ctxtcredit.SetEnabled(false);  
               ctxtcredit.SetText('0000000000.00');            
               OnlyPayment(obj,'Dr');
            }
            else
            {
                 ctxtcredit.SetEnabled(true);
            }
         }
         function focusval1(obj)
         {
            if(obj!='0.00')
            {
                ctxtdebit.SetEnabled(false);
                ctxtdebit.SetText('0000000000.00');
                OnlyPayment(obj,'Cr');
            }
            else    
            {
                ctxtdebit.SetEnabled(true);
            }
         }
         
         function Efocusval(obj)
         {
            if(obj!='0.00')
            {
                ctxtcreditE.SetEnabled(false);  
                ctxtcreditE.SetText('0.00');              
            }
            else
            {
                 ctxtcreditE.SetEnabled(true);
            }
         }
         function Efocusval1(obj)
         {
            if(obj!='0.00')
            {
                ctxtdebitE.SetEnabled(false);
                ctxtdebitE.SetText('0.00');
            }
            else    
            {
                ctxtdebitE.SetEnabled(true);
            }
         }
         function SelectSegment()
         {
            var obj=document.getElementById('ddlIntExchange').value;
            if(obj=="0")
            {
                document.getElementById("tdSeg1").style.display="none";
                document.getElementById("tdSeg2").style.display="none";
                txtAccountCode.SetText('JV');
                txtAccountCode.SetEnabled(true);
            }
            else    
            {
                document.getElementById("tdSeg1").style.display="inline";
                document.getElementById("tdSeg2").style.display="inline";
                txtAccountCode.SetText('YF');
                txtAccountCode.SetEnabled(false);
            }
         }
         function SegmentName()
         {
            var obj=document.getElementById('ddlSegment').value;
            var obj1=document.getElementById('ddlTntraExchange').value;
            if(obj==obj1)
            {
                alert('Segment And Segment2 Must Be Different');
                document.getElementById('ddlTntraExchange').selectedIndex='0';
                return false;
            }
         }
         function Narration_Off()
         {
             document.getElementById('TrNarration').style.display='none';
         }
         function Narration_Val(obj)
         {
            document.getElementById('TrNarration').style.display='inline';
            document.getElementById('txtNarration1').value=obj;
         }
         function dateStringToTime(dateStr) {
	        year = dateStr.substring(6, 8);
	        month = dateStr.substring(0, 2);
	        day = dateStr.substring(3, 5);
        	
	        return new Date(year, month, day).getTime();
        }

            ////This Method is Used For Checking Lock Date and Financial Year and Alert User For That if Date OutSide
         function DateChange()
         {
            
                if(cComboMode.GetValue()!=1)
                {
                    var SelectedDate = new Date(tDate.GetDate());
                    var monthnumber = SelectedDate.getMonth();
                    var monthday    = SelectedDate.getDate();
                    var year        = SelectedDate.getYear();
                    
                    var SelectedDateValue=new Date(year, monthnumber, monthday);
                    ///Checking of Transaction Date For MaxLockDate
                    var MaxLockDate=new Date('<%=Session["LCKJV"]%>');
                    monthnumber = MaxLockDate.getMonth();
                    monthday    = MaxLockDate.getDate();
                    year        = MaxLockDate.getYear();
                    var MaxLockDateNumeric=new Date(year, monthnumber, monthday).getTime();
    //                alert('TransactionDate='+TransactionDate+'\n'+'MaxLockDate= '+MaxLockDate);
                    //alert(ValueDate+'~'+ValueDateNumeric+'~'+VisibleIndexE);
                    if(SelectedDateValue<=MaxLockDateNumeric)
                    {
                        alert('This Entry Date has been Locked.');
                        MaxLockDate.setDate(MaxLockDate.getDate() + 1);
                        tDate.SetDate(MaxLockDate);
                        return;
                    }
                }
                
                var FYS ="<%=Session["FinYearStart"]%>";
                var FYE ="<%=Session["FinYearEnd"]%>"; 
                var LFY ="<%=Session["LastFinYear"]%>";
                var SelectedDate = new Date(tDate.GetDate());
                var FinYearStartDate = new Date(FYS);
                var FinYearEndDate = new Date(FYE);
                var LastFinYearDate=new Date(LFY);
                
                var monthnumber = SelectedDate.getMonth();
                var monthday    = SelectedDate.getDate();
                var year        = SelectedDate.getYear();
                
                var SelectedDateValue=new Date(year, monthnumber, monthday);
                
                monthnumber = FinYearStartDate.getMonth();
                monthday    = FinYearStartDate.getDate();
                year        = FinYearStartDate.getYear();
                var FinYearStartDateValue=new Date(year, monthnumber, monthday);
                
              
                monthnumber = FinYearEndDate.getMonth();
                monthday    = FinYearEndDate.getDate();
                year        = FinYearEndDate.getYear();
                var FinYearEndDateValue=new Date(year, monthnumber, monthday);
                
//                alert('SelectedDateValue :'+SelectedDateValue.getTime()+
//                '\nFinYearStartDateValue :'+FinYearStartDateValue.getTime()+
//                '\nFinYearEndDateValue :'+FinYearEndDateValue.getTime());
                
                var SelectedDateNumericValue=SelectedDateValue.getTime();
                var FinYearStartDateNumericValue=FinYearStartDateValue.getTime();
                var FinYearEndDatNumbericValue=FinYearEndDateValue.getTime();
                if(SelectedDateNumericValue>=FinYearStartDateNumericValue && SelectedDateNumericValue<=FinYearEndDatNumbericValue)
                {
 //                   alert('Between');
                }
                else
                {
                   alert('Enter Date Is Outside Of Financial Year !!');
                   if(SelectedDateNumericValue<FinYearStartDateNumericValue)
                   {
                        tDate.SetDate(new Date(FinYearStartDate));
                   }
                   if(SelectedDateNumericValue>FinYearEndDatNumbericValue)
                   {
                        tDate.SetDate(new Date(FinYearEndDate));
                   }
                }
          }
          ////This Method is Used For Checking Lock Date and Financial Year and With Out Alert User Change Date if Date OutSide(2012-04-07)
          function DateChange_WithOutAlert()
         {
            
                if(cComboMode.GetValue()!=1)
                {
                    var SelectedDate = new Date(tDate.GetDate());
                    var monthnumber = SelectedDate.getMonth();
                    var monthday    = SelectedDate.getDate();
                    var year        = SelectedDate.getYear();
                    
                    var SelectedDateValue=new Date(year, monthnumber, monthday);
                    ///Checking of Transaction Date For MaxLockDate
                    var MaxLockDate=new Date('<%=Session["LCKJV"]%>');
                    monthnumber = MaxLockDate.getMonth();
                    monthday    = MaxLockDate.getDate();
                    year        = MaxLockDate.getYear();
                    var MaxLockDateNumeric=new Date(year, monthnumber, monthday).getTime();
    //                alert('TransactionDate='+TransactionDate+'\n'+'MaxLockDate= '+MaxLockDate);
                    //alert(ValueDate+'~'+ValueDateNumeric+'~'+VisibleIndexE);
                    if(SelectedDateValue<=MaxLockDateNumeric)
                    {
                        MaxLockDate.setDate(MaxLockDate.getDate() + 1);
                        tDate.SetDate(MaxLockDate);
                        return;
                    }
                }
                
                var FYS ="<%=Session["FinYearStart"]%>";
                var FYE ="<%=Session["FinYearEnd"]%>"; 
                var LFY ="<%=Session["LastFinYear"]%>";
                var SelectedDate = new Date(tDate.GetDate());
                var FinYearStartDate = new Date(FYS);
                var FinYearEndDate = new Date(FYE);
                var LastFinYearDate=new Date(LFY);
                
                var monthnumber = SelectedDate.getMonth();
                var monthday    = SelectedDate.getDate();
                var year        = SelectedDate.getYear();
                
                var SelectedDateValue=new Date(year, monthnumber, monthday);
                
                monthnumber = FinYearStartDate.getMonth();
                monthday    = FinYearStartDate.getDate();
                year        = FinYearStartDate.getYear();
                var FinYearStartDateValue=new Date(year, monthnumber, monthday);
                
              
                monthnumber = FinYearEndDate.getMonth();
                monthday    = FinYearEndDate.getDate();
                year        = FinYearEndDate.getYear();
                var FinYearEndDateValue=new Date(year, monthnumber, monthday);
                
//                alert('SelectedDateValue :'+SelectedDateValue.getTime()+
//                '\nFinYearStartDateValue :'+FinYearStartDateValue.getTime()+
//                '\nFinYearEndDateValue :'+FinYearEndDateValue.getTime());
                
                var SelectedDateNumericValue=SelectedDateValue.getTime();
                var FinYearStartDateNumericValue=FinYearStartDateValue.getTime();
                var FinYearEndDatNumbericValue=FinYearEndDateValue.getTime();
                if(SelectedDateNumericValue>=FinYearStartDateNumericValue && SelectedDateNumericValue<=FinYearEndDatNumbericValue)
                {
 //                   alert('Between');
                }
                else
                {
                   if(SelectedDateNumericValue<FinYearStartDateNumericValue)
                   {
                        tDate.SetDate(new Date(FinYearStartDate));
                   }
                   if(SelectedDateNumericValue>FinYearEndDatNumbericValue)
                   {
                        tDate.SetDate(new Date(FinYearEndDate));
                   }
                }
          }
          function AcBalance(obj)
          {
          
                var comp=document.getElementById('hdnCompanyid').value;
                var segmnt=document.getElementById('hdnSegmentid').value;
                var date=document.getElementById('tDate_I').value; 
                var dest=document.getElementById('CbpAcBalance'); 
                var Suba=obj+"_hidden";
                var SubAcc=document.getElementById(Suba).value;
                var param=comp+'~'+segmnt+'~'+date+'~'+val+'~'+SubAcc;
                //alert(param);;
                PageMethods.GetContactName(param, CallSuccess, CallFailed, dest);
          }
          function AcBalance1(obj)
          {
            if(valLedgerType.toUpperCase()=='NONE')
            {
                var comp=document.getElementById('hdnCompanyid').value;
                var segmnt=document.getElementById('hdnSegmentid').value;
                var date=document.getElementById('tDate_I').value; 
                var dest=document.getElementById('CbpAcBalance'); 
                var Suba=obj+"_hidden";
                var SubAcc=document.getElementById(Suba).value;
                var param=comp+'~'+segmnt+'~'+date+'~'+val+'~'+'';
                //alert(param);;
                PageMethods.GetContactName(param, CallSuccess, CallFailed, dest);
            }
          }
          function CallSuccess(res, destCtrl)
          { 
              //destCtrl.innerText=res;
              var cc=res.substr(0, 1);
              if(cc=='-')
              {
                 //cc=res * (-1);
                 cc=res +' (DR)';
                 lbltype='DR';
                 destCtrl.innerText=cc;
                 destCtrl.style.color='red';
              }
              else
              {
                 cc=res+' (CR)';
                 lbltype='CR';
                 destCtrl.innerText=cc;
                 destCtrl.style.color='blue';
              }
              lblval=res;
          }
          function CallFailed(res, destCtrl)
          {
              alert(res.get_message());
          }
          function alertMessage()
          {
                alert('This Voucher has multi branch enters.\n Please Provide a single account for counter entry !!')
          }
          function btnInsert_Click()
          {
               document.getElementById('Div1').style.display='inline';
               document.getElementById('btnInsert').disabled=true;
               document.getElementById('btnSave').click();
          }
          function AlertAfterInsert()
            {
                var answer = confirm ("Do You Want To Print this page??");
                if (answer)
                {
                   document.getElementById('btnPrint').click();
                } 
            }
          function OnlyPayment(obj,objType)
            {
                if(lbltype=='DR' && objType=="Cr")
                {
                    var str=lblval;
                    str=str.replace(",", "");
                    str=Math.abs(str);
                    if(parseFloat(str)<parseFloat(obj))
                    {
                        document.getElementById('bDrCrStatus').innerHTML = '(Credit Is Greater Than Debit)';
                        document.getElementById('bDrCrStatus').style.font = "red";
                    }
                    else
                    {
                         document.getElementById('bDrCrStatus').innerHTML = '';
                    }
                }
                if(lbltype=='CR' && objType=="Dr")
                {
                    var str=lblval;
                    str=str.replace(",", "");
                    str=Math.abs(str);
                    if(parseFloat(str)<parseFloat(obj))
                    {
                        document.getElementById('bDrCrStatus').innerHTML = '(Debit Is Greater Than Credit)';
                        document.getElementById('bDrCrStatus').style.font = "blue";
                    }
                    else
                    {
                         document.getElementById('bDrCrStatus').innerHTML = '';
                    }
                }
            }
            function OnlyNarration(obj1,obj2,obj3)
             {
                ajax_showOptions(obj1,obj2,obj3);    
             }
         FieldName='txtPrefix';
         function AddButtonClick()
         {
            cDetailsGrid.PerformCallback('Add');
         }
         function CancelButtonClick()
         {
            Asp_SetSpace('txtMainAccount');
            Asp_SetSpace('txtSubAccount');
            document.getElementById('txtMainAccount').focus();
         }
         function SaveButtonClick()
         {
            if(cDetailsGrid.GetVisibleRowsOnPage() != '0' )
            {
               cDetailsGrid.PerformCallback('Save');
               
            }
            else
            {
                alert('Please Add Atleast Single Record First');
                document.getElementById('txtMainAccount').focus();
            }
            
         }
         function DiscardButtonClick()
         {
           var data='Are You Sure.It will Discard All Data You Entered';
           var answer = confirm(data)
	       if (answer)
	       {
             cDetailsGrid.PerformCallback('Discard');
           }
         }
         function RefreshButtonClick()
         {
            var data='Back To Initial Position?';
            var answer = confirm(data)
            if (answer)
            {
             document.getElementById('txtMainAccount').style.display='none';
             if(cDetailsGrid.GetVisibleRowsOnPage() != '0' )
             {   
              cDetailsGrid.PerformCallback('DiscardOnRefresh');
             }
             TblMainEntryForm.style.display="none";
             var SelectedValue=cComboMode.GetValue();
             if(SelectedValue=="1")
             {
              tdEntryButton.style.display="none";
              tdSearchButton.style.display="inline";
             }
             else
             {
               tdEntryButton.style.display="inline";
               tdSearchButton.style.display="none";
             }
             document.getElementById('txtMainAccount').style.display='inline';
             document.getElementById('txtMainAccount').value='';
             document.getElementById('txtSubAccount').value='';
             ctxtdebit.SetText('0000000000.00');
             ctxtcredit.SetText('0000000000.00');  
             txtAccountCode.SetText('JV');
             document.getElementById('txtNarration').value='';
             document.getElementById('txtBillNo').value='';
             var ddlBranch = document.getElementById("<%=ddlBranch.ClientID%>");
             ddlBranch.options[0].selected=true;
//             tDate.SetDate(new Date()); 
             document.getElementById('CbpAcBalance').innerHTML = '';
             tdAcBal.style.display="none";
             document.getElementById('CbpAcBalance').innerHTML = '';
             document.getElementById('bDrCrStatus').innerHTML = '';
            
            }
            
         }
         function NewButtonClick()
         {
            if(parseFloat(ctxtTDebit.GetValue())>parseFloat(ctxtTCredit.GetValue()))
            {
             ctxtdebit.SetText('0000000000.00');
            }
            else
            {
              ctxtcredit.SetText('0000000000.00');  
            }
            tdadd.style.display='inline'
            tdnew.style.display='none'
            ctxtcredit.SetEnabled(true); 
            ctxtdebit.SetEnabled(true);
            if(document.getElementById('tdSubAccount').style.display=='none')
            {
                document.getElementById('txtMainAccount').focus();
            }
            else
            {
                document.getElementById('txtSubAccount').value='';
                document.getElementById('txtSubAccount').focus();
                
            }
            document.getElementById('CbpAcBalance').innerHTML = '';
            document.getElementById('bDrCrStatus').innerHTML = '';
         }
         function SetDebitCreditValue(obj)
         {
            var TotalDebit=(obj.split('~')[0]);
            var TotalCredit=(obj.split('~')[1]);
            var RemainingDebit=(obj.split('~')[2]);
            var RemainingCredit=(obj.split('~')[3]);
            //alert(TotalDebit+' '+TotalDebit+' '+RemainingDebit+' '+RemainingCredit);
            ctxtdebit.SetText('0000000000.00');
            ctxtcredit.SetText('0000000000.00');
            ctxtdebit.SetText(RemainingDebit.toString());
            ctxtcredit.SetText(RemainingCredit.toString());
            ctxtTDebit.SetText('0000000000.00');
            ctxtTCredit.SetText('0000000000.00');
            ctxtTDebit.SetText(TotalDebit.toString());
            ctxtTCredit.SetText(TotalCredit.toString());
            
            if(TotalDebit==TotalCredit)
            {
                tdSaveButton.style.display="inline"
                ctxtdebit.SetText('0000000000.00');
                ctxtcredit.SetText('0000000000.00');  
            }
            else
            {   
                if(parseFloat(ctxtTDebit.GetValue())>parseFloat(ctxtTCredit.GetValue()))
                {
                 ctxtdebit.SetText('0000000000.00');
                }
                else
                {
                  ctxtcredit.SetText('0000000000.00');  
                }
                tdSaveButton.style.display="none"
            }
            if(cDetailsGrid.cpEntryNotAllow!="undefined")
            {
                if(cDetailsGrid.cpEntryNotAllow!="Empty")
                {
                    alert(cDetailsGrid.cpEntryNotAllow);
                    cDetailsGrid.cpEntryNotAllow="undefined";
                }
            }
            if(cDetailsGrid.cpSaveSuccessOrFail!="undefined")
            {
                if(cDetailsGrid.cpSaveSuccessOrFail=="Problem")
                {
                    alert("There is Some Problem. Sry for InConvenience");
                    cDetailsGrid.cpSaveSuccessOrFail="undefined";
                }
                else if(cDetailsGrid.cpSaveSuccessOrFail=="Success")
                {
                    ResetPageOnSave();
                    alert("Records Successfully Saved");
                    cDetailsGrid.cpSaveSuccessOrFail="undefined";
                    var answer = confirm ("Do You Want To Print Saved JV/JVs?");
                    if (answer)
                    {
                        document.getElementById('btnPrint').click();
                    } 
                }
                else
                {
                }
            }
            if(cDetailsGrid.cpSuccessDiscard!="undefined")
            {
                if(cDetailsGrid.cpSuccessDiscard=="Problem")
                {
                    alert('There is Some Problem. Sry for InConvenience');
                    cDetailsGrid.cpSuccessDiscard="undefined";
                }
                else if(cDetailsGrid.cpSuccessDiscard=="SuccessDiscard")
                {
                    ResetPageOnDiscard();
                    alert('Records Successfully Discard');
                    cDetailsGrid.cpSuccessDiscard="undefined";
                }
                else
                {
                }
            }
            if(cDetailsGrid.cpEntryData!="undefined")
            {
            
                if(cDetailsGrid.cpBillNo!="EmptyString")document.getElementById('txtBillNo').value=cDetailsGrid.cpBillNo;
                if(cDetailsGrid.cpJvNarration!="EmptyString")document.getElementById('txtNarration').value=cDetailsGrid.cpJvNarration;
                if(cDetailsGrid.cpPrefix!="EmptyString")txtAccountCode.SetText(cDetailsGrid.cpPrefix);
                var ddlBranch= document.getElementById("<%=ddlBranch.ClientID%>");
                if(cDetailsGrid.cpBranchSelectedValue!="EmptyString")ddlBranch.options[cDetailsGrid.cpBranchSelectedValue].selected=true;
            } 
            if(cDetailsGrid.cpHideAddBtnOnLock=="true")
            {
                cbtnadd.SetEnabled(true);
                cDetailsGrid.cpHideAddBtnOnLock=null;
            }
            if(cDetailsGrid.cpHideAddBtnOnLock=="false")
            {
                cbtnadd.SetEnabled(false);
                cDetailsGrid.cpHideAddBtnOnLock=null;
            }
            
            //Currency Setting
            if(cDetailsGrid.cpSetCurrencyNameSymbol != null)
            {
                var ChoosenCurrencyName=cDetailsGrid.cpSetCurrencyNameSymbol.split('~')[0];
                var ChoosenCurrencySymbol=cDetailsGrid.cpSetCurrencyNameSymbol.split('~')[1];
                document.getElementById('<%=B_ChoosenCurrency.ClientID %>').innerHTML="Voucher Currency : "+ChoosenCurrencyName+"["+ChoosenCurrencySymbol+"]";
            }
            
            height();
           
         }
         function EntryButtonClick()
         {
             TblMainEntryForm.style.display="inline";
             tdEntryButton.style.display="none";
             tdAcBal.style.display="inline";
             document.getElementById('txtMainAccount').focus();
             cDetailsGrid.PerformCallback('Entry');
             cDetailsGrid.cpEntryNotAllow='';
         }
         function SearchButtonClick()
         {
           cSearchPopUp.Show();
         }
         function ResetPageOnSave()
         {
            Asp_SetSpace('txtMainAccount');
            Asp_SetSpace('txtSubAccount');
            ctxtdebit.SetEnabled(true);
            ctxtcredit.SetEnabled(true);
            ctxtcredit.SetText('0000000000.00');
            ctxtdebit.SetText('0000000000.00');
            ctxtTCredit.SetText('0000000000.00');
            ctxtTDebit.SetText('0000000000.00');
            TblMainEntryForm.style.display='none'
            var SelectedValue=cComboMode.GetValue();
             if(SelectedValue=="1")
             {
              tdEntryButton.style.display="none";
              tdSearchButton.style.display="inline";
             }
             else
             {
               tdEntryButton.style.display="inline";
               tdSearchButton.style.display="none";
             }
            tdadd.style.display='inline';
            tdnew.style.display='none';
            tdAcBal.style.display="none";
            tdSaveButton.style.display='inline';
            txtAccountCode.SetText('JV');
            document.getElementById('txtNarration').value='';
            document.getElementById('txtBillNo').value='';
            var ddlBranch = document.getElementById("<%=ddlBranch.ClientID%>");
            ddlBranch.options[0].selected=true;
            tDate.SetDate(new Date()); 
            document.getElementById('CbpAcBalance').innerHTML = '';
            DateChange_WithOutAlert();
         }
         function ResetPageOnDiscard()
         {
            Asp_SetSpace('txtMainAccount');
            Asp_SetSpace('txtSubAccount');
            ctxtcredit.SetText('0000000000.00');
            ctxtdebit.SetText('0000000000.00');
            ctxtTCredit.SetText('0000000000.00');
            ctxtTDebit.SetText('0000000000.00');
            ctxtdebit.SetEnabled(true);
            ctxtcredit.SetEnabled(true);
            tdadd.style.display='inline';
            tdnew.style.display='none';
            tdSaveButton.style.display='inline';
            if(document.getElementById('txtMainAccount').style.display!='none')
            {
                document.getElementById('txtMainAccount').focus();
            }
            else
            {
                tDate.focus();
            }
            document.getElementById('CbpAcBalance').innerHTML = '';
            document.getElementById('txtNarration1').value = '';
         }
         function Asp_SetSpace(obj)
         {
            document.getElementById(obj).value='';
         }
         function focustxtMainAccountOnUpdateCancel()
         {
            document.getElementById('txtMainAccount').focus();
         }
        function OnComboModeSelectedIndexChanged()
        {
            TblMainEntryForm.style.display="none";
            TblSearch.style.display="none";
            document.getElementById('txtBillNo').value='';
            document.getElementById('txtNarration').value='';
            Asp_SetSpace('txtMainAccount');
            Asp_SetSpace('txtSubAccount');
            Asp_SetSpace('txtNarration1');
            ctxtdebit.SetEnabled(true);
            ctxtcredit.SetEnabled(true);
            ctxtcredit.SetText('0000000000.00');
            ctxtdebit.SetText('0000000000.00');
            ctxtTCredit.SetText('0000000000.00');
            ctxtTDebit.SetText('0000000000.00');
            tdadd.style.display='inline'
            tdnew.style.display='none'
            var ddlBranch = document.getElementById("<%=ddlBranch.ClientID%>");
            ddlBranch.options[0].selected=true;
            tDate.Focus();
            var SelectedValue=cComboMode.GetValue();
            if(SelectedValue=="1")
            {
             tdEntryButton.style.display="none";
             tdSearchButton.style.display="inline";
            }
            else
            {
             tdEntryButton.style.display="inline";
             tdSearchButton.style.display="none";
             tDate.SetDate(new Date());
             //cGvJvSearch.PerformCallback('PCB_EditEnd~');
            }
            tdAcBal.style.display="none";
        }
        function btnShowClick()
        {
            cGvJvSearch.PerformCallback('PCB_BtnShow~');
            cSearchPopUp.Hide();
//            if(cChkBranch.GetChecked()) cChkBranch.SetChecked(false);
//            if(cChkBillNo.GetChecked()) cChkBillNo.SetChecked(false);
//            if(cChkPrefix.GetChecked()) cChkPrefix.SetChecked(false);
//            if(cChkNarration.GetChecked()) cChkNarration.SetChecked(false);
            TblSearch.style.display="inline";
        }
        function CustomButtonClick(s, e) {
                var TransactionDate=new Date(tDate.GetDate());
                    monthnumber = TransactionDate.getMonth();
                    monthday    = TransactionDate.getDate();
                    year        = TransactionDate.getYear();
                    var TransactionDateNumeric=new Date(year, monthnumber, monthday).getTime();
		            
		            var MaxLockDate=new Date('<%=Session["LCKJV"]%>');
                    monthnumber = MaxLockDate.getMonth();
                    monthday    = MaxLockDate.getDate();
                    year        = MaxLockDate.getYear();
                    var MaxLockDateNumeric=new Date(year, monthnumber, monthday).getTime();
    //                alert('TransactionDate='+TransactionDate+'\n'+'MaxLockDate= '+MaxLockDate);
                    //alert(ValueDate+'~'+ValueDateNumeric+'~'+VisibleIndexE);
                    if(TransactionDateNumeric<=MaxLockDateNumeric)
                    {
                        alert('This Entry has been Locked.You Can Only View The Detail');
                        VisibleIndexE=e.visibleIndex;
                        cGvJvSearch.PerformCallback('PCB_BtnOkE~'+e.visibleIndex);
                        return;
                    }
		          if(e.buttonID == 'CustomBtnEdit') {
		                cMsgPopUp.Show();
		                VisibleIndexE=e.visibleIndex;
    		            
		          }
		          if(e.buttonID == 'CustomBtnDelete') {
		                cDeleteMsgPopUp.Show();
		                VisibleIndexE=e.visibleIndex;
		          }
            }
         
         function btnOkClick()
         {
            cGvJvSearch.PerformCallback('PCB_BtnOkE~'+VisibleIndexE);
            cSearchPopUp.Hide();
         }
         function DeletebtnOkClick()
         {
            cGvJvSearch.PerformCallback('PCB_DeleteBtnOkE~'+VisibleIndexE);
         }
         function btnContinueClick()
         {
            cGvJvSearch.PerformCallback('PCB_ContinueWith~'+VisibleIndexE);
         }
         function btnFreshEntryClick()
         {
            cGvJvSearch.PerformCallback('PCB_FreshEntry~'+VisibleIndexE);
         }
         function btnCloseClick()
         {
            cGvJvSearch.PerformCallback('PCB_CloseEntry~'+VisibleIndexE);
         }
         
         function GvJvSearch_EndCallBack()
         {
            if(cGvJvSearch.cpJVE_FileAlreadyUsedBy!=undefined)
            {
                var obj=cGvJvSearch.cpJVE_FileAlreadyUsedBy;
                var WhichUser=(obj.split('~')[0]);
                if(WhichUser=="Other")
                {
                    alert('This File Being Used By '+obj.split('~')[1]);
                }
                else
                {
                    cFileUsedByPopUp.Show();
                }
               
            }
            if(cGvJvSearch.cpEntryEventFire!=undefined)
            {
                TblSearch.style.display="none";
                tdSearchButton.style.display="none";
                EntryButtonClick();
            }
            if(cGvJvSearch.cpJVDelete!=undefined)
            {
                alert(cGvJvSearch.cpJVDelete);
                cGvJvSearch.PerformCallback('PCB_BindAfterDelete');
            }
            if(cGvJvSearch.cpJVClose!=undefined)
            {
                alert(cGvJvSearch.cpJVClose);
            }
           height();
         }
         function blinkIt() 
        {
            if (!document.all) return;
            else 
            {
              for(i=0;i<document.all.tags('blink').length;i++)
              {
                s=document.all.tags('blink')[i];
                s.style.visibility=(s.style.visibility=='visible') ?'hidden':'visible';
              }
            }
        }
        
        //Currency Setting
        function PageLoad_ForCurrency()
        {
            var ActiveCurrency = '<%=Session["ActiveCurrency"]%>'
            ActiveCurrencyID=ActiveCurrency.split('~')[0];
            ActiveCurrencyName=ActiveCurrency.split('~')[1];
            ActiveCurrencySymbol=ActiveCurrency.split('~')[2];
        }
        function CurrencySetting(CParam)
        {
            var ActiveCurrency = CParam;
            ActiveCurrencyID=ActiveCurrency.split('~')[0];
            ActiveCurrencyName=ActiveCurrency.split('~')[1];
            ActiveCurrencySymbol=ActiveCurrency.split('~')[2];
            document.getElementById('<%=B_ChoosenCurrency.ClientID %>').innerHTML="Voucher Currency : "+ActiveCurrencyName+"["+ActiveCurrencySymbol+"]";
        }
        function ChangeCurrency()
        {
            cCbpChoosenCurrency.PerformCallback("ChangeCurrency");
        }
        function CbpChoosenCurrency_EndCallBack()
        {
//            alert(cCbpChoosenCurrency.cpChangeCurrencyParam);
            if(cCbpChoosenCurrency.cpChangeCurrencyParam != null)
            {
                ActiveCurrencyName = cCbpChoosenCurrency.cpChangeCurrencyParam.split('~')[0];
                ActiveCurrencySymbol=cCbpChoosenCurrency.cpChangeCurrencyParam.split('~')[1];
                document.getElementById('<%=B_ChoosenCurrency.ClientID %>').innerHTML="Voucher Currency : "+ActiveCurrencyName+"["+ActiveCurrencySymbol+"]";
            }
        } 
        function CbpAcBalance_EndCallBack()
         {
            var strUndefined=new String(cCbpAcBalance.cpAcBalance);
            if(strUndefined != "undefined")
            {
                document.getElementById('<%=B_AcBalance.ClientID %>').innerHTML = strUndefined.split('~')[0];
                document.getElementById('<%=B_AcBalance.ClientID %>').style.color = strUndefined.split('~')[1];
            }
         } 
        ////////
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="javascript:document.form1.tDate.focus();setInterval('blinkIt()',500)">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000">
            </asp:ScriptManager>
            <table class="TableMain100" style="width: 99%">
                <tr>
                    <td>
                        <table class="TableMain100" width="100%">
                            <tr>
                                <td class="EHEADER" colspan="2" style="height: 20px; text-align: center">
                                    <strong><span id="SpanHeader" style="color: #000099">JOURNAL VOUCHER</span></strong>&nbsp;
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td style="font-weight: bold; vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                    Mode</td>
                                <td style="height: 11px">
                                    <dxe:aspxcombobox id="ComboMode" runat="server" clientinstancename="cComboMode" Font-Size="10px" SelectedIndex="0"
                                        ValueType="System.String" Width="65px" meta:resourcekey="ComboModeResource1">
                                        <items>
<dxe:ListEditItem Value="0" Text="Entry" meta:resourcekey="ListEditItemResource1"></dxe:ListEditItem>
<dxe:ListEditItem Value="1" Text="Edit" meta:resourcekey="ListEditItemResource2"></dxe:ListEditItem>
</items>
                                        <clientsideevents selectedindexchanged="OnComboModeSelectedIndexChanged" />
                                    </dxe:aspxcombobox>
                                </td>
                                <td>
                                <!--Currency Setting-->
                                    <dxcp:ASPxCallbackPanel ID="CbpChoosenCurrency" runat="server" ClientInstanceName="cCbpChoosenCurrency" BackColor="White" OnCallback="CbpChoosenCurrency_Callback">
                                    <PanelCollection>
                                        <dxp:panelcontent runat="server">
                                         <b title="Switch To Active Currency" id="B_ChoosenCurrency" runat="server" style="text-decoration: underline; width: 100%;
                                                font-style:italic;color: Blue; float: left;"></b>
                                        </dxp:panelcontent>
                                    </PanelCollection>
                                    <ClientSideEvents EndCallback="function(s, e) {
	                                                    CbpChoosenCurrency_EndCallBack(); }" />
                                </dxcp:ASPxCallbackPanel>  
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="TableMain100" style="width: 67%; height: 72px;" border="1">
                            <tr>
                                <td style="width: 52px; height: 11px; background-color: #b7ceec" valign="top">
                                    TranDate</td>
                                <td style="width: 45px; height: 11px; background-color: #b7ceec" valign="top">
                                    Branch</td>
                                <td colspan="6" style="height: 11px; background-color: #b7ceec" valign="top">
                                    Main Narration</td>
                            </tr>
                            <tr>
                                <td style="width: 63px; height: 11px;" valign="top">
                                    <dxe:ASPxDateEdit ID="tDate" runat="server" EditFormat="Custom" ClientInstanceName="tDate"
                                        UseMaskBehavior="True" Font-Size="13px" Width="157px" meta:resourcekey="tDateResource1">
                                        <ClientSideEvents DateChanged="function(s,e){DateChange()}" />
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td style="width: 119px; height: 11px;" valign="top">
                                    <asp:DropDownList ID="ddlBranch" runat="server" DataSourceID="dsBranch"
                                        DataTextField="BANKBRANCH_NAME" DataValueField="BANKBRANCH_ID" Width="204px"
                                        Font-Size="13px" meta:resourcekey="ddlBranchResource1">
                                    </asp:DropDownList></td>
                                <td colspan="6" valign="top">
                                    <asp:TextBox ID="txtNarration" Font-Names="Arial" runat="server" TextMode="MultiLine" 
                                      Width="98%" Font-Size="10pt" Height="42px" onkeyup="OnlyNarration(this,'Narration',event)" meta:resourcekey="txtNarrationResource1"></asp:TextBox></td>
                                   
                            </tr>
                            <tr>
                                <td style="background-color: #b7ceec;" valign="top">
                                    Bill No</td>
                                <td valign="top">
                                    <asp:TextBox ID="txtBillNo" runat="server" Width="149px" Font-Size="13px" meta:resourcekey="txtBillNoResource1"></asp:TextBox></td>
                                <td style="background-color: #b7ceec; width: 2px;" valign="top">
                                    Prefix</td>
                                <td valign="top" style="width: 45px">
                                    <dxe:ASPxTextBox ID="txtAccountCode" ClientInstanceName="txtAccountCode"
                                        runat="server" Width="90px" MaxLength="2" Font-Size="13px" meta:resourcekey="txtAccountCodeResource1">
                                        <ValidationSettings>
<RequiredField IsRequired="True" ErrorText="Select Account Code"></RequiredField>
</ValidationSettings>
                                        <ClientSideEvents KeyPress="function(s,e){window.setTimeout('updateEditorText()', 10);}" />
                                    </dxe:ASPxTextBox></td>
                                
                                <td  style="text-align: right; width: 40%;" valign="bottom" id="tdEntryButton">
                                    <dxe:ASPxButton ID="abtnEntry" runat="server" AccessKey="E" AutoPostBack="False" Text="[E]ntry" Width="76px" meta:resourcekey="abtnEntryResource1">
                                        <ClientSideEvents Click="function(s, e) {EntryButtonClick();}" />
                                    </dxe:ASPxButton>
                                </td>
                                 <td style="text-align: right; width: 40%;display:none;" valign="bottom" id="tdSearchButton" >
                                    <dxe:ASPxButton ID="abtnSearch" runat="server" AutoPostBack="False" Text="Search" Width="76px" meta:resourcekey="abtnSearchResource1">
                                        <ClientSideEvents Click="function(s, e) {SearchButtonClick();}" />
                                    </dxe:ASPxButton>
                                </td>
                                <td style="font-weight:bold;font-size:10px;width: 40%;display:none;" id="tdAcBal" colspan="2">
                                    
                                A/C Balance : <dxcp:ASPxCallbackPanel ID="CbpAcBalance" runat="server" ClientInstanceName="cCbpAcBalance"
                                        OnCallback="CbpAcBalance_Callback" BackColor="White">
                                        <PanelCollection>
                                            <dxp:panelcontent runat="server">
                                                <div style="width: 100%; text-align: right;">
                                                    <b style="text-align: right" id="B_AcBalance" runat="server"></b>
                                                </div>
                                            </dxp:panelcontent>
                                        </PanelCollection>
                                        <ClientSideEvents EndCallback="function(s, e) {
	                                                    CbpAcBalance_EndCallBack(); }" />
                                    </dxcp:ASPxCallbackPanel>
                                <blink><b style="color:Blue;font-size:10px;" id="bDrCrStatus" runat="server"></b></blink>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%;display:none" id="TblMainEntryForm" border="1">
                            <tr>
                                <td style="font-weight: bold; text-align: left; text-decoration: underline; background-color: #b7ceec; width: 134px;" >
                                    Main Account</td>
                                <td id="tdlblSubAccount" style="font-weight: bold; text-align: left; text-decoration: underline; background-color: #b7ceec; width: 54px;" >
                                    SubAccount</td>
                                <td style="font-weight: bold; text-align: left; text-decoration: underline; background-color: #b7ceec;" >
                                    Debit</td>
                                <td style="font-weight: bold; text-align: left; text-decoration: underline; background-color: #b7ceec;" >
                                    Credit</td>
                            </tr>
                            <tr>
                                <td style="width: 134px" >
                                    <asp:TextBox ID="txtMainAccount" runat="server" Width="200px" onkeyup="CallMainAccount(this,'MainAccountJournal_New',event)" onFocus="this.select()" Font-Size="13px" onblur="AcBalance1(this.id)" meta:resourcekey="txtMainAccountResource1"></asp:TextBox></td>
                                <td id="tdSubAccount" style="width: 54px">
                                    <asp:TextBox ID="txtSubAccount" runat="server" Width="200px" onkeyup="CallSubAccount(this,'SubAccountMod_New',event)" onFocus="this.select()" onblur="AcBalance(this.id)" Font-Size="13px" meta:resourcekey="txtSubAccountResource1"></asp:TextBox></td>
                                <td >
                                    <%--<dxe:ASPxSpinEdit ID="txtdebit" ClientInstanceName="ctxtdebit" runat="server" NumberType="Float" HorizontalAlign="Right" 
                                    DecimalPlaces="2"  TabIndex="0" NullText="0.00" Number="0.00">
                                        <Paddings PaddingRight="5px" />
                                        <ClientSideEvents LostFocus="function(s,e){focusval(s.GetValue());}" />
                                        <SpinButtons ShowIncrementButtons="False" ></SpinButtons>
                                     </dxe:ASPxSpinEdit>--%>
                                    <dxe:ASPxTextBox ID="txtdebit" runat="server" Width="140px" ClientInstanceName="ctxtdebit" HorizontalAlign="Right" Font-Size="13px" meta:resourcekey="txtdebitResource1" >
                                        <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                        <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;"  IncludeLiterals="DecimalSymbol" />
                                        <ClientSideEvents KeyUp="function(s,e){focusval(s.GetValue());}" />
                                    </dxe:ASPxTextBox>
                                </td>
                                <td>
                                 <%--   <dxe:ASPxSpinEdit ID="txtcredit" ClientInstanceName="ctxtcredit" runat="server" NumberType="Float" HorizontalAlign="Right" DecimalPlaces="2" TabIndex="0" NullText="0.00" Number="0.00">
                                        <Paddings PaddingRight="5px" />
                                        <ClientSideEvents LostFocus="function(s,e){focusval1(s.GetValue());}" />
                                        <SpinButtons ShowIncrementButtons="False" ></SpinButtons>
                                     </dxe:ASPxSpinEdit>--%>

                                  <dxe:ASPxTextBox ID="txtcredit" runat="server" Width="145px" ClientInstanceName="ctxtcredit" HorizontalAlign="Right" Font-Size="13px" meta:resourcekey="txtcreditResource1">
                                        <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                        <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;"  IncludeLiterals="DecimalSymbol" />
                                        <ClientSideEvents KeyUp="function(s,e){focusval1(s.GetValue());}" />
                                  </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold; text-align: left; text-decoration: underline; background-color: #b7ceec; width: 134px;" valign="top">
                                    Line Narration</td>
                                    <td style="font-weight: bold; text-align: left; text-decoration: underline;" valign="top" colspan="3">
                                    <asp:TextBox ID="txtNarration1" Font-Names="Arial" runat="server" TextMode="MultiLine"
                                        Width="99%" Font-Size="10px" Height="16px" meta:resourcekey="txtNarration1Resource1"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="height: 12px" colspan="4" valign="top">
                                    <table style="float:left;">
                                        <tr>
                                            <td id="tdadd" style="width: 100px">
                                                <dxe:ASPxButton ID="btnadd" ClientInstanceName="cbtnadd" runat="server" AccessKey="L" AutoPostBack="False"
                                                    Text="Add Entry To [L]ist" Width="150px" meta:resourcekey="btnaddResource1">
                                                    <ClientSideEvents Click="function(s, e) {SubAccountCheck();}" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td id="tdnew" style="width: 100px; height: 16px; display: none">
                                                <dxe:ASPxButton ID="btnnew" ClientInstanceName="cbtnnew" runat="server" AutoPostBack="False" Text="[N]ew Entry"
                                                    Width="150px" AccessKey="N" Font-Bold="False" Font-Underline="False" BackColor="Tan" meta:resourcekey="btnnewResource1">
                                                    <ClientSideEvents Click="function(s, e) {NewButtonClick();}" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td style="width: 100px">
                                                <dxe:ASPxButton ID="btnCancelEntry" runat="server" AccessKey="C" AutoPostBack="False" Text="[C]ancel Entry" Width="150px" meta:resourcekey="btnCancelEntryResource1">
                                                    <ClientSideEvents Click="function(s, e) {CancelButtonClick();}" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td style="width: 100px;display:none" id="tdSaveButton" runat="Server">
                                                <dxe:ASPxButton ID="btnSaveRecords" ClientInstanceName="cbtnSaveRecords" runat="server" AccessKey="S" AutoPostBack="False" Text="[S]ave Entered Records" Width="150px" meta:resourcekey="btnSaveRecordsResource1">
                                                    <ClientSideEvents Click="function(s, e) {SaveButtonClick();}" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td style="width: 100px">
                                                <dxe:ASPxButton ID="btnDiscardEntry" runat="server" AccessKey="D" AllowFocus="False"
                                                    AutoPostBack="False" Text="[D]iscard Entered Records" Width="150px" meta:resourcekey="btnDiscardEntryResource1">
                                                    <ClientSideEvents Click="function(s, e) {DiscardButtonClick();}" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td style="width: 100px">
                                                <dxe:ASPxButton ID="btnUnsaveData" runat="server" AccessKey="R" AutoPostBack="False" Text="[R]efresh" Width="150px" meta:resourcekey="btnUnsaveDataResource1">
                                                    <ClientSideEvents Click="function(s, e) {RefreshButtonClick();}" />
                                                </dxe:ASPxButton>
                                            </td>
                                            
                                        </tr>
                                    </table>
                                    <div class="EHEADER" style="float:left; vertical-align: top; height: 1px; text-align: right" width="70%">
                                                <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="True" BackColor="Navy"
                                                    ClientInstanceName="exp" Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                                    SelectedIndex="0" ValueType="System.Int32" Width="130px" meta:resourcekey="cmbExportResource1">
                                                    <items>
<dxe:ListEditItem Value="0" Text="Select" meta:resourcekey="ListEditItemResource3"></dxe:ListEditItem>
<dxe:ListEditItem Value="1" Text="PDF" meta:resourcekey="ListEditItemResource4"></dxe:ListEditItem>
<dxe:ListEditItem Value="2" Text="XLS" meta:resourcekey="ListEditItemResource5"></dxe:ListEditItem>
<dxe:ListEditItem Value="3" Text="RTF" meta:resourcekey="ListEditItemResource6"></dxe:ListEditItem>
<dxe:ListEditItem Value="4" Text="CSV" meta:resourcekey="ListEditItemResource7"></dxe:ListEditItem>
</items>
                                                    <clientsideevents selectedindexchanged="OncmbExportSelectedIndexChanged" />
                                                    <buttonstyle backcolor="#C0C0FF" forecolor="Black"></buttonstyle>
                                                    <itemstyle backcolor="Navy" forecolor="White">
<HoverStyle BackColor="#8080FF" ForeColor="White"></HoverStyle>
</itemstyle>
                                                    <border bordercolor="White" />
                                                    <dropdownbutton text="Export"></dropdownbutton>
                                                </dxe:ASPxComboBox>
                                       </div>
                                    
                                    </td>
                            </tr>
                            <tr>
                                <td colspan="4" style="height: 16px" valign="top">
                                    <table width="100%" border="1">
                                        <tr id="Tdebit" runat="server">
                                            <td style="width: 13017px; text-align: left; height: 14px;" valign="top">
                                            </td>
                                            <td style="width: 75px; text-align: left; height: 14px; background-color: #b7ceec;" valign="top">
                                                Total&nbsp;
                                            </td>
                                            <td style="width: 79px; text-align: left; height: 14px;" valign="top">
                                                <dxe:ASPxTextBox ID="txtTDebit" runat="server" Width="105px" ClientInstanceName="ctxtTDebit" HorizontalAlign="Right" Font-Size="10px" meta:resourcekey="txtTDebitResource1">
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                    <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;"  IncludeLiterals="DecimalSymbol" />
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td style="width: 75px; height: 14px; text-align: left; background-color: #b7ceec;" valign="top">
                                                Dr.</td>
                                            <td style="text-align: left; height: 14px;" valign="top">
                                                <dxe:ASPxTextBox ID="txtTCredit" runat="server" Width="105px" ClientInstanceName="ctxtTCredit" HorizontalAlign="Right" Font-Size="10px" meta:resourcekey="txtTCreditResource1">
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                    <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;"  IncludeLiterals="DecimalSymbol" />
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td style="height: 14px; text-align: left; width: 75px; background-color: #b7ceec;" valign="top">
                                                Cr.</td>
                                        </tr>
                                    </table>
                        <dxwgv:ASPxGridView ID="DetailsGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="cDetailsGrid"
                            KeyFieldName="CashReportID" Width="100%" OnCustomCallback="DetailsGrid_CustomCallback" 
                            OnCustomJSProperties="DetailsGrid_CustomJSProperties" OnHtmlRowCreated="DetailsGrid_HtmlRowCreated" 
                            OnRowDeleting="DetailsGrid_RowDeleting" OnHtmlEditFormCreated="DetailsGrid_HtmlEditFormCreated" OnRowUpdating="DetailsGrid_RowUpdating" OnCancelRowEditing="DetailsGrid_CancelRowEditing" 
                            OnHtmlRowPrepared="DetailsGrid_HtmlRowPrepared" Font-Size="10px" meta:resourcekey="DetailsGridResource1" OnCommandButtonInitialize="DetailsGrid_CommandButtonInitialize">
                            <ClientSideEvents EndCallback="function(s, e) {SetDebitCreditValue(s.cpTotalDebitCredit);}"></ClientSideEvents>
                            <Templates><EditForm>
                                    <table>
                                        <tr>
                                            <td style="font-weight: bold;font-size:10px; text-decoration: underline">
                                                Main Account</td>
                                            <td id="tdlblSubAccount" style="font-weight: bold;font-size:10px; text-decoration: underline">
                                                Sub Account</td>
                                            <td style="font-weight: bold;font-size:10px;  text-decoration: underline">
                                                Debit</td>
                                            <td style="font-weight: bold;font-size:10px;  text-decoration: underline">
                                                Credit</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox runat="server" Width="200px" Font-Size="13px" Text='<%# Bind("MainAccount1") %>' ID="txtMainAccountE" onkeyup="CallMainAccountE(this,'MainAccountJournalE',event)" meta:resourcekey="txtMainAccountEResource1"></asp:TextBox>

                                                <asp:HiddenField runat="server" ID="txtMainAccountE_hidden"></asp:HiddenField>

                                            </td>
                                            <td id="tdSubAccountE">
                                                <asp:TextBox runat="server" Width="200px" Font-Size="13px" Text='<%# Bind("SubAccount1") %>' ID="txtSubAccountE" onkeyup="CallSubAccountE(this,'SubAccountModE',event)" meta:resourcekey="txtSubAccountEResource1"></asp:TextBox>

                                                <asp:HiddenField runat="server" ID="txtSubAccountE_hidden"></asp:HiddenField>

                                            </td>
                                            <td>
                                                <dxe:ASPxTextBox runat="server" Text='<%# Bind("WithDrawl") %>' Font-Size="13px" Width="140px" ID="txtdebit" ClientInstanceName="ctxtdebitE" HorizontalAlign="Right" meta:resourcekey="txtdebitResource2">
<MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>

<ClientSideEvents LostFocus="function(s,e){Efocusval(s.GetValue());}"></ClientSideEvents>
</dxe:ASPxTextBox>

                                            </td>
                                            <td>
                                                <dxe:ASPxTextBox runat="server" Text='<%# Bind("Receipt") %>' Font-Size="13px" Width="145px" ID="txtcredit" ClientInstanceName="ctxtcreditE" HorizontalAlign="Right" meta:resourcekey="txtcreditResource2">
<MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>

<ClientSideEvents LostFocus="function(s,e){Efocusval1(s.GetValue());}"></ClientSideEvents>
</dxe:ASPxTextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;font-size:10px;text-decoration: underline; height: 16px;" valign="top">
                                                Line Narration</td>
                                            <td  colspan="3">
                                                <asp:TextBox runat="server" Width="99%" Font-Size="13px" Font-Names="Arial" Text='<%# Bind("SubNarration") %>' Height="16px" ID="txtNarration1" TextMode="MultiLine" meta:resourcekey="txtNarration1Resource2"></asp:TextBox>
</td>
                                            <td>
                                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormUpdateButton" ColumnID="" ID="UpdateButton">
                                                </dxwgv:ASPxGridViewTemplateReplacement>

                                            </td>
                                            <td>
                                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormCancelButton" ColumnID="" ID="CancelButton">
                                                </dxwgv:ASPxGridViewTemplateReplacement>

                                            </td>
                                        </tr>
                                        
                                    </table>
                                
</EditForm>
</Templates>
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True"></SettingsBehavior>
                            <Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedRow HorizontalAlign="Left" VerticalAlign="Top" CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<Footer CssClass="gridfooter"></Footer>
</Styles>
                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" Mode="ShowAllRecords">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
                            
                            <Columns>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="MainAccount1" Width="25%" Caption="Main Account" meta:resourcekey="GridViewDataTextColumnResource1">
<CellStyle Wrap="False" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="SubAccount1" Width="40%" Caption="Sub Account" meta:resourcekey="GridViewDataTextColumnResource2">
<CellStyle Wrap="False" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="WithDrawl" Width="10%" Caption="Debit" meta:resourcekey="GridViewDataTextColumnResource3">
<CellStyle Wrap="False" HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="Receipt" Width="10%" Caption="Credit" meta:resourcekey="GridViewDataTextColumnResource4">
<CellStyle Wrap="False" HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" FieldName="CashReportID" meta:resourcekey="GridViewDataTextColumnResource5"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" FieldName="SubNarration" meta:resourcekey="GridViewDataTextColumnResource6"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="4" Width="15%" meta:resourcekey="GridViewCommandColumnResource1">
<DeleteButton Visible="True"></DeleteButton>

<CellStyle ForeColor="White">
<HoverStyle BackColor="#000040"></HoverStyle>
</CellStyle>

<EditButton Visible="True"></EditButton>
</dxwgv:GridViewCommandColumn>
</Columns>
                            <SettingsEditing Mode="EditForm" />
                               <%-- <Settings VerticalScrollableHeight="300" ShowTitlePanel="True" ShowVerticalScrollBar="True" />--%>

                        </dxwgv:ASPxGridView>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 98%;display:none" id="TblSearch">
                            <tr>
                                <td>
                                    <dxwgv:ASPxGridView ID="GvJvSearch" runat="server" AutoGenerateColumns="False"
                                        ClientInstanceName="cGvJvSearch" KeyFieldName="JvID" Width="100%" OnCustomCallback="GvJvSearch_CustomCallback" 
                                        OnCustomJSProperties="GvJvSearch_CustomJSProperties" Font-Size="10px" meta:resourcekey="GvJvSearchResource1">
                                        <ClientSideEvents CustomButtonClick="CustomButtonClick" EndCallback="function(s, e) {GvJvSearch_EndCallBack();}" />
                                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                                       
                                        <Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedRow HorizontalAlign="Left" VerticalAlign="Top" CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<Footer CssClass="gridfooter"></Footer>
</Styles>
                                        <SettingsPager NumericButtonCount="20" ShowSeparators="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
                                        <Columns>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="JvID" Caption="Main Account" meta:resourcekey="GridViewDataTextColumnResource7">
<CellStyle Wrap="False" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="VoucherNumber" Width="20%" Caption="Jv Number" meta:resourcekey="GridViewDataTextColumnResource8">
<CellStyle Wrap="False" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="BranchNameCode" Width="20%" Caption="Branch" meta:resourcekey="GridViewDataTextColumnResource9">
<CellStyle Wrap="False" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="Narration" Width="60%" Caption="Narration" meta:resourcekey="GridViewDataTextColumnResource10">
<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="4" FieldName="IBRef" meta:resourcekey="GridViewDataTextColumnResource11"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="4" FieldName="WhichTypeItem" meta:resourcekey="GridViewDataTextColumnResource12"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="3" Width="15%" meta:resourcekey="GridViewCommandColumnResource2"><CustomButtons>
<dxwgv:GridViewCommandColumnCustomButton ID="CustomBtnEdit" Text="Edit" meta:resourcekey="GridViewCommandColumnCustomButtonResource1"></dxwgv:GridViewCommandColumnCustomButton>
<dxwgv:GridViewCommandColumnCustomButton ID="CustomBtnDelete" Text="Delete" meta:resourcekey="GridViewCommandColumnCustomButtonResource2"></dxwgv:GridViewCommandColumnCustomButton>
</CustomButtons>
</dxwgv:GridViewCommandColumn>
</Columns>
                                        <Settings VerticalScrollableHeight="500" ShowGroupPanel="True" ShowHorizontalScrollBar="True"  />
                                    </dxwgv:ASPxGridView>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td id='Div1' style="height: 20px; display:none">
                        <div  style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                    top: 50%; background-color: white; layer-background-color: white; height: 80;
                                    width: 150;'>
                                    <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loading..</strong></font></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                    </td>
                </tr>
              
            </table>
             <dxpc:ASPxPopupControl ID="SearchPopUp" runat="server" HeaderText="Filter" ClientInstanceName="cSearchPopUp" meta:resourcekey="SearchPopUpResource1" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
                            <ContentCollection>
                                <dxpc:PopupControlContentControl runat="server" meta:resourcekey="PopupControlContentControlResource1">
                                    <table class="style1">
                                        <tr>
                                            <td style="width: 3px">
                                                <dxe:aspxcheckbox  id="ChkTranDate" runat="server" text="Tran.Date"  
                                            ClientInstanceName="cChkTranDate" Checked="True" ReadOnly="True" meta:resourcekey="ChkTranDateResource1">
                                                </dxe:aspxcheckbox>
                                            </td>
                                            <td>
                                            <dxe:aspxcheckbox  id="ChkBranch" runat="server" text="Branch" 
                                            ClientInstanceName="cChkBranch" meta:resourcekey="ChkBranchResource1" ></dxe:aspxcheckbox >
                                             </td>
                                            <td><dxe:aspxcheckbox  id="ChkBillNo" runat="server" text="BillNo" 
                                            ClientInstanceName="cChkBillNo" meta:resourcekey="ChkBillNoResource1">
                                            </dxe:aspxcheckbox>
                                            </td>
                                            <td style="width: 3px">
                                            <dxe:aspxcheckbox  id="ChkPrefix" runat="server" text="Prefix" 
                                            ClientInstanceName="cChkPrefix" meta:resourcekey="ChkPrefixResource1">
                                             </dxe:aspxcheckbox>
                                            </td>
                                            <td style="width: 3px">
                                                <dxe:aspxcheckbox  id="ChkNarration" runat="server" text="Narration" 
                                            ClientInstanceName="cChkNarration" meta:resourcekey="ChkNarrationResource1">
                                                </dxe:aspxcheckbox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 3px">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td style="width: 3px">
                                                <dxe:ASPxButton ID="btnShow" runat="server" AutoPostBack="False" Text="Show" Width="65px" meta:resourcekey="btnShowResource1">
                                                    <ClientSideEvents Click="function (s, e) { btnShowClick(); ExcludePopUp.Hide(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td style="width: 3px">
                                                <dxe:ASPxButton ID="btnCancel" runat="server" AutoPostBack="False" Text="Cancel" Width="62px" meta:resourcekey="btnCancelResource1">
                                                    <ClientSideEvents Click="function (s, e) { cSearchPopUp.Hide(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </dxpc:PopupControlContentControl>
                            </ContentCollection>
                        </dxpc:ASPxPopupControl>
              
               <dxpc:ASPxPopupControl ID="MsgPopUp" runat="server" HeaderText="Notice" ClientInstanceName="cMsgPopUp" Width="387px" Left="200" ShowSizeGrip="False" Top="200" meta:resourcekey="MsgPopUpResource1" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
                            <ContentCollection>
                                <dxpc:PopupControlContentControl runat="server" meta:resourcekey="PopupControlContentControlResource2">
                                    <table class="style1">
                                        <tr>
                                            <td colspan="5">
                                                &nbsp;Do You Want To Edit This Entry?</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 3px">
                                            </td>
                                            <td>
                                            </td>
                                            <td style="width: 164px">
                                            </td>
                                            <td style="width: 3px">
                                                <dxe:ASPxButton ID="abtnOk" runat="server" AutoPostBack="False" Text="Ok" meta:resourcekey="abtnOkResource1">
                                                    <ClientSideEvents Click="function (s, e) { btnOkClick(); cMsgPopUp.Hide(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td style="width: 3px">
                                                <dxe:ASPxButton ID="abtnCancel" runat="server" AutoPostBack="False" Text="Cancel" meta:resourcekey="abtnCancelResource1">
                                                    <ClientSideEvents Click="function (s, e) { cMsgPopUp.Hide(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </dxpc:PopupControlContentControl>
                            </ContentCollection>
                        </dxpc:ASPxPopupControl>
                
                <dxpc:ASPxPopupControl ID="DeleteMsgPopUp" runat="server" HeaderText="Notice" ClientInstanceName="cDeleteMsgPopUp" Width="387px" Left="200" ShowSizeGrip="False" Top="200" meta:resourcekey="DeleteMsgPopUpResource1" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
                            <ContentCollection>
                                <dxpc:PopupControlContentControl runat="server" meta:resourcekey="PopupControlContentControlResource3">
                                    <table class="style1">
                                        <tr>
                                            <td colspan="5">
                                                Are u Sure? Do You Want To Delete This JV?</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 3px">
                                            </td>
                                            <td>
                                            </td>
                                            <td style="width: 164px">
                                            </td>
                                            <td style="width: 3px">
                                                <dxe:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Ok" meta:resourcekey="ASPxButton1Resource1">
                                                    <ClientSideEvents Click="function (s, e) { DeletebtnOkClick(); cDeleteMsgPopUp.Hide(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td style="width: 3px">
                                                <dxe:ASPxButton ID="ASPxButton2" runat="server" AutoPostBack="False" Text="Cancel" meta:resourcekey="ASPxButton2Resource1">
                                                    <ClientSideEvents Click="function (s, e) { cDeleteMsgPopUp.Hide(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </dxpc:PopupControlContentControl>
                            </ContentCollection>
                        </dxpc:ASPxPopupControl>
                        
                         <dxpc:ASPxPopupControl ID="FileUsedByPopUp" runat="server" HeaderText="Notice" ClientInstanceName="cFileUsedByPopUp" Width="387px" Left="200" ShowSizeGrip="False" Top="200" meta:resourcekey="FileUsedByPopUpResource1" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
                            <ContentCollection>
                                <dxpc:PopupControlContentControl runat="server" meta:resourcekey="PopupControlContentControlResource4">
                                    <table class="style1">
                                        <tr>
                                            <td colspan="5">
                                                This Entry Was Already Being Edited By You.</td>
                                        </tr>
                                        <tr>
                                           
                                            <td>
                                            </td>
                                            <td style="width: 3px">
                                                <dxe:ASPxButton ID="btnContinue" runat="server" AutoPostBack="False" Text="Continue Previous Edit" Width="140px" meta:resourcekey="btnContinueResource1">
                                                    <ClientSideEvents Click="function (s, e) { btnContinueClick(); cFileUsedByPopUp.Hide(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td style="width: 3px">
                                                <dxe:ASPxButton ID="btnNewEntry" runat="server" AutoPostBack="False" Text="Fresh Edit" Width="140px" meta:resourcekey="btnNewEntryResource1">
                                                    <ClientSideEvents Click="function (s, e) { btnFreshEntryClick();cFileUsedByPopUp.Hide(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td style="width: 3px">
                                                <dxe:ASPxButton ID="btnClose" runat="server" AutoPostBack="False" Text="Discard Previous Edit" Width="140px" meta:resourcekey="btnCloseResource1">
                                                    <ClientSideEvents Click="function (s, e) {btnCloseClick(); cFileUsedByPopUp.Hide(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                             <td style="width: 3px">
                                                <dxe:ASPxButton ID="btnCancle" runat="server" AutoPostBack="False" Text="Cancel" Width="140px" meta:resourcekey="btnCancleResource1">
                                                    <ClientSideEvents Click="function (s, e) { cFileUsedByPopUp.Hide(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </dxpc:PopupControlContentControl>
                            </ContentCollection>
                        </dxpc:ASPxPopupControl>
            <asp:SqlDataSource ID="dsCompany" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                ConflictDetection="CompareAllValues" SelectCommand="select cmp_internalId,cmp_Name from tbl_master_company where cmp_internalId in(select exch_compId from tbl_master_companyExchange)">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsBranch" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                ConflictDetection="CompareAllValues" SelectCommand="SELECT BRANCH_id AS BANKBRANCH_ID , RTRIM(BRANCH_DESCRIPTION)+' ['+ISNULL(RTRIM(BRANCH_CODE),'')+']' AS BANKBRANCH_NAME  FROM TBL_MASTER_BRANCH">
            </asp:SqlDataSource>
                        <asp:HiddenField ID="hddnEdit" runat="server" />
                         <asp:HiddenField ID="hdnSegmentid" runat="server" />
                         <asp:HiddenField ID="hdnCompanyid" runat="server" />
                        <asp:HiddenField ID="txtMainAccount_hidden" runat="server" />
                        <asp:HiddenField ID="txtSubAccount_hidden" runat="server" />
            <asp:HiddenField ID="hdn_Brch_NonBrch" runat="server" />
            <asp:HiddenField ID="hdn_MainAcc_Type" runat="server" />
            <div style="display: none">
                <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" meta:resourcekey="btnPrintResource1" />
                <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
                </dxwgv:ASPxGridViewExporter>
            </div>
        </div>
    </form>
</body>
</html>
