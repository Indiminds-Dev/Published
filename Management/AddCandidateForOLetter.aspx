<%@ page language="C#" autoeventwireup="true" inherits="management_AddCandidateForOLetter, App_Web_fmcnshmw" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%--<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>--%>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
         function SignOff()
            {
            window.parent.SignOff();
            }

    </script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

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
    <!--___________________These files are for datetime calander___________________-->
    <link type="text/css" rel="stylesheet" href="../CSS/dhtmlgoodies_calendar.css?random=20051112"
        media="screen" />

    <script type="text/javascript" src="../JSFUNCTION/dhtmlgoodies_calendar.js?random=20060118"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <!--___________________________________________________________________________-->
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

    <script language="javascript" type="text/javascript">
    
    	 function CallList(obj1,obj2,obj3)
        {
        var obj5='';
                   ajax_showOptions(obj1,obj2,obj3,obj5);
        }
    
    function ValidatePage()
    {
   
   
      if(document.getElementById("txtName").value=='')
      {
      alert('Candidate Name is Required.');
      return false;
      }
//      else if(document.getElementById("txtNoofDependent").value !='')
//      {
//          if(document.getElementById("txtNoofDependent").value.length !=10)
//          {
//           alert('PAN No should be 10 digits.');
//           return false;
//           }
//      }


    else if(document.getElementById("txtLocality").value =='')
      {
       alert('Address is Mandatory.');
       return false;
      }
      else if(document.getElementById("drpMaritalStatus").value =="0")
      {
       alert('Please Select Marital Status.');
       return false;
      }
      
       else if(document.getElementById("txtPhone").value =='')
      {
       alert('Mobile No is Mandatory.');
       return false;
      }
      else if(document.getElementById("txtPhone").value.length !=10)
      {
       alert('Mobile No should be 10 digits.');
       return false;
      }
      else if(txtDOB.GetText() =='01-01-0100' || txtDOB.GetText() =='01-01-1900')
      {
       alert('Date of birth is Mandatory.');
       return false;
      }
       else if(document.getElementById("drpQualification").value =="0")
      {
       alert('Please select Qualification.');
       return false;
      }
       else if(document.getElementById("cmbDept").value =="0")
      {
       alert('Please Select Department.');
       return false;
      }
       else if(txtPJD.GetText() =='01-01-0100' || txtPJD.GetText() =='01-01-1900')
      {
       alert('Joining date is Mandatory.');
       return false;
      }
      else if(document.getElementById("cmbOrganization").value =="0")
      {
       alert('Please Select Organization.');
       return false;
      }
       else if(document.getElementById("cmbBranch").value =="0")
      {
       alert('Please Select Branch.');
       return false;
      }
       else if(document.getElementById("cmbDesg").value =="0")
      {
       alert('Please Select Designation.');
       return false;
      }
       else if(document.getElementById("txtAprovedCTC").value =='')
      {
       alert('CTC Can not be blank.');
       return false;
      }
       else if(document.getElementById("EmpType").value =="0")
      {
       alert('Please Select Employee Type.');
       return false;
      }
        else if(document.getElementById("txtReportTo_hidden").value =='')
      {
       alert('Please Select Reporting Head.');
       return false;
      }
      
      
    }
     
    function Close()
    {
     parent.editwin.close();
    }
    
    //-------------------For Documents-----------------
      function Show() {
      var id=document.getElementById('LabelID').value;
      var mode=document.getElementById('LabelMode').value;
      
      if(id=='ADD')
      {
      alert('Please Add Canidate Details.')
      }
      else
      {
        mode='edit';
        var url ='frmAddDocumentCandidate.aspx?id=AddCandidateForOLetter.aspx?id='+ id +'&mode='+ mode +'&id1=Candidate&id2='+id;
        popup.SetContentUrl(url);
        popup.Show();
      }

    }
     function OnDocumentView(keyValue) 
    {
        var url='viewImage.aspx?id='+keyValue;
        popup.contentUrl=url;
        popup.Show();

    }
    
    
        
    //-------------------------------------------------
    
    
        function ondropdown()
        {
            //alert('123');
            var txtbox = document.getElementById("txtReferedBy");
            txtbox.value = "";
        }
        function call_ajax(obj1,obj2,obj3)
        {
            var set_value
            var ob = document.getElementById("drpSourceType")
            set_value = ob.value;
            ajax_showOptions(obj1,obj2,obj3,set_value)
        }
        
            function MaskMoney(evt) 
    {
    if (!(evt.keyCode == 46 || (evt.keyCode >= 48 && evt.keyCode <= 57))) return false;
    var parts = evt.srcElement.value.split('.');
    if (parts.length > 2) return false;
    if (evt.keyCode == 46) return (parts.length == 1);
    if (parts[0].length >= 14) return false;
    if (parts.length == 2 && parts[1].length >= 2) return false;
    }
        
        FieldName='btnCancel';
    </script>

    <form id="form1" runat="server">
        <div>
            <%--   <asp:Panel ID="panel" runat="server" Width="100%">--%>
            <table class="TableMain100">
                <tr class="EHEADER">
                    <td class="ColHead">
                        <span style="color: #3300cc"><strong>Candidate Information</strong></span>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center; width: 100%;">
                        <table cellpadding="2" cellspacing="0" border="0" class="TableMain100">
                            <tr>
                                <td colspan="6">
                                    (<span style="color: red">*</span>) Marks are mandatory Field.
                                </td>
                            </tr>
                             
                            
                            <tr >
                                <td class="gridcellleft" valign="top">
                                    <span style="color: red">*</span></td>
                                <td class="gridcellleft" valign="top">
                                    <span class="Ecoheadtxt">Candidate Name:</span>
                                </td>
                                <td class="gridcellleft" valign="top">
                                    <asp:DropDownList ID="CmbSalutation" runat="server" Width="50px" TabIndex="1" Font-Size="11px">
                                    </asp:DropDownList><br />
                                    <asp:TextBox ID="txtName" runat="server" Width="200px" Font-Size="11px" TabIndex="1"
                                        ValidationGroup="a"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                        Display="Dynamic" ErrorMessage="Required." ValidationGroup="a" Width="124px"></asp:RequiredFieldValidator></td>
                                <td style="width: 17px" valign="top">
                                    <span style="color: red">*</span>
                                </td>
                                <td class="gridcellleft" valign="top">
                                    <span class="Ecoheadtxt">Residence Locality:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtLocality" runat="server" Width="200px" Font-Size="11px" Height="50px"
                                        TabIndex="2" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr >
                                <td class="gridcellleft">
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Source Type:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="drpSourceType" runat="server" Width="203px" Font-Size="11px"
                                        TabIndex="3">
                                    </asp:DropDownList></td>
                                    
                                      <td style="width: 17px">
                                    <span style="color: red">*</span>
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Father's Name:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtFatherName" runat="server" Width="200px" Font-Size="11px" TabIndex="4"></asp:TextBox>
                                </td>
                                
                            </tr>
                              <tr >
                                <td class="gridcellleft">
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Source Name:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtReferedBy" runat="server" Width="200px" Font-Size="11px" TabIndex="5"></asp:TextBox>
                                     <%--<asp:TextBox ID="txtReferedBy_hidden" runat="server"></asp:TextBox>--%>
                                     <asp:HiddenField ID="txtReferedBy_hidden" runat="server" />
                                </td>
                                <td style="width: 17px">
                                    <span style="color: red">*</span>
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">PAN No:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtNoofDependent" runat="server" Width="200px" Font-Size="11px"
                                        TabIndex="6" MaxLength="10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr >
                                <td class="gridcellleft">
                                    <span style="color: red">*</span></td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Sex:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="drpSex" Width="203px" Font-Size="11px" runat="server" TabIndex="7">
                                        <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="FeMale" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 17px">
                                    <span style="color: red">*</span>
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Mobile No:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtPhone" runat="server" Width="200px" Font-Size="11px" TabIndex="8"
                                        MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPhone"
                                        Display="Dynamic" ErrorMessage="Required." ValidationGroup="a" Width="124px"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr  >
                                <td class="gridcellleft">
                                    <span style="color: red">*</span></td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Date of Birth:</span>
                                </td>
                                <td class="gridcellleft">
                                    <dxe:ASPxDateEdit ID="txtDOB" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        TabIndex="9" Width="202px">
                                        <buttonstyle width="13px">
                                            </buttonstyle>
                                    </dxe:ASPxDateEdit>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDOB"
                                        ErrorMessage="Required." Display="Dynamic"></asp:RequiredFieldValidator></td>
                                <td style="width: 17px">
                                    <span style="color: red">*</span>
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Email Id:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtEmailId" runat="server" Width="200px" Font-Size="11px" TabIndex="9"></asp:TextBox></td>
                            </tr>
                            
                             <tr  >
                                <td class="gridcellleft">
                                <span style="color: red">*</span>
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Marital Status:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="drpMaritalStatus" runat="server" Width="203px" Font-Size="11px"
                                        TabIndex="10">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 17px">
                                    
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt"></span>
                                </td>
                                <td class="gridcellleft">
                                     </td>
                              
                            </tr>                            
                            <tr  >
                                <td class="gridcellleft">
                                    <span style="color: red">*</span></td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Qualification:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="drpQualification" Width="203px" Font-Size="11px" runat="server"
                                        TabIndex="10">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 17px">
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Professional Qualification:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="drpProfQualification" Width="203px" Font-Size="11px" runat="server"
                                        TabIndex="11">
                                    </asp:DropDownList></td>
                            </tr>
                            <tr >
                                <td class="gridcellleft">
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Certifications:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtCertification" runat="server" Width="200px" Font-Size="11px"
                                        TabIndex="12"></asp:TextBox></td>
                                <td style="width: 17px">
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Current Employer:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtCurrentEmployer" runat="server" Width="200px" Font-Size="11px"
                                        TabIndex="13"></asp:TextBox></td>
                            </tr>
                            <tr >
                                <td class="gridcellleft">
                                    <span style="color: red">*</span></td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Experience Yrs:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtExpYrs" runat="server" Width="200px" Font-Size="11px" TabIndex="14"
                                        MaxLength="2"></asp:TextBox></td>
                                <td style="width: 17px">
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Crruent Job Prifile :</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="drpCurrentJobProfile" Width="203PX" Font-Size="11px" runat="server"
                                        TabIndex="15">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr >
                                <td class="gridcellleft">
                                    <span style="color: red">*</span></td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Current CTC:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtCurrentCTC" runat="server" Width="200px" Font-Size="11px" TabIndex="16"></asp:TextBox></td>
                                <td style="width: 17px">
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Desired CTC:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtDesiredCTC" runat="server" Width="200px" Font-Size="11px" TabIndex="17"></asp:TextBox></td>
                            </tr>
                            <tr >
                                <td class="gridcellleft">
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Previous CTC:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtPreviousCTC" runat="server" Width="200px" Font-Size="11px" TabIndex="18"></asp:TextBox>
                                </td>
                                <td style="width: 17px;">
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Previous Employer:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtPreviousEmployer" runat="server" Width="200px" Font-Size="11px"
                                        TabIndex="19"></asp:TextBox>
                                </td>
                            </tr>
                            <tr >
                                <td class="gridcellleft">
                                    <span style="color: red">*</span></td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Probable Join Date:</span>
                                </td>
                                <td class="gridcellleft">
                                    <dxe:ASPxDateEdit ID="txtPJD" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        TabIndex="20" Width="204px">
                                        <buttonstyle width="13px">
                                            </buttonstyle>
                                    </dxe:ASPxDateEdit>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPJD"
                                        ErrorMessage="Required."></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 17px;">
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Previous Job Profile :</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="drpPreviousJobProfile" Width="203PX" Font-Size="11px" runat="server"
                                        TabIndex="21">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr >
                                <td class="gridcellleft">
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Reason For Change :</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtReasonforChange" runat="server" TextMode="MultiLine" Width="198px"
                                        Font-Size="11px" TabIndex="22"></asp:TextBox>
                                </td>
                                <td style="width: 17px">
                                    <span style="color: red"></span>
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt"></span>
                                </td>
                                <td class="gridcellleft">
                                  </td>
                              
                            </tr>
                             <tr >
                                <td class="gridcellleft">
                                    <span style="color: red">*</span></td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Organization :</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="cmbOrganization" runat="server" Width="205px" Font-Size="11px"
                                        TabIndex="24">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 17px">
                                    <span style="color: red">*</span>
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Branch :</span>
                                    <%--<span class="Ecoheadtxt" >Actual Start Date/time:</span>--%>
                                </td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="cmbBranch" runat="server" Width="203px" Font-Size="11px" TabIndex="25">
                                    </asp:DropDownList>
                                    <%--<asp:TextBox ID="TextBox21" runat="server" Width="200px" Font-Size="11px"></asp:TextBox>--%>
                                </td>
                            </tr>
                            <tr >
                                <td class="gridcellleft">
                                    <span style="color: red">*</span></td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Designation :</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="cmbDesg" runat="server" Width="205px" Font-Size="11px" TabIndex="26">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 17px">
                                    <span style="color: red">*</span>
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Aproved CTC :</span>
                                    <%--<span class="Ecoheadtxt" >Actual Start Date/time:</span>--%>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtAprovedCTC" runat="server" Width="200px" Font-Size="11px" TabIndex="27"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtAprovedCTC"
                                        Display="Dynamic" ErrorMessage="Required." ValidationGroup="a" Width="124px"></asp:RequiredFieldValidator>
                                    <%--<asp:TextBox ID="TextBox21" runat="server" Width="200px" Font-Size="11px"></asp:TextBox>--%>
                                </td>
                            </tr>
                            <tr >
                                <td class="gridcellleft">
                                    <span style="color: red">*</span>
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Employee Type :</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="EmpType" runat="server" Width="205px" Font-Size="11px" TabIndex="28">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 17px">
                                 <span style="color: red">*</span>
                                </td>
                                <td class="gridcellleft">
                                 <span class="Ecoheadtxt">Report To :</span>                               
                                </td>
                                <td class="gridcellleft">
                                 <asp:TextBox ID="txtReportTo" runat="server" Width="200px" TabIndex="29"></asp:TextBox>
                                     <asp:HiddenField ID="txtReportTo_hidden" runat="server" />
                                </td>
                            </tr>
                            
                             <tr >
                                <td class="gridcellleft">
                                    <span style="color: red">*</span>
                                </td>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Department :</span>
                                </td>
                                <td class="gridcellleft">
                                   <asp:DropDownList ID="cmbDept" runat="server" Width="205px" TabIndex="30">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 17px">
                                   </td>
                                <td class="gridcellleft">
                                                            
                                </td>
                                <td class="gridcellleft">
                                 
                                </td>
                            </tr>
                          
                            <tr>
                                <td class="gridcellleft">
                                </td>
                                <td colspan="2" class="gridcellleft">
                                    <asp:Label ID="lblmessage" runat="server" ForeColor="Red"></asp:Label>&nbsp;</td>
                                <td style="width: 17px">
                                </td>
                                <td colspan="2" class="gridcellright">
                                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnUpdate" OnClick="btnSave_Click"
                                        TabIndex="31" ValidationGroup="a" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnUpdate" OnClientClick="Close()"
                                        TabIndex="32" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table class="TableMain100">
                <tr>
                    <td align="center">
                        <dxwgv:ASPxGridView ID="EmployeeDocumentGrid" runat="server" AutoGenerateColumns="False"
                            ClientInstanceName="gridDocument" KeyFieldName="Id" Width="850px" Font-Size="11px"
                            OnRowDeleting="EmployeeDocumentGrid_RowDeleting">
                            <columns>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0" Visible="False">
                                                        <EditFormSettings Visible="False" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Type" VisibleIndex="1" Caption="DocumentType"
                                                        Width="25%">
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="FileName" VisibleIndex="2" Caption="DocumentName"
                                                        Width="25%">
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Src" VisibleIndex="3" Visible="False">
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="FilePath" ReadOnly="True" VisibleIndex="4"
                                                        Caption="Document Physical Location" Width="25%">
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataHyperLinkColumn Caption="View" FieldName="Src" VisibleIndex="5"
                                                        Width="15%">
                                                        <DataItemTemplate>
                                                            <%--<a href='viewImage.aspx?id=<%#Eval("Src") %>' class='HTMLPopulation<%#Eval("Slno") %>'>View</a>--%>
                                                            <%--<a href='viewImage.aspx?id=<%#Eval("Src") %>' target="_blank">View</a>--%>
                                                            <a onclick="OnDocumentView('<%#Eval("Src") %>')" style="cursor:pointer;">View</a>
                                                        </DataItemTemplate>
                                                    </dxwgv:GridViewDataHyperLinkColumn>
                                                    <dxwgv:GridViewCommandColumn VisibleIndex="6">
                                                        <DeleteButton Visible="True">
                                                        </DeleteButton>
                                                        <HeaderTemplate>
                                                            <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                                              { %>
                                                            <a href="javascript:void(0);" onclick="Show();"><span style="color: #000099; text-decoration: underline">
                                                                Add New</span> </a>
                                                            <%} %>
                                                        </HeaderTemplate>
                                                    </dxwgv:GridViewCommandColumn>
                                                </columns>
                            <settings showstatusbar="Visible" />
                            <settingsediting mode="PopupEditForm" popupeditformheight="250px" popupeditformhorizontalalign="Center"
                                popupeditformmodal="True" popupeditformverticalalign="WindowCenter" popupeditformwidth="500px"
                                editformcolumncount="1" />
                            <styles>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                    </Header>
                                                    <FocusedRow CssClass="gridselectrow">
                                                    </FocusedRow>
                                                </styles>
                            <settingstext popupeditformcaption="Add/Modify Family Relationship" confirmdelete="Are You Want To Delete This Record ???" />
                            <settingspager numericbuttoncount="20" pagesize="20">
                                                </settingspager>
                            <settingsbehavior columnresizemode="NextColumn" confirmdelete="True" />
                        </dxwgv:ASPxGridView>
                        <dxpc:ASPxPopupControl ID="ASPXPopupControl" runat="server" ContentUrl="frmAddDocuments.aspx"
                            CloseAction="CloseButton" Top="100" Left="400" ClientInstanceName="popup" Height="500px"
                            Width="900px" HeaderText="Add Document">
                            <ContentCollection>
                                <dxpc:PopupControlContentControl runat="server">
                                </dxpc:PopupControlContentControl>
                            </ContentCollection>
                        </dxpc:ASPxPopupControl>
                    </td>
                </tr>
                <tr>
                    <td style="display: none">
                        <asp:TextBox ID="LabelID" runat="server" Text=""></asp:TextBox>
                        <asp:TextBox ID="LabelMode" runat="server" Text=""></asp:TextBox>
                    </td>
                </tr>
            </table>
            <%--</asp:Panel>--%>
        </div>
    </form>
</body>
</html>
