<%@ page language="C#" autoeventwireup="true" inherits="management_TradeEntry, App_Web_cvaj-tqf" %>

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
<head>
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/PageStyle.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.min.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/loaddata.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
    
    <script type="text/javascript" src="../JSFUNCTION/GenericJscript.js"></script>

    <link type="text/css" href="../CSS/AjaxStyle.css" rel="Stylesheet" />

    <script type="text/javascript" language="javascript">
 
 //ProtoType
    String.prototype.trim = function() {
        return this.replace(/^\s+|\s+$/g,"");
    }
    String.prototype.ltrim = function() {
        return this.replace(/^\s+/,"");
    }
    String.prototype.rtrim = function() {
        return this.replace(/\s+$/,"");
    }
//
 //Global Variable
    FieldName = '';
    AjaxComQuery='';
    AjaxComQueryProduct='';
    AjaxComQuerySold='';
    //End
    
    
function CallAjax(obj1,obj2,obj3,Query)
  {
        var CombinedQuery=new String(Query);
        ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');
  }
  
  
function replaceChars(entry)
 {
        out = "+"; // replace this
        add = "--"; // with this
        temp = "" + entry; // temporary holder

        while (temp.indexOf(out)>-1)
         {
        pos= temp.indexOf(out);
        temp = "" + (temp.substring(0, pos) + add + 
        temp.substring((pos + out.length), temp.length));
         }
     return temp;
}

function RefreshPage()
  {
    window.location.reload()
  }
 
function onClientChange()
{

if(cComboBoughtFrom.GetValue()=="Cl")
  {
   document.getElementById('TxtBoughtFrom').value="Enter Client Detail";
  }
  
}

function OnTypeChange(WhichCall)
{

if(WhichCall=="BoughtFrom")
{
    if(cComboBoughtFrom.GetValue()=="Cl")
      {
       Div_BoughtFrm.style.display="inline";
        Div_TCodeFrm.style.display="inline";
         OnValueChangeBoughtFrm(cComboBoughtFrom,'BoughtFrom');
      }
      
     else if(cComboBoughtFrom.GetValue()=="Brk")
      {
       Div_BoughtFrm.style.display="inline";
        Div_TCodeFrm.style.display="inline";
         document.getElementById('TxtBoughtFrom').value="Enter Broker Detail";
          cComboSoldTo.SetText("Client");
           cComboSoldTo.SetValue("Cl");
            document.getElementById('TxtSoldTo').value="Enter Client Detail";
             OnValueChangeBoughtFrm(cComboBoughtFrom,'BoughtFrom');

      }
           
    else if (cComboBoughtFrom.GetValue()=="Ex")
      { 
        Div_BoughtFrm.style.display="none";
        Div_TCodeFrm.style.display="none";
        Div_SoldTo.style.display="inline";
        Div_TCodeTo.style.display="inline";
        cComboSoldTo.SetText("Client");
        cComboSoldTo.SetValue("Cl"); 
        document.getElementById('TxtSoldTo').value="Enter Client Detail";
        document.getElementById('TxtBoughtFrom').value="";
        document.getElementById('TxtBoughtFrom_hidden').value="";
        cTxtTCodeFrom.SetText("");
        OnValueChangeBoughtFrm(cComboBoughtFrom,'BoughtFrom');
      }
  }
  else
  {
    if(cComboSoldTo.GetValue()=="Cl")
      {
      Div_SoldTo.style.display="inline";
       Div_TCodeTo.style.display="inline";
        document.getElementById('TxtSoldTo').value="Enter Client Detail";
         OnValueChangeSoldTo(cComboSoldTo,'SoldTo');
      } 
      
      else if(cComboSoldTo.GetValue()=="Brk")
      {  
          if(cComboBoughtFrom.GetValue()!="Brk" && cComboBoughtFrom.GetValue()!="Ex")
          { 
            Div_SoldTo.style.display="inline";
            Div_TCodeTo.style.display="inline";
            document.getElementById('TxtSoldTo').value="Enter Broker Detail";
            OnValueChangeSoldTo(cComboSoldTo,'SoldTo');
          }
          else
          {
             if(cComboBoughtFrom.GetValue()=="Brk")
                {
                    alert('You Can Not Make Entry Between Broker To Broker.');
                    
                }
             if(cComboBoughtFrom.GetValue()=="Ex")
                {
                    alert('You Can Not Make Entry Between Exchange To Broker.');
                }
                 cComboSoldTo.SetText("Client");
                 cComboSoldTo.SetValue("Cl");
                 document.getElementById('TxtSoldTo').value="Enter Client Detail";
                 OnValueChangeSoldTo(cComboSoldTo,'SoldTo');
          }
      }
      
    else if (cComboSoldTo.GetValue()=="Ex")
      {
        if(cComboBoughtFrom.GetValue()!="Ex" && cComboBoughtFrom.GetValue()!="Brk")
        {
            Div_SoldTo.style.display="none";
            Div_TCodeTo.style.display="none";
            document.getElementById('TxtSoldTo').value="";
            document.getElementById('TxtSoldTo_hidden').value="";     
            cTxtTCodeTo.SetText("");
            OnValueChangeSoldTo(cComboSoldTo,'SoldTo');
        }
        else
        {
            if(cComboBoughtFrom.GetValue()=="Ex")
            {
                alert('You Can Not Make Entry Between Exchange To Exchange.');
            }
            if(cComboBoughtFrom.GetValue()=="Brk")
            {
                alert('You Can Not Make Entry Between Exchange To Broker.');
                
            }
                cComboSoldTo.SetText("Client");
                cComboSoldTo.SetValue("Cl");
                Div_SoldTo.style.display="inline";
                Div_TCodeTo.style.display="inline";
                document.getElementById('TxtSoldTo').value="Enter Client Detail";
                OnValueChangeSoldTo(cComboSoldTo,'SoldTo');
        }
      } 
    }

}

function OnTypeChangeGV(WhichCall)
{
 
if(WhichCall=="BoughtFrom")
{
     if(cComboBoughtFromE.GetValue()=="Cl")
      { 
          Div_BoughtFrmE.style.display="inline";
           Div_TCodeFrmE.style.display="inline";
            OnValueChangeBoughtFrm(cComboBoughtFromE,'BoughtFrom');
      }
     if(cComboBoughtFromE.GetValue()=="Brk")
      {
        Div_BoughtFrmE.style.display="inline";
         Div_TCodeFrmE.style.display="inline";
          cComboSoldToE.SetText("Client");
           cComboSoldToE.SetValue("Cl");
            cTxtTCodeFromE.SetText("");
             OnValueChangeBoughtFrm(cComboBoughtFromE,'BoughtFrom');
      
      }
     if (cComboBoughtFromE.GetValue()=="Ex")
      {
          Div_BoughtFrmE.style.display="none";
           Div_TCodeFrmE.style.display="none";
            cComboSoldToE.SetText("Client");
             cComboSoldToE.SetValue("Cl");
              cTxtTCodeFromE.SetText("");
               OnValueChangeBoughtFrm(cComboBoughtFromE,'BoughtFrom');
      
      }
 }
 
 else
 {
  
 if(cComboSoldToE.GetValue()=="Cl")
  {
      Div_SoldToE.style.display="inline";
       Div_TCodeToE.style.display="inline";
        OnValueChangeSoldTo(cComboSoldToE,'SoldTo');
  }
   
 if (cComboSoldToE.GetValue()=="Ex")
  {
     if(cComboBoughtFromE.GetValue()!="Ex" && cComboBoughtFromE.GetValue()!="Brk")
        {
          Div_SoldToE.style.display="none";
           Div_TCodeToE.style.display="none";
            OnValueChangeSoldTo(cComboSoldToE,'SoldTo');
        }
     else
        {
           if(cComboBoughtFromE.GetValue()=="Ex")
            {
                alert('You Can Not Make Entry Between Exchange To Exchange.');
            }
           if(cComboBoughtFromE.GetValue()=="Brk")
            {
                alert('You Can Not Make Entry Between Exchange To Broker.');
                
            }
            cComboBoughtFromE.SetText("Client");
             cComboBoughtFromE.SetValue("Cl");
              cTxtTCodeToE.SetText("");
               Div_SoldToE.style.display="inline";
                 Div_TCodeToE.style.display="inline";
                  OnValueChangeSoldTo(cComboSoldToE,'SoldTo');
        }
  }
  
  if(cComboSoldToE.GetValue()=="Brk")
      {
      
      if(cComboBoughtFromE.GetValue()!="Brk" && cComboBoughtFromE.GetValue()!="Ex")
         {
              Div_SoldToE.style.display="inline";
               Div_TCodeToE.style.display="inline";
            //    document.getElementById('TxtSoldToE').value="Enter Broker Detail";
                    OnValueChangeSoldTo(cComboSoldToE,'SoldTo');
          }
          else
          {
                 if(cComboBoughtFromE.GetValue()=="Brk")
                    {
                        alert('You Can Not Make Entry Between Broker To Broker.');
                        
                    }
                 if(cComboBoughtFromE.GetValue()=="Ex")
                    {
                        alert('You Can Not Make Entry Between Exchange To Broker.');
                    }
                    
                   cComboBoughtFromE.SetText("Client");
                   cComboBoughtFromE.SetValue("Cl");
                   cTxtTCodeFromE.SetText("");
                   OnValueChangeSoldTo(cComboSoldToE,'SoldTo');
           }
          
      }
 }

}


function OnClickingTextBox()
{

 if(document.getElementById('TxtBoughtFrom').value.trim()==""||document.getElementById('TxtBoughtFrom').value.trim()=="Enter Client Detail")
     {
        if(cComboBoughtFrom.GetText()=="Client")
               {
                    alert('Please Enter the Bought Form Client');
                     document.getElementById('TxtBoughtFrom').focus();
               }
         else if (cComboBoughtFrom.GetText()=="Broker")     
               {
                 alert('Please Enter the Broker Details');
                     document.getElementById('TxtBoughtFrom').focus(); 
               }
       else
           {
               if(document.getElementById('TxtSoldTo').value.trim()==""||document.getElementById('TxtSoldTo').value=="Enter Client Detail")
               {
                   alert('Please Enter the Sold To Client');
                    document.getElementById('TxtSoldTo').focus();
               }
               
               else
               {
                   return; 
               }
           }
     }

     else if(document.getElementById('TxtSoldTo').value.trim()==""||document.getElementById('TxtSoldTo').value.trim()=="Enter Client Detail")
     {
        if(cComboSoldTo.GetText()=="Client")
                {
                alert('Please Enter the Sold To Client');
                 document.getElementById('TxtSoldTo').focus();
                }
        else
                {
                    if(document.getElementById('TxtBoughtFrom').value.trim()==""||document.getElementById('TxtBoughtFrom').value.trim()=="Enter Client Detail")
                        {
                        alert('Please Enter the Bought From Client');
                         document.getElementById('TxtBoughtFrom').focus();
                        }
                     
                    else
                    {
                    return; 
                    }
                }
     }
     
     else
            {
            return; 
            }
 }
    
