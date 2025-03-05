<%@ page language="C#" autoeventwireup="true" inherits="management_CRMPhoneCallWithFrame, App_Web_gywepxwc" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CRM Phone Calls</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
    var chkobj;
    var objchk=null;
    var obGenral=null;
    function chkGenral(objGenral,val12)
    {
        var st = document.getElementById("txtGrdContact")
        
        if (obGenral == null)
        {
            obGenral = objGenral;
        }
        else
        {
            obGenral.checked = false;
            obGenral = objGenral;
            obGenral.checked = true;
        }
        st.value = val12;
    }
    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }

    function OnMoreInfoClick(KeyValue) {
    document.location.href="CRMPhoneCalls.aspx?id="+KeyValue;
    
     }

    function frmOpenNewWindow1(url,title,v_height,v_weight)
    {
        parent.OnMoreInfoClick(url,title,v_height,v_weight,"Y");
    }
    function callback()
    {
        iframesource();
    }
    function calldispose(Obj,val)
    {
        var y=(screen.availHeight-450)/2;
        var x=(screen.availWidth-900)/2;
        var str = "SalesOutCome1.aspx?call="+val+"&obj="+Obj
        window.open(str,"Search_Conformation_Box","height=450,width=900,top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=no,resizable=no,dependent=no");       
        
//        var str = "SalesOutCome1.aspx?call="+val+"&obj="+Obj
//        frmOpenNewWindow1(str,400,900)
    }
     
    
    function CallEmail1(val)
    {
        parent.CallEmail(val);

    }
    function Changedata123(txtdate,txttime,nowdate,nowtime,cdate,ctime)
    {  
        //var drp = document.getElementById("txtOutCome_id")
        var drp = document.getElementById("TxtOut")
        var a= document.getElementById("chkStage");
        a.checked = false
        a.disabled = true
        document.getElementById("btnCallForward").disabled = true
        document.getElementById("btnSendEmail").disabled = true
                
        var st = drp.value.split("|")
         if ((st[1] == 1) || (st[1] == 2))
        {
           
            var nextdate = document.getElementById("trnextdate");
            nextdate.style.display = "block";
            var nexttime = document.getElementById("trnexttime");
            document.getElementById("lblNextDate").style.display = "block";
            document.getElementById("lblNextTime").style.display = "block";
            document.getElementById("lblNextDate1").style.display = "none";
            document.getElementById("tdnext").style.display = "none";
            document.getElementById("tdvisibility").style.width ="60%";
            document.getElementById("tdvisibility2").style.width ="60%";
            document.getElementById("tdvisibility2").style.textAlign ="right"; 
            document.getElementById("idtime").style.display ="block";
            document.getElementById("lblNextTime1").style.display = "none";
            document.getElementById("drpvisitplace").disabled = true;
            if ((st[1] == 1))
            {
                document.getElementById("btnCallForward").disabled = false;
                document.getElementById("btnSendEmail").disabled = false;
            }
        }
        else
        {
            if ((st[1] == 3) || (st[1] == 6))
            {
                var nextdate = document.getElementById("trnextdate");
                nextdate.style.display = "none";
                var nexttime = document.getElementById("trnexttime");
                var lbldate = document.getElementById("lblNextDate").style.display = "none";
                document.getElementById("lblNextDate1").style.display = "none";
                document.getElementById("idtime").style.display ="none";
                document.getElementById("drpvisitplace").disabled = true;
                a.checked = true;
                a.disabled = false;
            }
            else
            {
                var nextdate = document.getElementById("trnextdate");
                nextdate.style.display = "block";
                var nexttime = document.getElementById("trnexttime");
                document.getElementById("lblNextDate").style.display = "none";
                document.getElementById("lblNextTime").style.display = "none";
                document.getElementById("lblNextDate1").style.display = "block";
                document.getElementById("lblNextTime1").style.display = "block";
                document.getElementById("idtime").style.display ="block";
                document.getElementById("drpvisitplace").disabled = false;
                document.getElementById("btnSendEmail").disabled = false;
                //adddatetime(txtdate,nowdate,ctime)
            }
        }
        var savecall = document.getElementById("btnSavePhoneCallDetails").disabled = false;
    }
    function callforward()
    {
        var startcall = document.getElementById("txtEndTime").value;
        var nextcall = document.getElementById("txtStartDate").value;
        var note = document.getElementById("txtNotes").value;
        var CallDispose = document.getElementById("TxtOut").value;
        frmOpenNewWindow1('frmcallforward.aspx?callstarttime='+startcall+'&ASPxNextDate='+nextcall+'&txtNote='+note+'&txtCallDispose_id='+CallDispose,'300','600');
    }
    function FillValues(id)
    {
//        var sel = document.getElementById('txtProductCount');
//        sel.value=id;
        noofproduct=id;
    }
    
    function chkOnSaveClick123()
    {         
        var drp = document.getElementById("TxtOut");
        var st = drp.value.split("|");
        if ((st[1] == 5) || (st[1] == 4))
        {            
            //var sel = document.getElementById('txtProductCount');
            if (noofproduct == 0)
            {
                alert("For confirm sale/Request Meeting choose alleast one product");
                return false;
            }
           
        }
        if ((st[1] == 5) || (st[1] == 4))
        {
            var sel = document.getElementById("drpVisitPlace");
            if (sel.value == 0) //|| (sel.options.length == 0)
            {
                alert("Please Add Address");
                return false;
            }
        }
        if ((st[1] == 1) || (st[1] == 2))
        {
            var flag = checkDateFunction12()
            if (flag == false)
            {
                alert("Time must greater than current time");
                return false;
            }            
        }
        return true;
    }
    function checkDateFunction12()
    {
        var now=new Date();
        var year=now.getYear();
        var month=now.getMonth()+1;
        var date=now.getDate();//today
        var hh=now.getHours();
        if(hh==13)
        {
            hh="01 PM";
        }
        if(hh==14)
        {
            hh="02 PM";
        }
        if(hh==15)
        {
            hh="03 PM";
        }
        if(hh==16)
        {
            hh="04 PM";
        }
        if(hh==17)
        {
            hh="05 PM";
        }
        if(hh==18)
        {
            hh="06 PM";
        }
        if(hh==19)
        {
            hh="07 PM";
        }
        if(hh==20)
        {
            hh="08 PM";
        }
        if(hh==21)
        {
            hh="09 PM";
        }
        if(hh==22)
        {
            hh="10 PM";
        }
        if(hh==23)
        {
            hh="11 PM";
        }
        if(hh==24)
        {
            hh="12 PM";
        }
        else
        {
            if(hh==12)
            {
                hh=hh+" PM";
            }
            else
            {
                hh=hh+" AM";
            }
        }
        hh=hh.split(' ');
        var mm=now.getMinutes()+5;
        var ss=now.getSeconds();
        
        var d = document.getElementById("ASPxNextDate")
        var inputdate=d.value.split(' ');
        var da = inputdate[0]
        if(date==1 || date==2 || date==3 || date==4 || date==5 || date==6 || date==7 || date==8 || date==9)
        {
            date="0"+date;
        } 
        if(month==1 || month==2 || month==3 || month==4 || month==5 || month==6 || month==7 || month==8 || month==9)
        {
            month="0"+month;
        } 
        var mo = inputdate[1];
        var inputmonth;
        if(mo=='January')
        {
            inputmonth="01";
        }
        if(mo=='February')
        {
            inputmonth="02";
        }
        if(mo=='March')
        {
            inputmonth="03";
        }
        if(mo=='April')
        {
            inputmonth="04";
        }
        if(mo=='May')
        {
            inputmonth="05";
        }
        if(mo=='June')
        {
            inputmonth="06";
        }
        if(mo=='July')
        {
            inputmonth="07";
        }
        if(mo=='August')
        {
            inputmonth="08";
        }
        if(mo=='September')
        {
            inputmonth="09";
        }
        if(mo=='October')
        {
            inputmonth="10";
        }
        if(mo=='November')
        {
            inputmonth="11";
        }
        if(mo=='December')
        {
            inputmonth="12";
        }
        var y = inputdate[2];
        var m = inputdate[3].split(':')
        
        if(y>=year)
        {
	        if(y>year)
	        {
		        return true
	        }
	        else
	        {
	        if(inputmonth>=month)
	        {
	           
		        if(inputmonth>month)
		        {
			        return true
		        }	
		        else
		        {
		        if(da>=date)
		        {
			        if(da>date)
			        {
				        return true
			        }
			        else
			        {
			            if(inputdate[4]==hh[1])
			            {
			                if(m[0]>=hh[0])
			                {
				                if(m[0]>hh[0])
				                {
					                return true
				                }
				                else
				                {
					                if(m[1]<mm)
					                {
						                return false
					                }
				                }
			                }
			                else
			                {
				                return false

			                }
			            }
			            else
			            {
			                return true;
			            }
			        }
		        }
		        else
		        {
			        return false
		        }
		        }
	        }
	        else
	        {
		        return false
	        }
	        }
        }
        else
        {
	        return false
        }

        return true
    }
   
    function iframesource()
    {
        //alert('calluserinformation');
        iFrmInformation.location ="calluserinformation.aspx";
    }
    
      function SignOff()
        {
        window.parent.SignOff()
        }
       function height()
        {
           
           if(document.body.scrollHeight>=550)
                {
                    window.frameElement.height = document.body.scrollHeight;
                }
           else
                {
                    window.frameElement.height = '550px';
                }
                window.frameElement.widht = document.body.scrollWidht;
           
        }
      function callDhtmlFormsParent(val,val1)
        {
            if(val=="ADD")
            {
                parent.OnMoreInfoClick("frmOfferedProduct_New.aspx","ADD PRODUCT","950px","500px","Y");
            }
            else if(val=="UPDATE")
            {
                var url="UpdateOfferedProduct.aspx"+"?"+val1;
                parent.OnMoreInfoClick(url,"UPDATE PRODUCT","950px","500px","Y");
            }
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Phone Calls</span></strong>
                    </td>
                </tr>
                <tr id="pnlFButton" runat="server">
                    <td style="text-align: left; width: 100%">
                        <table>
                            <asp:Panel ID="pnlFButton1" runat="server">
                                <tr style="background-color: Black">
                                    <td>
                                        <asp:Button ID="BtnCalls" runat="server" Text="New Calls" CssClass="btnUpdate" OnClick="BtnCalls_Click"
                                            Height="21px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="BtnBack" runat="server" Text="Call Back" CssClass="btnUpdate" OnClick="BtnBack_Click"
                                            Height="21px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="BtnContact" runat="server" Text="Non Contactable" CssClass="btnUpdate"
                                            OnClick="BtnContact_Click" Height="21px" Width="105px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="BtnUsable" runat="server" Text="Non Usable" CssClass="btnUpdate"
                                            OnClick="BtnUsable_Click" Height="21px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="BtnWon" runat="server" Text="Won/ConfirmSale" CssClass="btnUpdate"
                                            OnClick="BtnWon_Click" Height="21px" Width="115px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="BtnLost" runat="server" Text="Lost/Not Interested" CssClass="btnUpdate"
                                            OnClick="BtnLost_Click" Width="125px" Height="21px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="BtnPipeline" runat="server" Text="Pipeline/Sales Visit" CssClass="btnUpdate"
                                            OnClick="BtnPipeline_Click" Width="125px" Height="21px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="BtnCourtesy" runat="server" Text="Courtesy Calls" CssClass="btnUpdate"
                                            OnClick="BtnCourtesy_Click" Height="21px" Width="100px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="BtnForward" runat="server" Text="Forward Calls" CssClass="btnUpdate"
                                            OnClick="BtnForward_Click" Height="21px" />
                                    </td>
                                </tr>
                            </asp:Panel>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100%">
                        <table>
                            <tr id="pnlBtn" runat="server">
                                <td style="text-align: left;">
                                    <table>
                                        <tr>
                                            <asp:Panel ID="pnlBtn1" runat="server">
                                                <td>
                                                    <asp:Button ID="btnCall" runat="server" Text="Call" CssClass="btnUpdate" OnClick="BtnCall_Click"
                                                        Height="21px" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="BtnService" runat="server" Text="Temp. Out of Service" CssClass="btnUpdate"
                                                        OnClick="BtnService_Click" Height="21px" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="BtnReachable" runat="server" Text="Not Reachable" CssClass="btnUpdate"
                                                        OnClick="BtnReachable_Click" Height="21px" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="BtnResponse" runat="server" Text="No Response" CssClass="btnUpdate"
                                                        OnClick="BtnResponse_Click" Height="21px" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="BtnExist" runat="server" Text="Number Doesnot Exist" CssClass="btnUpdate"
                                                        OnClick="BtnExist_Click1" Height="21px" />
                                                </td>
                                            </asp:Panel>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr style="height: auto" id="TotalNoOfCalls" runat="server">
                                <td>
                                    <table class="TableMain100">
                                        <tr>
                                            <td class="Ecoheadtxt" style="width: 47%; text-align: left">
                                                <asp:Label ID="lblTotalRecord" runat="server" ForeColor="Red"></asp:Label>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <asp:Label ID="lblTotalNumberofCalls" runat="server" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:GridView ID="grdUserInfo" runat="server" OnPageIndexChanging="grdUserInfo_PageIndexChanging"
                                        Width="100%" CssClass="gridcellleft" CellPadding="4" ForeColor="#333333" GridLines="None"
                                        BorderWidth="1px" BorderColor="#507CD1" OnRowDataBound="grdUserInfo_RowDataBound"
                                        OnRowCreated="grdUserInfo_RowCreated" AllowPaging="True" PageSize="20">
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#EFF3FB" BorderWidth="1px" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <HeaderStyle Font-Bold="False" ForeColor="Black" CssClass="EHEADER" BorderColor="AliceBlue"
                                            BorderWidth="1px" />
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sel">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkSel" runat="Server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblId" runat="Server" Text='<%# Eval("Id") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="gridheader" />
                                    </asp:GridView>
                                    <asp:Button ID="TxtNext" runat="server" Text="Next" OnClick="TxtNext_Click" CssClass="btnUpdate"
                                        Height="21px" />
                                    <asp:Button ID="TxtPrevious" runat="server" Text="Previous" CssClass="btnUpdate"
                                        OnClick="TxtPrevious_Click" Height="21px" />
                                    <asp:GridView ID="grdForwardCall" runat="server" CssClass="gridcellleft" CellPadding="4"
                                        ForeColor="#333333" GridLines="None" BorderWidth="1px" BorderColor="#507CD1"
                                        Width="100%" OnRowCreated="grdForwardCall_RowCreated">
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#EFF3FB" BorderWidth="1px" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <HeaderStyle Font-Bold="False" ForeColor="Black" CssClass="EHEADER" BorderColor="AliceBlue"
                                            BorderWidth="1px" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" id="tblshowdetails" runat="server" style="width: 100%">
                                    <asp:Panel ID="PnlShowDetails" runat="server" Width="100%" Visible="False">
                                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                            <tr>
                                                <td style="width: 100%;">
                                                    <table style="width: 100%;">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label4" runat="server" CssClass="mylabel">Alloted By :</asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="txtAlloatedBy" runat="server"></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="Label5" runat="server" CssClass="mylabel">Alloted On :</asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="txtDateOfAllottment" runat="server"></asp:Label>
                                                                <asp:Label ID="txtTotalNumberofCalls" runat="server" Visible="False"></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="Label8" runat="server" CssClass="mylabel">Priority :</asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="txtPriority" runat="server"></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="Label10" runat="server" CssClass="mylabel">Start By :</asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="txtSeheduleStart" runat="server"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label6" runat="server" CssClass="mylabel">End By :</asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="txtSeheduleEnd" runat="server"></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="Label7" runat="server" CssClass="mylabel">Started On :</asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="txtAcutalStart" runat="server"></asp:Label></td>
                                                            <td>
                                                                <asp:Label CssClass="mylabel" ID="Label3" runat="server" Text="Next Call :" wrap="false"></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="lblNextVisit" runat="server" CssClass="EcoheadCon"></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="Label1" runat="server" Text="Last Call :" CssClass="mylabel"></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="lblLastVisit" runat="server"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label2" runat="server" Text="OutCome :" CssClass="mylabel"></asp:Label></td>
                                                            <td>
                                                                <asp:Label CssClass="EcoheadCon" ID="lblLastOutcome" runat="server"></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="Label9" runat="server" CssClass="mylabel">Instruction :</asp:Label></td>
                                                            <td colspan="5">
                                                                &nbsp;<asp:Label ID="lblShortNote" runat="server"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="javascript:void(0)" Font-Underline="True"
                                                                    ForeColor="#8080FF">Phone /Address</asp:HyperLink></td>
                                                            <td align="center">
                                                                <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="True" ForeColor="#8080FF"
                                                                    NavigateUrl="javascript:void(0)" CssClass="myhypertext">Contact Details</asp:HyperLink></td>
                                                            <td colspan="9" align="left">
                                                                <asp:HyperLink ID="aa" runat="server" CssClass="myhypertext" NavigateUrl="javascript:void(0)"
                                                                    Font-Underline="True" ForeColor="#8080FF">Show History</asp:HyperLink></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border: solid 1px black">
                                                    <iframe id="iFrmInformation" src="" width="100%" height="200" frameborder="0"></iframe>
                                                </td>
                                            </tr>
                                            <tr id="pnlData1">
                                                <td class="gridcellleft">
                                                    <table style="width:100%">
                                                        <tr>
                                                            <td style="width: 117px">
                                                                <asp:Label ID="Label11" runat="server" CssClass="mylabel1" Text="Call OutCome :"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <input id="txtOutCome_id" type="hidden" name="txtOutCome_id" style="width: 7px; height: 13px;" />
                                                                <asp:TextBox ID="txtCallDispose" runat="server" Width="176px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblNextDate" runat="Server" Text="Next Call Date : " CssClass="mylabel1"
                                                                    Width="92px"></asp:Label></td>
                                                            <td id="tdnext" runat="server">
                                                                <asp:Label ID="lblNextDate1" runat="Server" Text="Next Visit Date : " CssClass="mylabel1" Width="89px"></asp:Label></td>
                                                            <td id="idtime" runat="server">
                                                                <dxe:ASPxDateEdit ID="ASPxNextDate" runat="server" EditFormat="custom"
                                                                    UseMaskBehavior="True">
                                                                    <ButtonStyle Width="13px">
                                                                    </ButtonStyle>
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 117px">
                                                                <asp:Label ID="Label12" runat="server" CssClass="mylabel1" Text="Note/Remarks :"></asp:Label></td>
                                                            <td>
                                                                <asp:TextBox ID="txtNotes" TextMode="MultiLine" runat="server" Height="45px" Width="421px"></asp:TextBox></td>
                                                            <td>
                                                                <asp:CheckBox ID="chkStage" runat="Server" Text="Non Usable" Checked="false" ForeColor="Black" /></td>
                                                            <td id="tdvisibility" runat="server" class="mylabelr">
                                                                <asp:Label ID="lblVisitPlace" runat="server" Text="Visit Place : " Font-Bold="True"
                                                                    CssClass="mylabel1"></asp:Label></td>
                                                            <td>
                                                                <asp:DropDownList ID="drpVisitPlace" runat="Server" Enabled="False" AppendDataBoundItems="True">
                                                                    <asp:ListItem Value="0">Select Address</asp:ListItem>
                                                                </asp:DropDownList></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Button ID="btnSavePhoneCallDetails" runat="server" Text="Save" Enabled="False"
                                                                                CssClass="btnUpdate" OnClick="btnSavePhoneCallDetails_Click" Height="21px" /></td>
                                                                        <td>
                                                                            <input type="button" id="btnCallForward" name="btnCallForward" value="Call Forward"
                                                                                onclick="callforward()" disabled="disabled" class="btnUpdate" style="height: 21px" /></td>
                                                                        <td>
                                                                            <asp:Button ID="btnSendEmail" runat="Server" Text="Send Email" Enabled="false" CssClass="btnUpdate"
                                                                                Height="21px" OnClick="btnSendEmail_Click" /></td>
                                                                        <td>
                                                                            <input type="hidden" id="txtProductCount" name="txtProductCount" /></td>
                                                                        <td>
                                                                            <asp:Button ID="btnSCancel" runat="server" CssClass="btnUpdate" OnClick="btnSCancel_Click"
                                                                                Text="Cancel" Height="21px" /></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td id="tdvisibility2" runat="server">
                                                                <asp:TextBox ID="TxtOut" runat="server" BackColor="Transparent" BorderColor="Transparent"
                                                                    BorderStyle="None" ForeColor="#DDECFE" Width="86px"></asp:TextBox>
                                                                    <asp:TextBox ID="txtEndTime" runat="server" BackColor="Transparent" BorderColor="Transparent"
                                                                    BorderStyle="None" ForeColor="#DDECFE"></asp:TextBox>
                                                                <asp:TextBox ID="txtStartDate" runat="server" BackColor="Transparent" BorderColor="Transparent"
                                                                    BorderStyle="None" ForeColor="#DDECFE"></asp:TextBox>
                                                                    </td>
                                                           
                                                        </tr>
                                                        <tr id="trnexttime" style="display: none">
                                                            <td class="Ecoheadtxt" style="text-align: left; width: 117px;">
                                                                <asp:Label ID="lblNextTime" runat="server" Text="Next Call Time : " Font-Bold="False"
                                                                    CssClass="mylabel1"></asp:Label>
                                                                <asp:Label ID="lblNextTime1" runat="server" Text="Next Visit Time : " Font-Bold="False"
                                                                    CssClass="mylabel1"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" id="tbldata" runat="server" style="width: 100%">
                                    <asp:Panel ID="pnlData" Visible="false" Enabled="true" runat="server" Width="100%">
                                        <table width="100%">
                                            <tr>
                                                <td class="Ecoheadtxt" colspan="2" style="text-align: left;">
                                                    <table id="nextcall" runat="Server">
                                                        <tr id="trnextdate" style="display: none">
                                                            <td class="Ecoheadtxt" style="text-align: left">
                                                                &nbsp;</td>
                                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                                &nbsp;<%--<asp:TextBox ID="ASPxNextDate" runat="server"></asp:TextBox>
                                               <asp:Image ID="Image1" runat="server" ImageUrl="~/images/calendar.jpg" />--%></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
