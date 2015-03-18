window.ballotbox =
  renumber_rails_form: (selector) ->
    $(selector).each (i) ->
      this.name = this.name.replace(/\[\d+\]/, "[#{i}]")
      this.id = this.id.replace(/_\d+_/, "_#{i}_")