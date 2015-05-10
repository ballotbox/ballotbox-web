// TODO: Move to the "proper" directory
function getRandomColor() {
    var letters = '0123456789ABCDEF'.split('');
    var color = '#';
    for( var i = 0; i < 6; ++i ) {
        color += letters[ Math.floor( Math.random() * 16 ) ];
    }
    return color;
}

window.onload = function() {
    var labels = [], values = [], data = [], colors = [], highlights = [];

    for( var label in gon.choices ) {
        if( gon.choices.hasOwnProperty(label) ) {
            labels.push( label );
            values.push( gon.choices[label] );
        }
    }

    var num_choices = labels.length;
    for( var i = 0; i < num_choices; ++i ) {
        colors.push( getRandomColor() );
        highlights.push( getRandomColor() );
    }

    for( var i = 0; i < num_choices; ++i ) {
        data.push(
            {
                value: values[i],
                color: colors[i],
                highlight: highlights[i],
                label: labels[i],
            }
        );
    }

    var ctx = document.getElementById( "resultGraph" ).getContext( "2d" );
    var myNewChart = new Chart( ctx ).Pie( data, 
            { tooltipTemplate: 
                " <%=label%>: <%= numeral(value).format('(00)') %> - <%= numeral(circumference / (2 * Math.PI)).format('(0%)') %>" } );

    var total = 0;
    var first = values[0];
    for( var i = 0; i < values.length; ++i) {
        total += values[i];
    }
        
    var majority = false;
    var three_fifths = false;
    var two_thirds = false;

    
    if( total == 0 ) {
    }
    else {
        var portion = values[0] / total;
        if( portion > 1.0 / 2 ) {
            majority = true;
        }
        if( portion >= 3.0 / 5 ) {
            three_fifths = true;
        }
        if( portion >= 2.0 / 3 ) {
            two_thirds = true;
        }
    }

    if( majority ) {
        document.getElementById("stat_majority").className = "success";
    }
    if( three_fifths ) {
        document.getElementById("stat_three_fifths").className = "success";
    }
    if( two_thirds ) {
        document.getElementById("stat_two_thirds").className = "success";
    }
    
}
