// Agregação e Composição
import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }
   Map<String, dynamic> toJson() {
    return {"nome": _nome};
}
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }
   Map<String, dynamic> toJson() {
    return {"nome": _nome, "dependentes": _dependentes.map((d) => d.toJson()).toList()};
}
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }
   Map<String, dynamic> toJson() {
    return {"nomeProjeto": _nomeProjeto, "funcionarios": _funcionarios.map((f) => f.toJson()).toList()};
}

void main() {
  // 1. Criar varios objetos Dependentes
  var dependente1 = Dependente("Dependente 1");
  var dependente2 = Dependente("Dependente 2");
  var dependente3 = Dependente("Dependente 3");
  var dependente4 = Dependente("Dependente 4");
  var dependente5 = Dependente("Dependente 5");

  // 2. Criar varios objetos Funcionario  / 3. Associar os Dependentes criados aos respectivos funcionários
  var funcionario1 = Funcionario("João", [dependente1]);
  var funcionario2 = Funcionario("Ana", [dependente2]);
  var funcionario3 = Funcionario("Linda", [dependente3]); 
  var funcionario4 = Funcionario("Arthur", [dependente4]); 
  var funcionario5 = Funcionario("Letícia", [dependente5]);

  // 4. Criar uma lista de Funcionarios
  var funcionarios = [funcionario1, funcionario2, funcionario3, funcionario4, funcionario5];

  // 5. criar um objeto Equipe Projeto chamando o metodo contrutor que da nome ao projeto e insere uma coleção de funcionario
  var equipeProjeto = EquipeProjeto("Meu Projeto", funcionarios);
  
  // 6. Printar no formato JSON o objeto Equipe Projeto.
  equipeProjeto = EquipeProjeto("Meu Projeto", funcionarios);
  var equipeProjetoJson = jsonEncode(equipeProjeto.toJson());
  print(equipeProjetoJson);

}
}
