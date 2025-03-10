<%@ page language="C#" autoeventwireup="true" inherits="management_frm_UserRecruitRefferal, App_Web_yf04ozfw" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
 <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
     <script language="javascript" type="text/javascript">
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
    function BtnActivity_Click()
    {
        document.getElementById("TdNewCalls").style.display = 'inline';
        document.getElementById("TdUpperDetails").style.display = 'none';
        document.getElementById("TdShowDetails").style.display = 'none';   
        document.getElementById("TdCall").style.display = 'none';
        var Hd2=document.getElementById("ctl00$ContentPlaceHolder3$Hd2");  
        Hd2.value='NewActivity';   
        grid.PerformCallback('New Activity');
    }
    function BtnPendingInterview_Click()
    {
        document.getElementById("TdNewCalls").style.display = 'inline';
        document.getElementById("TdUpperDetails").style.display = 'none';
        document.getElementById("TdShowDetails").style.display = 'none';
        document.getElementById("TdCall").style.display = 'none';
        var Hd2=document.getElementById("ctl00$ContentPlaceHolder3$Hd2");  
        Hd2.value='';   
        grid.PerformCallback('Pending');
    }
    function BtnCompletedIntereview_Click()
    {
        document.getElementById("TdNewCalls").style.display = 'inline';
        document.getElementById("TdUpperDetails").style.display = 'none';
        document.getElementById("TdShowDetails").style.display = 'none';
        document.getElementById("TdCall").style.display = 'none';
        var Hd2=document.getElementById("ctl00$ContentPlaceHolder3$Hd2");  
        Hd2.value='';   
        grid.PerformCallback('SelectedInterview');
    }
    function BtnSelectedCandidates_Click()
    {
        document.getElementById("TdNewCalls").style.display = 'inline';
        document.getElementById("TdUpperDetails").style.display = 'none';
        document.getElementById("TdShowDetails").style.display = 'none';
        document.getElementById("TdCall").style.display = 'none';
        var Hd2=document.getElementById("ctl00$ContentPlaceHolder3$Hd2");  
        Hd2.value='';   
        grid.PerformCallback('SelectedCandidate');
    }
    function BtnEliminatedCandidates_Click()
    {
        document.getElementById("TdNewCalls").style.display = 'inline';
        document.getElementById("TdUpperDetails").style.display = 'none';
        document.getElementById("TdShowDetails").style.display = 'none';
        document.getElementById("TdCall").style.display = 'none';
        var Hd2=document.getElementById("ctl00$ContentPlaceHolder3$Hd2");  
        Hd2.value='';   
        grid.PerformCallback('ElininatedCandidate');
    }
    function RowValue(e)
    {
        grid.GetRowValues(e.visibleIndex,'Id', GetValues);
    }
    function GetValues(values) 
    {
        RowID=values;        
        var Hd=document.getElementById("ctl00$ContentPlaceHolder3$Hd1");
        Hd.value=RowID;
        var Hd2=document.getElementById("ctl00$ContentPlaceHolder3$Hd2"); 
        if(Hd2.value=="NewActivity")
        {
            document.getElementById("TdNewCalls").style.display = 'none';
            document.getElementById("TdUpperDetails").style.display = 'inline';
            document.getElementById("TdShowDetails").style.display = 'inline';
            document.getElementById("TdCall").style.display = 'none';
            ShowData();
        }
        else
        {
            document.getElementById("TdNewCalls").style.display = 'none';
            document.getElementById("TdUpperDetails").style.display = 'inline';
            document.getElementById("TdShowDetails").style.display = 'inline';
            document.getElementById("TdCall").style.display = 'none';
            ShowData();
        }
    } 
    function RowValueCall(e)
    {
        gridNewCall.GetRowValues(e.visibleIndex,'Id', GetValuesCall);
    }
    function GetValuesCall(values) 
    {
        RowID=values;
        document.getElementById("TdNewCalls").style.display = 'none';
        document.getElementById("TdUpperDetails").style.display = 'inline';
        document.getElementById("TdShowDetails").style.display = 'inline';
        document.getElementById("TdCall").style.display = 'none';
        ShowData();
    } 
    function InitialPosition()
    {
        document.getElementById("TdNewCalls").style.display = 'none';
        document.getElementById("TdUpperDetails").style.display = 'none';
        document.getElementById("TdShowDetails").style.display = 'none';
        document.getElementById("TdCall").style.display = 'inline';
    }
    function frmOpenNewWindow1(location,v_height,v_weight)
    {
        var y=(screen.availHeight-v_height)/2;
        var x=(screen.availWidth-v_weight)/2;
        window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=no,resizable=no,dependent=no");       
    }    
    function BtnAddCandidate_Click()
    {
        var str = "frm_AddCandidate.aspx?id="+RowID+"&mode=new&id1="+RowID+"";
        frmOpenNewWindow1(str,400,900);
    }
    function BtnUpdateCandidate_Click()
    {
        var str = "frm_AddCandidate.aspx?id="+RowID1+"&mode=edit&id1="+RowID+"";
        frmOpenNewWindow1(str,400,900)
    }
    function BtnCreateInterview_Click()
    {
        var str = "frm_UpdateInterview.aspx?id="+RowID1+"&mode=new&id1="+RowID+"";
        frmOpenNewWindow1(str,400,900)
    }
    function CandidateRefresh()
    {
        var Hd=document.getElementById("ctl00$ContentPlaceHolder3$Hd1");
        candidate.PerformCallback(Hd.value);
    }
    FieldName='BtnActivity';
