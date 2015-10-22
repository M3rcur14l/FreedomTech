<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/font-awesome/css/font-awesome.min.css"/>">
<script src="<c:url value="/resources/js/vendor/modernizr.js"/>"></script>
</head>
<body>
	<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

	<!-- Add your site or application content here -->


	<header class="header" role="banner">

		<div class="skiptocontent">
			<a href="#main">skip to main content</a>
		</div>
		<h2 class="logo">
			<a href="<c:url value="/"/>"><img
				src="<c:url value="/resources/img/logo.png"/>" width="300"
				height="100" alt="Web-Store"></a>
		</h2>

		<form class="search-form" method="get">
			<div class="search-container">
				<h2 class="hidden">Search Menu</h2>
				<label for="search-input" class="hidden">Search a product</label> <input
					id="search-input" class="search-input" type="text"
					placeholder="Search a product">
				<button type="submit" title="Search"
					class="search-button button-link" alt="Submit Search">
					<span class="hidetext">Search</span><i class="fa fa-search"></i>
				</button>
			</div>
		</form>
		<div class="clear"></div>
		<nav role="navigation">
			<h2 class="hidden">Navigation Menu</h2>

			<div class="left">
				<ul>
					<li><a id="categories" href="#" title="Categories">Categories
							<span class="hidetext">Click to explore categories</span><i class="fa fa-chevron-down"></i>
					</a>
						<ul id="submenu">
							<c:forEach items="${categoryList}" var="category">
								<li><a
									href="<c:url value="/type-view?category=${category.name}"/>"
									title="${category.name}">${category.name}</a></li>
							</c:forEach>
						</ul></li>
				</ul>
			</div>

			<div class="right">
				<ul>
					<c:choose>
						<c:when test="${email!=null}">
							<li><a href="<c:url value="/account"/>" title="My Account">My
									Account</a></li>
							<li><a href="<c:url value="/cart"/>" title="Cart">Cart <i
									class="fa fa-shopping-cart"></i></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="<c:url value="/login"/>" title="Login/Register">Login/Register</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
	</header>

	<main class="large" role="main" id="main">
	<p id="breadcrumbs">
		<span class="hidetext">You are here: </span><a href="<c:url value="/"/>">Home</a>
		&gt; Login/Register
	</p>
	<article>
		<div class="login-signup">

			<div class="login">
				<h1>Registered Customers</h1>

				<form id="login-form" name="login" method="post"
					action="<c:url value="/login"/>">

					<p>
						<label for="login-email">Email</label> <input required=""
							aria-required="true" class="required" type="email"
							name="login-email" id="login-email">
					</p>

					<p>
						<label for="login-password">Password</label> <input required=""
							aria-required="true" class="required"
							aria-describedby="password-description" type="password"
							name="login-password" id="login-password"> <br>
					</p>

					<p>
						<button type="submit" title="Login" class="button-link"
							alt="Submit Login">Login</button>
					</p>

				</form>
			</div>

			<div class="signup">
				<h1>New Customers</h1>

				<p>
					Please complete all required fields marked with a <span
						class="star">*</span>.
				</p>

				<form id="signup-form" name="signup" method="post"
					action="<c:url value="/signup"/>">
					<p>
						<label for="fname">First Name <span class="star">*</span></label>
						<input required="" aria-required="true" class="required"
							type="text" name="fname" id="fname">
					</p>

					<p>
						<label for="lname">Last Name <span class="star">*</span></label> <input
							required="" aria-required="true" class="required" type="text"
							name="lname" id="lname">
					</p>

					<p>
						<label for="signup-email">Email <span class="star">*</span></label>
						<input required="" aria-required="true" class="required"
							type="email" name="signup-email" id="signup-email">
					</p>

					<p>
						<label for="signup-password">Password <span class="star">*</span></label>
						<input required="" aria-required="true" class="required"
							aria-describedby="password-description" type="password"
							name="signup-password" id="signup-password"> <br>
					</p>

					<p>
						<label for="bday">Birthday <span class="star">*</span></label> <input
							required="" aria-required="true" class="required"
							aria-describedby="bday-format" type="date" name="bday" id="bday">
					</p>

					<p>
					<fieldset class="inline">
						<legend>
							Gender <span class="star">*</span>
						</legend>
						<input required="" aria-required="true" class="required"
							type="radio" name="gender" value="male" id="male"> <label
							for="male" class="inline">Male</label> <input required=""
							aria-required="true" class="required" type="radio" name="gender"
							value="female" id="female"> <label for="female"
							class="inline">Female</label>
					</fieldset>

					</p>

					<p>

						<label for="country">Location <span class="star">*</span></label>

						<select id="country" name="country">

							<option value="AF">Afghanistan</option>
							<option value="AL">Albania</option>
							<option value="DZ">Algeria</option>
							<option value="AS">American Samoa</option>
							<option value="AD">Andorra</option>
							<option value="AO">Angola</option>
							<option value="AI">Anguilla</option>
							<option value="AQ">Antarctica</option>
							<option value="AG">Antigua and Barbuda</option>
							<option value="AR">Argentina</option>
							<option value="AM">Armenia</option>
							<option value="AW">Aruba</option>
							<option value="AU">Australia</option>
							<option value="AT">Austria</option>
							<option value="AZ">Azerbaijan</option>
							<option value="BH">Bahrain</option>
							<option value="BD">Bangladesh</option>
							<option value="BB">Barbados</option>
							<option value="BY">Belarus</option>
							<option value="BE">Belgium</option>
							<option value="BZ">Belize</option>
							<option value="BJ">Benin</option>
							<option value="BM">Bermuda</option>
							<option value="BT">Bhutan</option>
							<option value="BO">Bolivia</option>
							<option value="BA">Bosnia and Herzegovina</option>
							<option value="BW">Botswana</option>
							<option value="BV">Bouvet Island</option>
							<option value="BR">Brazil</option>
							<option value="IO">British Indian Ocean Territory</option>
							<option value="VG">British Virgin Islands</option>
							<option value="BN">Brunei</option>
							<option value="BG">Bulgaria</option>
							<option value="BF">Burkina Faso</option>
							<option value="BI">Burundi</option>
							<option value="CI">Côte d'Ivoire</option>
							<option value="KH">Cambodia</option>
							<option value="CM">Cameroon</option>
							<option value="CA">Canada</option>
							<option value="CV">Cape Verde</option>
							<option value="KY">Cayman Islands</option>
							<option value="CF">Central African Republic</option>
							<option value="TD">Chad</option>
							<option value="CL">Chile</option>
							<option value="CN">China</option>
							<option value="CX">Christmas Island</option>
							<option value="CC">Cocos (Keeling) Islands</option>
							<option value="CO">Colombia</option>
							<option value="KM">Comoros</option>
							<option value="CG">Congo</option>
							<option value="CK">Cook Islands</option>
							<option value="CR">Costa Rica</option>
							<option value="HR">Croatia</option>
							<option value="CU">Cuba</option>
							<option value="CY">Cyprus</option>
							<option value="CZ">Czech Republic</option>
							<option value="CD">Democratic Republic of the Congo</option>
							<option value="DK">Denmark</option>
							<option value="DJ">Djibouti</option>
							<option value="DM">Dominica</option>
							<option value="DO">Dominican Republic</option>
							<option value="TP">East Timor</option>
							<option value="EC">Ecuador</option>
							<option value="EG">Egypt</option>
							<option value="SV">El Salvador</option>
							<option value="GQ">Equatorial Guinea</option>
							<option value="ER">Eritrea</option>
							<option value="EE">Estonia</option>
							<option value="ET">Ethiopia</option>
							<option value="FO">Faeroe Islands</option>
							<option value="FK">Falkland Islands</option>
							<option value="FJ">Fiji</option>
							<option value="FI">Finland</option>
							<option value="MK">Former Yugoslav Republic of Macedonia</option>
							<option value="FR">France</option>
							<option value="FX">France, Metropolitan</option>
							<option value="GF">French Guiana</option>
							<option value="PF">French Polynesia</option>
							<option value="TF">French Southern Territories</option>
							<option value="GA">Gabon</option>
							<option value="GE">Georgia</option>
							<option value="DE">Germany</option>
							<option value="GH">Ghana</option>
							<option value="GI">Gibraltar</option>
							<option value="GR">Greece</option>
							<option value="GL">Greenland</option>
							<option value="GD">Grenada</option>
							<option value="GP">Guadeloupe</option>
							<option value="GU">Guam</option>
							<option value="GT">Guatemala</option>
							<option value="GN">Guinea</option>
							<option value="GW">Guinea-Bissau</option>
							<option value="GY">Guyana</option>
							<option value="HT">Haiti</option>
							<option value="HM">Heard and Mc Donald Islands</option>
							<option value="HN">Honduras</option>
							<option value="HK">Hong Kong</option>
							<option value="HU">Hungary</option>
							<option value="IS">Iceland</option>
							<option value="IN">India</option>
							<option value="ID">Indonesia</option>
							<option value="IR">Iran</option>
							<option value="IQ">Iraq</option>
							<option value="IE">Ireland</option>
							<option value="IL">Israel</option>
							<option value="IT">Italy</option>
							<option value="JM">Jamaica</option>
							<option value="JP">Japan</option>
							<option value="JO">Jordan</option>
							<option value="KZ">Kazakhstan</option>
							<option value="KE">Kenya</option>
							<option value="KI">Kiribati</option>
							<option value="KW">Kuwait</option>
							<option value="KG">Kyrgyzstan</option>
							<option value="LA">Laos</option>
							<option value="LV">Latvia</option>
							<option value="LB">Lebanon</option>
							<option value="LS">Lesotho</option>
							<option value="LR">Liberia</option>
							<option value="LY">Libya</option>
							<option value="LI">Liechtenstein</option>
							<option value="LT">Lithuania</option>
							<option value="LU">Luxembourg</option>
							<option value="MO">Macau</option>
							<option value="MG">Madagascar</option>
							<option value="MW">Malawi</option>
							<option value="MY">Malaysia</option>
							<option value="MV">Maldives</option>
							<option value="ML">Mali</option>
							<option value="MT">Malta</option>
							<option value="MH">Marshall Islands</option>
							<option value="MQ">Martinique</option>
							<option value="MR">Mauritania</option>
							<option value="MU">Mauritius</option>
							<option value="YT">Mayotte</option>
							<option value="MX">Mexico</option>
							<option value="FM">Micronesia</option>
							<option value="MD">Moldova</option>
							<option value="MC">Monaco</option>
							<option value="MN">Mongolia</option>
							<option value="ME">Montenegro</option>
							<option value="MS">Montserrat</option>
							<option value="MA">Morocco</option>
							<option value="MZ">Mozambique</option>
							<option value="MM">Myanmar</option>
							<option value="NA">Namibia</option>
							<option value="NR">Nauru</option>
							<option value="NP">Nepal</option>
							<option value="NL">Netherlands</option>
							<option value="AN">Netherlands Antilles</option>
							<option value="NC">New Caledonia</option>
							<option value="NZ">New Zealand</option>
							<option value="NI">Nicaragua</option>
							<option value="NE">Niger</option>
							<option value="NG">Nigeria</option>
							<option value="NU">Niue</option>
							<option value="NF">Norfolk Island</option>
							<option value="KP">North Korea</option>
							<option value="MP">Northern Marianas</option>
							<option value="NO">Norway</option>
							<option value="OM">Oman</option>
							<option value="PK">Pakistan</option>
							<option value="PW">Palau</option>
							<option value="PS">Palestine</option>
							<option value="PA">Panama</option>
							<option value="PG">Papua New Guinea</option>
							<option value="PY">Paraguay</option>
							<option value="PE">Peru</option>
							<option value="PH">Philippines</option>
							<option value="PN">Pitcairn Islands</option>
							<option value="PL">Poland</option>
							<option value="PT">Portugal</option>
							<option value="PR">Puerto Rico</option>
							<option value="QA">Qatar</option>
							<option value="RE">Reunion</option>
							<option value="RO">Romania</option>
							<option value="RU">Russia</option>
							<option value="RW">Rwanda</option>
							<option value="ST">São Tomé and Príncipe</option>
							<option value="SH">Saint Helena</option>
							<option value="PM">St. Pierre and Miquelon</option>
							<option value="KN">Saint Kitts and Nevis</option>
							<option value="LC">Saint Lucia</option>
							<option value="VC">Saint Vincent and the Grenadines</option>
							<option value="WS">Samoa</option>
							<option value="SM">San Marino</option>
							<option value="SA">Saudi Arabia</option>
							<option value="SN">Senegal</option>
							<option value="RS">Serbia</option>
							<option value="SC">Seychelles</option>
							<option value="SL">Sierra Leone</option>
							<option value="SG">Singapore</option>
							<option value="SK">Slovakia</option>
							<option value="SI">Slovenia</option>
							<option value="SB">Solomon Islands</option>
							<option value="SO">Somalia</option>
							<option value="ZA">South Africa</option>
							<option value="GS">South Georgia and the South Sandwich
								Islands</option>
							<option value="KR">South Korea</option>
							<option value="ES">Spain</option>
							<option value="LK">Sri Lanka</option>
							<option value="SD">Sudan</option>
							<option value="SR">Suriname</option>
							<option value="SJ">Svalbard and Jan Mayen Islands</option>
							<option value="SZ">Swaziland</option>
							<option value="SE">Sweden</option>
							<option value="CH">Switzerland</option>
							<option value="SY">Syria</option>
							<option value="TW">Taiwan</option>
							<option value="TJ">Tajikistan</option>
							<option value="TZ">Tanzania</option>
							<option value="TH">Thailand</option>
							<option value="BS">The Bahamas</option>
							<option value="GM">The Gambia</option>
							<option value="TG">Togo</option>
							<option value="TK">Tokelau</option>
							<option value="TO">Tonga</option>
							<option value="TT">Trinidad and Tobago</option>
							<option value="TN">Tunisia</option>
							<option value="TR">Turkey</option>
							<option value="TM">Turkmenistan</option>
							<option value="TC">Turks and Caicos Islands</option>
							<option value="TV">Tuvalu</option>
							<option value="VI">US Virgin Islands</option>
							<option value="UG">Uganda</option>
							<option value="UA">Ukraine</option>
							<option value="AE">United Arab Emirates</option>
							<option value="GB">United Kingdom</option>
							<option value="US">United States</option>
							<option value="UM">United States Minor Outlying Islands</option>
							<option value="UY">Uruguay</option>
							<option value="UZ">Uzbekistan</option>
							<option value="VU">Vanuatu</option>
							<option value="VA">Vatican City</option>
							<option value="VE">Venezuela</option>
							<option value="VN">Vietnam</option>
							<option value="WF">Wallis and Futuna Islands</option>
							<option value="EH">Western Sahara</option>
							<option value="YE">Yemen</option>
							<option value="ZM">Zambia</option>
							<option value="ZW">Zimbabwe</option>

						</select>

					</p>

					<p>
						<label for="address">Address<span class="star">*</span></label> <input
							required="" aria-required="true" class="required" type="text"
							name="address" id="address">
					</p>

					<p>
						<label for="city">City <span class="star">*</span></label> <input
							required="" aria-required="true" class="required" type="text"
							name="city" id="city">
					</p>

					<p class="instructions-container">
						<label for="zip">Zip Code <span class="star">*</span></label> <input
							input required="" aria-required="true" class="required"
							type="number" pattern="[0-9]*" maxlength="5" min="0" name="zip"
							id="zip">
					</p>

					<p>
						<label for="cardnum">Card Number <span class="star">*</span></label>
						<input required="" aria-required="true" class="required"
							type="number" name="cardnum" id="cardnum">
					</p>

					<p>
						<label for="cardhold">Card Holder <span class="star">*</span></label>
						<input required="" aria-required="true" class="required"
							type="text" name="cardhold" id="cardhold">
					</p>

					<p>
						<label for="cardexpire">End Date (mm/yy) <span
							class="star">*</span></label> <input required="" aria-required="true"
							class="required" type="text" name="cardexpire" id="cardexpire">
					</p>

					<p>
						<button type="submit" title="Sign Up" class="button-link"
							alt="Submit Sign Up">Sign Up</button>
					</p>
				</form>

			</div>

		</div>
	</article>

	</main>
	<div class="clearfix"></div>
	<footer role="contentinfo">
		<div>
			<h2>Information</h2>
			<ul>
				<li><a href="#">About Us</a></li>
				<li><a href="#">Customer Service</a></li>
				<li><a href="#">Privacy Policy</a></li>
				<li><a href="#">Orders and Returns</a></li>
				<li><a href="#">Contact Us</a></li>
			</ul>
		</div>
		<div>
			<h2>Why buy from us</h2>
			<ul>
				<li><a href="#">Shipping & Returns</a></li>
				<li><a href="#">Secure Shopping</a></li>
				<li><a href="#">International Shipping</a></li>
				<li><a href="#">Affiliates</a></li>
				<li><a href="#">Group Sales</a></li>
			</ul>
		</div>
		<div>
			<h2>My account</h2>
			<ul>
				<li><a href="#">Sign In</a></li>
				<li><a href="#">View Cart</a></li>
				<li><a href="#">My Wishlist</a></li>
				<li><a href="#">Track My Order</a></li>
				<li><a href="#">Help</a></li>
			</ul>
		</div>
	</footer>

	<script>
		window.jQuery
				|| document
						.write(
								'<script src="<c:url value="/resources/js/vendor/jquery-1.10.2.min.js"/>"><\/script>')
	</script>
	<script src="<c:url value="/resources/js/plugins.js"/>"></script>
	<script src="<c:url value="/resources/js/main.js"/>"></script>

	<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
	<script>
		(function(b, o, i, l, e, r) {
							b.GoogleAnalyticsObject = l;
							b[l] || (b[l] = function() {
								(b[l].q = b[l].q || []).push(arguments)
							});
							b[l].l = +new Date;
							e = o.createElement(i);
							r = o.getElementsByTagName(i)[0];
							e.src = '//www.google-analytics.com/analytics.js';
							r.parentNode.insertBefore(e, r)
						}(window, document, 'script', 'ga'));
		ga('create', 'UA-XXXXX-X');
		ga('send', 'pageview');
	</script>
	<script src="<c:url value="/resources/js/vendor/jquery.js"/>"></script>
</body>
</html>
