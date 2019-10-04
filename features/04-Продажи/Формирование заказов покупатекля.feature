#language: ru
@tree

Функционал: Формирование заказов покупателю

Как менеджер по продажам
Я хочу формировать заказы покупателям
Чтобы выставлять счета на покупку

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Формирование заказа

	Дано я удалил все документы "ЗаказПокупателям" за сегодня
	Когда я открываю форму списка документа "ЗаказПокупателям"
		И В панели разделов я выбираю 'Интегрируемые подсистемы'
		И Я нажимаю кнопку командного интерфейса 'Демо: Заказы покупателя'
		Тогда открылось окно 'Демо: Заказы покупателя'
	Затем я создаю новый документ
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Демо: Заказ покупателя (создание)'
	И я заполняю шапку документа
		И я нажимаю кнопку выбора у поля с именем "Партнер"
		Тогда открылось окно 'Демо: Партнеры'
		И в поле 'Контрагент' я ввожу текст 'ООО "Альфа"'
		И я перехожу к следующему реквизиту
		И из выпадающего списка "Контрагент" я выбираю по строке 'ООО "Альфа"'
		И я перехожу к следующему реквизиту
		# И в таблице "Список" я перехожу к строке:
		# 	| Наименование  |
		# 	| 'ООО "Альфа"' |
		# И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Демо: Заказ покупателя (создание) *'
		И я нажимаю кнопку выбора у поля "Контрагент"
		Тогда открылось окно 'Демо: Контрагенты'
		И в таблице "Список" я перехожу к строке:
			| Наименование  |
			| 'ООО "Альфа"' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Демо: Заказ покупателя (создание) *'
		И я нажимаю кнопку выбора у поля "Организация"
		Тогда открылось окно 'Демо: Организации'
		И в таблице "Список" я перехожу к строке:
			| Наименование         |
			| Новые технологии ООО |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Демо: Заказ покупателя (создание) *'
		И в поле 'Сумма документа' я ввожу текст '100.00'
	И я добавляю одну строку товаров
		И в таблице "СчетаНаОплату" я нажимаю на кнопку с именем 'СчетаНаОплатуДобавить'
		# И в таблице "СчетаНаОплату" я выбираю текущую строку
		# И я нажимаю на кнопку создать поля "Счет"
		# И В панели открытых я выбираю 'Демо: Заказ покупателя (создание) *'
		# Тогда открылось окно 'Демо: Заказ покупателя (создание) *'
		# И я перехожу к закладке "Контактные лица"
		# И в таблице "СчетаНаОплату" я завершаю редактирование строки
		# И я перехожу к закладке "Счета на оплату (1)"
		# И в таблице "СчетаНаОплату" я выбираю текущую строку
		И в таблице "СчетаНаОплату" я нажимаю кнопку выбора у реквизита "Счет"
		Тогда открылось окно 'Демо: Счета на оплату покупателям'
		И в таблице "Список" я активизирую поле "Номер"
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Демо: Заказ покупателя (создание) *'
		И в таблице "СчетаНаОплату" я завершаю редактирование строки
		# И в таблице "СчетаНаОплату" я активизирую поле "Отступ"
	И я провожу документ
		И я нажимаю на кнопку 'Провести и закрыть'
		И я жду закрытия окна 'Демо: Заказ покупателя (создание) *' в течение 20 секунд
	Тогда в списке документов "ЗаказПокупателям" я вижу новый документ с текущей датой
		Тогда открылось окно 'Демо: Заказы покупателя'
		И в таблице "Список" я активизирую поле с именем "Организация"
		И в таблице "Список" я перехожу к строке:
			| Валюта | Дата      | Номер       | Организация          | Партнер                      | Статус заказа | Сумма документа |
			| RUB    | 1/23/2015 | 00-00000018 | Новые технологии ООО | 'Торговый дом "Комплексный"' | Согласован    | '55,000.00'     |
		И в таблице "Список" я активизирую поле "Партнер"
		И в таблице "Список" я перехожу к строке:
			| Дата  | Номер       | Организация          | Партнер       | Статус заказа | Сумма документа |
			| 18:24 | SS-00000001 | Новые технологии ООО | 'ООО "Альфа"' | Не согласован | 100.00          |
