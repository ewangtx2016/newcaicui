//¼¯ÍÅÕ¾Í·²¿µ¼º½
$(function(){

    // 导航滑动处理

   //  var $navA=$(".nav ul>li>a ");
   //  var _index=0;

   //  $navA.each(function(){
   //     if($(this).hasClass("one")){
   //      num=$(this).index();
   //     }
   //  });

   //  $navA.mouseenter(function(){
   //      $navA.removeClass("one");
   //      $(this).addClass("one");
   //  });
   //  $navA.mouseleave(function(){
   //           $navA.removeClass("one");
   //         $navA.eq(num).addClass("one");   
   //  });
    
   //   $navA.parent().find("ol").mouseenter(function(){

   //          $navA.removeClass("one");
   //      $(this).parent().find(".nav_box").addClass("one");
   //  });
      
   // $navA.parent().find("ol").mouseleave(function(){
        
   //          $navA.removeClass("one");
   //      $navA.eq(_index).addClass("one");
   //  });









   var $navA=$(".nav ul>li>a ");
    var _index=0;

    $navA.each(function(){
       if($(this).hasClass("one")){
        num=$(this).index();
       }
    });

    $navA.mouseenter(function(){
       // $navA.removeClass("one");
        //$(this).addClass("one");
    });
    $navA.mouseleave(function(){
            // $navA.removeClass("one");
           //$navA.eq(num).addClass("one");   
    });
    
     $navA.parent().find("ol").mouseenter(function(){

           // $navA.removeClass("one");
        // $(this).parent().find(":first-child").addClass("one");
       // $(this).siblings("a").addClass("one");
    });
      
   $navA.parent().find("ol").mouseleave(function(){
        
           // $navA.removeClass("one");
        //$navA.eq(_index).addClass("one");
    });




$(document).on("mousewheel DOMMouseScroll", function (e) {
        var delta = (e.originalEvent.wheelDelta && (e.originalEvent.wheelDelta > 0 ? 1 : -1)) ||  // chrome & ie
            (e.originalEvent.detail && (e.originalEvent.detail > 0 ? -1 : 1));              // firefox
        if (delta > 0) {
            // 向上滚
            $('.jtin_top').slideDown(500);
        } else if (delta < 0) {
            // 向下滚
            $('.jtin_top').slideUp(500);
        }
 });

   
    



});