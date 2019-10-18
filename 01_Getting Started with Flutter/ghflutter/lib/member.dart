class Member {
  final String login;

  Member(this.login) {
    if (login == null) {
       throw ArgumentError("login of Member cannot be null. "
          "Received: '$login'");
    }
  }
}