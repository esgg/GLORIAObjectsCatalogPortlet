<%
/**
 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />

 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
 <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
 <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<style>
  #accordion-resizer {
    padding: 10px;
    width: 350px;
    height: 220px;
  }
  
  #feedback { font-size: 1.4em; }
  #selectable .ui-selecting { background: #FECA40; }
  #selectable .ui-selected { background: #F39814; color: white; }
  #selectable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
  #selectable li { margin: 3px; padding: 0.4em; font-size: 1.4em; height: 18px; }
  
  #selectablePlanet .ui-selecting { background: #FECA40; }
  #selectablePlanet .ui-selected { background: #F39814; color: white; }
  #selectablePlanet { list-style-type: none; margin: 0; padding: 0; width: 60%; }
  #selectablePlanet li { margin: 3px; padding: 0.4em; font-size: 1.4em; height: 18px; }
  
  </style>
  <script>
  $(function() {
    $( "#accordion" ).accordion({
      heightStyle: "fill"
    });
  });
  $(function() {
    $( "#accordion-resizer" ).resizable({
      minHeight: 140,
      minWidth: 200,
      resize: function() {
        $( "#accordion" ).accordion( "refresh" );
      }
    });
  });
  $(function() {
	    $( "#selectable" ).selectable({
	      stop: function() {
	        var result = $( "#select-result" ).empty();
	        $( ".ui-selected", this ).each(function() {
	          var index = $( "#selectable li" ).index( this );
	          result.append( " #" + ( index + 1 ) );
	        });
	      }
	    });
	  });
  $(function() {
	    $( "#selectablePlanet" ).selectable({
	      stop: function() {
	        $( ".ui-selected", this ).each(function() {
	          var index = $( "#selectablePlanet li" ).index( this );
	          alert("Planeta elegido"+index+" "+$( "#selectablePlanet li" ).id);
	        });
	      }
	    });
	  });
  </script>

<div id="accordion-resizer" class="ui-widget-content">
	<div id="accordion">
		<h3>Galaxias</h3>
		<div>
			<p id="feedback">
				<span>You've selected:</span> <span id="select-result">none</span>.
			</p>
 
			<ol id="selectable">
  				<li class="ui-widget-content">Andrómeda</li>
			</ol>
		</div>
		<h3>Planetas</h3>
		<div>
			<ol id="selectablePlanet">
  				<li class="ui-widget-content" id="mercury">Mercurio</li>
  				<li class="ui-widget-content">Venus</li>
  				<li class="ui-widget-content">Marte</li>
  				<li class="ui-widget-content">Jupiter</li>
  				<li class="ui-widget-content">Saturno</li>
			</ol>
		</div>
		<h3>Cúmulos</h3>
		<div>
			<div>
			</div>
		</div>
		
	</div>
</div>