function clickOnTxt()
{
    if(document.getElementById('TxtInstrument').value.trim()=="")
        {
        alert('Please Enter the Instrument');
         document.getElementById('TxtInstrument').focus();
        }
    else if(cTxtQuantity.GetText()=="0.0000")
        {
        alert('Please Enter the Quantity');
         cTxtQuantity.Focus();
        }
    else
        {
        return; 
        }
}

function FocusOnTxt()
{
  if(document.getElementById('TxtInstrument').value.trim()=="")
        {
        alert('Please Enter the Instrument');
         document.getElementById('TxtInstrument').focus();
        }
    else if(cTxtQuantity.GetText()=="0.0000")
        {
        alert('Please Enter the Quantity');
         cTxtQuantity.Focus();
        }
    else if(cTxtMarketRate.GetText()=="0.0000")
        {
        alert('Please Enter the MarketRate');
         cTxtMarketRate.Focus();
        }
    else
        {
        return; 
        }
}

function AddButtonClick()
{
//alert(cTradeDt.GetText());
    if(cComboBoughtFrom.GetText()=="Client"||cComboBoughtFrom.GetText()=="Broker")
    {
        if(document.getElementById('TxtBoughtFrom').value.trim()==""||document.getElementById('TxtBoughtFrom').value.trim()=="Enter Client Detail"||document.getElementById('TxtBoughtFrom_hidden').value.trim()==""||document.getElementById('TxtBoughtFrom').value.trim()=="No Record Found")
         {
             alert('Please Enter the Bought Form Client');
              document.getElementById('TxtBoughtFrom').value="";
               document.getElementById('TxtBoughtFrom').focus();
                return;
         }
    }
   
    if(cComboSoldTo.GetText()=="Client")
    {
        if(document.getElementById('TxtSoldTo').value.trim()==""||document.getElementById('TxtSoldTo').value.trim()=="Enter Client Detail"||document.getElementById('TxtSoldTo_hidden').value.trim()==""||document.getElementById('TxtSoldTo').value.trim()=="No Record Found")
        {
            alert('Please Enter the Sold To Client');
             document.getElementById('TxtSoldTo').value="";
              document.getElementById('TxtSoldTo').focus();
               return;
        }
    }
     
    if(document.getElementById('TxtInstrument').value.trim()==""||document.getElementById('TxtInstrument_hidden').value.trim()==""||document.getElementById('TxtInstrument').value.trim()=="No Record Found")
    {
        alert('Please Enter the Instrument');
         document.getElementById('TxtInstrument').value="";
          document.getElementById('TxtInstrument').focus();
           return;
    }
    if(cTxtQuantity.GetText()=="0.0000")
    {
        alert('Please Enter the Quantity');
         cTxtQuantity.Focus();
          return;
    }
    
    
    cGvBindXml.PerformCallback('Bind~'); 
    
}



function Update()
{

  cGvBindXml.PerformCallback('Update~');

}

function DiscardButtonClick()
{
    cGvBindXml.PerformCallback('Discard~'); 
//     Reset();
//     alert('DiscardButtonClick');
}

function SaveButtonClick()
{
    cGvBindXml.PerformCallback('Save~'+cTradeDt.GetText().trim());
     
}
function message()
{
    alert('Data has been saved'); 
}

function ReEnterButtonClick()
{
    Reset();
//    alert('ReEnterButtonClick');
}

function ExitButtonClick(obj)
{
        if(obj=='Exit')
        {
            window.close();
        }
        else
        {
            cGvBindXml.PerformCallback('Save~'+cTradeDt.GetText().trim());
             alert('Data has been saved');
              window.close(); 
        }
}

function keyVal(obj)
 {
//  alert(obj);

if(obj=="No Record Found")
{
     if(cComboBoughtFrom.GetValue()=="Cl" && document.getElementById('TxtBoughtFrom_hidden').value=="No Record Found" )
     {
                cTxtTCodeFrom.SetValue(" ");
     }
     if(cComboBoughtFromE.GetValue()=="Cl" && document.getElementById('TxtBoughtFromE_hidden').value=="No Record Found" )
     {
               cTxtTCodeFromE.SetValue(" ");
     }
     if(cComboSoldTo.GetValue()=="Cl" && document.getElementById('TxtSoldTo_hidden').value.trim()=="No Record Found")
     {
               cTxtTCodeTo.SetValue(" ");
     }
     if(cComboSoldToE.GetValue()=="Cl" && document.getElementById('TxtSoldToE_hidden').value.trim()=="No Record Found")
     {
               cTxtTCodeToE.SetValue(" ");
     }
 }


           var WhichCall=obj.split('~')[0];
           

            if(WhichCall=="BOUGHT")
               {
                var ChrgTCode1=obj.split('~')[1];
                 cTxtTCodeFrom.SetValue(ChrgTCode1);
                  cTxtTCodeFromE.SetValue(ChrgTCode1);
                 
               }
           else if(WhichCall=="SOLD")
               {
                var ChrgTCode2=obj.split('~')[1];
                  cTxtTCodeTo.SetValue(ChrgTCode2);
                   cTxtTCodeToE.SetValue(ChrgTCode2);
               }
           else
               {
               return;
               }
               
 }

function Reset()
{
    cTxtOrderNo.SetText("");   
     cTxtTradeNo.SetText("");  
      document.getElementById('TxtInstrument').value="";
       cTxtQuantity.SetText("000000000");
        cTxtMarketRate.SetText("000000000");
          cTxtTradeCtg.SetText("");
            cComboBrokerage.SetValue("Bkg");   
              cComboBoughtFrom.SetValue("Cl");
                Div_BoughtFrm.style.display="inline";
                 Div_TCodeFrm.style.display="inline";
                  document.getElementById('TxtBoughtFrom').value="Enter Client Detail"; 
                    document.getElementById('TxtBoughtFrom').style.color="gray";      
                     cComboSoldTo.SetValue("Cl");
                        Div_SoldTo.style.display="inline";
                         Div_TCodeTo.style.display="inline";
                         document.getElementById('TxtSoldTo').value="Enter Client Detail";
                      document.getElementById('TxtSoldTo').style.color="gray"; 
                    cTxtTCodeFrom.SetText("TCode"); 
                  cTxtTCodeTo.SetText("TCode");
                document.getElementById("TxtBoughtFrom_hidden").value="";
              document.getElementById("TxtSoldTo_hidden").value="";  
            cGvBindXml.PerformCallback('ok'+'~'+'Pro'+'~'+cTradeDt.GetText()+'~'+'Cl'+'~'+'BoughtFrom'+'~'+'Cl'+'~'+'SoldTo',"");
            
}


