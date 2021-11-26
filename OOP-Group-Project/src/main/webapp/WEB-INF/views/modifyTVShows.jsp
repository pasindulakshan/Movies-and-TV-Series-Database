<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.model.*"%>
<%@page import="com.servlet.*"%>
<%@page import="com.util.*"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%! @SuppressWarnings("unchecked") %>

<%TVShow tvshow = (TVShow) request.getAttribute("tvshow");%>

<!-- include header -->
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param value="Modify TV Show" name="title"/>
</jsp:include>
<!-- Include Sidebar -->
<jsp:include page="/WEB-INF/views/sidebar.jsp"></jsp:include>

<!-- main content -->
<main class="main">
	<div class="container-fluid">
		<div class="row">
			<!-- main title -->
			<div class="col-12">
				<div class="main__title">
					<h2>Modify TV Show</h2>
				</div>
			</div>
			<!-- end main title -->

			<!-- form -->
			<div class="col-12">
				<form action="ModifyTVShow" class="form" enctype="multipart/form-data" method="post">
					<div class="row">
						<div class="col-12 col-md-5 form__cover">
							<div class="row">
								<div class="col-12 col-sm-6 col-md-12">
									<div class="form__img">
										<label for="form__img-upload">Upload cover (270 x 400)</label>
										<input id="form__img-upload" name="form__img-upload" type="file" accept=".png, .jpg, .jpeg">
										<img id="form__img" src="image/tvshows/covers/<%out.print(tvshow.getCover()); %>" alt=" ">
									</div>
								</div>
							</div>
						</div>
						
						<input type="hidden" name="tid" value="<%out.print(request.getParameter("tid")); %>">

						<div class="col-12 col-md-7 form__content">
							<div class="row">
								<div class="col-12">
									<input type="text" name="title" class="form__input" placeholder="Title" value="<%out.print(tvshow.getTitle());%>" required>
								</div>

								<div class="col-12">
									<textarea id="text" name="description" class="form__textarea" placeholder="Description" required><%out.print(tvshow.getDescription());%></textarea>
								</div>

								<div class="col-12 col-lg-6">
									<input type="text" name="rdate" class="form__input" placeholder="Release date ex -2017-06-15" value="<%out.print(tvshow.getRdate());%>" required>
								</div>

								<div class="col-12 col-lg-6">
									<input type="text" name="runtime" class="form__input" placeholder="Running time" value="<%out.print(tvshow.getRuntime());%>" required>
								</div>

								<div class="col-12 col-lg-6">
									<select name="country" class="js-example-basic-multiple" id="country" required multiple>
										<!--<option selected disabled>Choose country</option>-->  
										<%out.println("<option selected value=\""+tvshow.getCountry()+"\">"+tvshow.getCountry()+"</option>"); %>
										<option value="Afghanistan">Afghanistan</option>
										<option value="Åland Islands">Åland Islands</option>
										<option value="Albania">Albania</option>
										<option value="Algeria">Algeria</option>
										<option value="American Samoa">American Samoa</option>
										<option value="Andorra">Andorra</option>
										<option value="Angola">Angola</option>
										<option value="Anguilla">Anguilla</option>
										<option value="Antarctica">Antarctica</option>
										<option value="Antigua and Barbuda">Antigua and Barbuda</option>
										<option value="Argentina">Argentina</option>
										<option value="Armenia">Armenia</option>
										<option value="Aruba">Aruba</option>
										<option value="Australia">Australia</option>
										<option value="Austria">Austria</option>
										<option value="Azerbaijan">Azerbaijan</option>
										<option value="Bahamas">Bahamas</option>
										<option value="Bahrain">Bahrain</option>
										<option value="Bangladesh">Bangladesh</option>
										<option value="Barbados">Barbados</option>
										<option value="Belarus">Belarus</option>
										<option value="Belgium">Belgium</option>
										<option value="Belize">Belize</option>
										<option value="Benin">Benin</option>
										<option value="Bermuda">Bermuda</option>
										<option value="Bhutan">Bhutan</option>
										<option value="Bolivia">Bolivia</option>
										<option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
										<option value="Botswana">Botswana</option>
										<option value="Bouvet Island">Bouvet Island</option>
										<option value="Brazil">Brazil</option>
										<option value="Brunei Darussalam">Brunei Darussalam</option>
										<option value="Bulgaria">Bulgaria</option>
										<option value="Burkina Faso">Burkina Faso</option>
										<option value="Burundi">Burundi</option>
										<option value="Cambodia">Cambodia</option>
										<option value="Cameroon">Cameroon</option>
										<option value="Canada">Canada</option>
										<option value="Cape Verde">Cape Verde</option>
										<option value="Cayman Islands">Cayman Islands</option>
										<option value="Central African Republic">Central African Republic</option>
										<option value="Chad">Chad</option>
										<option value="Chile">Chile</option>
										<option value="China">China</option>
										<option value="Colombia">Colombia</option>
										<option value="Comoros">Comoros</option>
										<option value="Congo">Congo</option>
										<option value="Congo">Congo</option>
										<option value="Cook Islands">Cook Islands</option>
										<option value="Costa Rica">Costa Rica</option>
										<option value="Cote D'ivoire">Cote D'ivoire</option>
										<option value="Croatia">Croatia</option>
										<option value="Cuba">Cuba</option>
										<option value="Cyprus">Cyprus</option>
										<option value="Czech Republic">Czech Republic</option>
										<option value="Denmark">Denmark</option>
										<option value="Djibouti">Djibouti</option>
										<option value="Dominica">Dominica</option>
										<option value="Dominican Republic">Dominican Republic</option>
										<option value="Ecuador">Ecuador</option>
										<option value="Egypt">Egypt</option>
										<option value="El Salvador">El Salvador</option>
										<option value="Equatorial Guinea">Equatorial Guinea</option>
										<option value="Eritrea">Eritrea</option>
										<option value="Estonia">Estonia</option>
										<option value="Ethiopia">Ethiopia</option>
										<option value="Faroe Islands">Faroe Islands</option>
										<option value="Fiji">Fiji</option>
										<option value="Finland">Finland</option>
										<option value="France">France</option>
										<option value="Gabon">Gabon</option>
										<option value="Gambia">Gambia</option>
										<option value="Georgia">Georgia</option>
										<option value="Germany">Germany</option>
										<option value="Ghana">Ghana</option>
										<option value="Gibraltar">Gibraltar</option>
										<option value="Greece">Greece</option>
										<option value="Greenland">Greenland</option>
										<option value="Grenada">Grenada</option>
										<option value="Guadeloupe">Guadeloupe</option>
										<option value="Guam">Guam</option>
										<option value="Guatemala">Guatemala</option>
										<option value="Guernsey">Guernsey</option>
										<option value="Guinea">Guinea</option>
										<option value="Guinea-bissau">Guinea-bissau</option>
										<option value="Guyana">Guyana</option>
										<option value="Haiti">Haiti</option>
										<option value="Honduras">Honduras</option>
										<option value="Hong Kong">Hong Kong</option>
										<option value="Hungary">Hungary</option>
										<option value="Iceland">Iceland</option>
										<option value="India">India</option>
										<option value="Indonesia">Indonesia</option>
										<option value="Iran">Iran</option>
										<option value="Iraq">Iraq</option>
										<option value="Ireland">Ireland</option>
										<option value="Isle of Man">Isle of Man</option>
										<option value="Israel">Israel</option>
										<option value="Italy">Italy</option>
										<option value="Jamaica">Jamaica</option>
										<option value="Japan">Japan</option>
										<option value="Jersey">Jersey</option>
										<option value="Jordan">Jordan</option>
										<option value="Kazakhstan">Kazakhstan</option>
										<option value="Kenya">Kenya</option>
										<option value="Kiribati">Kiribati</option>
										<option value="Korea">Korea</option>
										<option value="Kuwait">Kuwait</option>
										<option value="Kyrgyzstan">Kyrgyzstan</option>
										<option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
										<option value="Latvia">Latvia</option>
										<option value="Lebanon">Lebanon</option>
										<option value="Lesotho">Lesotho</option>
										<option value="Liberia">Liberia</option>
										<option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
										<option value="Liechtenstein">Liechtenstein</option>
										<option value="Lithuania">Lithuania</option>
										<option value="Luxembourg">Luxembourg</option>
										<option value="Macao">Macao</option>
										<option value="Macedonia">Macedonia</option>
										<option value="Madagascar">Madagascar</option>
										<option value="Malawi">Malawi</option>
										<option value="Malaysia">Malaysia</option>
										<option value="Maldives">Maldives</option>
										<option value="Mali">Mali</option>
										<option value="Malta">Malta</option>
										<option value="Marshall Islands">Marshall Islands</option>
										<option value="Martinique">Martinique</option>
										<option value="Mauritania">Mauritania</option>
										<option value="Mauritius">Mauritius</option>
										<option value="Mayotte">Mayotte</option>
										<option value="Mexico">Mexico</option>
										<option value="Moldova">Moldova</option>
										<option value="Monaco">Monaco</option>
										<option value="Mongolia">Mongolia</option>
										<option value="Montenegro">Montenegro</option>
										<option value="Montserrat">Montserrat</option>
										<option value="Morocco">Morocco</option>
										<option value="Mozambique">Mozambique</option>
										<option value="Myanmar">Myanmar</option>
										<option value="Namibia">Namibia</option>
										<option value="Nauru">Nauru</option>
										<option value="Nepal">Nepal</option>
										<option value="Netherlands">Netherlands</option>
										<option value="Netherlands Antilles">Netherlands Antilles</option>
										<option value="New Caledonia">New Caledonia</option>
										<option value="New Zealand">New Zealand</option>
										<option value="Nicaragua">Nicaragua</option>
										<option value="Niger">Niger</option>
										<option value="Nigeria">Nigeria</option>
										<option value="Niue">Niue</option>
										<option value="Norfolk Island">Norfolk Island</option>
										<option value="Northern Mariana Islands">Northern Mariana Islands</option>
										<option value="Norway">Norway</option>
										<option value="Oman">Oman</option>
										<option value="Pakistan">Pakistan</option>
										<option value="Palau">Palau</option>
										<option value="Panama">Panama</option>
										<option value="Papua New Guinea">Papua New Guinea</option>
										<option value="Paraguay">Paraguay</option>
										<option value="Peru">Peru</option>
										<option value="Philippines">Philippines</option>
										<option value="Pitcairn">Pitcairn</option>
										<option value="Poland">Poland</option>
										<option value="Portugal">Portugal</option>
										<option value="Puerto Rico">Puerto Rico</option>
										<option value="Qatar">Qatar</option>
										<option value="Reunion">Reunion</option>
										<option value="Romania">Romania</option>
										<option value="Russian Federation">Russian Federation</option>
										<option value="Rwanda">Rwanda</option>
										<option value="Samoa">Samoa</option>
										<option value="San Marino">San Marino</option>
										<option value="Sao Tome and Principe">Sao Tome and Principe</option>
										<option value="Saudi Arabia">Saudi Arabia</option>
										<option value="Senegal">Senegal</option>
										<option value="Serbia">Serbia</option>
										<option value="Seychelles">Seychelles</option>
										<option value="Sierra Leone">Sierra Leone</option>
										<option value="Singapore">Singapore</option>
										<option value="Slovakia">Slovakia</option>
										<option value="Slovenia">Slovenia</option>
										<option value="Solomon Islands">Solomon Islands</option>
										<option value="Somalia">Somalia</option>
										<option value="South Africa">South Africa</option>
										<option value="Spain">Spain</option>
										<option value="Sri Lanka">Sri Lanka</option>
										<option value="Sudan">Sudan</option>
										<option value="Suriname">Suriname</option>
										<option value="Swaziland">Swaziland</option>
										<option value="Sweden">Sweden</option>
										<option value="Switzerland">Switzerland</option>
										<option value="Syrian Arab Republic">Syrian Arab Republic</option>
										<option value="Taiwan">Taiwan</option>
										<option value="Tajikistan">Tajikistan</option>
										<option value="Tanzania">Tanzania</option>
										<option value="Thailand">Thailand</option>
										<option value="Timor-leste">Timor-leste</option>
										<option value="Togo">Togo</option>
										<option value="Tokelau">Tokelau</option>
										<option value="Tonga">Tonga</option>
										<option value="Trinidad and Tobago">Trinidad and Tobago</option>
										<option value="Tunisia">Tunisia</option>
										<option value="Turkey">Turkey</option>
										<option value="Turkmenistan">Turkmenistan</option>
										<option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
										<option value="Tuvalu">Tuvalu</option>
										<option value="Uganda">Uganda</option>
										<option value="Ukraine">Ukraine</option>
										<option value="United Arab Emirates">United Arab Emirates</option>
										<option value="United Kingdom">United Kingdom</option>
										<option value="United States">United States</option>
										<option value="Uruguay">Uruguay</option>
										<option value="Uzbekistan">Uzbekistan</option>
										<option value="Vanuatu">Vanuatu</option>
										<option value="Venezuela">Venezuela</option>
										<option value="Viet Nam">Viet Nam</option>
										<option value="Western Sahara">Western Sahara</option>
										<option value="Yemen">Yemen</option>
										<option value="Zambia">Zambia</option>
										<option value="Zimbabwe">Zimbabwe</option>
									</select>
								</div>

								<div class="col-12 col-lg-6">
									<select class="js-example-basic-multiple" id="genre" multiple name="genres" required>
										<%List<Genre> genres = (List<Genre>)request.getAttribute("genres");
											for(Genre g : genres){
												boolean check = false;
												for(Genre gen : tvshow.getGenres1()){
													if(g.getGid() == gen.getGid()){
														check = true;
													}
												}
												if(check){
													out.print("<option value="+g.getGid()+" selected>"+g.getName()+"</option>");
												}
												else {
													out.print("<option value="+g.getGid()+">"+g.getName()+"</option>");
												}
											}
										%>
									</select>
								</div>
								
								<div class="col-12 col-lg-6">
									<select class="js-example-basic-multiple" id="directors" multiple name="directors" required>
										<%List<Celebrity> directors = (List<Celebrity>)request.getAttribute("directors");
											for(Celebrity d : directors){
												boolean check = false;
												for(Celebrity celeb : tvshow.getDirectors1()){
													if(d.getCid() == celeb.getCid()){
														check = true;
													}
												}
												if(check){
													out.print("<option selected value="+d.getCid()+">"+d.getFname()+" "+d.getLname()+"</option>");
												}
												else {
													out.print("<option value="+d.getCid()+">"+d.getFname()+" "+d.getLname()+"</option>");
												}
											}
										%>
									</select>
								</div>
								
								<div class="col-12 col-lg-6">
									<select class="js-example-basic-multiple" id="writers" multiple name="writers" required>
										<%List<Celebrity> writers = (List<Celebrity>)request.getAttribute("writers");
											for(Celebrity w : writers){
												boolean check = false;
												for(Celebrity celeb : tvshow.getWriters1()){
													if(w.getCid() == celeb.getCid()){
														check = true;
													}
												}
												if(check){
													out.print("<option selected value="+w.getCid()+">"+w.getFname()+" "+w.getLname()+"</option>");
												}
												else {
													out.print("<option value="+w.getCid()+">"+w.getFname()+" "+w.getLname()+"</option>");
												}
											}
										%>
									</select>
								</div>
							</div>
						</div>
						
						<div class="col-12">
							<div class="form__gallery">
								<label id="gallery1" for="form__gallery-upload">Upload more photos</label>
								<input data-name="#gallery1" id="form__gallery-upload" name="gallery" class="form__gallery-upload" type="file" accept=".png, .jpg, .jpeg" multiple >
							</div>
						</div>
						<div class="col-12">
								<input name="trailer" type="text" class="form__input" placeholder="Trailer Link" required value="<%out.print(tvshow.getTrailer());%>">
						</div>
						
						<div class="col-12" id="addCastContainer">
							<div class="col-12">
								<span class="form__title">Add Cast</span>
							</div>
							<%
							int idcount = 0;
							for(Cast c : tvshow.getCasts()) {
								Celebrity celeb = c.getActor();
							%>
							<div class="row" >
								<div class="col-12 col-sm-6 col-md-4 col-xl-6">
									<select class="js-example-basic-multiple" id="actors<%out.print(idcount);%>" name="actors" required multiple>
										<%List<Celebrity> actors = (List<Celebrity>)request.getAttribute("actors");
											for(Celebrity a : actors){
												boolean check = false;
												if(a.getCid() == celeb.getCid()){
													out.print("<option selected value="+a.getCid()+">"+a.getFname()+" "+a.getLname()+"</option>");
												}
												else {
													out.print("<option value="+a.getCid()+">"+a.getFname()+" "+a.getLname()+"</option>");
												}
											}
										%>
									</select>
								</div>

								<div class="col-12 col-sm-6 col-md-4 col-xl-6">
									<input type="text" class="form__input" placeholder="Role" name="roles" required value="<%out.print(c.getRole());%>">
								</div>
							</div>
							<%
							idcount++;
							} %>
							
							
						</div>
						<div class="col-12">
							<div class="col-12 col-sm-4 col-md-3 col-xl-12">
								<button type="button" class="form__btn form__btn--add" onclick="addCast()">Add More Cast</button>
							</div>
						</div>
						
						<div class="col-12">
							<div class="row" >
								<!-- tv series -->
								<div class="col-12" id="addSeasonContainer">
											<!-- episode -->
											<div class="form__episode" id="addEpisodeContainer">
												<%List<Episode> episodes = tvshow.getEpisodes();
						  						  for (Episode e : episodes) {
												%>
												<div class="row">
													<div class="col-12">
														<span class="form__title">Episode</span>
													</div>
													
													<div class="col-12 col-md-2">
														<input type="text" class="form__input" placeholder="Season" name="snumber" required value="<%out.print(e.getSnumber());%>">
													</div>
													
													<div class="col-12 col-md-2">
														<input type="text" class="form__input" placeholder="Number" name="enumber" required value="<%out.print(e.getEnumber());%>">
													</div>

													<div class="col-12 col-md-5">
														<input type="text" class="form__input" placeholder="Episode title" name="etitle" required value="<%out.print(e.getEtitle());%>">
													</div>

													<div class="col-12 col-md-3">
														<input type="text" class="form__input" placeholder="Air date" name="eairdate" required value="<%out.print(e.getAirdate());%>">
													</div>
													
													<div class="col-12 col-md-12">
														<input type="text" class="form__input" placeholder="Downlload Link" name="edlink" required value="<%out.print(e.getTdlink());%>">
													</div>
												</div>
												<%} %>
											</div>
											<div class="col-12 col-sm-4 col-md-3 col-xl-12">
														<button type="button" class="form__btn form__btn--add" onclick="addEpisode(this)">add episode</button>
											</div>
								</div>
								
								
								<!-- end tv series -->
								

								<div class="col-12">
									<button type="submit" type="button" class="form__btn">Update</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- end form -->
		</div>
	</div>
