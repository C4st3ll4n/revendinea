import 'package:revendinea/src/model/uf.dart';

abstract class ILocalidadeRepository {
  getUF();
  getCity(UF uf);
}
