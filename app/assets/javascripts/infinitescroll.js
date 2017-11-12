window.lastid = null;
$(document).on('turbolinks:load', function () {
    $(window).scroll(function() {   
        if($('.infinitescroll').length > 0){
            if($(window).scrollTop() + $(window).height() == $(document).height()) {
                if(window.lastid > 0){
                    $('.loading').css('visibility','visible')
                    console.log("visible");
                    console.log(window.lastid); 
                    $.ajax({
                        url: window.location.href,
                        type: 'GET',
                        dataType: 'html',
                        data: 'offset='+window.lastid,
                        success: function(code_html,statut){            
                            $('.loading').remove()  
                            console.log("remove");
                            $(".infinitescroll").append(code_html);  
                            $(".infinitescroll").find("nav").remove();
                        },
                    });
                }
            }
        }
    });
     $("body").on('click'," [data-do='like']",function (e) {
        e.preventDefault();
        var that = this;
        $.ajax({
            type:'POST',
            url:'/like',
            data: { 
                post_id: $(that).data('id')
            },
            success:function(data){
              if(data.klass == "active"){
                  $(that).addClass(data.klass);
              }
              else{
                  $(that).removeClass("active");
              }
              $('*[data-nbr="'+ data.post_id +'"]').text(data.number);
            }
        });
    })



});