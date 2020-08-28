unit SConst;

interface

resourcestring
{$I SEAST.INC}

  SRegAppKey       = '\Software\EastTrade\Oil';
  SRegYear         = 'Year';
  SRegMonth        = 'Month';

  SAlreadyRunning  = 'Приложение ''Расход топлива'' уже выполняется.'#13#10 +
                     'Активизируйте его при помощи панели задач';

  SEastTitle       = 'ТОРГОВЫЙ ДОМ "ВОСТОК"';
  SAppTitle        = 'Расход топлива';
  SCopyright       = 'Copyright '#$A9' 2009-2010 A.Lebedev';

  STotal           = 'Всего';

  SRange          = '[%s] - [%s]';
  SRangeT         = 'С  [%s]  По [%s]';

  SAllCategories         = 'Товары всех групп';

  SSumProd  = ' Количество [%s] * Цена [%s] = Сумма [%s]';

  // Строки для TStatusBar
  SAllRows = 'Всего записей: %d';
  SReserveRows = 'Резервных: %d';
  SArchiveRows = 'Архивных: %d';
  SProductRow  = 'Товаров: %d';
{ ============ SQL ==============================================}

  SSQLGetSubjects       = 'EXEC O_GetSubjects %d, %d';
  SSQLGetConsumptions   = 'EXEC O_GetConsumptions %d, %d';

  // Модуль автомобилей
  SSQLGetCars = 'EXEC REPORTS..O_GetCars %d, ''%s'', ''%s'' ';
  SSQLGetCarDetail = 'EXEC REPORTS..O_GetCarDetail %d, ''%s''';       // UID, Archive
  SSQLGetCarArc = 'EXEC REPORTS..O_GetCarArc %d';                     //Вывод архивных версий автомобиля (UID)
  SSQLInsCar = 'EXEC REPORTS..O_InsCar ''%s'',  ''%s'', ''%s'', ''%s'', ''%s'', %d, ''%s'', ''%s'', ''%s'', ''%s'', %d, ''%s'', ' +
                                       '%d, %d, ''%s'', ''%s'', %d, ''%s'', ''%s'', %d, %d,  ''%s''';
  SSQLCorrCar = 'EXEC REPORTS..O_CorrCar %d, ''%s'',  ''%s'', ''%s'', ''%s'', ''%s'', %d, ''%s'', ''%s'', ''%s'', ''%s'', %d, ''%s'', ' +
                                        '%d, %d, ''%s'', ''%s'', %d, ''%s'', ''%s'', %d, %d,  ''%s''';
  SSQLDeleteCars  = 'EXEC REPORTS..O_DeleteCars %d';                 // Удаление автомобиля
  SSQLTrancferCars = 'EXEC REPORTS..O_TrancferCars %d, %d, ''%s''';          // Перевод автомобиля в резерв


//  Модуль страхования
  SSQLGetInsurance  = 'EXEC REPORTS..O_GetInsurance %d, ''%s'', ''%s''';      // Получение списка страховых документов 0 - без резерва, 1 - все записи
  SSQLGetInsuranceDetail = 'EXEC REPORTS..O_GetInsuranceDetail %d'; //  Получение информации о страховом документе
  SSQLGetIsnuranceArc = 'EXEC REPORTS..O_GetIsnuranceArc %d';       //  Получение архивных записей страхового документа
  SSQLInsInsurance  = 'EXEC REPORTS..O_InsInsurance %d, %d, ''%s'',  ''%s'', ''%s'', %d, ''%s'', %d, ''%s''';       // Добавление страхового документа
  SSQLCorrInsurance = 'EXEC REPORTS..O_CorrInsurance %d, %d, %d, ''%s'',  ''%s'', ''%s'', %d, ''%s'', %d, ''%s''';  // Изменение страхового документа
  SSQLTrancferInsurance = 'EXEC REPORTS..O_TrancferInsurance %d, %d, ''%s''';                                       // Перевод страхового документа в резерв
  SSQLDelInsurance = 'EXEC REPORTS..O_DelInsurance %d';                                                             // Удаление страхового документа


