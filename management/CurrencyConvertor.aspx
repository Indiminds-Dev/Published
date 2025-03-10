<%@ page language="C#" autoeventwireup="true" inherits="management_CurrencyConverter, App_Web_e158i_8t" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1">
    <title>Untitled Page</title>
 <link type="text/css" href="../CSS/PageStyle.css" rel="Stylesheet" />
 <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
 <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.min.js"></script>
 <script type="text/javascript" src="../JSFUNCTION/loaddata.js"></script>
 <script type="text/javascript" language="javascript" >
 
 function DateChange(DateObj)
    {
        var Lck ='<%=Session["LCKBNK"] %>';
        var FYS ='<%=Session["FinYearStart"]%>';
        var FYE ='<%=Session["FinYearEnd"]%>'; 
        var LFY ='<%=Session["LastFinYear"]%>';
        DevE_CheckForLockDate(DateObj,Lck);
        DevE_CheckForFinYear(DateObj,FYS,FYE,LFY);
    }
    
function ConvertButtonClick()
{ 
    if(cTxtAmnt.GetText()=="0.00")
    {
        alert('Please Insert The Amount..');
        cTxtAmnt.Focus();
        return;
    }
    else if(cTxtConvrsnChrg.GetText()=="0.000000")
    {
        alert('Please Insert The Commission Rate..');
        cTxtConvrsnChrg.Focus();
        return;
    }
   else
    {
                 cFrmCrncylbl.SetText(cCombo_frmCrncy.GetText());
                 cToCrncylbl.SetText(cCombo_toCrncy.GetText());
                 cLblAmnt.SetText(cTxtAmnt.GetText());
             
                  var ComboValue=$.trim(cComboFeeBasis.GetValue());
                 cCbpConvert.PerformCallback('Convert~'+ComboValue);
                 
     
     }
     
}



