//esta classe representará os dados da transação
class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;

  //definindo o construtor com atributos nomeados
  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });
}
