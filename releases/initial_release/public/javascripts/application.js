	function lock(checkbox) {
		if(checkbox.is(':checked')){
			$('#private_label').css('background-image', 'url("/images/lock.png")');	
		} else {
			$('#private_label').css('background-image', 'url("/images/unlock.png")');	
		}  
	}
	
	$(document).ready(function(){
		lock($('.private'));
		
		$('.private').click(function(event){
			lock($(event.target));
		});
		
		$('#create').live({
			mousedown: function(event){
				$(event.target).addClass('pressed');
			},
			mouseup: function(event){
				$(event.target).removeClass('pressed');
			}
		});
		
		if($('.edit_page').length != 0) {
			$('.edit_page').click(function(){
				$('#password_form').toggle();
			});
		}
	});
