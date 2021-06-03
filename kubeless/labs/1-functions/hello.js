module.exports = {
  handler: function (event, context) {
    console.log(event);

    const message = `Hello ${event.data || 'World'}`;

    return message;
  }
}
