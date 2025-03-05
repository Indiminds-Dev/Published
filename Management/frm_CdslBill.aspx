<%@ page language="C#" autoeventwireup="true" inherits="management_frm_CdslBill, App_Web_sggmuspu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
<div align="center">
        <script language="javascript" type="text/javascript">
    function PageLoad()
    {
        FieldName='ctl00_ContentPlaceHolder3_btnShow';
        document.getElementById('Div1').style.display="none";
    }
    function dateassign(s)
    {

    d1=new Date(billdate.GetValue());
    d1.setDate(d1.getDate()+7);
    periodDueDate.SetValue(d1);
    //New Work
    var months = new Array(12);
    months[0] = "January";
    months[1] = "February";
    months[2] = "March";
    months[3] = "April";
    months[4] = "May";
    months[5] = "June";
    months[6] = "July";
    months[7] = "August";
    months[8] = "September";
    months[9] = "October";
    months[10] = "November";
    months[11] = "December";

    var current_date = new Date(billdate.GetValue());
    current_date.setDate(current_date.getDate());
    month_value = current_date.getMonth();
    day_value = current_date.getDate();
    year_value = current_date.getFullYear();

    var mnth=months[month_value];
    cmbMonth.SetValue(mnth);
    //End of New Work
    }
    
    //New Work
    function DateChangeForBillDt()
        {    
            var sessionValFrom ="<%=Session["FinYearStart"]%>";
            var sessionValTo ="<%=Session["FinYearEnd"]%>"; 
            var sessionVal ="<%=Session["LastFinYear"]%>";
            var objsession=sessionVal.split('-');   
            var MonthDate=billdate.GetDate().getMonth()+1;
            var DayDate=billdate.GetDate().getDate();
            var YearDate=billdate.GetDate().getYear();
            var Cdate=MonthDate+"/"+DayDate+"/"+YearDate;
            var Sto=new Date(sessionValTo).getMonth()+1;
            var SFrom=new Date(sessionValFrom).getMonth()+1;   
            var SDto=new Date(sessionValTo).getDate();
            var SDFrom=new Date(sessionValFrom).getDate();
            
            var months = new Array(12);
            months[0] = "January";
            months[1] = "February";
            months[2] = "March";
            months[3] = "April";
            months[4] = "May";
            months[5] = "June";
            months[6] = "July";
            months[7] = "August";
            months[8] = "September";
            months[9] = "October";
            months[10] = "November";
            months[11] = "December";
                    
            if(YearDate<=objsession[1])
            {
                if(MonthDate<SFrom && YearDate==objsession[0])
                {
                    alert('Enter Date Is Outside Of Financial Year !!');
                    var datePost=(Sto+'-'+SDto+'-'+objsession[1]);
                    billdate.SetDate(new Date(datePost));
                    d1=new Date(billdate.GetValue());
                    d1.setDate(d1.getDate()+7);
                    periodDueDate.SetValue(d1);
                    
                    var current_date = new Date(datePost);
                    current_date.setDate(current_date.getDate());
                    month_value = current_date.getMonth();

                    var mnth=months[month_value];
                    cmbMonth.SetValue(mnth);
                }
                else if(MonthDate>Sto && YearDate==objsession[1])
                {
                    alert('Enter Date Is Outside Of Financial Year !!');
                    var datePost=(Sto+'-'+SDto+'-'+objsession[1]);
                    billdate.SetDate(new Date(datePost));
                    d1=new Date(billdate.GetValue());
                    d1.setDate(d1.getDate()+7);
                    periodDueDate.SetValue(d1);
                    
                    var current_date = new Date(datePost);
                    current_date.setDate(current_date.getDate());
                    month_value = current_date.getMonth();

                    var mnth=months[month_value];
                    cmbMonth.SetValue(mnth);
                }
                else if(YearDate!=objsession[0] && YearDate!=objsession[1])
                {
                    alert('Enter Date Is Outside Of Financial Year !!');
                    var datePost=(Sto+'-'+SDto+'-'+objsession[1]);
                    billdate.SetDate(new Date(datePost));
                    d1=new Date(billdate.GetValue());
                    d1.setDate(d1.getDate()+7);
                    periodDueDate.SetValue(d1);
                    
                    var current_date = new Date(billdate.GetValue());
                    current_date.setDate(current_date.getDate());
                    month_value = current_date.getMonth();

                    var mnth=months[month_value];
                    cmbMonth.SetValue(mnth);
                }
            }
            else
            {
                alert('Enter Date Is Outside Of Financial Year !!');
                var datePost=(Sto+'-'+SDto+'-'+objsession[1]);
                billdate.SetDate(new Date(datePost));
                d1=new Date(billdate.GetValue());
                d1.setDate(d1.getDate()+7);
                periodDueDate.SetValue(d1);
                
                var current_date = new Date(billdate.GetValue());
                current_date.setDate(current_date.getDate());
                month_value = current_date.getMonth();

                var mnth=months[month_value];
                cmbMonth.SetValue(mnth);
            }
        }
    //End of New Work

    function generateBill()
    {
     if(cmbBillType.GetValue()=='2')
         {
            var i=confirm("Do you want to Delete The Bill for '"+cmbMonth.GetText()+"'?");
            if(i)
             {
             document.getElementById('Div1').style.display="inline";
             cmb.PerformCallback(cmbBillType.GetValue());
             }
         }
       else
         {
              document.getElementById('Div1').style.display="inline";
              cmb.PerformCallback('0');
         }

    }

    function showResult(s)
    {
       if(s!=null)
       {
         document.getElementById('Div1').style.display="none";
          if(s.substring(0,2)=='20')
             {
                  if(confirm('DP-50 of '+s.substring(2,s.length)+' not imported.\n Want to proceed?'))
                  {
                   document.getElementById('Div1').style.display="inline";
                    cmb.PerformCallback('3');
                     
                   }
                   
             }
             else
              if(s.substring(0,2)=='30')
                  {
                    if(confirm('ISIN Rates of '+s.substring(2,s.length)+' not imported.\n Want to proceed?'))
                     {
                      document.getElementById('Div1').style.display="inline";
                      cmb.PerformCallback(cmbBillType.GetValue());

                      }
         
                  }
                 else
                    if(s.substring(0,3)=='999')
                        {
                            var temp=s.split(';');
                            
                            dematPopUp(temp[1]);
                        }
                     else if(s=='40')
                     {
                        document.getElementById('Div1').style.display="inline";
                        cmb.PerformCallback('3');
                     }
                     else if(s.substring(0,2)=='50')
                     {
                        document.getElementById('Div1').style.display="inline";
                        cmb.PerformCallback(cmbBillType.GetValue());
                     }
                     else
                    if(s.substring(0,4)=='1000')
                        {
                        
                            var value=s.split(';');
                            ChargeBasketPopUp(value[1]);
                        }

             else
             {
                 alert(s);
             }
         }
         else
         {
            document.getElementById('Div1').style.display="none";
         }
    }   
    function dematPopUp(time)
        {
         var url='cdsl_DematCertificates.aspx?time='+time;
          parent.OnMoreInfoClick(url,"Demat Certificates Update",'550px','400px',"Y");
       
        }
        function ChargeBasketPopUp(obj)
        {
         var url='cdsl_NotAllocaed.aspx?dp=CDSL&value='+obj;
          parent.OnMoreInfoClick(url,"Clients not allocated in any Charge Basket",'550px','400px',"Y");
       
        }
   function PopUpClose()
     {   
         editwin.close();
     }

   function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=400)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '400px';
        window.frameElement.Width = document.body.scrollWidth;
    }

 
        </script>
        <table class="TableMain100">
 <tr>
                <td align="right" class="EHEADER" colspan="7" style="text-align: center">
                    <span style="color: #3300cc"><strong>Billing</strong></span><br />
                </td>
            </tr>
            </table>
        <div id='Div1'>
            <table width='150' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor="white">
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td height='25' align='center' bgcolor='#FFFFFF'>
                                    <img src='../images/progress.gif' width='18' height='18'></td>
                                <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                    <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please
                                        Wait..</strong></font></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <table width="600" style="border:solid 1px white;">
            <tr>
                <td align="right" colspan="7">
                    <br />
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 30%">
                </td>
                <td align="left" style="width: 18%">
                    <span class="Ecoheadtxt">Bill Date: </span>
                </td>
                <td align="left">
                    <dxe:ASPxDateEdit ID="txtbillDate" runat="server" ClientInstanceName="billdate" Width="150px"
                        EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" AllowNull="False"
                        Height="25px">
                        <ButtonStyle Width="13px">
                        </ButtonStyle>
                        <ClientSideEvents ValueChanged="function(s, e) {dateassign(s.GetValue());}" />
                        <ClientSideEvents DateChanged="function(s,e){DateChangeForBillDt();}" />
                    </dxe:ASPxDateEdit>
                </td>
                <td align="left" style="width: 30%">
                </td>
            </tr>
            <tr>
                <td align="right">
                </td>
                <td align="left">
                    <span class="Ecoheadtxt">Transaction Month:</span></td>
                <td align="left">
                    <dxe:ASPxComboBox ID="cmbMonth" Width="150px" ClientInstanceName="cmbMonth" runat="server"
                        ValueType="System.String" Font-Bold="False" SelectedIndex="0" Height="25px">
                        <Items>
                            <dxe:ListEditItem Text="January" Value="Jan"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="February" Value="Feb"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="March" Value="Mar"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="April" Value="Apr"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="May" Value="May"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="June" Value="Jun"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="July" Value="Jul"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="August" Value="Aug"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="September" Value="Sep"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="October" Value="Oct"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="November" Value="Nov"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="December" Value="Dec"></dxe:ListEditItem>
                        </Items>
                        <ButtonStyle Width="13px">
                        </ButtonStyle>
                    </dxe:ASPxComboBox>
                    <%-- <dxe:ASPxDateEdit ID="txtFromDate" runat="server" ClientInstanceName="periodfrom" 
                                 
                                Width="150px" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                                AllowNull="False" Height="25px">
                                <buttonstyle width="13px"></buttonstyle>
                                
                            </dxe:ASPxDateEdit> --%>
                </td>
                <td align="left">
                </td>
            </tr>
            <%-- <tr>
            <td align="right">
                 <span class="Ecoheadtxt">To</span></td>
            <td align="left">
             <dxe:ASPxDateEdit ID="txtToDate" runat="server" ClientInstanceName="periodto" 
                                 
                                Width="150px" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                                AllowNull="False" Height="25px">
                                <buttonstyle width="13px"></buttonstyle>
                                <clientsideevents valuechanged="function(s, e) {assignDueDate(s.GetValue());}" />
                  
                            </dxe:ASPxDateEdit>
            </td>
        </tr>--%>
            <tr>
                <td align="right">
                </td>
                <td align="left">
                    <span class="Ecoheadtxt">Due Date:</span></td>
                <td align="left">
                    <dxe:ASPxDateEdit ID="txtDueDate" runat="server" ClientInstanceName="periodDueDate"
                        Width="150px" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                        AllowNull="False" Height="25px">
                        <ButtonStyle Width="13px">
                        </ButtonStyle>
                    </dxe:ASPxDateEdit>
                </td>
                <td align="left">
                </td>
            </tr>
            <tr>
                <td align="right">
                </td>
                <td align="left">
                    <span class="Ecoheadtxt">Billing Order:</span>
                </td>
                <td align="left">
                    <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                        ValueType="System.String" Width="150px" ID="ddlBillOrder" ClientInstanceName="SlipClient"
                        SelectedIndex="0">
                        <Items>
                            <dxe:ListEditItem Text="Area Wise" Value="1"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="Branch Wise" Value="2"></dxe:ListEditItem>
                        </Items>
                    </dxe:ASPxComboBox>
                </td>
                <td align="left">
                </td>
            </tr>
            <tr>
                <td align="right">
                </td>
                <td align="left">
                    <span class="Ecoheadtxt">Billing Type:</span>
                </td>
                <td align="left">
                    <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                        ValueType="System.String" Width="150px" ID="cmbBillType" ClientInstanceName="cmbBillType"
                        SelectedIndex="0">
                        <Items>
                            <dxe:ListEditItem Text="Generate" Value="1" />
                            <dxe:ListEditItem Text="Delete" Value="2" />
                        </Items>
                    </dxe:ASPxComboBox>
                </td>
                <td align="left">
                </td>
            </tr>
            <tr>
                <td align="right">
                </td>
                <td align="left">
                </td>
                <td align="left">
                    <dxe:ASPxButton ID="btnShow" runat="server" Text="Done" ValidationGroup="a" AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
	generateBill();
}"></ClientSideEvents>
                    </dxe:ASPxButton>
                </td>
                <td align="left">
                </td>
            </tr>
            <tr style="visibility: hidden">
                <td align="right">
                </td>
                <td align="right">
                </td>
                <td align="left">
                    <dxe:ASPxComboBox ID="cmb" Width="160px" runat="server" Font-Size="10px" ValueType="System.String"
                        Font-Bold="False" SelectedIndex="0" ClientInstanceName="cmb" OnCallback="cmb_Callback"
                        OnCustomJSProperties="cmb_CustomJSProperties">
                        <Items>
                            <dxe:ListEditItem Text="All" Value="All"></dxe:ListEditItem>
                        </Items>
                        <ButtonStyle Width="60px">
                        </ButtonStyle>
                        <DropDownButton Text="Client Type">
                        </DropDownButton>
                        <ClientSideEvents EndCallback="function(s, e) {
	                        showResult(s.cpretValue);
                                    }"></ClientSideEvents>
                        <Paddings PaddingBottom="0px"></Paddings>
                    </dxe:ASPxComboBox>
                </td>
                <td align="left">
                </td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>
