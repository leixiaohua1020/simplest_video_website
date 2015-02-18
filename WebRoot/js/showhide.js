$(document).ready(function(){

	// IE6 background image flicker fix
	try {
		document.execCommand("BackgroundImageCache", false, true);
	} catch(e) {}

	$('li.headlink').hover(
				function() { $('ul', this).css('display', 'block'); },
				function() { $('ul', this).css('display', 'none'); });		
		
	$(function() {
		$("#tabs").tabs();
	});
	
	var	prev = null;
	
	$('.showhide').bind('click', null,function(event) {
		var	next = $(event.target).next();		
		next.toggle();				
		
		if (next.is(':visible') )
		{					
			$(event.target).removeClass('showhide');
			$(event.target).addClass('showhideopen');						
		}else
		{			
			$(event.target).removeClass('showhideopen');
			$(event.target).addClass('showhide');
			
		}
		
		
		return false;
	});
	
	var elements = $('.showhide');
	for( var i = 0; i < elements.length; i++ )
	{			
		ele = $(elements[i]);
		ele.next().hide();
	}

});