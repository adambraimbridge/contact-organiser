<!DOCTYPE html>
<html>
  	{{> _head }}
	<body>
		{{> _header }}
		<div id='content' class="o-grid-container">

			<form id="filter" action="/" method="get">
				<div class="o-forms-group">
					<fieldset>
						<legend class="o-forms__label" for="filter">Contact Filtering (enter one or more fields)</legend>
						<div class="o-grid-container">
							<div class="o-grid-row">
								<div data-o-grid-colspan="3">
									<label class="o-forms__label" for="dataItemID">ID</label>
									<small class="o-forms__additional-info">Wildcards (* and ?) can be used.</small>
									<input name="dataItemID" value="{{dataItemID}}" class="o-forms__text" id="dataItemID"></input>
								</div>
								<div data-o-grid-colspan="3">
									<label class="o-forms__label" for="name">Name</label>
									<small class="o-forms__additional-info">Wildcards (* and ?) can be used.</small>
									<input name="name" value="{{name}}" class="o-forms__text" id="name"></input>
								</div>
								<div data-o-grid-colspan="3">
									<label class="o-forms__label" for="slack">Slack Channel</label>
									<small class="o-forms__additional-info">Wildcards (* and ?) can be used.</small>
									<input name="slack" value="{{slack}}" class="o-forms__text" id="slack"></input>
								</div>
								<div data-o-grid-colspan="3">
									<label class="o-forms__label" for="email">Email</label>
									<small class="o-forms__additional-info">Wildcards (* and ?) can be used.</small>
									<input name="email" value="{{email}}" class="o-forms__text" id="email"></input>
								</div>
							</div>
							<div class="o-grid-row">
								<div data-o-grid-colspan="3">
									<label class="o-forms__label" for="phone">Phone</label>
									<small class="o-forms__additional-info">Wildcards (* and ?) can be used.</small>
									<input name="phone" value="{{phone}}" class="o-forms__text" id="phone"></input>
								</div>
								<div data-o-grid-colspan="3">
									<label class="o-forms__label" for="programme">Programme</label>
									<small class="o-forms__additional-info">Wildcards (* and ?) can be used.</small>
									<input name="programme" value="{{programme}}" class="o-forms__text" id="programme"></input>
								</div>
								<div data-o-grid-colspan="3">
									<label class="o-forms__label" for="contactType">Contact Type</label>
									<small class="o-forms__additional-info">Wildcards (* and ?) can be used.</small>
									<input name="contactType" value="{{contactType}}" class="o-forms__text" id="contactType"></input>
								</div>
								<div data-o-grid-colspan="3">
									<label class="o-forms__label" for="contactPref">Contact Pref</label>
									<small class="o-forms__additional-info">Wildcards (* and ?) can be used.</small>
									<input name="contactPref" value="{{contactPref}}" class="o-forms__text" id="contactPref"></input>
								</div>
							</div>
							<div class="o-grid-row">
								<div data-o-grid-colspan="3">
									<input type='submit' class="o-buttons o-buttons--standout " value='Filter' />
									<a class="o-buttons o-buttons--standout" href="/">Clear</a>
								</div>
							</div>
						</div>
					</fieldset>
				</div>
			</form>

			<p/>

			<div class="o-grid-container">
				<div class="o-grid-row">
					<div data-o-grid-colspan="3">
						<h2>Existing Contacts ({{contacts.length}})</h2>
					</div>
					<div data-o-grid-colspan="4">
						<div class="o-buttons__pagination">
						{{#pages}}
							{{#faux}}...{{/faux}}
							{{^faux}}
								<a class="o-buttons" aria-selected="{{selected}}" href="?dataItemID={{dataItemID}}&amp;name={{name}}&amp;slack={{slack}}&amp;email={{email}}&amp;phone={{phone}}&amp;programme={{programme}}&amp;contactType={{contactType}}&amp;contactPref={{contactPref}}&amp;page={{number}}">{{number}}</a>
							{{/faux}}
						{{/pages}}
						</div>
					</div>
					<div data-o-grid-colspan="2">
						<form id="switch" action="/" method="get">
							<input type="hidden" name="dataItemID" value="{{dataItemID}}" />
							<input type="hidden" name="name" value="{{name}}" />
							<input type="hidden" name="slack" value="{{slack}}" />
							<input type="hidden" name="email" value="{{email}}" />
							<input type="hidden" name="phone" value="{{phone}}" />
							<input type="hidden" name="programme" value="{{programme}}" />
							<input type="hidden" name="contactType" value="{{contectType}}" />
							<input type="hidden" name="contactPref" value="{{contactPref}}" />
							{{#indextable}}
							<input type="hidden" name="index" value="tiles" />
							<input type='submit' class="o-buttons o-buttons--standout o-buttons--big" value='Show Tiles' />
							{{/indextable}}
							{{#indextiles}}
							<input type="hidden" name="index" value="table" />
							<input type='submit' class="o-buttons o-buttons--standout o-buttons--big" value='Show Table' />
							{{/indextiles}}
						</form>
					</div>
					<div data-o-grid-colspan="3">
						<form id="new" action="/new" method="get">
							<input type='submit' class="o-buttons o-buttons--standout o-buttons--big" value='Add New Contact' />
						</form>
					</div>
				</div>
			</div>

			{{#indextable}}
			<div id="contactindex">
				<div class="o-grid-row">
					<div data-o-grid-colspan="12">
						<table class="o-table o-table--row-stripes" data-o-component="o-table">
							<thead>
								{{#contacts.length}}
								<th>ID</th>
								<th>Name</th>
								<th>Slack</th>
								<th>Email</th>
								<th>Phone</th>
								<th>Contact Preference</th>
								<th>Programme</th>
								{{/contacts.length}}
							</thead>
							<tbody>
								{{#contacts}}
									<tr>
										<td class='truncateID'><a href="{{localpath}}">{{id}}</a></td>
										<td class='truncateName'>{{name}}</td>
										<td>{{slack}}</td>
										<td>{{email}}</td>
										<td>{{phone}}</td>
										<td class='truncatePref'>{{contactPref}}</td>
										<td>{{programme}}</td>
									</tr>
								{{/contacts}}
								{{^contacts}}
									<div id='emptylist'>Sorry, no records are available. Please adjust your filter</div>
								{{/contacts}}
							</tbody>
						</table>
					</div>
				</div>
			</div>
			{{/indextable}}

			{{#indextiles}}
			<div class="o-grid-row">
				<div data-o-grid-colspan="12">
				{{#contacts}}
					<div class='contact'>
						<img class='avatar' src="{{avatar}}" />
						<span class='details'>
							<h3><a href="/contacts/{{id}}">{{name}}</a></h3>
							id:{{id}}
							{{#slack}}<span class='contactfield'>Slack: <a href="https://financialtimes.slack.com/messages/{{slack}}" target="__blank">#{{slack}}</a></span>{{/slack}}
							{{#email}}<span class='contactfield'>Email: <a href="mailto:{{email}}">{{email}}</a></span>{{/email}}
							{{#phone}}<span class='contactfield'>Phone Number: <a href="tel:{{phone}}">{{phone}}</a></span>{{/phone}}
							{{#supportRota}}<form action="{{supportRota}}" target="_blank"><button class="o-buttons o-buttons--standout o-buttons--small">View Support Rota</button></form>{{/supportRota}}
							{{#contactPref}}<span class='contactfield'>Preferred contact method: {{contactPref}}</span>{{/contactPref}}
							{{#programme}}<span class='contactfield'>Programme: {{programme}}</span>{{/programme}}
						</span>

						<form action="/contacts/{{id}}"><input type='submit' class="o-buttons edit-button" value='Edit' /></form>
					</div>
				{{/contacts}}
				{{^contacts}}
					<div id='emptylist'>Sorry, no records are available. Please adjust your filter</div>
				{{/contacts}}
				</div>
			</div>
			{{/indextiles}}

		</div>
		<script src="https://build.origami.ft.com/v2/bundles/js?modules=o-header-services@^1.0.0,o-buttons@^4.0.0,o-forms@^2.0.3,o-grid@^4.2.1"></script>
	</body>
</html>