function CbpConvert_EndCallBack()
   {

            if( cCbpConvert.cpNtAvl!=null)
            {
//                alert(cCbpConvert.cpNtAvl);
                Div_right_buttom.style.display="inline";
                Div_right.style.display="none";  
            }
            else
            {
                 cFromCrncyUnitlbl.SetText(cCbpConvert.cpUnit2);
                 cToCrncyUnitlbl.SetText(cCbpConvert.cpUnit);
                 cLblCnvAmnt.SetText(cCbpConvert.cpCnvamnt);
                 cChrglbl.SetText(cCbpConvert.cpCnCharge);
                 cFcrncylbl2.SetText(cCbpConvert.cpFromCrncySymbol);
                 cTcrncylbl2.SetText(cCbpConvert.cpToCrncySymbol);
                 cFcrncylbl3.SetText(cCbpConvert.cpFromCrncySymbol);
                 cTcrncylbl3.SetText(cCbpConvert.cpToCrncySymbol);
                 if(cCbpConvert.cpUnitCharge=="F")
                 {
                 cChrgUnitlbl.SetText(cCbpConvert.cpFromCrncySymbol);
                 }
                 else
                 {
                 cChrgUnitlbl.SetText(cCbpConvert.cpToCrncySymbol);
                 }
                 Div_right.style.display="inline";
                 Div_right_buttom.style.display="none";  
             }
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

 </script>
</head>
<body onload="HideLoading();">
    <form id="form1" runat="server">
    <div style="width:100%">
        <div id="Div_header" style="width: 96%">
            <div id="Div_headername" class="EHEADER" style="width: 97.5%; text-align: center">
                <strong><span id="SpanHeader" style="color: #000099; font-family: Tahoma,Arial, Helvetica, sans-serif">
                    Currency Converter</span></strong>&nbsp;</div>
        </div>
        <div id="Div2" style="width: 98%;"> </div>
        <div id="Div_left" style="width:52%; margin-top: 1px; margin-left: 1px;float:left; border-right: white thin solid; border-top: white thin solid; border-left: white thin solid; margin-right: 5px; border-bottom: white thin solid;">
       <div id="Div_date" style="width: 98%;">
            <div id="Div1_Middle1" class="tdmain" style="width: 10%;  text-align: center; height: 21px; margin-left: 5px;">
                Date</div>
            <div id="Div8" class="tdsecondary" style="width: 29%; ">
                <dxe:ASPxDateEdit ID="Date" runat="server" ClientInstanceName="cDate" DateOnError="Today"
                    EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="90%">
                    <ClientSideEvents DateChanged="function(s,e){DateChange(cDate);}" />
                    <ButtonStyle Width="3px">
                    </ButtonStyle>
                </dxe:ASPxDateEdit>
            </div>
        </div>
        <div id="Div_middle_1" style="width: 98%; " align="center">
            <div id="Div11" class="tdmain" style="width: 28%; ; text-align: center;margin:4px">
                <span style="color: black">
            &nbsp;Amount</span></div>
        <div id="Div13" class="tdmain" style="width: 28%; text-align: center;float:left;margin:4px" >
            &nbsp;Base Currency</div>
            <div id="Div14" class="tdmain" style="width: 28%;  text-align: center;float:left;margin:4px" >
            &nbsp;Converted Currency</div>
        </div>
        
        <div id="Div_middle_2" style="width: 98%;"><div id="Div17" class="tdsecondary" style="width: 28%; margin:4px;float:left;">
           
                    <dxe:ASPxTextBox ID="TxtAmnt" runat="server" Width="136px" ClientInstanceName="cTxtAmnt" HorizontalAlign="Right" > 
                       <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;"  IncludeLiterals="DecimalSymbol" />
                       
                       </dxe:ASPxTextBox>
                    </div>
                    
            <div id="Div1_Middle2_1" class="tdsecondary" style="width: 28%; margin:4px;">
                <dxe:ASPxComboBox ID="Combo_frmCrncy" runat="server" ClientInstanceName="cCombo_frmCrncy"
                  EnableIncrementalFiltering="True"
                    Font-Size="Small" SelectedIndex="0" ValueType="System.String" Width="97%">
                        <%-- <ClientSideEvents SelectedIndexChanged="OnTypeChange"></ClientSideEvents>--%>
                </dxe:ASPxComboBox>
                
            </div>
            <div id="Div4" class="tdsecondary" style="width: 28%; margin:4px;">
                <dxe:ASPxComboBox ID="Combo_toCrncy" runat="server" ClientInstanceName="cCombo_toCrncy"
                EnableIncrementalFiltering="True" 
                    Font-Size="Small" SelectedIndex="0" ValueType="System.String" Width="97%">
                   <%-- <ClientSideEvents SelectedIndexChanged="OnTypeChange"></ClientSideEvents>--%>
                </dxe:ASPxComboBox>
            </div>
        </div>
            <div id="Div16" style="width: 98%;" align="center">
                <div id="Div3" class="tdmain" style="width: 30%;  text-align: center;margin:4px">
                    &nbsp;Calculate Commission On</div>
                <div id="Div6" class="tdmain" style="width: 25%;  text-align: center;float:left;margin:4px" >
                    &nbsp;Commission Rate</div>
            </div>
        <div id="Div_middle_3" style="width: 98%; font-size: 12pt;">
            <div id="Div9" align="center" style="width: 89%; float:left; height: 54px;">
                <span style="color: white; font-size: 7pt;">
                </span><div id="Div10" class="tdsecondary" style="width: 34%; margin:4px;float:left; height: 25px;">
                <dxe:ASPxComboBox ID="ComboFeeBasis" runat="server" ClientInstanceName="cComboFeeBasis"
                Font-Size="Small"  EnableIncrementalFiltering="True" SelectedIndex="0" ValueType="System.String" Width="97%">
                                                   
                                             
              
                                                   
                                                    <Items>
                                                        <dxe:ListEditItem Text="Base Currency" Value="Fc"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Converted Currency" Value="Tc"></dxe:ListEditItem>
                                                    </Items>
                </dxe:ASPxComboBox>
                   </div>
                <div id="Div18" class="tdsecondary" style="width: 28%;float:left; height: 25px; margin-top: 4px; margin-bottom: 4px; margin-left: 4px;">
               
                <dxe:ASPxTextBox ID="TxtConvrsnChrg" runat="server"  Width="121px" ClientInstanceName="cTxtConvrsnChrg" HorizontalAlign="Right" > 
                 <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;00..999999&gt;"  IncludeLiterals="DecimalSymbol" />
                 </dxe:ASPxTextBox>
                   </div>
            <div id="Divbtn_GnDl" align="center" style=" width: 19%; margin-top: 8px; margin-bottom: 6px; margin-right: 6px;float:left">
            <dxcp:ASPxCallbackPanel ID="CbpConvert" runat="server" ClientInstanceName="cCbpConvert"  BackColor="Transparent" OnCallback="CbpConvert_Callback" Width="58px">
                        <PanelCollection>
                            <dxp:panelcontent runat="server">
                                <div style="width:80%;text-align:right; background-color: transparent;" >
                                    <dxe:ASPxButton ID="BtnConvrt" runat="server" AutoPostBack="False" ClientInstanceName="cBtnConvrt"
                                        Font-Size="Small" Text="Convert">
                                        <ClientSideEvents Click="function (s, e) {ConvertButtonClick();}" />
                                        <Border BorderColor="White" />
                                    </dxe:ASPxButton>
                                </div>
                            </dxp:panelcontent>
                        </PanelCollection>
                         <ClientSideEvents  EndCallback="function (s, e) {CbpConvert_EndCallBack();}" />
            </dxcp:ASPxCallbackPanel>
              
                &nbsp;</div>
            </div>
        </div>
            <br />
    </div>
     <div id="Div_right" style="background-color: #b7ceec;width:45%;float:left; border-right: white thin solid; border-top: white thin solid; border-left: white thin solid; border-bottom: white thin solid; height: auto;display:none; text-align: center; font-size: 12pt;">
         <br />
         <dxe:ASPxLabel ID="LblAmnt" runat="server" ForeColor="MidnightBlue" ClientInstanceName="cLblAmnt" Font-Bold="False" Font-Size="Large" ></dxe:ASPxLabel>
         &nbsp;
         <dxe:ASPxLabel ID="FrmCrncylbl" runat="server" Font-Size="Small" ForeColor="#000000" ClientInstanceName="cFrmCrncylbl" Font-Bold="False"></dxe:ASPxLabel>
         
         <strong><span style="color:darkblue; font-size: 14pt;">=</span> </strong>
         <dxe:ASPxLabel ID="LblCnvAmnt" runat="server" ForeColor="MidnightBlue" ClientInstanceName="cLblCnvAmnt" Font-Bold="False" Font-Size="Large">
         
         </dxe:ASPxLabel>
         &nbsp; 
         <dxe:ASPxLabel ID="ToCrncylbl" runat="server" Font-Size="Small" ForeColor="Black" ClientInstanceName="cToCrncylbl" Font-Bold="False"></dxe:ASPxLabel>
         &nbsp;&nbsp;<br />
         <br />
         <dxe:ASPxLabel ID="Fcrncylbl2" runat="server" ForeColor="MidnightBlue" ClientInstanceName="cFcrncylbl2" Font-Bold="False" Font-Size="Smaller" >
         </dxe:ASPxLabel>
         &nbsp;<dxe:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="Large" ForeColor="Black" ClientInstanceName="" Font-Bold="False" Text="1">
         </dxe:ASPxLabel>
         &nbsp; &nbsp;===<span style="color: #3333ff"><span style="color:dimgray"><span style="color:mediumblue">&gt;
             <dxe:ASPxLabel ID="Tcrncylbl2" runat="server" ForeColor="MidnightBlue" ClientInstanceName="cTcrncylbl2" Font-Bold="False" Font-Size="Smaller" >
             </dxe:ASPxLabel>
             </span></span></span><dxe:ASPxLabel ID="ToCrncyUnitlbl" runat="server" Font-Size="Small" ForeColor="Black" ClientInstanceName="cToCrncyUnitlbl" Font-Bold="False">
         </dxe:ASPxLabel>
         &nbsp;<span style="color:#3333ff; margin-top: 1px; margin-right: 1px;"><span style="color:dimgray"><strong>&nbsp;</strong></span>
             &nbsp;<br />
             <br />
             <dxe:ASPxLabel ID="Tcrncylbl3" runat="server" ForeColor="MidnightBlue" ClientInstanceName="cTcrncylbl3" Font-Bold="False" Font-Size="Smaller" >
             </dxe:ASPxLabel>
             &nbsp;<dxe:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="Large" ForeColor="Black" ClientInstanceName="" Font-Bold="False" Text="1">
             </dxe:ASPxLabel>
             &nbsp;<span style="color: #0000cd"></span>
             <span style="color: #000000">&nbsp;===</span><span style="color: #3333ff"><span style="color:dimgray"><span style="color:mediumblue">&gt;
                 <dxe:ASPxLabel ID="Fcrncylbl3" runat="server" ForeColor="MidnightBlue" ClientInstanceName="cFcrncylbl3" Font-Bold="False" Font-Size="Smaller" >
                 </dxe:ASPxLabel>
                 </span></span></span><dxe:ASPxLabel ID="FromCrncyUnitlbl" runat="server" Font-Size="Small" ForeColor="Black" ClientInstanceName="cFromCrncyUnitlbl" Font-Bold="False">
             </dxe:ASPxLabel>
             &nbsp;<span><span><strong>&nbsp;</strong></span>
                 <br />
             </span>
             <br />
             <span style="font-family: Calibri">Commission Amount:
                 <dxe:ASPxLabel ID="ChrgUnitlbl" runat="server" ForeColor="MidnightBlue" ClientInstanceName="cChrgUnitlbl" Font-Bold="False" Font-Size="Smaller" >
             </dxe:ASPxLabel>
             <dxe:ASPxLabel ID="Chrglbl" runat="server" Font-Size="Small" ForeColor="Black" ClientInstanceName="cChrglbl" Font-Bold="False">
             </dxe:ASPxLabel>
             <br />
             </span>
             <br />
         </span>
        
     </div><div id="Div_right_buttom" style="background-color: #b7ceec;width:45%;float:left; border-right: white thin solid; border-top: white thin solid; border-left: white thin solid; border-bottom: white thin solid; height: auto;display:none; text-align: center; font-size: 12pt;">
         <span style="font-size: 16pt">
         <br />
         </span><span style="font-size: 16pt">
         <br />
         </span>
         <span style="margin-top: 1px; margin-right: 1px;"><span>
         </span><span style="color: #3333ff; font-family: Calibri"><span style="font-size: 14pt;
             color: #00006f"><strong>Fx Rates</strong><br />
             For This Date For
             The Selected Currency Pair 
             <br />
             <strong>Not Available</strong> In The System!!!<br />
         </span>
             <br />
             <br />
             <span style="font-size: 16pt">
                 <br />
             </span>
         </span>
         </span>
     </div>
    </div>
        &nbsp;&nbsp;<br /><span style="color: #3333ff"><span style="color:dimgray"><span style="color: mediumblue">
        </span><strong>
            <br />
            <br />
            &nbsp;<br />
                </strong></span></span>
    </form>
</body>
</html>
