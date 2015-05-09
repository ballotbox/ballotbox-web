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

    for( var key in gon.choices ) {
        console.log(key + ": " + gon.choices[key]);
    }

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
}