</script>
<script type="text/ecmascript">
    function RowValue1(e)
    {
        candidate.GetRowValues(e.visibleIndex,'Id', GetValues1);
    }
    function GetValues1(values) 
    {
        RowID1=values;        
        CallServer("Candidate" + "~" +RowID1,"");
    } 
    function ShowData()
    {
        CallServer("Edit" + "~" +RowID,"");
    }
    function BtnUpdateInterview_Click()
    {
        var str = "frm_AddInterviews.aspx?id="+id+"&name="+name+"&interviewer="+interviewer+"&interviewId="+interviewid+"&id1="+RowID+"";
        frmOpenNewWindow1(str,470,900)
    }
    function ReceiveServerData(rValue)
    {
        var DATA=rValue.split('~');
        if(DATA[0]=="Edit")
        {
            if(DATA[1]!="N")
            {
                var TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblDateofAllotment");
                    TextComboId.innerText=DATA[1];
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblSchStartDate");
                    TextComboId.innerText=DATA[2];
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblSchEndDate");
                    TextComboId.innerText=DATA[3];
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblActivityId");
                    TextComboId.innerText=DATA[4];
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblAllotedby");
                    TextComboId.innerText=DATA[5];                    
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblPriority");
                    TextComboId.innerText=DATA[6];
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblMinExp");
                    TextComboId.innerText=DATA[7];
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblEduQualification");
                    TextComboId.innerText=DATA[8];
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblProfQualification");
                    TextComboId.innerText=DATA[9];
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblVacancies");
                    TextComboId.innerText=DATA[10];                    
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblJobResponsibility");
                    TextComboId.innerText=DATA[11];
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblSex");
                    TextComboId.innerText=DATA[12];
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblSkills");
                    TextComboId.innerText=DATA[13];
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblfromAge");
                    TextComboId.innerText=DATA[14];
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblToAge");
                    TextComboId.innerText=DATA[15];
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblLocalityPref");
                    TextComboId.innerText=DATA[16];
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblHOD");
                    TextComboId.innerText=DATA[17];
                    candidate.PerformCallback(DATA[4]);
            }
            else
            {
                var TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblDateofAllotment");
                    TextComboId.innerText="";
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblSchStartDate");
                    TextComboId.innerText="";
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblSchEndDate");
                    TextComboId.innerText="";
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblActivityId");
                    TextComboId.innerText="";
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblAllotedby");
                    TextComboId.innerText="";               
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblPriority");
                    TextComboId.innerText="";
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblMinExp");
                    TextComboId.innerText="";
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblEduQualification");
                    TextComboId.innerText="";
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblProfQualification");
                    TextComboId.innerText="";
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblVacancies");
                    TextComboId.innerText="";                 
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblJobResponsibility");
                    TextComboId.innerText="";
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblSex");
                    TextComboId.innerText="";
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblSkills");
                    TextComboId.innerText=""; 
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblfromAge");
                    TextComboId.innerText="";
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblToAge");
                    TextComboId.innerText="";
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblLocalityPref");
                    TextComboId.innerText="";
                    TextComboId=document.getElementById("ctl00_ContentPlaceHolder3_lblHOD");
                    TextComboId.innerText="";
            }
        }
        if(DATA[0]=="Candidate")
        {
            id=DATA[1];
            name=DATA[2];
            interviewer=DATA[3];
            interviewid=DATA[4];
        }
    }
</script>
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
   
