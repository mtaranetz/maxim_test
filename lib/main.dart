import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Основной виджет приложения
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // MaterialApp - корневой виджет
      home: MyHomePage(), // MyHomePage - главный экран приложения
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // MaterialApp - базовый виджет для Material Design приложений
    return MaterialApp(
      home: Scaffold(
        // Scaffold - основа экрана с AppBar, Body и др.
        appBar: AppBar(
          // AppBar - верхняя панель приложения
          title: const Center(
            // Центрируем заголовок
            child: Text('Оплата госуслуг'), // Текст заголовка
          ),
        ),
        body: SingleChildScrollView(
          // Позволяет прокручивать содержимое
          child: Column(
            // Размещаем элементы вертикально
            crossAxisAlignment: CrossAxisAlignment.start,
            // Выравнивание по левому краю
            children: [
              // Список виджетов внутри Column

              // Баннер
              Container(
                color: Colors.green,
                padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView( // Добавляем SingleChildScrollView
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Выравнивание по левому краю
                  children: [
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.end, // Выравниваем элементы по нижнему краю
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Как списать долги по кредитам?',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Получите бесплатную консультацию юриста по списанию долгов',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Column(
                        children: [
                          Placeholder(
                          fallbackHeight: 50.0, // Высота заглушки
                          fallbackWidth: 130.0,   // Ширина заглушки
                          color: Colors.grey,     // Цвет заглушки (необязательно)
                        ),

                    // Кнопка
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                      child: Align( // Выравниваем кнопку по правому краю
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            'Консультация',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                        ],
                        ),
          ],
        ),
                  ],
                ),
            ),
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0), // Отступы вокруг заголовка
                child: Text(
                  'Проверка и оплата госуслуг',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Список услуг
              _buildServiceItem(context, 'assets/images/gibdd.png', 'Штрафы и пошлины ГИБДД'),
              _buildServiceItem(context, 'assets/images/court.png', 'Судебные задолженности'),
              _buildServiceItem(context, 'assets/images/taxes.png', 'Налоговые задолженности'),

              const Padding(
                padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0), // Отступы вокруг заголовка
                child: Text(
                  'Дополнительно',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 10.0, 0.0, 16.0), // Отступы вокруг заголовка
                child: Column(
                  children: [
                    _buildCheckContainer(
                      context,
                      'assets/images/realty.png', // Путь к картинке
                      'Проверка недвижимости',
                      'Официальная проверка по базе Росреестра',
                    ),
                    _buildCheckContainer(
                      context,
                      'assets/images/car.png', // Путь к картинке
                      'Проверка истории авто',
                      'Официальная и полная проверка авто по 20 категориям',
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  // Функция для создания элемента списка услуг
  Widget _buildServiceItem(BuildContext context, String imagePath, String title) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: InkWell( // Переносим InkWell внутрь Row// Добавляем InkWell для обработки нажатия на весь Row
      onTap: () {
        // Переход на экран штрафов ГИБДД
        if (title == 'Штрафы и пошлины ГИБДД') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CarInfoScreen()),
          );
        }
        // Добавьте обработку для других экранов, если нужно
      },
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 24.0,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16.0),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
    ),
    );
  }

  // Функция для создания контейнера с проверкой
  Widget _buildCheckContainer(BuildContext context, String imagePath, String title, String description) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1, // Ширина контейнера (чуть меньше половины экрана)
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0), // Отступы справа и слева
      decoration: BoxDecoration(
        color: Colors.grey[200], // Светло-серый фон контейнера
        borderRadius: BorderRadius.circular(8.0), // Закругленные углы
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(description),
              ],
            ),
          ),
    Placeholder(
    fallbackHeight: 48.0, // Высота заглушки
    fallbackWidth: 48.0,   // Ширина заглушки
    color: Colors.grey,     // Цвет заглушки (необязательно)
    ),
  ],
      ),
    );
  }
}

class CarData {
  final String carNumber;
  final String history;
  final String mileage;
  final String ownerHistory;
  final String serviceHistory;
  final String registrationData;
  final String legalStatus;
  final String insuranceHistory;
  final String repairs;
  final String recalls;
  final String financialObligations;

