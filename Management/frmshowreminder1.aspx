<%@ Import Namespace="System.Web.Services" %>
<%@ page language="C#" autoeventwireup="true" inherits="management_frmshowreminder1, App_Web_im-ehkhh" %>
<%@ outputcache duration="1" varybyparam="none" Location="None" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script language="javascript" type="text/javascript">
        function SignOff()
           {
                parent.window.SignOff();
           }
    </script>
    <script type="text/javascript" language="javascript">
        var refreshinterval;//=10
        var cashJournal ;
    refreshinterval = <%=Session["TimeForTickerDisplay"] %>;
    cashJournal = <%=Session["cashJournal"] %>;    
    
    var displaycountdown="NO"
     var starttime
    var nowtime
    var reloadseconds=0
    var secondssinceloaded=0

    function starttime() {
	    starttime=new Date()
	    starttime=starttime.getTime()
	    if(cashJournal==1)
            countdown()
    }

    function countdown() 
    {
	    nowtime= new Date()
	    nowtime=nowtime.getTime()
	    secondssinceloaded=(nowtime-starttime)/10
	    reloadseconds=Math.round(refreshinterval-secondssinceloaded)
	    if (refreshinterval>=secondssinceloaded) {
            var timer=setTimeout("countdown()",10)
		    if (displaycountdown=="yes") {
			    window.status="Page refreshing in "+reloadseconds+ " seconds"
		    }
        }
        else {
            clearTimeout(timer)
		    window.location.reload(true)
		    //ParentCall('Parent')
        } 
    }
    window.onload=starttime
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
