	</div>
	
	<div id="footer">	
		<p>Copyright &copy; 2015 Angela Rosario</p>
	</div>
	
	<script>
	var body = document.body;
    var	doc = document.documentElement;
    console.log("body.offsetHeight is: " + body.offsetHeight); 
    console.log("doc.offsetHeight is: " + doc.offsetHeight); 
	if (body.offsetHeight < 750) {
		body.style.height = "750px";
	} else {
		body.style.height = "100%";
	}
	</script>

</body>
</html>