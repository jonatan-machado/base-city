/*
VAZADO POR MAPREE DEV
VAZADO POR MAPREE DEV
VAZADO POR MAPREE DEV
VAZADO POR MAPREE DEV
VAZADO POR MAPREE DEV
VAZADO POR MAPREE DEV
VAZADO POR MAPREE DEV
*/
$(document).ready(function(){
  window.addEventListener('message', function( event ) {      
    if (event.data.action == true) {
      fuel = event.data.fuel; 
      datafuel = event.data.fuel
      money = event.data.money
      preco_por_litro = event.data.precolitro

      $('.model').attr('src',`https://www.wolkesoft.com/fcp/powerserver/allstar/vehicles/${event.data.vehicle}.png`/*`/html/images/${event.data.vehicle}.png*/)
      $(".money").text('R$ ' + event.data.money)
      $('.price').text(`R$ ${preco_por_litro}.00`/*preco_por_litro + '.00'*/)

      $('body').fadeIn();
      $('.modal').css('display','none');
      $('.allstar__porcentagem').text(Math.round(event.data.fuel) + '%');
      $('.completion').css("width", Math.round(event.data.fuel) + '%');
      $("#allstar__preco").val("")

      $(document).keyup(function(e) {
        if (!counting) {
          if (e.key === "Escape") {
            myStop();
            $("#allstar__preco").val("")
            counting;
            inv;
            price;
            perc_new;
            totalPercent;
            guardar;
            completar;
            maxFuel;
            $.post('http://nation_fuel/escape', JSON.stringify({}));
          }
        }
      });
    } else {
      $('body').fadeOut();  
    }
  });
  
  var counting;
  var completar;
  var guardar;   
  var price;
  var inv;
  var totalPercent;
  var perc_new; 
  var maxFuel;


  function myStart() {
      if (inv == undefined) { inv = setInterval(increase,1000); }
    }

  function myStop() {
    if (inv !== undefined) { clearInterval(inv); inv = undefined; }
  }

  function increase() {
    if (counting) {
      if (fuel < maxFuel) {
        fuel++;
        totalPercent = Math.round(fuel) + '%'
        $('.allstar__porcentagem').text(totalPercent);
        $('.completion').css("width", totalPercent);    
      } else {
        $.post('http://nation_fuel/removeanim', JSON.stringify({}));
        if (completar) {
          $.post('http://nation_fuel/pay', JSON.stringify({ new_perc: perc_new }));
          perc_new;
          completar = !completar;
        } else if (guardar) {
          $.post('http://nation_fuel/pay', JSON.stringify({ new_perc: price }));
          price;
          guardar = !guardar;
        }
        counting = !counting;
        inv;
        totalPercent;
        maxFuel;
        myStop();
        $.post('http://nation_fuel/escape', JSON.stringify({})); 
      } 
    }
  }

  $( ".allstar__completar" ).click(function() {
    if (!counting) {
      perc_new = 100 - Math.round(datafuel);
        if (money >= perc_new) {
        $.post('http://nation_fuel/checkpay', JSON.stringify({ new_perc: perc_new }));
        counting = !counting;
        completar = !completar;
        maxFuel = 99
        $('.modal span').text("Aceita abastecer o tanque com $"+perc_new);  
        $('.modal').fadeIn(300);
        $(".allstar__princi").fadeOut();
        $("body").delay(300).addClass("disable");
      } else {
        var texto = 'O dinheiro necessario para completar com <b>R$'+ perc_new +'</b> !'
        $.post('http://nation_fuel/notifytext', JSON.stringify({ text: texto }));
      }
    }
  });

  $( ".allstar__abastecer" ).click(function() {
    if (!counting) {
      price = Math.round($("#allstar__preco").val() * preco_por_litro); 
      if (price > 0 && price <= 100) {  
        if (price+Math.round(datafuel) <= 100) {
          if (money >= price) {
            $.post('http://nation_fuel/checkpay', JSON.stringify({ new_perc: price }));
            counting = !counting;
            guardar = !guardar;
            maxFuel = (price+Math.round(datafuel))-1
            $('.modal span').text("Deseja abastecer o tanque no valor de $ "+price); 
            $('.modal').fadeIn(300);
            $(".allstar__princi").fadeOut();
            $("body").delay(300).addClass("disable");
          } else {
            var texto = 'Sem dinheiro suficiente para abastecer <b>R$'+ price +'</b> !'
            $.post('http://nation_fuel/notifytext', JSON.stringify({ text: texto }));
          }
        } else {
              var texto = "O maximo de gasto para encher o tanque é <b>$"+(100-Math.round(datafuel))+"</b>!"
              $.post('http://nation_fuel/notifytext', JSON.stringify({ text: texto }));
            }
        } else {
          var texto = "Somente valores entre <b>$1</b> e <b>$100</b>, o valor atual é <b>$"+Math.round($("#amount").val())+"</b>!"
          $.post('http://nation_fuel/notifytext', JSON.stringify({ text: texto }));
      }
    }
  });

$(".accept").click(function() {
    if (counting) {
      $('.modal').fadeOut();
      $(".allstar__princi").fadeIn(300);
      $.post('http://nation_fuel/startanim', JSON.stringify({}));
      $("body").delay(300).removeClass("disable");
      myStop();
      myStart(); 
    }
})

  $(".recuse").click(function() {
    $('.modal').fadeOut();
  $(".allstar__princi").fadeIn(300);
  $("body").delay(300).removeClass("disable");
    if (completar) {
      counting = !counting;
      completar = !completar;
    } else if (guardar) {
      counting = !counting;
      guardar = !guardar;
    }
  })
});

function addToPanel(){
    let first = $("#allstar__preco")
    let value = first.val()
    let more = parseInt(value) + 1
    $(".allstar__preco").val('more')
}
/*
VAZADO POR MAPREE DEV
VAZADO POR MAPREE DEV
VAZADO POR MAPREE DEV
VAZADO POR MAPREE DEV
VAZADO POR MAPREE DEV
VAZADO POR MAPREE DEV
VAZADO POR MAPREE DEV
*/