<table  class="TableMain100">
    <tr>
        <td id="TdButton" style="text-align: left">
            <input id="BtnActivity" type="button" value="New Activity" class="btnUpdate" onclick="BtnActivity_Click()"/>
            <input id="BtnPendingInterview" type="button" value="Pending Interview" class="btnUpdate" onclick="BtnPendingInterview_Click()"/>
            <input id="BtnCompletedIntereview" type="button" value="Completed Intereview" class="btnUpdate" onclick="BtnCompletedIntereview_Click()"/>
            <input id="BtnSelectedCandidates" type="button" value="Selected Candidates" class="btnUpdate" onclick="BtnSelectedCandidates_Click()"/>
            <input id="BtnEliminatedCandidates" type="button" value="Eliminated Candidates" class="btnUpdate" onclick="BtnEliminatedCandidates_Click()"/>
        </td>        
    </tr>
    <tr>
        <td id="TdNewCalls">
            <dxwgv:ASPxGridView ID="gridNewCalls" runat="server" KeyFieldName="Id" ClientInstanceName="grid" Width="100%" AutoGenerateColumns="true" OnCustomCallback="gridNewCalls_CustomCallback">
                <Styles>
                    <LoadingPanel ImageSpacing="10px">
                    </LoadingPanel>
                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                    </Header>
                </Styles>
                <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                     <FirstPageButton Visible="True">
                     </FirstPageButton>
                     <LastPageButton Visible="True">
                     </LastPageButton>
                </SettingsPager>
                <SettingsBehavior AllowFocusedRow="True" AllowSort="False" AllowMultiSelection="false"/>
                <ClientSideEvents RowClick="function(s, e) { RowValue(e); }" />
            </dxwgv:ASPxGridView>
        </td>
    </tr> 
    <tr>
        <td id="TdCall">
            <dxwgv:ASPxGridView ID="gridNewCall" runat="server" KeyFieldName="Id" ClientInstanceName="gridNewCall" Width="100%" AutoGenerateColumns="true" OnCustomCallback="gridNewCalls_CustomCallback">
                <Styles>
                    <LoadingPanel ImageSpacing="10px">
                    </LoadingPanel>
                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                    </Header>
                </Styles>
                  <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                     <FirstPageButton Visible="True">
                     </FirstPageButton>
                     <LastPageButton Visible="True">
                     </LastPageButton>
                </SettingsPager>
                <SettingsBehavior AllowFocusedRow="True" AllowSort="False" AllowMultiSelection="false"/>
                <ClientSideEvents RowClick="function(s, e) { RowValueCall(e); }" />
            </dxwgv:ASPxGridView>
        </td>
    </tr>   
    <tr>
        <td id="TdUpperDetails">
           <asp:Panel ID="Panel1" runat="server" Width="50%" BorderWidth="1px" BorderColor="blue">
            <table class="TableMain100">
                <tr class="EHEADER">
                    <td class="ColHead" colspan="4">
                        <span style="color: #3300cc"><strong>Activity Detail</strong></span>
                    </td>
                </tr>
                <tr>
                    <td class="Ecoheadtxt" style="width: 26%">
                        Activity Id :
                    </td>
                    <td style="width: 15%; text-align: left;">
                        <asp:Label ID="lblActivityId" runat="server" CssClass="EcoheadCon"></asp:Label>
                    </td>
                    <td class="Ecoheadtxt" style="width: 31%">
                        Date of Allotment :
                    </td>
                    <td style="text-align: left">
                        <asp:Label ID="lblDateofAllotment" runat="server" CssClass="EcoheadCon"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Ecoheadtxt" style="width: 26%">
                        Alloted By :
                    </td>
                    <td style="width: 15%; text-align: left">
                        <asp:Label ID="lblAllotedby" runat="server" CssClass="EcoheadCon"></asp:Label>
                    </td>
                    <td class="Ecoheadtxt" style="width: 31%">
                        Scheduled Start Date/time :
                    </td>
                    <td style="text-align: left">
                        <asp:Label ID="lblSchStartDate" runat="server" CssClass="EcoheadCon"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Ecoheadtxt" style="width: 26%">
                        Priority :
                    </td>
                    <td style="width: 15%; text-align: left">
                        <asp:Label ID="lblPriority" runat="server" CssClass="EcoheadCon"></asp:Label>
                    </td>
                    <td class="Ecoheadtxt" style="width: 31%">
                        Scheduled End Date/time :
                    </td>
                    <td style="text-align: left">
                        <asp:Label ID="lblSchEndDate" runat="server" CssClass="EcoheadCon"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Ecoheadtxt" style="width: 26%">
                        Vacancies :
                    </td>
                    <td style="width: 15%; text-align: left">
                        <asp:Label ID="lblVacancies" runat="server" CssClass="EcoheadCon"></asp:Label>
                    </td>
                    <td class="Ecoheadtxt" style="width: 31%">
                        Actual Start Date/time :
                    </td>
                    <td style="text-align: left">
                        <asp:Label ID="lblActualStartDate" runat="server" CssClass="EcoheadCon"></asp:Label>
                    </td>
                </tr>
            </table>
           </asp:Panel> 
        </td>
    </tr>    
    <tr>
        <td id="TdShowDetails">
            <table class="TableMain100">
                <tr>
                    <td>
                       <asp:Panel ID="Panel2" runat="server" Width="50%" BorderWidth="1px" BorderColor="blue"> 
                        <table class="TableMain100">
                            <tr class="EHEADER">
                                <td class="ColHead" colspan="4">
                                    <span style="color: #3300cc"><strong>Recruitment Detail</strong></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="Ecoheadtxt" style="width: 26%">
                                    Job Responsibility :
                                </td>
                                <td style="width: 15%; text-align: left">
                                    <asp:Label ID="lblJobResponsibility" runat="server" CssClass="EcoheadCon"></asp:Label>
                                </td>
                                <td class="Ecoheadtxt" style="width: 31%">
                                    HOD :
                                </td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblHOD" runat="server" CssClass="EcoheadCon"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Ecoheadtxt" style="width: 26%">
                                    Skills  :&nbsp;</td>
                                <td style="width: 15%; text-align: left">
                                    <asp:Label ID="lblSkills" runat="server" CssClass="EcoheadCon"></asp:Label></td>
                                <td class="Ecoheadtxt" style="width: 31%">
                                    Sex :&nbsp;</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblSex" runat="server" CssClass="EcoheadCon"></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="Ecoheadtxt" style="width: 26%">
                                    Locality Preferences :
                                </td>
                                <td style="width: 15%; text-align: left">
                                    <asp:Label ID="lblLocalityPref" runat="server" CssClass="EcoheadCon"></asp:Label></td>
                                <td class="Ecoheadtxt" style="width: 31%">
                                    <span style="text-decoration: underline">
                                    Age Limit</span>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="Ecoheadtxt" style="width: 26%">
                                    Educational Qualification :
                                </td>
                                <td style="width: 15%; text-align: left">
                                    <asp:Label ID="lblEduQualification" runat="server" CssClass="EcoheadCon"></asp:Label>
                                </td>
                                <td class="Ecoheadtxt" style="width: 31%">
                                    From :</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblfromAge" runat="server" CssClass="EcoheadCon" Width="33px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="Ecoheadtxt" style="width: 26%">
                                    Professional Qualification :
                                </td>
                                <td style="width: 15%; text-align: left">
                                    <asp:Label ID="lblProfQualification" runat="server" CssClass="EcoheadCon"></asp:Label>
                                </td>
                                <td class="Ecoheadtxt" style="width: 31%">
                                    To :</td>
                                <td style="text-align: left">
                                    <asp:Label ID="lblToAge" runat="server" CssClass="EcoheadCon" Width="33px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Ecoheadtxt" style="width: 26%">
                                    Min Exp :
                                </td>
                                <td style="width: 15%; text-align: left">
                                    <asp:Label ID="lblMinExp" runat="server" CssClass="EcoheadCon"></asp:Label>
                                </td>
                                <td class="Ecoheadtxt" style="width: 31%">
                                    </td>
                                <td style="text-align: left">
                                    </td>
                            </tr>
                        </table>
                       </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <input id="BtnAddCandidate" type="button" value="Add Candidate" class="btnUpdate" onclick="BtnAddCandidate_Click()"/>
                        <input id="BtnUpdateCandidate" type="button" value="Update Candidate" class="btnUpdate" onclick="BtnUpdateCandidate_Click()"/>
                        <input id="BtnCreateInterview" type="button" value="Create Interview" class="btnUpdate" onclick="BtnCreateInterview_Click()"/>
                        <input id="BtnUpdateInterview" type="button" value="Update Interview" class="btnUpdate" onclick="BtnUpdateInterview_Click()"/>
                        <asp:HiddenField ID="Hd1" runat="server" />
                        <asp:HiddenField ID="Hd2" runat="server" />
                    </td>
                </tr>
                <tr class="EHEADER">
                  <td class="ColHead" colspan="4">
                      <span style="color: #3300cc"><strong>Candidate And Interview Detail</strong></span>
                  </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="gridCandidate" runat="server" KeyFieldName="Id" ClientInstanceName="candidate" Width="100%" OnCustomCallback="gridCandidate_CustomCallback">
                            <Styles>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                            </Styles>
                            <SettingsBehavior AllowFocusedRow="True" AllowSort="False"/>
                            <ClientSideEvents RowClick="function(s, e) { RowValue1(e); }" />
                            <SettingsPager ShowSeparators="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                        </dxwgv:ASPxGridView>
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
