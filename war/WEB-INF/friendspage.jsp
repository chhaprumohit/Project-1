<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body id="body">

	<div class="container">
		<div class="col-md-5">
			<div class="form-area">
				<form id="fb_Form" role="form" action="twitter" method="post"
					style="width: 150%;">
					<h3 style="margin-bottom: 25px; text-align: center;">Mohit
						Twitter</h3>
					<div id="User_Pic"></div>
					<h6 id="User_Welcome"></h6>
					<nav class="navbar navbar-default">
					<div class="container-fluid">
						<ul class="nav navbar-nav">
							<li><a id="tweetLink">Tweet</a></li>
							<li><a href="/friendspage">Friends</a></li>
							<li><a href="/toptweets">Top Tweets</a></li>
						</ul>
					</div>
					</nav>
				</form>
			</div>
		</div>
	</div>

	<input type="hidden" id="author" name="author" value=">">
	<!-- <img id="img" src="" alt="HTML5 Icon" width="64" height="64"> -->
	<br>

	<script>
		//console.log("${usertweetsCount}");		
		debugger;
		var usertweets = "${usertweets}";
		//var r1 = "${r1}";
		debugger
		//console.log(usertweets);
		usertweetsArray = usertweets.split("-----")
		for (var i = 0; i < usertweetsArray.length - 1; i++) {
			//console.log(usertweetsArray[i]);
			//console.log(document.getElementById("tt").innerHTML);
			//document.getElementById("tt").innerHTML = document.getElementById("tt").innerHTML +usertweets[i].split("--")[0]+"  =====>  "+usertweets[i].split("--")[1]+"<br>";
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : "1321199734624625",
				xfbml : true,
				version : "v2.9"
			});

			function onLogin(response) {
				if (response.status == "connected") {
					FB
							.api(
									"/me?fields=first_name,last_name,picture",
									function(data) {
										debugger;
										//console.log(data);
										//console.log(data.first_name + " " + data.last_name);
										//console.log(data.picture.data.url);
										//document.getElementById("img").src= data.picture.data.url
										//console.log(document.getElementById("img").src);
										var image = document
												.createElement("img");
										var imageParent = document
												.getElementById("fb_Form");
										image.id = "Owner Image";
										image.className = "class";
										image.src = data.picture.data.url;
										imageParent.appendChild(image);

										var t = document.createTextNode(" "
												+ data.first_name
												+ data.last_name);
										imageParent.appendChild(t);

										linebreak = document
												.createElement("br");
										imageParent.appendChild(linebreak);

										if (usertweets.includes(data.first_name
												+ data.last_name)) {
											for (var i = 0; i < usertweetsArray.length - 1; i++) {
												if (usertweetsArray[i]
														.includes(data.first_name
																+ data.last_name)) {
													var a = document
															.createElement("a");
													var msg = document
															.createTextNode(usertweetsArray[i]
																	.split("--")[1]);
													msg.textIndent = "100px";
													a.appendChild(msg)
													a.className = "form-control";
													a.title = msg;
													a.href = "https://1-dot-mytweetproject-168818.appspot.com/tweetinfo?id="
															+ usertweetsArray[i].split("--")[0];
													a.target = "_blank";
													imageParent
															.appendChild(document
																	.createTextNode("\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0"));
													imageParent.appendChild(a);													
												}
											}
											lb = document.createElement("br");
											imageParent.appendChild(lb);
										}

										var welcomeBlock = document
												.getElementById("User_Welcome");
										welcomeBlock.innerHTML = "Hello, "
												+ data.first_name + " "
												+ data.last_name + "!"
												+ "<br/>"
												+ "Welcome to the Application";
										document.getElementById("tweetLink").href = "/twitter?Author="
												+ data.first_name
												+ data.last_name;
										var sndName = document
												.getElementById("author")
										if (sndName) {
											console.log("The sender is ok ");
											sndName.value = data.first_name
													+ data.last_name;
										} else {
											console.log("The sender is ok ");
										}
									});

					FB
							.api(
									"/me/friends?fields=first_name,last_name,picture",
									function(data) {
										//console.log(data);

										for ( var i in data.data) {
											var image = document
													.createElement("img");
											var imageParent = document
													.getElementById("fb_Form");
											image.id = "id" + i;
											image.className = "class";
											image.src = data.data[i].picture.data.url;
											imageParent.appendChild(image);

											var t = document.createTextNode(" "
													+ data.data[i].first_name
													+ data.data[i].last_name);
											imageParent.appendChild(t);

											linebreak = document
													.createElement("br");
											imageParent.appendChild(linebreak);

											if (usertweets
													.includes(data.data[i].first_name
															+ data.data[i].last_name)) {
												for (var k = 0; k < usertweetsArray.length - 1; k++) {
													if (usertweetsArray[k]
															.includes(data.data[i].first_name
																	+ data.data[i].last_name)) {
														var a = document
																.createElement("a");
														var msg = document
																.createTextNode(usertweetsArray[k]
																		.split("--")[1]);
														msg.textIndent = "100px";
														a.appendChild(msg)
														a.className = "form-control";
														a.title = msg;
														a.href = "https://1-dot-mytweetproject-168818.appspot.com/tweetinfo?id="
																+ usertweetsArray[k]
																		.split("--")[0];
														a.target = "_blank";
														imageParent
																.appendChild(document
																		.createTextNode("\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0"));
														imageParent
																.appendChild(a);												
													}
												}
												lb = document.createElement("br");
												imageParent.appendChild(lb);
											}
										}
									}, {
										scope : "user_friends"
									});
				} else {
					var welcomeBlock = document.getElementById("User_Welcome");
					welcomeBlock.innerHTML = "Cant get data " + response.status
							+ "!";
				}
			}

			FB.getLoginStatus(function(response) {
				// Check login status on load, and if the user is
				// already logged in, go directly to the welcome message.
				console.log("getLoginStatus .... ");

				if (response.status == "connected") {
					console.log("connected .... ");
					onLogin(response);
				} else {
					console.log("Not connected .... ");
					FB.login(function(response) {
						onLogin(response);
					}, {
						scope : "user_friends, email, user_birthday"
					});
				}
			});
			console.log("logPageView .... ");
			FB.AppEvents.logPageView();
		};
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, "script", "facebook-jssdk"));
	</script>
</body>
</html>