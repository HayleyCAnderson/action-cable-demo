var Results = React.createClass({
  getInitialState() {
    var answers = this.props.answers;
    answers.forEach(function(answer) { answer.count = 0; });
    return {total: 0, answers: answers};
  },

  render() {
    var results = []
    var total = parseInt(this.state.total);
    this.state.answers.forEach(function(answer) {
      var position = (100 - ((parseInt(answer.count) / total) * 100)).toString() + '%';
      results.push(
        <div key={ answer.number }>
          <div className='chart' style={{right: position}}></div>
          <p className='label'>{ answer.text }: <strong>{ answer.count }</strong> votes</p>
        </div>
      )
    });

    return <div className='results'>{ results }</div>;
  },

  updateResults(data) {
    var updateState = function(state) {
      numbers = $.map(state.answers, function(a) { return a.number; })
      index = numbers.indexOf(data['vote']);
      if (index > -1) {
        state.answers[index]['count'] += 1;
        state.total += 1;
      }
    };

    this.setState(updateState);
  },

  componentDidMount() {
    var survey_id = this.props.survey_id;
    var updateResults = this.updateResults;

    App.output = App.cable.subscriptions.create('SurveyChannel', {
      connected() {
        var self = this;
        setTimeout(function() { self.perform('subscribe', {id: survey_id}) }, 1000);
      },

      received(data) {
        updateResults(data);
      }
    });
  }
});
