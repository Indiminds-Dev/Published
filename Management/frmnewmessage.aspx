<%@ page language="C#" autoeventwireup="true" inherits="management_frmnewmessage, App_Web_0payuukt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head" runat="server">
    <title>Untitled Page</title>

    <script language="javascript" type="text/javascript">
    
    function imgClick()
    {
        //alert('hi');
        frmOpenNewWindow1('frmnewmessage_popup.aspx','400','800');
    }
    
    var refreshinterval;//=10
     var cashJournal ;
    refreshinterval = <%=Session["TimeForTickerDisplay"] %>;
    //cashJournal = <%=Session["cashJournal"] %>;  
    var displaycountdown="NO"
     var starttime
    var nowtime
    var reloadseconds=0
    var secondssinceloaded=0

    function starttime() {
	    starttime=new Date()
	    starttime=starttime.getTime()
	    countdown()
    }

    function countdown() {
        //alert('hi');
	    nowtime= new Date()
	    nowtime=nowtime.getTime()
	    secondssinceloaded=(nowtime-starttime)/1000
	    reloadseconds=Math.round(refreshinterval-secondssinceloaded)
	    if (refreshinterval>=secondssinceloaded) {
            var timer=setTimeout("countdown()",1000)
		    if (displaycountdown=="yes") {
			    window.status="Page refreshing in "+reloadseconds+ " seconds"
		    }
        }
        else {
            clearTimeout(timer)
		    window.location.reload(true)
		    
        } 
    }
    window.onload=starttime();

    
     function frmOpenNewWindow1(location,v_height,v_weight)
        {
            var y=(screen.availHeight-v_height)/2;
            var x=(screen.availWidth-v_weight)/2;
            window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=yes,resizable=no,dependent=no");       
        }
    
    
   function SignOff()
   {
        parent.window.SignOff();
   }
    
    
    </script>

</head>
<body style="background-color: white">
    <form id="form1" runat="server">
        <asp:HiddenField ID="H_MSGCOUNT" runat="server" />
    </form>
    <table>
        <tr>
            <td align="right">
                <div runat="server" id="MessageId">
                
                </div>
            </td>
        </tr>
    </table>
    <table style="width: 100%; height: 20px;">
        <tr>
            <td align="right">
                <div id="reminder" style="border-width: 0px; width: 100%; border: 0px">
                    <span runat="server" style="width: 100%; border: 0px" id="SpnResultId">
                    </span>
                </div>
            </td>
        </tr>
    </table>
</body>
</html>
