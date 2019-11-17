$(function() {
   
    function eventHtml(event) {
      var checkedStatus = event.done ? "checked" : "";
      var liClass = event.done ? "completed" : "";
      var liElement = '<li id="listItem-' + event.id +'" class="' + liClass + '">' +
      '<div class="view"><input class="toggle" type="checkbox"' +
        " data-id='" + event.id + "'" +
        checkedStatus +
        '><label>' +
         event.title +
         '</label></div></li>';

      return liElement;
    }

    function toggleEvent(e) {
      var itemId = $(e.target).data("id");
      

      var doneValue = Boolean($(e.target).is(':checked'));
      

      $.post("/events/" + itemId, {
        _method: "PUT",
        event: {
          done: doneValue
        }
      }).success(function(data) {
      var liHtml = eventHtml(data);
      var $li = $("#listItem-" + data.id) 
      $li.replaceWith(liHtml);
       $('.toggle').change(toggleEvent);
       
      } );
    }

      $.get("/events").success( function( data ) {
        var htmlString = "";

         $.each(data, function(index,  event) {
          htmlString += eventHtml(event);
      });
        var ulEvents = $('.event-list');
        ulEvents.html(htmlString);

        $('.toggle').change(toggleEvent);

      
    });

      $('#new-form').submit(function(event) {
      event.preventDefault();
      var textbox = $('.new-event');
      var payload = {
        event: {
          title: textbox.val()
        }
      };
      $.post("/events", payload).success(function(data) {
        var htmlString = eventHtml(data);
        var ulEvents = $('.event-list');
        ulEvents.append(htmlString);
        $('.toggle').click(togglEvent);
        $('.new-todo').val('');
      });
    });

  });