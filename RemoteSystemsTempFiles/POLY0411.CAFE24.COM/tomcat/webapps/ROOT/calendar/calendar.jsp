<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />  
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>
    
  </head>
  <body class="is-preload homepage" >
  	  <div style="position:absolute; padding-left: 40%; margin-left: 140px; margin-top:-2px text-align: center;">
	  	  <a href="../index.jsp">
	  	  	<img src="logo.png"> 
	  	  </a>
  	  </div>
      
 	   
	  <div id='calendar'></div>
	  
	 <!-- Scripts -->

			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script> 
	  
  </body>
</html>