[#ftl]
[#--<#import "/spring.ftl" as spring/>--]
[#--<@spring.bind "manufacturer"/>--]

<html lang="en">
<title>Search Page</title>
<head>
[#include '/macro/bootstrap_header.ftl']
[#include '/macro/header.ftl']
</head>
<body onload="autoEnable();brandChanged();onLoad();">
[#include '/macro/nav_index_bar.ftl']

	<div class="container">
        <div class="row">
        </div>
		<form id="forSearch" action="/search">
			<div class="row">
				<div class="col-lg-6">
						<div class="row" id="searchText" align="left">
							<div class="col-lg-12">Search</div>
						</div>
						<hr>
						<div class="row">
							<div class="form-group col-lg-6">
                                <label>Manufacturer</label>
                                <select name="manufacturer" id="manufacturer" onchange="autoEnable();brandChanged();" class="form-control">
                                    <optgroup label="Manufacturer">
                                        <option value="All" [#if searchModel.type?? && searchModel.type == 'All']selected[/#if] >All</option>
                                       	[#list map?keys as manufacturer]
                                       	    <option value="${manufacturer}" [#if searchModel.manufacturer == manufacturer]selected[/#if]>${manufacturer}</option>
                                       	[/#list]
                                    </optgroup>
                                </select>
						 	</div>

						  	<div class="form-group col-lg-6">
						  		<label>Type</label>
							    <select name="type" id="type"  class="form-control">
								  <optgroup label="Type">
									  <option value="All" [#if searchModel.type?? && searchModel.type == 'All']selected[/#if] >All</option>

								  </optgroup>
								</select>
						  	</div>
						</div>
						<div class="row">
							<div class="form-group col-lg-6">
							    <label for="price">Price up to</label>
							    <input type="text" class="form-control" name="price" id="price" value="[#if searchModel.price != 0]${searchModel.price?string["0000"]}[/#if]" placeholder="ex: 2000">
						 	</div>
						  	<div class="form-group col-lg-6">
							    <label for="fabricationYear">First Registration</label>
							    <input type="text" class="form-control" name="fabricationYear" value="[#if searchModel.fabricationYear != 0]${searchModel.fabricationYear?string["0000"]}[/#if]" placeholder="ex: 2005">
						  	</div>
						</div>
						<div class="row">
							<div class="form-group col-lg-6">
                            <label for="mileAge">Mileage up to</label>
                            <input type="text" class="form-control"
                                   type="number" step="any" name="mileAge" value="[#if searchModel.mileAge != 0]${searchModel.mileAge?string["0000"]}[/#if]" placeholder="ex: 2000">
                        </div>
						  	<div class="form-group col-lg-6">
						  		<div class="row">
						  			<div class="col-lg-12">
						  				<label for="transmissionType">Transmission type</label>
						  			</div>
						  		</div>
						  		<div class="row">
						  			<div class="col-lg-6">
						  				<div class="checkbox">
											<label><input type="checkbox" name="transmissionType" [#if searchModel.transmissionType?seq_contains('MANUAL') ]checked[/#if] value="MANUAL">Manual</label>
										</div>
						  			</div>
						  			<div class="col-lg-6">
						  				<div class="checkbox">
											<label><input type="checkbox" name="transmissionType" [#if searchModel.transmissionType?seq_contains('AUTOMATIC') ]checked[/#if] value="AUTOMATIC">Automatic</label>
										</div>
						  			</div>
						  		</div>
						  	</div>
						</div>
						<div class="row">
							<div class="form-group col-lg-6">
								<label>Color</label>
								<br>
								<select  name="colour" class="form-control">
								  <optgroup label="Color">
                                      <option value="All" [#if searchModel.colour?? && searchModel.colour == 'All']selected[/#if] >All</option>
								    [#list colours as colour]
								        <option value="${colour}" [#if searchModel.colour?? && searchModel.colour == colour]selected[/#if] >${colour}</option>
								    [/#list]
								  </optgroup>
								</select>
						 	</div>
						  	<div class="form-group col-lg-6">
						  		<div class="row">
						  			<div class="col-lg-12">
						  				<label>Engine type</label>
						  			</div>
						  		</div>
						  		<div class="row">
						  			<div class="col-lg-3">
						  				<div class="checkbox">
											<label><input type="checkbox" name="engineType" [#if searchModel.engineType?seq_contains('PETROL')]checked[/#if] value="PETROL">petrol</label>
										</div>
						  			</div>
						  			<div class="col-lg-3">
						  				<div class="checkbox">
											<label><input type="checkbox" name="engineType" [#if searchModel.engineType?seq_contains('DIESEL')]checked[/#if] value="DIESEL">diesel</label>
										</div>
						  			</div>
                                    <div class="col-lg-3">
                                        <div class="checkbox">
                                            <label><input type="checkbox" name="engineType" [#if searchModel.engineType?seq_contains('ELECTRIC')]checked[/#if] value="ELECTRIC">electric</label>
                                        </div>
                                    </div>
						  			<div class="col-lg-3">
						  				<div class="checkbox">
											<label><input type="checkbox" name="engineType" [#if searchModel.engineType?seq_contains('HYBRID')]checked[/#if] value="HYBRID">hybrid</label>
										</div>
						  			</div>
						  		</div>
						  	</div>
						</div>
						<div class="row">
                            <div class="form-group col-lg-6">

								<div class="row">
                                    <div class="col-lg-12">
                                        <label>Matriculation status</label>
                                    </div>
                                    <div class="col-lg-5">
                                        <div class="checkbox">
                                            <label><input type="checkbox" name="matriculationStatus" [#if searchModel.matriculationStatus?seq_contains(true)]checked[/#if] value="true">Matriculated</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <div class="checkbox">
                                            <label><input type="checkbox" name="matriculationStatus" [#if searchModel.matriculationStatus?seq_contains(false)]checked[/#if] value="false">Not matriculated</label>
                                        </div>
                                    </div>
								</div>
							</div>
							<div class="form-group col-lg-6">
								<div class="row">
									<div class="col-lg-3">
                                        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> Search</button>
									</div>
								</div>
							</div>
						</div>
				</div>


				<div class="col-lg-6">
					<div class="row">
                        <div class="col-lg-12">
                            <div class="thumbnail">
                                <img src="https://ocmsites.org/news/wp-content/uploads/sites/15/2015/10/parking.jpg">
                            </div>
						</div>
						<div class="col-lg-12">
							[#if errors??]
								[#list errors as error]
									<ul class="list-group">
										<li class="list-group-item list-group-item-danger">${error}</li>
									</ul>
								[/#list]
							[/#if]
						</div>
					</div>

				</div>
			</div>
		</form>

		<hr>

		<div class="row">
			<div class="col-lg-12">
                <h4>Search results: </h4>
			</div>
		</div>
        <br>
		[#if results?size == 0]
		    <div class="row">
				<div class="col-lg-12">
                    <h3>0 cars found</h3>
				</div>
			</div>[#else]

			[#list results as car]
				<div class="row">
					<div class="col-lg-3">
						<div class="thumbnail">
							[#if car.imgUrl??]<img src="/ext-img/${car.imgUrl}"/>[/#if]
							[#--<h3>Aici vine imageinea: "{car.imgUrl}"</h3>--]
							[#--<img src="http://cdn.bmwblog.com/wp-content/uploads/BMW-M3-GTS-Garching-03.jpg">--]
						</div>
					</div>
					<div class="col-lg-7">
						<div class="row">
							<div class="col-lg-12 car-header">
								${car.manufacturer} ${car.type}
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								Fabrication Year: ${car.fabricationYear?string["0000"]}
							</div>
							<div class="col-lg-6">
								Mileage: ${car.mileAge}
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								Engine type: ${car.engineType}
							</div>
							<div class="col-lg-6">
								Transmission Type: ${car.transmissionType}
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								Color: ${car.colour}
							</div>
							<div class="col-lg-6">
								Matriculation status: Matriculated
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<strong>Description</strong>
								<p>"${car.extras}"</p>
							</div>
						</div>
					</div>
					<div class="col-lg-2">
						<div class="row">
							<div class="col-lg-12 right-align car-header">
								Price: ${car.price}
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-lg-12 right-align">
								<a class="btn btn-default" href="/account/list/car?id=${car.id?c}" role="button"><i class="fa fa-eye" aria-hidden="true"></i> View Car</a>
							</div>
						</div>
					</div>
				</div>
				<hr>
			[/#list]
		[/#if]


	</div>

    <script>
		[#assign car_manufacuters = map?keys]
        var DATA = {
		[#list car_manufacuters as car_manufacturer]
            '${car_manufacturer}' : [ [#list map[car_manufacturer] as type]'${type}',[/#list] ],
		[/#list]
        };

        function brandChanged() {
            var manufacturers = document.getElementById('manufacturer');
            var brand = manufacturers.options[manufacturers.selectedIndex].value;
            var models = DATA[brand];
            var modelSelect = document.getElementById('type');
            modelSelect.style.display = 'block';
            modelSelect.innerHTML = '';

            var model = 'All';
            var opt = document.createElement('option');
            opt.value = model;
            opt.innerHTML = model;
            modelSelect.appendChild(opt);

            for (var i = 0; i < models.length; i++) {
                var model = models[i];
                var opt = document.createElement('option');
                opt.value = model;
                opt.innerHTML = model;
                modelSelect.appendChild(opt);
            }

        }
        function onLoad() {
            var manufacturer = document.getElementById('manufacturer').value;
            if(manufacturer != "All") {
                document.getElementById('type').value = "${searchModel.type}";
            }
        }
    </script>
	<script src="/js/search.js"></script>
<!-- <script type="text/javascript" src="index.js"></script> -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script> -->

</body>