function GvBindXml_EndCallBack()
{

        height();
        if(cGvBindXml.cpEntryAdded!=null)
        {
            Reset();
            Div_ShowEntry.style.display="inline";
            cComboBoughtFrom.Focus();
        }
        if(cGvBindXml.cpExpiryDate!=null)
        {
            alert(cGvBindXml.cpExpiryDate);
            cTradeDt.Focus();
            cGvBindXml.cpExpiryDate=null;
        }
        if(cGvBindXml.cpComboModeChange=="T")
            {
            cComboMode.SetText("Add Entry");
            cGvBindXml.cpComboModeChange=null;
            }
        if(cGvBindXml.cpEdit=="F")
        {
            if(cGvBindXml.cpEditAvl == "NE")
                {

                    alert('Sorry!!This Entry Can Not Be Edited..Trade Already Processed For This Record. You Can Only Delete This Trade.');
                    cGvBindXml.CancelEdit();
                    cGvBindXml.cpEdit=null;
              
                }  
              
        }

        if(cGvBindXml.cpFreshBinding!=null)
        {
            if(cGvBindXml.cpFreshBinding.split('~')[0]=="F")
            {
                divContinueEdit.innerHTML="This Entry Was Already Being Edited By You."+
                cGvBindXml.cpFreshBinding.split('~')[1];
                cFileUsedByPopUp.Show();
                cGvBindXml.cpFreshBinding=null;
            }
            else if(cGvBindXml.cpFreshBinding.split('~')[0]=="T")
            {
                alert('This File is Being Used By UserID= '+cGvBindXml.cpFreshBinding.split('~')[1]);
                cPopUp_StartPage.Show();
                cGvBindXml.cpFreshBinding=null;
            }
        }
            
        if(cGvBindXml.cpEdit=="T")
        {
              if(cGvBindXml.cpFileAlreadyUsedBy!=undefined)
              {  
                
                var obj=cGvBindXml.cpFileAlreadyUsedBy;
                var WhichUser=(obj.split('~')[0]);
             
                if(WhichUser=="Other")
                {
                alert('This Entry is Being Edited By '+obj.split('~')[1]);
                cGvBindXml.cpFileAlreadyUsedBy = null;
                } 
                else
                {
                alert('This Entry is already Being Edited By You');
                cGvBindXml.cpFileAlreadyUsedBy = null;
                }   

             }
            
            if( cGvBindXml.cpBindDivEX == "B")
            {
              Div_BoughtFrmE.style.display="none";
               Div_TCodeFrmE.style.display="none";
                cComboSoldToE.SetText("Client");
                 cTxtTCodeFromE.SetText("");
                  cGvBindXml.cpBindDivEX=null;
                   return;
            }

            if(cGvBindXml.cpBindDivEX == "S")
            {
              Div_SoldToE.style.display="none";
               Div_TCodeToE.style.display="none";
                cComboBoughtFromE.SetText("Client");
                
                 cTxtTCodeToE.SetText("");
                  cGvBindXml.cpBindDivEX=null;
                   return;
            }

            if(cGvBindXml.cpBindDivCL == "B")
            {
              cGvBindXml.cpBindDivCL=null;
               return;
            }


            if(cGvBindXml.cpBindDivCL == "S")
            {    
              Div_SoldToE.style.display="inline";
               Div_TCodeToE.style.display="inline";
                cGvBindXml.cpBindDivCL=null;
                 return;
            }
            cGvBindXml.cpEdit=null;
         }

        if(cGvBindXml.cpUpdate == "T")
        {
            
            if(cGvBindXml.cpGiveMsg=="Bt")
            {
                alert('Please enter the Client');
                 cGvBindXml.cpGiveMsg=null;
                  return;
            }

            if(cGvBindXml.cpGiveMsg=="St")
            {
                alert('Please enter the Client');
                 cGvBindXml.cpGiveMsg=null;
                  return;
            }

            if(cGvBindXml.cpGiveMsg=="It")
            {
                alert('Please enter the Instrument');
                 cGvBindXml.cpGiveMsg=null;
                  return;
            }

            if(cGvBindXml.cpGiveMsg=="Qt")
            {
                alert('Please enter the Quantity');
                 cGvBindXml.cpGiveMsg=null;
                  return;
            }

            if(cGvBindXml.cpGiveMsg=="Tc")
            {
                alert('Please enter the Trade Category');
                 cGvBindXml.cpGiveMsg=null;
                  return;
            }
            if(cGvBindXml.cpUpdateAlrt=="U")
            {
                alert("Data has been Updated.Please Save After All Changes.[Click Above Save Button] Or [Press Alt S].");
                 cGvBindXml.cpUpdateAlrt=null;
            }
            
            cGvBindXml.cpUpdate =null;
        }

            if(cGvBindXml.cpDataSave=="S")
            {
            alert('Data has been saved');
            cGvBindXml.cpDataSave=null; 
            }
          
            if(cGvBindXml.cpAfterRowDeleted=="D")
            {
                alert('Data has been Deleted.Please Save After All Changes.[Click Above Save Button] Or [Press Alt S].');
                 cGvBindXml.cpAfterRowDeleted=null;
            }
            
             
         cGvBindXml.cpEdit=null;
         cGvBindXml.cpEditAvl =null; 
         cGvBindXml.cpFileAlreadyUsedBy=null;
         
         
         //////////////Recieve Server Code///////////////////////////
                    if(cGvBindXml.cpdata !=null)
                    {
                        var rcvdata=cGvBindXml.cpdata.split('#');
                        if(rcvdata[0]!="Bc")
                        {
                            var Data1=rcvdata[0].split('@');
                            
                            if(Data1[0]=='AjaxQuery')
                            { 
                                  AjaxComQuery = Data1[2];
                                  
                                  if(Data1[1].toUpperCase()=='BOUGHTFROM') 
                                  {   
                                    var AjaxList_TextBox=document.getElementById('TxtBoughtFrom'); 
                                    AjaxList_TextBox.attachEvent('onkeyup',CallGenericAjaxBoughtFrom);
                                    
                                   
                                  }
                             }
                        }
                        
                        if(rcvdata[1]!="Sc")
                        {
                           var Data2=rcvdata[1].split('@');
                           if(Data2[0]=='AjaxQuerySold')
                                { 
                                      AjaxComQuerySold = Data2[2];
                                     
                                      if(Data2[1].toUpperCase()=='SOLDTO') 
                                      {   
                                            var AjaxList_TextBoxSoldTo=document.getElementById('TxtSoldTo'); 
                                            AjaxList_TextBoxSoldTo.attachEvent('onkeyup',CallGenericAjaxSoldTo);
                                            
                                       
                                      }
                                 }
                       
                        }
                       
                       var Data3=rcvdata[2].split('@');
                       if(Data3[0]=='AjaxQueryProduct')
                        { 
                              AjaxComQueryProduct = Data3[2];
                             
                              if(Data3[1].toUpperCase()=='PRODUCT')
                              {
                                   var AjaxList_TextBoxProduct=document.getElementById('TxtInstrument'); 
                                   AjaxList_TextBoxProduct.attachEvent('onkeyup',CallGenericAjaxProduct);
                                     
                              }

                        }
                     }
             ////////////// End Recieve Server Code///////////////////////////

                
             
}

function OnValueChangeBoughtFrm(objCombo,objSource)
{
    var CliBro=objCombo.GetValue();
    cGvBindXml.PerformCallback('ok'+'~'+''+'~~'+CliBro+'~'+objSource+'~'+'Cl'+'~'+'',""); 
 
}
 
function OnValueChangeSoldTo(objCombo,objSource)
 {
    var CliBro=objCombo.GetValue();
    cGvBindXml.PerformCallback('ok'+'~~~~~'+CliBro+'~'+objSource,""); 
 }

function SignOff()
    {
        window.parent.SignOff();
    }
    
    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
             window.frameElement.height = '500px';
              window.frameElement.Width = document.body.scrollWidth;
   }
   
   function OnFocusTextBox()
   {
    
    if(document.getElementById('TxtBoughtFrom').value==""||document.getElementById('TxtBoughtFrom').value=="Enter Client Detail")
     {
        if(cComboBoughtFrom.GetText()=="Client")
               {
                alert('Please Enter the Bought Form Client');
                 document.getElementById('TxtBoughtFrom').focus();
               }
       else
           {
               if(document.getElementById('TxtSoldTo').value==""||document.getElementById('TxtSoldTo').value=="Enter Client Detail")
               {
               alert('Please Enter the Sold To Client');
                document.getElementById('TxtSoldTo').focus();
               }
               
               else
               {
                return; 
               }
           }
     }

     else if(document.getElementById('TxtSoldTo').value==""||document.getElementById('TxtSoldTo').value=="Enter Client Detail")
     {
        if(cComboSoldTo.GetText()=="Client")
                {
                alert('Please Enter the Sold To Client');
                 document.getElementById('TxtSoldTo').focus();
                }
        else
                {
                    if(document.getElementById('TxtBoughtFrom').value==""||document.getElementById('TxtBoughtFrom').value=="Enter Client Detail")
                        {
                        alert('Please Enter the Bought From Client');
                         document.getElementById('TxtBoughtFrom').focus();
                        }
                     
                    else
                    {
                     return; 
                    }
                }
     }
     
     else
          {
            return; 
          }
   }
   
   
//  function OnFocus(elementId, defaultText)
//{
//   if (document.getElementById(elementId).value == defaultText)
//   {
//      document.getElementById(elementId).className = "normal";
//       document.getElementById(elementId).value = "";
//   }
//}

//function OnBlur(elementId, defaultText)
//{
//   var textValue = document.getElementById(elementId).value;

