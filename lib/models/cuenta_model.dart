class CuentaModel {
  //int? idCuenta;
  final String xNombre;
  final String xEmail;
  final String xContrasenia;

  CuentaModel(this.xNombre, this.xEmail, this.xContrasenia);

  /*factory CuentaModel.fromMap(Map<String, dynamic> cuenta) {
    return CuentaModel(
        //idCuenta: cuenta['idCuenta'],
        Nombre: cuenta['Nombre'],
        Email: cuenta['Email'],
        Contrasenia: cuenta['Contrasenia']);
  }*/
}
