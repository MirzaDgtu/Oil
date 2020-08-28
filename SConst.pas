unit SConst;

interface

resourcestring
{$I SEAST.INC}

  SRegAppKey       = '\Software\EastTrade\Oil';
  SRegYear         = 'Year';
  SRegMonth        = 'Month';

  SAlreadyRunning  = '���������� ''������ �������'' ��� �����������.'#13#10 +
                     '������������� ��� ��� ������ ������ �����';

  SEastTitle       = '�������� ��� "������"';
  SAppTitle        = '������ �������';
  SCopyright       = 'Copyright '#$A9' 2009-2010 A.Lebedev';

  STotal           = '�����';

  SRange          = '[%s] - [%s]';
  SRangeT         = '�  [%s]  �� [%s]';

  SAllCategories         = '������ ���� �����';

  SSumProd  = ' ���������� [%s] * ���� [%s] = ����� [%s]';

  // ������ ��� TStatusBar
  SAllRows = '����� �������: %d';
  SReserveRows = '���������: %d';
  SArchiveRows = '��������: %d';
  SProductRow  = '�������: %d';
{ ============ SQL ==============================================}

  SSQLGetSubjects       = 'EXEC O_GetSubjects %d, %d';
  SSQLGetConsumptions   = 'EXEC O_GetConsumptions %d, %d';

  // ������ �����������
  SSQLGetCars = 'EXEC REPORTS..O_GetCars %d, ''%s'', ''%s'' ';
  SSQLGetCarDetail = 'EXEC REPORTS..O_GetCarDetail %d, ''%s''';       // UID, Archive
  SSQLGetCarArc = 'EXEC REPORTS..O_GetCarArc %d';                     //����� �������� ������ ���������� (UID)
  SSQLInsCar = 'EXEC REPORTS..O_InsCar ''%s'',  ''%s'', ''%s'', ''%s'', ''%s'', %d, ''%s'', ''%s'', ''%s'', ''%s'', %d, ''%s'', ' +
                                       '%d, %d, ''%s'', ''%s'', %d, ''%s'', ''%s'', %d, %d,  ''%s''';
  SSQLCorrCar = 'EXEC REPORTS..O_CorrCar %d, ''%s'',  ''%s'', ''%s'', ''%s'', ''%s'', %d, ''%s'', ''%s'', ''%s'', ''%s'', %d, ''%s'', ' +
                                        '%d, %d, ''%s'', ''%s'', %d, ''%s'', ''%s'', %d, %d,  ''%s''';
  SSQLDeleteCars  = 'EXEC REPORTS..O_DeleteCars %d';                 // �������� ����������
  SSQLTrancferCars = 'EXEC REPORTS..O_TrancferCars %d, %d, ''%s''';          // ������� ���������� � ������


//  ������ �����������
  SSQLGetInsurance  = 'EXEC REPORTS..O_GetInsurance %d, ''%s'', ''%s''';      // ��������� ������ ��������� ���������� 0 - ��� �������, 1 - ��� ������
  SSQLGetInsuranceDetail = 'EXEC REPORTS..O_GetInsuranceDetail %d'; //  ��������� ���������� � ��������� ���������
  SSQLGetIsnuranceArc = 'EXEC REPORTS..O_GetIsnuranceArc %d';       //  ��������� �������� ������� ���������� ���������
  SSQLInsInsurance  = 'EXEC REPORTS..O_InsInsurance %d, %d, ''%s'',  ''%s'', ''%s'', %d, ''%s'', %d, ''%s''';       // ���������� ���������� ���������
  SSQLCorrInsurance = 'EXEC REPORTS..O_CorrInsurance %d, %d, %d, ''%s'',  ''%s'', ''%s'', %d, ''%s'', %d, ''%s''';  // ��������� ���������� ���������
  SSQLTrancferInsurance = 'EXEC REPORTS..O_TrancferInsurance %d, %d, ''%s''';                                       // ������� ���������� ��������� � ������
  SSQLDelInsurance = 'EXEC REPORTS..O_DelInsurance %d';                                                             // �������� ���������� ���������


// ������ ���������
  SSQLGetNakl = 'EXEC REPORTS..O_GetNakl ''%s'', ''%s'', %d';       // ��������� ������ ��������� (BegDate, EndDate, Archive - 0,1)
  SSQLGetNaklDetail = 'EXEC REPORTS..O_GetNaklDetail %d, %d';       // ��������� ����������� ��������� (Unicum_Num, Archive - 0,1)
  SSQLInsNaklHead = 'EXEC REPORTS..O_InsNaklHead ''%s'', ''%s'', ''%s'', %d, ''%s'', ''%s'', ''%s''';  // �������� ����� ��������� (�������� �����)
                                     // (DATE_DOC, SUM_DOC, DRIVER, Car_UID, Type_Doc, Family, Primech)
  SSQLInsNaklMove = 'EXEC REPORTS..O_InsNaklMove %d, %d, %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';   // �������� ����� �������� (���� ���������)
                                     // (Unicum_Num, Num_Doc, Num_Predm, Name_Predm, KOLC_Predm, Sum_Predm, Family, Type_Doc, Primech)
  SSQLTrancferNakl = 'EXEC REPORTS..O_TrancferNakl %d, %d, ''%s''';   // ������� ��������� (Unicum_Num, Otmetka, Family) (������� �� �������������)

                                // ��������� ������������� ���������
  SSQLCorrNaklHead = 'EXEC REPORTS..O_CorrNaklHead %d, ''%s'', ''%s'', ''%s'', %d, ''%s'', ''%s'', ''%s''';

  SSQLCorrNaklMove = 'EXEC REPORTS..O_CorrNaklMove %d, %d, %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';

  SSQLDelNakl = 'EXEC REPORTS..O_DelNakl %d';                         // �������� ���������

