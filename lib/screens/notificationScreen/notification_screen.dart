import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum NotificationType { cancelado, aleracao, novosServicos, pagamento }

class Notification {
  final NotificationType type;
  final String title;
  final String description;
  final DateTime time;

  Notification({
    required this.type,
    required this.title,
    required this.description,
    required this.time,
  });
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List<Notification> notifications = [
      Notification(
        type: NotificationType.cancelado,
        title: 'Agendamento cancelado!',
        description:
            'Você cancelou com sucesso sua consulta com o Dr. Alan Watson em 24 de dezembro de 2024, às 13h. 80% dos fundos serão devolvidos à sua conta.Cronograma alterado.',
        time: DateTime.now(),
      ),
      Notification(
        type: NotificationType.aleracao,
        title: 'Cronograma alterado',
        description:
            'Você alterou com sucesso o agendamento de uma consulta com o Dr. Alan Watson em 24 de dezembro de 2024, às 13h. Não se esqueça de ativar seu lembrete.',
        // um dia antes
        time: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Notification(
        type: NotificationType.novosServicos,
        title: 'Novos serviços disponíveis!',
        description:
            'Agora você pode marcar várias consultas de doutorado de uma só vez. Você também pode cancelar seu compromisso.',
        // um dia depois
        time: DateTime.now().add(const Duration(days: 2)),
      ),
      Notification(
        type: NotificationType.pagamento,
        title: 'Cartão de crédito conectado!',
        description:
            'Seu cartão de crédito foi vinculado com sucesso ao Medica. Aproveite nosso serviço.',
        // um dia depois
        time: DateTime.now().add(const Duration(days: 3)),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Column(
            children: [
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: notification.type == NotificationType.cancelado
                        ? Colors.red
                        : notification.type == NotificationType.aleracao
                            ? Colors.orange
                            : notification.type ==
                                    NotificationType.novosServicos
                                ? Colors.green
                                : Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    notification.type == NotificationType.cancelado
                        ? Icons.cancel
                        : notification.type == NotificationType.aleracao
                            ? Icons.alarm
                            : notification.type ==
                                    NotificationType.novosServicos
                                ? Icons.add
                                : Icons.payment,
                    color: Colors.white,
                  ),
                ),
                title: Text(notification.title),
                subtitle: Text(
                  notification.time.day == DateTime.now().day
                      ? 'Hoje ${DateFormat('HH:mm').format(notification.time)}'
                      : notification.time.day == DateTime.now().day - 1
                          ? 'Ontem ${DateFormat('HH:mm').format(notification.time)}'
                          : DateFormat('dd/MM/yyyy').format(notification.time),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  size.width * 0.05,
                  size.width * 0.02,
                  size.width * 0.05,
                  size.width * 0.05,
                ),
                child: Text(
                  notification.description,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