//   if (textValue == defaultText || textValue.length == 0)
//   {
//      document.getElementById(elementId).className = "watermark";
//       document.getElementById(elementId).value = defaultText;
//   }
//   else
//      document.getElementById(elementId).className = "normal";
//}
function WaterMark(obj,type)
{
 var defaultTextClnt="Enter Client Detail";
 var defaultTextBrokr="Enter Broker Detail";
 if(type=="BoughtFrom")
    {
               if(cComboBoughtFrom.GetValue()=="Cl" && document.getElementById(obj).value=="")
               {
                document.getElementById(obj).value = defaultTextClnt;
                document.getElementById(obj).style.color="gray";
               }

             if(cComboBoughtFrom.GetValue()=="Brk" && document.getElementById(obj).value=="")
               {
                document.getElementById(obj).value = defaultTextBrokr;
                document.getElementById(obj).style.color="gray";
               }
    }
   if(type=="SoldTo")
    { 
               if(cComboSoldTo.GetValue()=="Cl" && document.getElementById(obj).value=="")
               {
               document.getElementById(obj).value = defaultTextClnt;
                document.getElementById(obj).style.color="gray";
               }

             if(cComboSoldTo.GetValue()=="Brk" && document.getElementById(obj).value=="")
               {
                document.getElementById(obj).value = defaultTextBrokr;
                 document.getElementById(obj).style.color="gray";
               }
    }
}
function NoWaterMark(obj)
{
 if(document.getElementById(obj).value == "Enter Client Detail"||document.getElementById(obj).value == "Enter Broker Detail")
   document.getElementById(obj).value = "";
   document.getElementById(obj).style.color="black";
}
 function changeColor(obj)
 {
 var color;
 if(obj.focused||obj.GetValue()!=null||obj.GetText()!="TCode")
     color="black";
 else
     color="gray";
      obj.GetInputElement().style.color=color;
 }
 
 function getvalue()
     {
        
     if(cTxtTCodeFrom.GetText()=="")
         {
        var obj=document.getElementById("TxtBoughtFrom_hidden").value;
         var WhichCall1=obj.split('~')[1];
         if(WhichCall1 =="")
             {
              alert('Please Enter the TCode');
             }
             else
             {
               cTxtTCodeFrom.SetValue( WhichCall1);
                cTxtTCodeFrom.SetText( WhichCall1);
             }
         }
    else if(document.getElementById('TxtBoughtFrom').value=="Enter Client Detail")
        {
            cTxtTCodeFrom.SetText("TCode");
        }
    else if(cTxtTCodeTo.GetText()=="")
         {
         var obj=document.getElementById("TxtSoldTo_hidden").value;
          var WhichCall2=obj.split('~')[1];
           cTxtTCodeTo.SetValue(WhichCall2);
            cTxtTCodeTo.SetText(WhichCall2);
         }
    else if(document.getElementById('TxtSoldTo').value=="Enter Client Detail")
         {
            cTxtTCodeTo.SetText("TCode");
         } 
     else
          return;
     }
  
  function PopUp_StartPage_abtnOK_Click()
        {
         
        var exchangeSegment="<%=Session["ExchangeSegmentID"]%>";
             if(exchangeSegment=="1" || exchangeSegment=="4" ||  exchangeSegment=="19")
                {
                 div_date.disabled=true;
                 cTradeDt.SetEnabled(false);
                 cComboBoughtFrom.Focus();

                } 
             else
                 {
                 cTradeDt.Focus();
                 }
                
             if (cComboMode.GetValue()=="Edit")
             {
                 Div_AddEntry.style.display="none";
                 Div_EditEntry.style.display="none";
                 div_Red.style.display="inline";
                 Div_DeleteRecords.style.display="inline";
                 document.getElementById("imgarrowup").setAttribute('title','Hide Add New Entry');
                 document.getElementById("imgarrowdown").setAttribute('title','Show Add New Entry');
             }
             if (cComboMode.GetValue()=="Add")
             {
                 Div_AddEntry.style.display="inline";
                 Div_BtnAddEntry.style.display="none";
                 Div_SaveBtn.style.display="none";
                 Div_FreshEditBtn.style.display="none";
                 div_Red.style.display="none";
                 Div_DeleteRecords.style.display="none";
                 document.getElementById("imgarrowup").setAttribute('title','Hide Edit New Entry');
                 document.getElementById("imgarrowdown").setAttribute('title','Show Edit New Entry');
             }
             
//             cGvBindXml.PerformCallback('ModeSelection~'+' ~'+cComboMode.GetValue()); 
             cGvBindXml.PerformCallback('BtnOk'+'~'+'Pro'+'~'+cTradeDt.GetText()+'~'+'Cl'+'~'+'BoughtFrom'+'~'+'Cl'+'~'+'SoldTo'+'~'+'ModeSelection'+'~'+cComboMode.GetValue(),"");
            
        }
        
 function OnAddEntryBtn_Click()
 {
 Div_AddEntry.style.display="inline";
 Div_BtnAddEntry.style.display="none";
// Div_OpnCloseBtn.style.display="none";
// Div_EditEntry.style.display="inline";
 Div_SaveBtn.style.display="none";
 Div_FreshEditBtn.style.display="none";
 div_Red.style.display="none";
 Div_DeleteRecords.style.display="none";
 cGvBindXml.PerformCallback('AddBind~');
 cComboMode.SetValue("Add");
 document.getElementById("imgarrowup").style.display='none';
 document.getElementById("imgarrowdown").style.display='inline';
 document.getElementById("imgarrowup").setAttribute('title','Hide Edit New Entry');
 document.getElementById("imgarrowdown").setAttribute('title','Show Edit New Entry');
 }
 
 function OnEditEntryBtn_Click()
 {
  Div_EditEntry.style.display="none";
//  Div_OpnCloseBtn.style.display="none";
//  Div_BtnAddEntry.style.display="inline";
  Div_AddEntry.style.display="none";
  div_Red.style.display="inline";
  Div_DeleteRecords.style.display="inline";
  cGvBindXml.PerformCallback('EditBind~'+cTradeDt.GetText().trim());
  cComboMode.SetValue("Edit");
  document.getElementById("imgarrowup").style.display='none';
  document.getElementById("imgarrowdown").style.display='inline';
  Div_SaveBtn.style.display="inline"; 
  Div_FreshEditBtn.style.display="inline";
  document.getElementById("imgarrowup").setAttribute('title','Hide Add New Entry');
  document.getElementById("imgarrowdown").setAttribute('title','Show Add New Entry');
 }       
  
 function ShowHideShowDetail(obj)
    {
    
        if(obj=='s')
        {
        if (cComboMode.GetValue()=="Add")
            {
             Div_EditEntry.style.display="inline";
            }
        else if(cComboMode.GetValue()=="Edit")
            {
            Div_BtnAddEntry.style.display="inline";
            Div_SaveBtn.style.display="none"; 
            Div_FreshEditBtn.style.display="none";
            }
        document.getElementById("imgarrowup").style.display='inline';
        document.getElementById("imgarrowdown").style.display='none';
        
        }
        
        if(obj=='h')
        {
         Div_BtnAddEntry.style.display="none";
         Div_EditEntry.style.display="none";
         document.getElementById("imgarrowup").style.display='none';
         document.getElementById("imgarrowdown").style.display='inline';
         if (cComboMode.GetValue()=="Edit")
            {
         Div_SaveBtn.style.display="inline"; 
         Div_FreshEditBtn.style.display="inline";
             }
        }
    }
    function IsProductExpired(CompareToDate,SessionExpireDate)
    {
        //alert(SessionExpireDate+'~'+CompareToDate.GetText());
        ///Date Should Between Current Fin Year StartDate and EndDate
        var ExpireDate = new Date(SessionExpireDate);
        var CompareDate = new Date(CompareToDate.GetDate());
        
        monthnumber = ExpireDate.getMonth();
        monthday    = ExpireDate.getDate();
        year        = ExpireDate.getYear();
        var ExpireDateValue=new Date(year, monthnumber, monthday);
        
      
        monthnumber = CompareDate.getMonth();
        monthday    = CompareDate.getDate();
        year        = CompareDate.getYear();
        var CompareDateValue=new Date(year, monthnumber, monthday);
        
                
        //alert('ExpireDateValue :'+ExpireDateValue+' CompareDateValue :'+CompareDateValue);
        
        var ExpireDateNumeric=ExpireDateValue.getTime();
        var CompareDateNumeric=CompareDateValue.getTime();

        if(ExpireDateNumeric<=CompareDateNumeric)
        {
            alert('License Expired.Please Renew Your License for No Further Interruption!!!.Sorry For InConvenience.');
            CompareToDate.Focus();
            return 'T';
        }
        else
            return 'F';
            
    }
    function DateChange(DateObj)
    { 
     // alert(DateObj.GetText());
        var Lck ='<%=Session["LCKBNK"] %>';
        var FYS ='<%=Session["FinYearStart"]%>';
        var FYE ='<%=Session["FinYearEnd"]%>'; 
        var LFY ='<%=Session["LastFinYear"]%>';
        var GetDate='<%=Session["ServerDate"]%>';
        var ExpDate='<%=Session["ExpireDate"]%>';
        //var ExpDate='31-12-2013';
        
//        if(IsProductExpired(DateObj,ExpDate)=='F')
//        {
            DevE_CheckForLockDate(DateObj,Lck);
            DevE_CheckForFinYear(DateObj,FYS,FYE,LFY);
//        }

        cGvBindXml.PerformCallback('date'+'~'+cTradeDt.GetText()+'~'+'Pro',"");
//     cGvBindXml.PerformCallback('DateBind~'+DateObj.GetText().trim()+'~'+DateObj.GetDate());
//     Reset(); 
//     alert('DateChange');   
    }
    
    function btnCancelClick()
    {
     cFileUsedByPopUp.Hide();
    }
    
    function btnContinueClick()
     {
        cGvBindXml.PerformCallback('ContinueEdit~');
     }
    
    function CallRaiseCallBackEvent(oCombo,WhichCall)
    {
  
    }
    
    function CallGenericAjaxBoughtFrom(e)
    {
      
        var AjaxList_TextBox=document.getElementById('<%=TxtBoughtFrom.ClientID%>'); 
        AjaxComQuery=AjaxComQuery.replace("\'","'");
        ajax_showOptions(AjaxList_TextBox,'GenericAjaxList',e,replaceChars(AjaxComQuery),'Main');
     
    }
    function CallGenericAjaxSoldTo(e)
    {
      
        var AjaxList_TextBoxSoldTo=document.getElementById('<%=TxtSoldTo.ClientID%>'); 
        AjaxComQuerySold=AjaxComQuerySold.replace("\'","'");
        ajax_showOptions(AjaxList_TextBoxSoldTo,'GenericAjaxList',e,replaceChars(AjaxComQuerySold),'Main');
     
    }
    function CallGenericAjaxProduct(e)
    {
      
        var AjaxList_TextBoxProduct=document.getElementById('<%=TxtInstrument.ClientID%>'); 
        AjaxComQueryProduct=AjaxComQueryProduct.replace("\'","'");
        ajax_showOptions(AjaxList_TextBoxProduct,'GenericAjaxList',e,replaceChars(AjaxComQueryProduct),'Main');
     
    }
    
    function btnRefreshList()
    {
        cGvBindXml.PerformCallback('Refresh~'+cTradeDt.GetText().trim());
        //  cFileUsedByPopUp.Hide();
    }
    
  function CancelEditing()
 {
   cGvBindXml.CancelEdit();

 }
 function btnCancelClickAndShowFirst()
 {
  cFileUsedByPopUp.Hide();
  cPopUp_StartPage.Show();
  
 }
 
 
    </script>