// ��������� ���������� � ����������� ���������
  SSQLGetDrivers = 'EXEC REPORTS..O_GetDrivers';    // ��������� ������ ���������

// ������ ����� ����������
  SSQLInsTypeDocs = 'EXEC REPORTS..O_InsTypeDocs ''%s'', ''%s'', %d';           // ���������� ���� ���������
  SSQLCorrTypeDoc = 'EXEC REPORTS..O_CorrTypeDoc %d, ''%s'', ''%s'', %d';       // ��������� ���� ���������
  SSQLDelTypeDocs = 'EXEC REPORTS..O_DelTypeDocs %d';                           // �������� ���� ���������
  SSQLTransferTypeDoc = 'EXEC REPORTS..O_TransferTypeDoc %d, %d';               // ������� ���� ��������� �\�� ������(�)
  SSQLGetTypeDocs = 'EXEC REPORTS..O_GetTypeDocs %d';                           // ��������� ������ ����� ���������


// ������ �������
  SSQLGetProducts = 'EXEC REPORTS..O_GetProducts ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';                      // ��������� ������ ��� �������
  SSQLGetProdCategories = 'EXEC REPORTS..O_GetProdCategories';                                                     // ��������� ������ ���������

  // ��������� �����
  SSQLGetGroup1 = 'EXEC REPORTS..O_GetGroup1';
  SSQLGetGroup2 = 'EXEC REPORTS..O_GetGroup2';
  SSQLGetGroup3 = 'EXEC REPORTS..O_GetGroup3';
  SSQLGetGroup4 = 'EXEC REPORTS..O_GetGroup4';
  SSQLGetGroup5 = 'EXEC REPORTS..O_GetGroup5';
  SSQLGetGroup6 = 'EXEC REPORTS..O_GetGroup6';

  SSQLGetTypeTovr = 'EXEC REPORTS..O_GetTypeTovr';  // ��������� ����� �������

  SSQLInsProduct = 'EXEC REPORTS..O_InsProduct ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ' +          // ���������� ������ ������
                                               '''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ' +
                                               '''%s'', ''%s'', ''%s'', ''%s'', ''%s''';

  SSQLCorrProduct = 'EXEC REPORTS..O_CorrProduct %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ' +   // ��������� ������
                                                  '''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ' +
                                                  '''%s'', ''%s'', ''%s'', ''%s'', ''%s''';

  SSQLDelProduct = 'EXEC REPORTS..O_DelProduct %d';                                               // �������� ������

  SSQLGetProductDetail = 'EXEC REPORTS..O_GetProductDetail %d';                                   // ��������� ���������� � ������


  // ������ ���������
  SSQLInsDriver = 'EXEC REPORTS..O_InsDriver ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ' +     // ���������� ������ ��������
                                             '''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ' +
                                             '''%s'', ''%s'', %d, ''%s'', %d, ''%s''';

  SSQLCorrDriver = 'EXEC REPORTS..O_CorrDriver %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ' +     // ��������� ������ ��������
                                             '''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ' +
                                             '''%s'', ''%s'', %d, ''%s'', %d, ''%s''';

  SSQLDelDriver = 'EXEC REPORTS..O_DelDriver %d';                                                   // �������� ��������

  SSQLTransferDriver = 'EXEC REPORTS..O_TransferDriver %d, %d';                                    //  ����������/������� �� ������

  SSQLGetDriversL = 'EXEC REPORTS..O_GetDriversL %d';   // ��������� ������ ��������� (0 - ��� ���������, 1 - ���)

  SSQLGetDriverCar = 'EXEC REPORTS..O_GetDriverCar %d'; //��������� ���������� � ���������� ��������


  // ������ �������
  SSQLGetProductReports = 'EXEC REPORTS..O_GetProductReports ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'''; // ����� �� ������� �������

  





 // ������
  SReestr = 'Template\Reestr';      // ������ �������
  SNakl = 'Template\Nakl';          // ������ ���������
  SCarReestr = 'Template\CarReestr'; // ������ ������� �����������
  SCarDetail = 'Template\CarDetail'; // ������ ���������� �� ����������
implementation

end.
