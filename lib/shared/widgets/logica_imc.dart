class LogicaIMC {
  double peso;
  double altura;

  LogicaIMC(this.peso, this.altura);

  double calcularIMC() {
    return peso / (altura * altura);
  }
}
