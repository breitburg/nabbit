class Ticket {
  final String id, key;
  final bool verified;

  const Ticket(this.id, this.key, {this.verified = true});
}