  CarData({
    required this.carNumber,
    required this.history,
    required this.mileage,
    required this.ownerHistory,
    required this.serviceHistory,
    required this.registrationData,
    required this.legalStatus,
    required this.insuranceHistory,
    required this.repairs,
    required this.recalls,
    required this.financialObligations,
  });

  factory CarData.fromJson(Map<String, dynamic> json) {
    return CarData(
      carNumber: json['car_number'] ?? '',
      history: json['data']['История аварий'] ?? '',
      mileage: json['data']['Пробег автомобиля'] ?? '',
      ownerHistory: json['data']['Состояние владельцев'] ?? '',
      serviceHistory: json['data']['История обслуживания'] ?? '',
      registrationData: json['data']['Данные о регистрации'] ?? '',
      legalStatus: json['data']['Состояние автомобиля по документам'] ?? '',
      insuranceHistory: json['data']['История страховок'] ?? '',
      repairs: json['data']['Ранее проведенные ремонты и замены'] ?? '',
      recalls: json['data']['Участие в программах отзыва'] ?? '',
      financialObligations: json['data']['Финансовые обязательства'] ?? '',
    );
  }
}


class CarResultScreen extends StatelessWidget {
  final CarData carData;

  const CarResultScreen({Key? key, required this.carData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Информация об авто', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoItem('Номер авто:', carData.carNumber),
            _buildInfoItem('История аварий:', carData.history),
            _buildInfoItem('Пробег автомобиля:', carData.mileage),
            _buildInfoItem('Состояние владельцев:', carData.ownerHistory),
            _buildInfoItem('История обслуживания:', carData.serviceHistory),
            _buildInfoItem('Данные о регистрации:', carData.registrationData),
            _buildInfoItem('Состояние автомобиля по документам:', carData.legalStatus),
            _buildInfoItem('История страховок:', carData.insuranceHistory),
            _buildInfoItem('Ранее проведенные ремонты и замены:', carData.repairs),
            _buildInfoItem('Участие в программах отзыва:', carData.recalls),
            _buildInfoItem('Финансовые обязательства:', carData.financialObligations),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          text: '$title ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black
          ),
          children: <TextSpan>[
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}








class CarInfoScreen extends StatefulWidget {
  @override
  _CarInfoScreenState createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _carNumberController = TextEditingController();
  CarData? _carData;
  String? _errorMessage;
  bool _isLoading = false;

  Future<void> _fetchCarData() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      final carNumber = _carNumberController.text;
      final response = await http.get(Uri.parse(
          'https://finassist.store/car-info?number=$carNumber'));

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          _carData = CarData.fromJson(jsonData);
        });
      } else {
        setState(() {
          _errorMessage = 'Ошибка: ${response.statusCode}';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Информация об авто', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Выравнивание текста по левому краю
            children: [
              const SizedBox(height: 16.0),
              const Text(
                'Введите данные',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _carNumberController,
                decoration: const InputDecoration(
                  labelText: 'Номер авто',
                  focusedBorder: UnderlineInputBorder( // Подчеркивание при фокусе
                    borderSide: BorderSide(color: Colors.black), // Цвет подчеркивания - черный
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите номер авто';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24.0),
              SizedBox( // Оборачиваем кнопку в SizedBox
                width: double.infinity, // Растягиваем кнопку по ширине
                child: ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () {
                    if (_formKey.currentState!.validate()) {
                      // Проверка номера с помощью регулярного выражения
                      if (RegExp(r'^[А-Яа-я]\d{3}[А-Яа-я]{2}\d{2,3}$').hasMatch(_carNumberController.text)) {
                        _fetchCarData().then((_) {
                          if (_carData != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CarResultScreen(carData: _carData!),
                              ),
                            );
                          }
                        });
                      } else {
                        // Вывод сообщения об ошибке, если номер не соответствует шаблону
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Неверный формат номера авто')),
                        );
                      }
                    }
                  },
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                    'Получить информацию',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Цвет кнопки
                    padding: const EdgeInsets.symmetric(vertical: 16.0), // Отступы внутри кнопки
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


