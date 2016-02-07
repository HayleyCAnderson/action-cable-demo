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

  componentDidMount() {
  }
});