// Модуль накладных
  SSQLGetNakl = 'EXEC REPORTS..O_GetNakl ''%s'', ''%s'', %d';       // Получение списка накладных (BegDate, EndDate, Archive - 0,1)
  SSQLGetNaklDetail = 'EXEC REPORTS..O_GetNaklDetail %d, %d';       // Получение детализации накладной (Unicum_Num, Archive - 0,1)
  SSQLInsNaklHead = 'EXEC REPORTS..O_InsNaklHead ''%s'', ''%s'', ''%s'', %d, ''%s'', ''%s'', ''%s''';  // Создание новой накладной (Головная часть)
                                     // (DATE_DOC, SUM_DOC, DRIVER, Car_UID, Type_Doc, Family, Primech)
  SSQLInsNaklMove = 'EXEC REPORTS..O_InsNaklMove %d, %d, %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';   // Создание новой накланой (Тело накладной)
                                     // (Unicum_Num, Num_Doc, Num_Predm, Name_Predm, KOLC_Predm, Sum_Predm, Family, Type_Doc, Primech)
  SSQLTrancferNakl = 'EXEC REPORTS..O_TrancferNakl %d, %d, ''%s''';   // Отметка накладной (Unicum_Num, Otmetka, Family) (Отложен до востребования)

                                // Процедуры корректировки документа
  SSQLCorrNaklHead = 'EXEC REPORTS..O_CorrNaklHead %d, ''%s'', ''%s'', ''%s'', %d, ''%s'', ''%s'', ''%s''';

  SSQLCorrNaklMove = 'EXEC REPORTS..O_CorrNaklMove %d, %d, %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';

  SSQLDelNakl = 'EXEC REPORTS..O_DelNakl %d';                         // Удаление накладной

// Получение информации в справочники документа
  SSQLGetDrivers = 'EXEC REPORTS..O_GetDrivers';    // Получение списка водителей

// Модуль типов документов
  SSQLInsTypeDocs = 'EXEC REPORTS..O_InsTypeDocs ''%s'', ''%s'', %d';           // Добавление типа документа
  SSQLCorrTypeDoc = 'EXEC REPORTS..O_CorrTypeDoc %d, ''%s'', ''%s'', %d';       // Изменение типа документа
  SSQLDelTypeDocs = 'EXEC REPORTS..O_DelTypeDocs %d';                           // Удаление типа документа
  SSQLTransferTypeDoc = 'EXEC REPORTS..O_TransferTypeDoc %d, %d';               // Перевод типа документа в\из резерв(а)
  SSQLGetTypeDocs = 'EXEC REPORTS..O_GetTypeDocs %d';                           // Получение списка типов документа


// Модуль товаров
  SSQLGetProducts = 'EXEC REPORTS..O_GetProducts ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';                      // Получение списка ГСМ товаров
  SSQLGetProdCategories = 'EXEC REPORTS..O_GetProdCategories';                                                     // Получение списка категорий

  // Получение групп
  SSQLGetGroup1 = 'EXEC REPORTS..O_GetGroup1';
  SSQLGetGroup2 = 'EXEC REPORTS..O_GetGroup2';
  SSQLGetGroup3 = 'EXEC REPORTS..O_GetGroup3';
  SSQLGetGroup4 = 'EXEC REPORTS..O_GetGroup4';
  SSQLGetGroup5 = 'EXEC REPORTS..O_GetGroup5';
  SSQLGetGroup6 = 'EXEC REPORTS..O_GetGroup6';

  SSQLGetTypeTovr = 'EXEC REPORTS..O_GetTypeTovr';  // Получение типов товаров

  SSQLInsProduct = 'EXEC REPORTS..O_InsProduct ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ' +          // Добавление нового товара
                                               '''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ' +
                                               '''%s'', ''%s'', ''%s'', ''%s'', ''%s''';

  SSQLCorrProduct = 'EXEC REPORTS..O_CorrProduct %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ' +   // Изменение товара
                                                  '''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ' +
                                                  '''%s'', ''%s'', ''%s'', ''%s'', ''%s''';

  SSQLDelProduct = 'EXEC REPORTS..O_DelProduct %d';                                               // Удаление товара

  SSQLGetProductDetail = 'EXEC REPORTS..O_GetProductDetail %d';                                   // Получение информации о товаре


  // Модуль водителей
  SSQLInsDriver = 'EXEC REPORTS..O_InsDriver ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ' +     // Добавление нового водителя
                                             '''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ' +
                                             '''%s'', ''%s'', %d, ''%s'', %d, ''%s''';

  SSQLCorrDriver = 'EXEC REPORTS..O_CorrDriver %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ' +     // Изменение данных водителя
                                             '''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ' +
                                             '''%s'', ''%s'', %d, ''%s'', %d, ''%s''';

  SSQLDelDriver = 'EXEC REPORTS..O_DelDriver %d';                                                   // Удаление водителя

  SSQLTransferDriver = 'EXEC REPORTS..O_TransferDriver %d, %d';                                    //  Увольнение/Возврат на работу

  SSQLGetDriversL = 'EXEC REPORTS..O_GetDriversL %d';   // Получение списка водителей (0 - без уволенных, 1 - Все)

  SSQLGetDriverCar = 'EXEC REPORTS..O_GetDriverCar %d'; //Получение информации о автомобиле водителя


  // Модуль отчетов
  SSQLGetProductReports = 'EXEC REPORTS..O_GetProductReports ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'''; // Отчет по группам товаров

  





 // Печать
  SReestr = 'Template\Reestr';      // Печать реестра
  SNakl = 'Template\Nakl';          // Печать документа
  SCarReestr = 'Template\CarReestr'; // Печать реестра автомобилей
  SCarDetail = 'Template\CarDetail'; // Печать информации об автомобиле
implementation

end.