</head>
<body onload="HideLoading();">
    <form id="form1" runat="server">
        <div style="padding-top: 4px" id="div_startBtns">
            <div id="Div_header" style="width: 96%">
                <div id="Div_headername" class="EHEADER" style="width: 97.5%; text-align: center">
                    <strong><span id="SpanHeader" style="color: #000099; font-family: Tahoma,Arial, Helvetica, sans-serif;font-size:12px">
                        TRADES ENTRY</span></strong></div>
            </div>
            <div style="width: 99%; padding-top: 4px;" >
                <div id="div_date" class="tdsecondary" runat="server" style="width: 17%;margin-left: 2px;">
                    <dxe:ASPxDateEdit ID="TradeDt" runat="server" ClientInstanceName="cTradeDt" DateOnError="Today"
                        EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="98%">
                        <ButtonStyle Width="3px">
                        </ButtonStyle>
                        <DropDownButton Text="TradeDate">
                        </DropDownButton>
                        <ClientSideEvents LostFocus="function(s,e){DateChange(cTradeDt);}"/>
                    </dxe:ASPxDateEdit>
                    <%--DateChanged="function(s,e){DateChange(cTradeDt);}"--%>
                </div>
            <div id="Div_GvRowColorDetail" class="tdsecondary" style="background-color: #e0e0e0; width: 40%;float: left; text-align: center;" >
                    <div>
                        <div style="float: left; width: 18px;
                            height: 15px; background-color: blue;">
                        </div>
                        <div style="color:#000099;font-size: 10pt; float: left;font-family: Calibri">&nbsp;Unsaved Record(s)&nbsp;&nbsp;</div>
                        <div style="float: left;color:black;width: 18px; height: 15px; background-color: black;">
                        </div>
                      
                        <div style="float: left;color: black;font-family: Calibri;font-size: 10pt; width: 95px;">
                            &nbsp;Saved Record(s)&nbsp;
                        </div>
                        <div id="div_Red" runat="server" style="float: left;color:black;width: 18px; height: 15px; background-color: red;" >
                        </div>
                        <div id="Div_DeleteRecords" style="float: left;color: black;font-family: Calibri;font-size: 10pt; width: 107px;" >
                            &nbsp;Deleted Record(s)</div>
                    </div>
                </div>
            <div id="Div_OpnCloseBtn"  runat="server" style="width: 4%;float: left; text-align: right;">
                <img id="imgarrowdown" alt="Show Add New Entry/Edit New Entry" onclick="ShowHideShowDetail('s')" src="../images/arrow_down.gif"
                    style="cursor: pointer" />
                <img id="imgarrowup" alt="Hide Add New Entry/Edit New Entry" onclick="ShowHideShowDetail('h')" src="../images/arrow_up.gif"
                     style="cursor: pointer;display: none" />&nbsp;<span id="span_addCharge" style="font-weight: bold;
                        color: maroon"></span>
            </div>
            <div id="Div_BtnAddEntry"  runat="server" style="width: 15%;float: left; text-align: right;;display:none; padding-right: 6px; padding-top: 2px;">
            <dxe:ASPxButton ID="AddEntry_ASPxBtn" runat="server" AutoPostBack="false" TabIndex="0"
                            Text="Add New Entry >>" ToolTip="Click Button to Add New Entries"
                            Width="99%" ClientInstanceName="cbtnAdd" BackColor="#DDECFE" Font-Names="Calibri" Font-Size="Small" ForeColor="Navy" >
                <Border BorderColor="#DDECFE" />
                <ClientSideEvents Click="function(s, e) {OnAddEntryBtn_Click();}" />
            </dxe:ASPxButton>
            </div>
            <div id="Div_EditEntry"  runat="server" style="width: 22%;float: left; text-align: right;;display:none; padding-right: 6px; padding-top: 2px;">
                <dxe:ASPxButton ID="EditEntry_ASPxBtn" runat="server" AutoPostBack="false" TabIndex="0"
                            Text="Edit Previously Saved Entry >>" ToolTip="Click Button to Edit Saved Entries"
                            Width="99%" ClientInstanceName="cbtnAdd" BackColor="#DDECFE" Font-Names="Calibri" Font-Size="Small" ForeColor="Navy" >
                    <Border BorderColor="#DDECFE" />
                    <ClientSideEvents Click="function(s, e) {OnEditEntryBtn_Click();}" />
                </dxe:ASPxButton>
            </div>
            <div id="Div_SaveBtn" style="float: left; width: 12%; padding-top: 2px;">
                <dxe:ASPxButton ID="SaveBtn" runat="server" AccessKey="S" AutoPostBack="false" TabIndex="0"
                            Text="[S]ave Changes" ToolTip="Save Data of Grid Below with Changes Made in Edit or Delete."
                            Width="95%">
                    <Border BorderColor="White" />
                    <ClientSideEvents Click="function(s, e) {SaveButtonClick();}" />
                    <Paddings PaddingTop="2px" />
                </dxe:ASPxButton>
            </div><div id="Div_FreshEditBtn" style="float: left; width: 12%; padding-top: 2px;">
                <dxe:ASPxButton ID="BtnFreshEdit" runat="server" AccessKey="F" AutoPostBack="false" TabIndex="0"
                            Text="[F]resh Edit" ToolTip="Refresh The Entries in Grid and Discard the changes made in Editing"
                            Width="95%" ClientInstanceName="cBtnFreshEdit">
                    <Paddings PaddingTop="2px" />
                    <Border BorderColor="White" />
                    <ClientSideEvents Click="function(s, e) {btnRefreshList();}" />
                </dxe:ASPxButton>
            </div>
             </div>
            <div id="Div_AddEntry" runat="server" style="margin-top: 1px; border-left-color: white; float: left;
                border-bottom-color: white; margin-left: 1px; width: 99%; border-top-color: white;
                margin-right: 5px;">
                <div id="Div34" align="center" style="width: 98%">
                    <div id="divDIV" align="center" style="width: 49%; float: left">
                        <div id="Div31" class="tdmain" style="float: left; margin: 4px; width: 95%; text-align: center;">
                            &nbsp;Bought From</div>
                    </div>
                    <div id="divDIV2" align="center" style="width: 49%; float: left">
                        <div id="Div12" class="tdmain" style="float: left; margin-top: 4px;margin-bottom: 4px;margin-left: 3.8px;margin-right: 4px; width: 95%; text-align: center;">
                            &nbsp;Sold To</div>
                    </div>
                </div>
                <div id="Div19" align="center" style="width: 98%">
                    <div id="Div_divide" align="center" style="width: 49%; float: left">
                        <div id="Div20" class="tdsecondary" style="float: left; margin-left:2px;margin-top:4px;margin-bottom:2px;height: 24px;  width: 18%;">
                            <dxe:ASPxComboBox ID="ComboBoughtFrom" runat="server" ClientInstanceName="cComboBoughtFrom"
                                EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                Width="100%">
                                <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange('BoughtFrom')}" TextChanged="onClientChange"></ClientSideEvents>
                                
                                <%--ValueChanged="function(s,e){OnValueChangeBoughtFrm(cComboBoughtFrom,'BoughtFrom')}" --%>
                                <Items>
                                    <dxe:ListEditItem Text="Client" Value="Cl" />
                                    <dxe:ListEditItem Text="Broker" Value="Brk" />
                                    <dxe:ListEditItem Text="Exchange" Value="Ex" />
                                </Items>
                            </dxe:ASPxComboBox>
                        </div>
                        <div id="Div_BoughtFrm" class="tdsecondary" align="left" style="margin-left: 2px;margin-top: 4px;margin-bottom:2px; height: 24px;width: 50%;">
                            <asp:TextBox ID="TxtBoughtFrom" runat="server" Width="98%"  onfocus="NoWaterMark('TxtBoughtFrom')" OnClick="NoWaterMark('TxtBoughtFrom')" onblur="WaterMark('TxtBoughtFrom','BoughtFrom')"
                                 Text="Enter Client Detail" Font-Size="Small" ForeColor="gray"></asp:TextBox></div>
                        <div id="Div_TCodeFrm" class="tdsecondary" style="margin-left:1px;margin-top:4px; margin-bottom:2px; height: 24px;width: 23%;">
                            <dxe:ASPxTextBox ID="TxtTCodeFrom" runat="server" ClientInstanceName="cTxtTCodeFrom" 
                                HorizontalAlign="left" Width="98%" EnableClientSideAPI="True"
                                ForeColor="DarkGray" Text="TCode">
                                <ClientSideEvents GotFocus="function(s, e) {changeColor(s);}" LostFocus="function(s, e) {changeColor(s);getvalue();}" />
                            </dxe:ASPxTextBox>
                        </div>
                    </div>
                    <div id="Div_divide2" align="center" style="width: 49%; float: left">
                        <div id="Div21" class="tdsecondary" style="float: left; margin-left:2px;margin-top:4px;margin-bottom:2px; height: 24px;width: 18%;">
                            <dxe:ASPxComboBox ID="ComboSoldTo" runat="server" ClientInstanceName="cComboSoldTo"
                                EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                Width="100%">
                                <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange('SoldTo')}" ></ClientSideEvents>
                                <%--ValueChanged="function(s,e){OnValueChangeSoldTo(cComboSoldTo,'SoldTo')}"--%>
                                <Items>
                                    <dxe:ListEditItem Text="Client" Value="Cl" />
                                    <dxe:ListEditItem Text="Broker" Value="Brk" />
                                    <dxe:ListEditItem Text="Exchange" Value="Ex" />
                                </Items>
                            </dxe:ASPxComboBox>
                        </div>
                        <div id="Div_SoldTo" class="tdsecondary" align="left" style="margin-left: 2px;margin-top: 4px;margin-bottom:2px;height: 24px; width: 50%;">
                            <asp:TextBox ID="TxtSoldTo" runat="server"  Width="98%" onfocus="NoWaterMark('TxtSoldTo')" OnClick="NoWaterMark('TxtSoldTo')" onblur="WaterMark('TxtSoldTo','SoldTo')"
                                Text="Enter Client Detail" Font-Size="Small" ForeColor="gray"></asp:TextBox>
                        </div>
                        <div id="Div_TCodeTo" class="tdsecondary" style="margin-left:1px;margin-top:4px;margin-bottom:2px;height: 24px;width: 23%;">
                            <dxe:ASPxTextBox ID="TxtTCodeTo" runat="server" ClientInstanceName="cTxtTCodeTo"
                                HorizontalAlign="left" Width="98%" EnableClientSideAPI="True"
                                ForeColor="DarkGray" Text="TCode">
                                <ClientSideEvents GotFocus="function(s, e) {changeColor(s);}" LostFocus="function(s, e) {changeColor(s);getvalue();}" />
                            </dxe:ASPxTextBox>
                        </div>
                    </div>
                </div>
                <div id="Div_middle_1" align="center" style="width: 98%">
                    <div id="Div11" class="tdmain" style="margin: 4px; width: 17%; text-align: center">
                        <span style="color: black; margin: 4px;">&nbsp;Order No.</span></div>
                    <div id="Div13" class="tdmain" style="float: left; margin: 4px; width: 17%; text-align: center">
                        Trade No.</div>
                    <div id="Div14" class="tdmain" style="float: left; margin: 4px; width: 22%; text-align: center">
                        Instrument</div>
                    <div id="Div2" class="tdmain" style="float: left; margin: 4px; width: 17%; text-align: center">
                        Quantity</div>
                    <div id="Div5" class="tdmain" style="float: left; margin: 4px; width: 17%; text-align: center">
                        Market Rate</div>
                </div>
                <div id="Div_middle_2" style="width: 98%">
                    <div id="Div17" class="tdsecondary" align="left" style="float: left; margin: 4px;
                        width: 17%; height: 24px;">
                        <dxe:ASPxTextBox ID="TxtOrderNo" runat="server" ClientInstanceName="cTxtOrderNo"
                            Width="98%" OnClick="OnClickingTextBox()">
                            <ClientSideEvents GotFocus="OnFocusTextBox" />
                        </dxe:ASPxTextBox>
                    </div>
                    <div id="Div1_Middle2_1" class="tdsecondary" style="margin: 4px; width: 17%; height: 24px;"
                        align="left">
                        <dxe:ASPxTextBox ID="TxtTradeNo" runat="server" ClientInstanceName="cTxtTradeNo"
                            Width="98%" OnClick="OnClickingTextBox()">
                            <ClientSideEvents GotFocus="OnFocusTextBox" />
                        </dxe:ASPxTextBox>
                    </div>
                    <div id="Div4" class="tdsecondary" align="left" style="margin: 4px; width: 22%; height: 24px;">
                        <asp:TextBox ID="TxtInstrument" runat="server" HorizontalAlign="left" Width="97%"
                            OnClick="OnClickingTextBox()" onfocus="OnClickingTextBox()"></asp:TextBox>
                    </div>
                    <div id="Div7" class="tdsecondary" style="margin: 4px; width: 17%; height: 24px;">
                        <dxe:ASPxTextBox ID="TxtQuantity" runat="server" ClientInstanceName="cTxtQuantity"
                            HorizontalAlign="Right" Width="157px" OnClick="OnClickingTextBox()">
                            <ClientSideEvents GotFocus="OnFocusTextBox" />
                            <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;0000..9999&gt;"  IncludeLiterals="DecimalSymbol" />
                        </dxe:ASPxTextBox>
                        &nbsp;</div>
                    <div id="Div8" class="tdsecondary" style="margin: 4px; width: 17%; height: 24px;">
                        <dxe:ASPxTextBox ID="TxtMarketRate" runat="server" ClientInstanceName="cTxtMarketRate"
                            HorizontalAlign="Right" Width="157px" OnClick="OnClickingTextBox()">
                            <ClientSideEvents GotFocus="OnFocusTextBox" />
                            <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;0000..9999&gt;"  IncludeLiterals="DecimalSymbol" />
                        </dxe:ASPxTextBox>
                        &nbsp;</div>
                </div>
                <div id="Div16" align="center" style="width: 98%">
                    <div id="Div3" class="tdmain" style="margin: 4px; width: 17%; text-align: center">
                        &nbsp;Brokerage</div>
                    <div id="Div6" class="tdmain" style="float: left; margin: 4px; width: 17%; text-align: center">
                        &nbsp;Trade Category</div>
                    <%--New Work--%>
                    <div id="Div23" class="tdmain" style="float: left; margin: 4px; width: 17%; text-align: center">
                        &nbsp;Effective Date</div>
                    <%--End of New Work--%>
                </div>
                <div id="Div_middle_3" style="font-size: 12pt; width: 98%">
                    <div id="Div9" align="center" style="float: left; width: 89%;">
                        <span style="font-size: 7pt; color: white"></span>
                        <div id="Div10" class="tdsecondary" align="left" style="float: left; margin: 4px;
                            width: 19%;">
                            <dxe:ASPxComboBox ID="ComboBrokerage" runat="server" ClientInstanceName="cComboBrokerage"
                                EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                Width="98%">
                                <Items>
                                    <dxe:ListEditItem Text="Zero Brokerage" Value="Bkg" />
                                    <dxe:ListEditItem Text="Normal" Value="Norm" />
                                </Items>
                            </dxe:ASPxComboBox>
                        </div>
                        <div id="Div18" class="tdsecondary" align="left" style="margin-top: 4px; float: left;
                            margin-bottom: 4px; margin-left: 4px; width: 19%;">
                            <dxe:ASPxTextBox ID="TxtTradeCtg" runat="server" ClientInstanceName="cTxtTradeCtg"
                                Width="98%" MaxLength="3" OnClick="clickOnTxt()">
                                <ClientSideEvents GotFocus="FocusOnTxt" />
                            </dxe:ASPxTextBox>
                        </div>
                        <%--New Work--%>
                        <div id="Div32" class="tdsecondary" runat="server" style="margin-top: 4px; float: left;
                            margin-bottom: 4px; margin-left: 4px; width: 19%;">
                            <dxe:ASPxDateEdit ID="EffectiveDt" runat="server" ClientInstanceName="cEffectiveDt" DateOnError="Today"
                                EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="98%">
                                <ButtonStyle Width="3px">
                                </ButtonStyle>
                                <DropDownButton Text="EffectiveDate">
                                </DropDownButton>
                                <ClientSideEvents LostFocus="function(s,e){DateChange(cEffectiveDt);}"/>
                            </dxe:ASPxDateEdit>
                        </div>
                        <%--End of New Work--%>
                    </div>
                    <br />
                    <br />
                </div>
                <div id="Div24" style="width: 98%; height: 2%">
                    <div id="Div25" style="float: left; width: 19%">
                        <dxe:ASPxButton ID="btnAdd" runat="server" AccessKey="L" AutoPostBack="false" TabIndex="0"
                            Text="Add To [L]ist" ToolTip="Add Data You Entered into Below Grid (Note. Yet To Be Save)"
                            Width="90%" ClientInstanceName="cbtnAdd">
                            <ClientSideEvents Click="function(s, e) {AddButtonClick();}" />
                            <Border BorderColor="White" />
                        </dxe:ASPxButton>
                    </div>
                    <div id="Div26" style="float: left; width: 19%">
                        <dxe:ASPxButton ID="btnCancel" runat="server" AccessKey="R" AutoPostBack="false"
                            TabIndex="0" Text="[R]enter" ToolTip="Position You On Start Without Adding Data to Grid Below."
                            Width="90%">
                            <Border BorderColor="White" />
                            <ClientSideEvents Click="function(s, e) {ReEnterButtonClick();}" />
                        </dxe:ASPxButton>
                    </div>
                    <div id="Div27" style="float: left; width: 19%">
                        <dxe:ASPxButton ID="btnSave" runat="server" AccessKey="S" AutoPostBack="false" TabIndex="0"
                            Text="[S]ave List" ToolTip="Save Added Data of Grid Below. And Bind Again in Grid."
                            Width="90%">
                            <Border BorderColor="White" />
                            <ClientSideEvents Click="function(s, e) {SaveButtonClick();}" />
                        </dxe:ASPxButton>
                    </div>
                     <div id="Div1" style="float: left; width: 19%">
                      <%--  <asp:Button ID="btn" runat="server" Text="Ex" OnClick="ex_click" />--%>
                        <dxe:ASPxButton ID="btnExport" runat="server" AccessKey="c" AllowFocus="False"  OnClick="ex_click"
                            AutoPostBack="false" TabIndex="0" Text="Export" ToolTip="Position You at Very First Position. Remove All Unsave Data."
                            Width="92%">
                            <Border BorderColor="White" />
                            
                        </dxe:ASPxButton>
                    </div>
                    <div id="Div28" style="float: left; width: 19%">
                        <dxe:ASPxButton ID="btncancelall" runat="server" AccessKey="c" AllowFocus="False"
                            AutoPostBack="false" TabIndex="0" Text="Dis[c]ard Added List" ToolTip="Position You at Very First Position. Remove All Unsave Data."
                            Width="92%">
                            <Border BorderColor="White" />
                            <ClientSideEvents Click="function(s, e) {DiscardButtonClick();}" />
                        </dxe:ASPxButton>
                    </div>
                </div>
                <br />
            </div>
            
            <div id="Div_ShowEntry" style="padding-top: 4px" runat="server">
            <dxwgv:ASPxGridView ID="GvBindXml" runat="server" AutoGenerateColumns="False" ClientInstanceName="cGvBindXml"
                KeyFieldName="RowID" OnCustomCallback="GvBindXml_CustomCallback" Width="995px"
                Settings-ShowHorizontalScrollBar="true" OnHtmlEditFormCreated="GvBindXml_HtmlEditFormCreated" OnCancelRowEditing="GvBindXml_CancelRowEditing"
                OnRowDeleting="GvBindXml_RowDeleting" OnHtmlRowCreated="GvBindXml_HtmlRowCreated" Font-Size="Small" OnCommandButtonInitialize="GvBindXml_CommandButtonInitialize" >
                <Templates>
                    <EditForm>
                        <div id="Div_left" style="margin-top: 1px; border-left-color: white; float: left;
                            border-bottom-color: white; margin-left: 1px; width: 99%; border-top-color: white;
                            margin-right: 5px;">
                            <div id="Div34" align="center" style="width: 98%">
                                <div id="divDIV" align="center" style="width: 45%; float: left">
                                    <div id="Div31" class="tdmain" style="float: left; margin: 4px; width: 95%; text-align: center;">
                                        &nbsp;Bought From</div>
                                </div>
                                <div id="divDIV2" align="center" style="width: 45%; float: left">
                                    <div id="Div12" class="tdmain" style="float: left; margin: 4px; width: 95%; text-align: center;">
                                        &nbsp;Sold To</div>
                                </div>
                            </div>
                            <div id="Div19" align="center" style="width: 98%">
                                <div id="Div_divide" align="center" style="width: 45%; float: left">
                                    <div id="Div20" class="tdsecondary" style="float: left; margin: 2px; width: 20%;">
                                        <dxe:ASPxComboBox ID="ComboBoughtFromE" runat="server" ClientInstanceName="cComboBoughtFromE"
                                            Text='<%# Bind("BoughtFromD") %>' EnableIncrementalFiltering="True" Font-Size="Small"
                                            SelectedIndex="0" ValueType="System.String" Width="98%">
                                            <ClientSideEvents SelectedIndexChanged="OnTypeChangeGV" > </ClientSideEvents>
                                            <Items>
                                                <dxe:ListEditItem Text="Client" Value="Cl" />
                                                <dxe:ListEditItem Text="Broker" Value="Brk" />
                                                <dxe:ListEditItem Text="Exchange" Value="Ex" />
                                            </Items>
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <div id="Div_BoughtFrmE" class="tdsecondary" align="left" style="margin: 2px; width: 52%;">
                                        <asp:TextBox ID="TxtBoughtFromE" runat="server" HorizontalAlign="Right" Width="98%"
                                            Font-Size="Small" OnFocus="" Text='<%# Bind("BoughtFromClientD") %>'> </asp:TextBox>
                                        <asp:HiddenField ID="TxtBoughtFromE_hidden" runat="server" Value='<%# Bind("BoughtFromClientHiddenValue") %>' />
                                    </div>
                                    <div id="Div_TCodeFrmE" class="tdsecondary" style="margin-top: 2px; float: left;
                                        margin-bottom: 4px; margin-left: 4px; width: 18%;">
                                        <dxe:ASPxTextBox ID="TxtTCodeFromE" runat="server" ClientInstanceName="cTxtTCodeFromE"
                                            HorizontalAlign="left" Width="98%" EnableClientSideAPI="True"
                                            ForeColor="Gray" Text='<%# Bind("BoughtFromClientTCodeD") %>'>
                                            <ClientSideEvents GotFocus="function(s, e) {changeColor(s);}" LostFocus="function(s, e) {changeColor(s);getvalue();}" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="Div_divide2" align="center" style="width: 45%; float: left">
                                    <div id="Div21" class="tdsecondary" style="float: left; margin: 2px; width: 20%;">
                                        <dxe:ASPxComboBox ID="ComboSoldToE" runat="server" ClientInstanceName="cComboSoldToE"
                                            Text='<%# Bind("SoldToD") %>' EnableIncrementalFiltering="True" Font-Size="Small"
                                            SelectedIndex="0" ValueType="System.String" Width="98%">
                                            <ClientSideEvents SelectedIndexChanged="OnTypeChangeGV" ></ClientSideEvents>
                                            <%-- ValueChanged="function(s,e){OnValueChangeSoldTo(cComboSoldToE,'SoldTo')}"--%>
                                            <Items>
                                                <dxe:ListEditItem Text="Client" Value="Cl" />
                                                <dxe:ListEditItem Text="Broker" Value="Brk" />
                                                <dxe:ListEditItem Text="Exchange" Value="Ex" />
                                            </Items>
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <div id="Div_SoldToE"  class="tdsecondary" align="left" style="margin: 2px; width: 52%;">
                                        <asp:TextBox ID="TxtSoldToE" runat="server" HorizontalAlign="Right" Width="98%"
                                            Font-Size="Small" Text='<%# Bind("SoldToClientD") %>'> </asp:TextBox>
                                        <asp:HiddenField ID="TxtSoldToE_hidden" runat="server" Value='<%# Bind("SoldToClientHiddenValue") %>' />
                                    </div>
                                    <div id="Div_TCodeToE" class="tdsecondary" style="margin: 2px; float: left;width:18%;">
                                        <dxe:ASPxTextBox ID="TxtTCodeToE" runat="server" ClientInstanceName="cTxtTCodeToE"
                                            HorizontalAlign="left" Width="98%" EnableClientSideAPI="True"
                                            ForeColor="Gray" Text='<%# Bind("SoldToClientTCodeD") %>'>
                                            <ClientSideEvents GotFocus="function(s, e) {changeColor(s);}" LostFocus="function(s, e) {changeColor(s);getvalue();}" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                            </div>
                            <div id="Div_middle_1" align="center" style="width: 98%">
                                <div id="Div11" class="tdmain" style="margin: 2px; width: 15%; text-align: center">
                                    <span style="color: black; margin: 2px;">&nbsp;Order No.</span></div>
                                <div id="Div13" class="tdmain" style="float: left; margin: 2px; width: 15%; text-align: center">
                                    Trade No.</div>
                                <div id="Div14" class="tdmain" style="float: left; margin: 2px; width: 24%; text-align: center">
                                    Instrument</div>
                                <div id="Div2" class="tdmain" style="float: left; margin: 2px; width: 15%; text-align: center">
                                    Quantity</div>
                                <div id="Div5" class="tdmain" style="float: left; margin: 2px; width: 15%; text-align: center">
                                    Market Rate</div>
                            </div>
                            <div id="Div_middle_2" style="width: 98%">
                                <div id="Div17" class="tdsecondary" align="left" style="float: left; margin: 2px;
                                    width: 15%;">
                                    <dxe:ASPxTextBox ID="TxtOrderNoE" runat="server" ClientInstanceName="cTxtOrderNoE"
                                        Text='<%# Bind("OrderNoD") %>' Width="98%">
                                        <%--<ClientSideEvents GotFocus="OnFocusTextBox" />--%>
                                    </dxe:ASPxTextBox>
                                </div>
                                <div id="Div1_Middle2_1" class="tdsecondary" style="margin: 2px; width: 15%;"
                                    align="left">
                                    <dxe:ASPxTextBox ID="TxtTradeNoE" runat="server" ClientInstanceName="cTxtTradeNoE"
                                        Text='<%# Bind("TradeNoD") %>' Width="98%">
                                    </dxe:ASPxTextBox>
                                </div>
                                <div id="Div4" class="tdsecondary" align="left" style="margin: 2px; width: 24%;">
                                    <asp:TextBox ID="TxtInstrumentE" runat="server" HorizontalAlign="left" Width="98%"
                                        Text='<%# Bind("InstrumentD") %>'></asp:TextBox>
                                    <asp:HiddenField ID="TxtInstrumentE_hidden" runat="server" Value='<%# Bind("InstrumentHiddenValue") %>' />
                                </div>
                                <div id="Div7" class="tdsecondary" style="margin: 2px; width: 15%; height:22px">
                                <dxe:ASPxTextBox ID="TxtQuantityE" runat="server" ClientInstanceName="cTxtQuantityE"
                                        HorizontalAlign="Right" Width="145px" Text='<%# Bind("QuantityD") %>'>
                                        <%--<MaskSettings Mask="&lt;0..999999g&gt;" IncludeLiterals="DecimalSymbol" />--%>
                                        <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;0000..9999&gt;"  IncludeLiterals="DecimalSymbol" />
                                    </dxe:ASPxTextBox>
                                    &nbsp;</div>
                                    <div id="Div8" class="tdsecondary" style="margin: 2px; width: 15%;height:22px">
                                    <dxe:ASPxTextBox ID="TxtMarketRateE" runat="server" ClientInstanceName="cTxtMarketRateE"
                                        HorizontalAlign="Right" Width="145px" Text='<%# Bind("MarketRateD") %>'>
                                        <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;0000..9999&gt;"  IncludeLiterals="DecimalSymbol" />
                                    </dxe:ASPxTextBox>
                                    &nbsp;</div>
                            </div>
                            <div id="Div16" align="center" style="width: 98%">
                                <div id="Div3" class="tdmain" style="margin: 2px; width: 15%; text-align: center">
                                    &nbsp;Brokerage</div>
                                <div id="Div6" class="tdmain" style="float: left; margin: 2px; width: 15%; text-align: center">
                                    &nbsp;Trade Category</div>
                                <%--New Work--%>
                                <div id="Div35" class="tdmain" style="float: left; margin: 2px; width: 15%; text-align: center">
                                    &nbsp;Effective Date</div>
                                <%--End of New Work--%>
                            </div>
                            <div id="Div_middle_3" style="font-size: 12pt; width: 98%">
                                <div id="Div9" align="center" style="float: left; width: 89%;">
                                    <span style="font-size: 7pt; color: white"></span>
                                    <div id="Div10" class="tdsecondary" align="left" style="float: left; margin: 2px;
                                        width: 17%;">
                                        <dxe:ASPxComboBox ID="ComboBrokerageE" runat="server" ClientInstanceName="cComboBrokerageE"
                                            EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                            Width="98%">
                                            <Items>
                                                <dxe:ListEditItem Text="Zero Brokerage" Value="Bkg" />
                                                <dxe:ListEditItem Text="Normal" Value="Norm" />
                                            </Items>
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <div id="Div18" class="tdsecondary" align="left" style="margin: 2px; float: left;width: 17%;">
                                        <dxe:ASPxTextBox ID="TxtTradeCtgE" runat="server" ClientInstanceName="cTxtTradeCtgE"
                                            Width="98%" MaxLength="3" Text='<%# Bind("TradeCategoryD") %>'>
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <%--New Work--%>
                                    <div id="Div33" class="tdsecondary" align="left" style="margin: 1px; float: left;width: 20%;">
                                        <dxe:ASPxDateEdit ID="EffectiveDtE" runat="server" ClientInstanceName="cEffectiveDtE" DateOnError="Today"
                                            EditFormat="Custom" DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="98%" 
                                            Value='<%# Bind("EffectiveDateD") %>'>
                                            <ButtonStyle Width="3px">
                                            </ButtonStyle>
                                            <DropDownButton Text="EffectiveDate">
                                            </DropDownButton>
                                        </dxe:ASPxDateEdit>
                                    </div>
                                    <%--End of New Work--%>
                                    <dxe:ASPxTextBox ID="EntryModeTxt" runat="server" Visible="false"
                                           Text='<%# Bind("EntryMode") %>'>
                                    </dxe:ASPxTextBox>
                                    
                                     <dxe:ASPxTextBox ID="TransExchangeTradesID1Txt" runat="server" Visible="false"
                                           Text='<%# Bind("TransExchangeTradesID1") %>'>
                                    </dxe:ASPxTextBox>
                                    
                                    <dxe:ASPxTextBox ID="TransExchangeTradesID2Txt" runat="server" Visible="false"
                                           Text='<%# Bind("TransExchangeTradesID2") %>'>
                                    </dxe:ASPxTextBox>
                                    
                                    <dxe:ASPxTextBox ID="EditAvailability"  ClientInstanceName="cEditAvailability" runat="server" Visible="false"
                                           Text='<%# Bind("EditAvailability") %>'>
                                    </dxe:ASPxTextBox>
                                    
                                    <div id="Div29" style="float: left; width: 16%">
                                        <%--<dxcp:ASPxCallbackPanel ID="CbpConvert" runat="server" ClientInstanceName="cCbpConvert" OnCallback="CbpConvert_Callback">
                        <PanelCollection>
                            <dxp:panelcontent runat="server">--%>
                                        <dxe:ASPxButton ID="btnUpdate" runat="server" AccessKey="X" AutoPostBack="False"
                                            TabIndex="0" Text="Update Detail" ToolTip="Update the Detail you have inserted now."
                                            Width="90%">
                                            <Border BorderColor="White" />
                                            <ClientSideEvents Click="function(s, e) { Update();}" />
                                            <%-- { Update();CbpUpdate.PerformCallback('RowId~'+GvBindXml.GetSelectedKeysOnPage());}" />--%>
                                        </dxe:ASPxButton>
                                        <%--</dxp:panelcontent>
                    </PanelCollection>
                    </dxcp:ASPxCallbackPanel>--%>
                                    </div>
                                    <div id="Div30" style="float: left; width: 16%">
                                        <dxe:ASPxButton ID="btnCancel" runat="server" AccessKey="W" AutoPostBack="False"
                                            TabIndex="0" Text="Cancel" ToolTip="Cancel Editing or Updating." 
                                            Width="90%">
                                        
                                            <Border BorderColor="White" />
                                          <ClientSideEvents Click="function(s, e) {CancelEditing();}" />
                                        </dxe:ASPxButton>
                                        
                                    </div>
                                </div>
                                <br />
                                <br />
                            </div>
                            <br />
                        </div>
                    </EditForm>
                    <TitlePanel>
                        <table style="width: 150%">
                            <tr>
                                <td align="right">
                                    <table width="200px">
                                        <tr>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </TitlePanel>
                </Templates>
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                <Styles>
               
                    <Header ImageSpacing="5px" SortingImageSpacing="5px" CssClass="gridheader">
                    </Header>
                    <FocusedGroupRow CssClass="gridselectedrow">
                    </FocusedGroupRow>
                    <FocusedRow CssClass="gridselectedrow" HorizontalAlign="Left" VerticalAlign="Top">
                    </FocusedRow>
                    <Footer CssClass="gridfooter">
                    </Footer>
                    <LoadingPanel ImageSpacing="10px">
                    </LoadingPanel>
                    <Row Wrap="False">
                    </Row>
                </Styles>
                <SettingsEditing Mode="EditForm" />
                <SettingsText EmptyDataRow="No Data To Display" />
                <ClientSideEvents EndCallback="function (s, e) {GvBindXml_EndCallBack();}" />
                <Columns>
                    <dxwgv:GridViewCommandColumn VisibleIndex="0" Width="50px" ButtonType="Link" CellStyle-Font-Underline="false" >
                        <EditButton   Text="Edit" Visible="True">
                        </EditButton>
                        <DeleteButton  Visible="True">
                        </DeleteButton>
                        <CellStyle Font-Underline="false" Font-Size="12px">
                            <HoverStyle BackColor="#000040">
                            </HoverStyle>
                        </CellStyle>
                    </dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn Caption="BOUGHT FROM" VisibleIndex="1" Width="320px">
                        <DataItemTemplate>
                            <div class="GVdiv">
                                <dxe:ASPxLabel ID="BoughtFromLabel" runat="server" Text='<%# Eval("BoughtFrom")%>' Font-Size="10px">
                                </dxe:ASPxLabel>
                            </div>
                            <div class="GVdiv">
                                <dxe:ASPxLabel ID="BoughtFromClientLabel" runat="server" Text='<%# Eval("BoughtFromClient")%>' Font-Size="10px">
                                </dxe:ASPxLabel>
                                <asp:HiddenField ID="BoughtFromClientLabel_hidden" runat="server" Value='<%#Eval("BoughtFromClientHiddenValue") %>' />
                            </div>
                            <div class="GVdiv">
                                <dxe:ASPxLabel ID="BoughtFromClientTCodeLabel" runat="server" Text='<%# Eval("BoughtFromClientTCode")%>' Font-Size="10px">
                                </dxe:ASPxLabel>
                            </div>
                        </DataItemTemplate>
                        <CellStyle Wrap="False" Font-Size="Smaller">
                        </CellStyle>
                        <HeaderTemplate>
                            <div class="GVdiv">
                            </div>
                            <div class="GVdiv" style="font-size:11px">
                                BOUGHT FROM</div>
                            <div class="GVdiv" >
                            </div>
                        </HeaderTemplate>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="SOLD TO" VisibleIndex="2" Width="300px">
                        <DataItemTemplate>
                            <div class="GVdiv">
                                <dxe:ASPxLabel ID="SoldToLabel" runat="server" Text='<%# Eval("SoldTo")%>' Font-Size="10px">
                                </dxe:ASPxLabel>
                            </div>
                            <div class="GVdiv">
                                <dxe:ASPxLabel ID="SoldToClientLabel" runat="server" Text='<%# Eval("SoldToClient")%>' Font-Size="10px">
                                </dxe:ASPxLabel>
                                <asp:HiddenField ID="SoldToClientLabel_hidden" runat="server" Value='<%#Eval("SoldToClientHiddenValue") %>' />
                            </div>
                            <div class="GVdiv">
                                <dxe:ASPxLabel ID="SoldToClientTCodeLabel" runat="server" Text='<%# Eval("SoldToClientTCode")%>' Font-Size="10px">
                                </dxe:ASPxLabel>
                            </div>
                        </DataItemTemplate>
                      
                        <HeaderTemplate>
                            <div class="GVdiv">
                            </div>
                            <div class="GVdiv" style="font-size:11px">
                                SOLD TO</div>
                            <div class="GVdiv">
                            </div>
                        </HeaderTemplate>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="TRADE DETAILS" VisibleIndex="3" Width="500px">
                        <DataItemTemplate>
                            <div class="GVdiv">
                                <dxe:ASPxLabel ID="TradeNoLabel" runat="server" Text='<%# Eval("OrderNo")%>' Font-Size="10px">
                                </dxe:ASPxLabel>
                            </div>
                            <%--<div class="GVdiv" style="width:10px" ></div>--%>
                            <div class="GVdiv">
                                <dxe:ASPxLabel ID="OrderNoLabel" runat="server"  Text='<%# Eval("TradeNo")%>' Font-Size="10px">
                                </dxe:ASPxLabel>
                            </div>
                            <div class="GVdiv">
                                <dxe:ASPxLabel ID="InstrumentLabel" runat="server" Text='<%# Eval("Instrument")%>' Font-Size="10px">
                                </dxe:ASPxLabel>
                                <asp:HiddenField ID="InstrumentLabel_hidden" runat="server" Value='<%# Eval("InstrumentHiddenValue") %>' />
                            </div>
                            <div class="GVdiv">
                                <dxe:ASPxLabel ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity")%>' Font-Size="10px">
                                </dxe:ASPxLabel>
                            </div>
                            <div class="GVdiv">
                                <dxe:ASPxLabel ID="MarketRateLabel" runat="server" Text='<%# Eval("MarketRate")%>' Font-Size="10px">
                                </dxe:ASPxLabel>
                            </div>
                        </DataItemTemplate>
                        <CellStyle Wrap="False" Font-Size="Smaller">
                        </CellStyle>
                        <HeaderTemplate>
                            <div class="GVdiv" style="font-size:11px">
                                [ORDER NO.]</div>
                            <div class="GVdiv" style="font-size:11px">
                                [TRADE NO.]</div>
                            <div class="GVdiv" style="font-size:11px">
                                [INSTRUMENT]</div>
                            <div class="GVdiv" style="font-size:11px">
                                [QUANTITY]</div>
                            <div class="GVdiv" style="font-size:11px">
                                [MARKET RATE]</div>
                        </HeaderTemplate>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="TradeCategory" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="OrderNoD" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="TradeNoD" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="InstrumentD" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="QuantityD" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="MarketRateD" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="BoughtFromD" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="BoughtFromClientD" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="BoughtFromClientTCodeD" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="SoldToD" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="SoldToClientD" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="SoldToClientTCodeD" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="BrokerageD" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="TradeCategoryD" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="EntryMode" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="TransExchangeTradesID1" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="TransExchangeTradesID2" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="EditAvailability" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    
                </Columns>
                <settings  ShowHorizontalScrollBar="True" ></settings>
            </dxwgv:ASPxGridView>
            </div>
            <asp:HiddenField ID="TxtBoughtFrom_hidden" runat="server" />
            <asp:HiddenField ID="TxtSoldTo_hidden" runat="server" />
            <asp:HiddenField ID="TxtInstrument_hidden" runat="server" />
            <br />
            <dxpc:ASPxPopupControl ID="PopUp_StartPage" runat="server" ClientInstanceName="cPopUp_StartPage"
                CloseAction="None" HeaderText="Select Entry Type" Modal="True" PopupHorizontalAlign="WindowCenter"
                PopupVerticalAlign="WindowCenter" ShowOnPageLoad="True" ShowSizeGrip="False" Width="387px">
                <ClientSideEvents PopUp="function(s, e)
                                                    {
                                                    setTimeout('cComboMode.Focus()', 50);
                                                    }" />
                <ContentCollection>
                    <dxpc:PopupControlContentControl runat="server">
                     <asp:Panel ID="Panel_Start" runat="server" DefaultButton="abtnOk">
                   <div style="text-align:center">
                   <br />
                <dxe:ASPxComboBox ID="ComboMode" runat="server" ClientInstanceName="cComboMode" EnableIncrementalFiltering="True"
                                            Font-Size="10px" SelectedIndex="0" ValueType="System.String" Width="155px">
                                            <Items>
                                               
                                                <dxe:ListEditItem Text="Add Entry" Value="Add" />
                                                <dxe:ListEditItem Text="Show Or Edit Entry" Value="Edit" />
                                            </Items>
                                        </dxe:ASPxComboBox>
                        <br />
                                        <dxe:ASPxButton ID="abtnOk" runat="server" AutoPostBack="False" Text="Ok" Width="85px">
                                            <ClientSideEvents Click="function (s, e) {PopUp_StartPage_abtnOK_Click();cPopUp_StartPage.Hide(); }" />
                                        </dxe:ASPxButton>
                    </div>
                    </asp:Panel> 
                    </dxpc:PopupControlContentControl>
                </ContentCollection>
                <HeaderStyle BackColor="LightGray" ForeColor="Black" Font-Names="Calibri" />
            </dxpc:ASPxPopupControl>
            <br />
            <dxpc:ASPxPopupControl ID="FileUsedByPopUp" runat="server" ClientInstanceName="cFileUsedByPopUp"
                HeaderText="Notice" Left="100" PopupHorizontalAlign="Center"
                PopupVerticalAlign="WindowCenter" ShowSizeGrip="False" Top="100" Width="696px" Modal="True" CloseAction="None">
                <ClientSideEvents PopUp="function(s, e)
                                                    {
                                                    setTimeout('cBtnContinue.Focus()', 50);
                                                    }" />
                <ContentCollection>
                    <dxpc:PopupControlContentControl runat="server" >
                        <br />
                    <asp:Panel ID="Panel_check" runat="server" DefaultButton="BtnContinue" Width="98%">
                        
                           <div id="divContinueEdit" style="font-weight:bold">
                                    </div><br />
                            <div  style="width: 98%;" id="DIV15">
                            <div style="width: 31%;float:left">
                                <dxe:ASPxButton ID="BtnContinue" runat="server" AutoPostBack="False" Text="Continue With Previous Edit" ClientInstanceName="cBtnContinue"
                                        Width="90%">
                                    <ClientSideEvents Click="function (s, e) {btnContinueClick(); cFileUsedByPopUp.Hide(); }" />
                                </dxe:ASPxButton>
                            </div>
                                <div style="width:21%;float:left" id="DIV22"  >
                                
                                    <dxe:ASPxButton ID="btnRefresh" runat="server" AutoPostBack="False" Height="6px"
                                         Text="Fresh Editing" Width="90%" >
                                        <ClientSideEvents Click="function (s, e) {btnRefreshList(); cFileUsedByPopUp.Hide(); }" />
                                        <Paddings PaddingRight="10px" PaddingLeft="10px" />
                                    </dxe:ASPxButton>
                                </div>
                                <div style="width: 22%;float:left">
                                    <dxe:ASPxButton ID="discardBtnPopup" runat="server" AutoPostBack="False" Text="Discard Previous Edit"
                                        Width="95%">
                                        <ClientSideEvents Click="function (s, e) {DiscardButtonClick(); cFileUsedByPopUp.Hide(); }" />
                                    </dxe:ASPxButton>
                                 </div> 
                                 <div style="width: 24%;float:left">
                                     <dxe:ASPxButton ID="btnCancle" runat="server" AutoPostBack="False" Text="Cancel"
                                        Width="140px">
                                         <ClientSideEvents Click="function (s, e) {btnCancelClickAndShowFirst(); cFileUsedByPopUp.Hide(); }" />
                                     </dxe:ASPxButton>
                                 </div>
                            </div>  
                          </asp:Panel>        
                    </dxpc:PopupControlContentControl>
                </ContentCollection>
                <HeaderStyle Font-Names="Calibri" BackColor="LightGray" />
            </dxpc:ASPxPopupControl>
            &nbsp;
            
        </div>
    </form>
</body>
</html>