</main>
<!-- end main content -->
<!-- Include Footer -->
<!-- Javascript fot add and delete elements -->

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<script type="text/javascript">
	var snumber = 2;
	var anumber = 3;
	
	<% 
	for(int i = 1; i < idcount; i++){
		out.print("$('#actors"+i+"').select2({placeholder: \"Choose Actor\"});");
	}
	%>
	
	var options = '<%List<Celebrity> actors = (List<Celebrity>)request.getAttribute("actors");for(Celebrity a : actors){out.print("<option value="+a.getCid()+">"+a.getFname()+" "+a.getLname()+"</option>");}%>'
	function addEpisode(button) {
		var html = '<div class="row"><div class="col-12"><span class="form__title">Episode</span><button class="form__delete" type="button" onclick="deleteEpisode(this)"><i class="icon ion-ios-close"></i></button></div><div class="col-12 col-md-2"><input type="text" class="form__input" placeholder="Season" name="snumber" required></div><div class="col-12 col-md-2"><input type="text" class="form__input" placeholder="Number" name="enumber" required></div><div class="col-12 col-md-5"><input type="text" class="form__input" placeholder="Episode title" name="etitle" required></div><div class="col-12 col-md-3"><input type="text" class="form__input" placeholder="Air date" name="eairdate" required></div><div class="col-12 col-sm-8 col-md-9 col-xl-12"><input type="text" class="form__input" placeholder="Downlload Link" name="edlink" required></div></div>'
			
		document.getElementById("addEpisodeContainer").insertAdjacentHTML("beforeend", html);
	}
	function deleteSeason(button) {
		var parent = button.parentNode;
		var grand_father = parent.parentNode.parentNode.parentNode.parentNode.parentNode;
		grand_father.removeChild(parent.parentNode.parentNode.parentNode.parentNode);
		snumber--;
	}
	function deleteEpisode(button) {
		var parent = button.parentNode;
		var grand_father = parent.parentNode.parentNode;
		grand_father.removeChild(parent.parentNode);
	}
	function addCast() {
		var html = '<div class="row" ><div class="col-12 col-sm-6 col-md-4 col-xl-6"><select class="js-example-basic-multiple" id="actors'+anumber+'" name="actors" required multiple>'+options+'</select></div><div class="col-12 col-sm-6 col-md-4 col-xl-6"><input type="text" class="form__input" placeholder="Role" name="roles" required></div></div>'
		document.getElementById("addCastContainer").insertAdjacentHTML("beforeend", html);
		var id = '#actors'+anumber;
		$(id).select2({
			placeholder: "Choose Actor"
		});
		anumber++
	}
</script>