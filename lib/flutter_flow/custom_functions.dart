import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

DateTime? dia1mesatual() {
  // extrair o primeiro dia do mes  atual
  DateTime now = DateTime.now();
  DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
  return firstDayOfMonth;
}

double? porcentagem(
  double? numero1,
  double? numero2,
) {
  // calcular a porcentagem de crescimento entre dois numero decimais
  if (numero1 == null || numero2 == null || numero1 == 0) {
    return null;
  }
  double resultado = ((numero2 - numero1) / numero1) * 100;
  return resultado.isNaN ? null : resultado;
}

DateTime? dIaAnterior() {
  // extrair um dia atras do atual começando pela meia noite
// extrair um dia atras do atual começando pela meia noite
  DateTime now = DateTime.now();
  DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
  return yesterday;
}

DateTime? meiaNoitedoDIaAtual() {
  // mudar a hora do dia atual para meia noite
// mudar a hora do dia atual para meia noite
  DateTime now = DateTime.now();
  DateTime midnight = DateTime(now.year, now.month, now.day);
  return midnight;
}

String? caracter22Extrair(String? qrcode) {
  if (qrcode != null && qrcode.length > 22) {
    String extracted = qrcode.substring(22); // Extrai a partir do 22º caractere
    if (extracted.length > 2) {
      // Verifica se a string extraída tem pelo menos 3 caracteres
      return extracted.substring(
          0, extracted.length - 3); // Retira os dois últimos caracteres
    }
  }
  return null;
}

String? base64Extract(String? dataUri) {
  const prefix = 'data:image/png;base64,';
  if (dataUri!.startsWith(prefix)) {
    return dataUri.substring(prefix.length);
  }
  return null;
}

bool? barracomoPirmeirocaracter(String? input) {
  // uma função para retornar verdadeiro ou falso se a "/" é o primeiro caracter da string
  if (input == null || input.isEmpty) {
    return null;
  }
  return input.startsWith('/');
}

bool? depoisdaBarra(String? input) {
  // uma função que retorne verdadeiro ou falso se existe qualquer caracter depois de "/"
  if (input == null || input.isEmpty) {
    return null;
  }
  int index = input.indexOf('/');
  if (index == -1 || index == input.length - 1) {
    return false;
  }
  return true;
}

String? datatotimestamptz(String? data) {
  // transformar a string de data de dd/MM/yyyy em timestamptz nesse formato yyyy-MM-dd HH:mm:ss+00
  if (data == null) return null;
  final formatter = DateFormat('dd/MM/yyyy');
  final dateTime = formatter.parse(data);
  final timestamp = dateTime.toUtc().toString();
  return timestamp.substring(0, 19) + '+00';
}

List<dynamic> setoresToJson(List<BotSetoresStruct> setores) {
  final List<dynamic> list = [];

  int i = 0;

  for (BotSetoresStruct item in setores) {
    if (item.ativo) {
      i++;
      list.add({"nome": item.nome, "ordem": i, "setor": item.setor});
    }
  }
  return list;
}

String? retornarVazia(String? string) {
  // uma função para retornar vazio de qualquer string
  if (string == null || string.isEmpty) {
    return '';
  } else {
    return null;
  }
}

int? somarNumeros(List<int> numeros) {
  // somar numeros de uma lista
  if (numeros.isEmpty) {
    return null;
  }
  int sum = 0;
  for (int num in numeros) {
    sum += num;
  }
  return sum;
}

bool verifyEmail(String email) {
  final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');

  return regex.hasMatch(email);
}

String returnFilteredAudio(String audio) {
  return 'https://fntyzzstyetnbvrpqfre.supabase.co/storage/v1/object/public/$audio';
}

List<String>? horasdodia() {
  // me retornar uma lista de todas as horas do dia no formato HH:mm
  List<String> hours = [];
  for (int i = 0; i < 24; i++) {
    String hour = DateFormat('HH:mm').format(DateTime(2022, 1, 1, i));
    hours.add(hour);
  }
  return hours;
}

bool? listContainsString(
  String string,
  List<String> list,
) {
  // verificar se na lista que forneci tem a string que tambem forneci
  return list.contains(string);
}

int? mais10(int? inteiro) {
  // somar mais 10 em um determinado número
  return inteiro != null ? inteiro + 10 : null;
}

String regexNumeroConexao(String text1) {
  // Regex para encontrar números seguidos por ':'
  RegExp regExp = RegExp(r'(\d+):');

  // Procurando pela primeira correspondência na string
  RegExpMatch? match = regExp.firstMatch(text1);

  // Se uma correspondência for encontrada, retornar o número
  if (match != null) {
    return match.group(1) ?? '';
  } else {
    return 'Nenhum número encontrado';
  }
}

dynamic setorDTToJson(List<BotSetoresStruct> setores) {
  final Map<String, dynamic> map = {};
  return map;
}

List<BotSetoresStruct> jsonToSetores(dynamic json) {
  final List<BotSetoresStruct> list = [];
  for (var item in json['setores']) {
    if (item != null) {
      list.add(BotSetoresStruct(
          nome: item['nome'], setor: item['setor'], ordem: item['ordem']));
    }
  }
  return list;
}

String? imagepathtoString(String? imagepath) {
  // tranformar imagepath to string
  return imagepath?.toString();
}

String? extrairDDD(String? numero) {
  RegExp regex = RegExp(r'(?<=^\d{2})\d{2}');
  Match? match = regex.firstMatch(numero!);

  if (match != null) {
    // Retorna os dois dígitos encontrados
    return match.group(0) ?? "";
  } else {
    // Retorna uma string vazia se não encontrar uma correspondência
    return "";
  }
}

String? extrairNumerotelefone(String? numero) {
// Usando regex para extrair a parte do número após o DDD
  RegExp regex = RegExp(r'^\d{2}(\d+)$');
  Match? match = regex.firstMatch(numero!);

  if (match != null) {
    // Retorna a parte do número após o DDD
    return match.group(1) ?? "";
  } else {
    // Retorna uma string vazia se não encontrar uma correspondência
    return "";
  }
}

String mascararNumero(String numero) {
  // Remove qualquer formatação existente
  String numeroLimpo = numero.replaceAll(RegExp(r'\D'), '');

  // Remove o código do país "55" se presente
  if (numeroLimpo.startsWith('55')) {
    numeroLimpo = numeroLimpo.substring(2);
  }

  // Verifica se está faltando o dígito 9 após o DDD
  if (numeroLimpo.length == 10) {
    numeroLimpo = numeroLimpo.substring(0, 2) + '9' + numeroLimpo.substring(2);
  }

  RegExp regex;
  if (numeroLimpo.length == 11) {
    regex = RegExp(r'^(\d{2})(\d{1})(\d{4})(\d{4})$');
  } else {
    return numero; // Retorna o número sem mudança se não se encaixar nos critérios esperados
  }

  return numeroLimpo.replaceAllMapped(
      regex, (Match m) => '(${m[1]}) ${m[2]}${m[3]}-${m[4]}');
}

String msgFinalizar(
  String texto,
  String protocolo,
) {
  final padrao = r'\{\{protocolo\}\}';
  return texto.replaceAll(RegExp(padrao), protocolo);
}

String msgAssumir(
  String emoji,
  String nomeAtendente,
  String nomeCliente,
  String saudacao,
  String texto,
) {
// Primeiro, faz a substituição normal
  String mensagemSubstituida = texto
      .replaceAll("{{emoji_sexo_atendente}}", emoji)
      .replaceAll("*{{nome_atendente}}*", "*" + nomeAtendente + "*")
      .replaceAll("{{saudacao}}", saudacao)
      .replaceAll("*{{nome_cliente}}*", nomeCliente);

  // Depois, adiciona a quebra de linha após o primeiro ':' encontrado
  String mensagemFinal = mensagemSubstituida.replaceFirst(':', ":\n\n");

  return mensagemFinal;
}

String formatarNumero(String numero) {
  RegExp exp = RegExp(r'[^\d]');

  // Substitui todos os caracteres encontrados pela expressão regular por uma string vazia
  return numero.replaceAll(exp, '');
}

List<int> gerarNumeros60() {
  return List.generate(60, (index) => index + 1);
}

List<String> gerarMinutos() {
  return List.generate(60, (index) => "${index + 1} minutos");
}

dynamic funcionamentoToJson(BotFuncionamentoStruct disponibilidade) {
  Map<String, dynamic> returnJson(FuncionamentoDiaStruct dia, int i) {
    return {
      "$i": {"fim": dia.fim, "ativo": dia.ativo, "inicio": dia.inicio}
    };
  }

  final Map<String, dynamic> json = {
    "dias": {
      "1": {
        "fim": disponibilidade.domingo.fim,
        "ativo": disponibilidade.domingo.ativo,
        "inicio": disponibilidade.domingo.inicio
      },
      "2": {
        "fim": disponibilidade.segunda.fim,
        "ativo": disponibilidade.segunda.ativo,
        "inicio": disponibilidade.segunda.inicio
      },
      "3": {
        "fim": disponibilidade.terca.fim,
        "ativo": disponibilidade.terca.ativo,
        "inicio": disponibilidade.terca.inicio
      },
      "4": {
        "fim": disponibilidade.quarta.fim,
        "ativo": disponibilidade.quarta.ativo,
        "inicio": disponibilidade.quarta.inicio
      },
      "5": {
        "fim": disponibilidade.quinta.fim,
        "ativo": disponibilidade.quinta.ativo,
        "inicio": disponibilidade.quinta.inicio
      },
      "6": {
        "fim": disponibilidade.sexta.fim,
        "ativo": disponibilidade.sexta.ativo,
        "inicio": disponibilidade.sexta.inicio
      },
      "7": {
        "fim": disponibilidade.sabado.fim,
        "ativo": disponibilidade.sabado.ativo,
        "inicio": disponibilidade.sabado.inicio
      },
    }
  };

  return json;
}

bool jsonToBoolean(dynamic json) {
  if (json is bool) {
    return json;
  }
  return false;
}

String formatPhoneNumber(String phoneNumber) {
  // Remove todos os caracteres exceto dígitos
  String digitsOnly = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
  // Adiciona o prefixo '55' aos dígitos
  return '55$digitsOnly';
}

DateTime formatJsonDateSP(String jsonData) {
// Parse a string de data-hora para um objeto DateTime em UTC
  DateTime utcDate = DateTime.parse(jsonData);

  // Calcula a diferença de fuso horário de São Paulo (UTC-3)
  int offset = -3;
  // Cria um novo DateTime ajustando o fuso horário para São Paulo
  DateTime spDate = utcDate.add(Duration(hours: offset));

  return spDate;
}

String newLine() {
  return "\n";
}

String? audiopathToString(String? audio) {
  // transforma um audio path em string
  String audioPath = '/path/to/audio.mp3';
  return audioPath.toString();
}

String? videopathToString(String? videopath) {
  // transforma video path em string
  return videopath?.toString();
}

String ajustarNonoDigito9(String numero) {
// Remove caracteres não numéricos
  String numeroLimpo = numero.replaceAll(RegExp(r'[^0-9]'), '');

  // Verifica se deve adicionar ou remover o dígito 9
  if (numeroLimpo.length == 10) {
    // Caso tenha 10 dígitos, adiciona o 9 após o código de área
    numeroLimpo = numeroLimpo.substring(0, 2) + '9' + numeroLimpo.substring(2);
  } else if (numeroLimpo.length == 11) {
    // Caso tenha 11 dígitos, remove o 9 após o código de área
    numeroLimpo = numeroLimpo.substring(0, 2) + numeroLimpo.substring(3);
  }

  // Adiciona o prefixo "55" ao número
  return '55' + numeroLimpo;
}

bool? containeByInterger(
  List<int>? lista,
  int? inteiro,
) {
  // uma função que retorna em booleano se um numero esta dentro de uma lista de numeros
  if (lista == null || inteiro == null) {
    return null;
  }
  return lista.contains(inteiro);
}

bool? numerocontemdigito(
  int? digito,
  int numero,
) {
  // uma função que retorna um boleano se um inteiro contem um certo digito
  // Converte o número para uma string para facilitar a manipulação dos dígitos
  String numeroStr = numero.toString();

  // Converte o dígito para uma string
  String digitoStr = digito.toString();

  // Verifica se a string do número contém a string do dígito
  return numeroStr.contains(digitoStr);
}

int? juntardigitos(
  int? numero1,
  int? numero2,
) {
// Converte os números para strings
  String strNumero1 = numero1.toString();
  String strNumero2 = numero2.toString();

  // Concatena as strings dos números
  String resultadoStr = strNumero1 + strNumero2;

  // Converte o resultado de volta para um número inteiro
  int resultado = int.parse(resultadoStr);

  return resultado;
}

int? removerDigito(
  int? numero,
  int? digitoRemover,
) {
  // Converte o número para uma lista de dígitos
  List<int> digitos = numero.toString().split('').map(int.parse).toList();

  // Remove o dígito especificado da lista
  digitos.remove(digitoRemover);

  // Verifica se a lista está vazia (todos os dígitos foram removidos)
  if (digitos.isEmpty) {
    return 0;
  }

  // Converte a lista de volta para um número inteiro
  int resultado = int.parse(digitos.join(''));

  return resultado;
}

String listaintergerToString(List<int> lista) {
  return lista.join(',');
}

List<String>? nomestabelas() {
  List<String> obterCategorias() {
    return ['conversas', 'Respostas_Rapidas', 'setores'];
  }

  void main() {
    var categorias = obterCategorias();
    print(categorias);
  }
}

bool validarNumeroCelular(String numero) {
  // Remover caracteres não numéricos
  String numeroLimpo = numero.replaceAll(RegExp(r'[^\d]'), '');

  // Verificar se o número tem o formato correto após a remoção dos caracteres não numéricos
  RegExp regex = RegExp(r'^\d{2}9\d{8}$');
  return regex.hasMatch(numeroLimpo);
}

String? jsonTostring(dynamic string) {
  // converter json para string
  return json.encode(string);
}

String? getFileExtensionFromUrl(String url) {
// Analisa a URL para obter um objeto Uri.
  final uri = Uri.parse(url);

  // Obtém o último segmento do caminho, que deve ser o nome do arquivo.
  final fileName = uri.pathSegments.last;

  // Encontra a última ocorrência de '.' para obter a extensão.
  final dotIndex = fileName.lastIndexOf('.');

  // Se um ponto foi encontrado, retorna a substring após o ponto.
  // Caso contrário, retorna uma string vazia.
  return dotIndex != -1 ? fileName.substring(dotIndex + 1) : '';
}

List<int> intersectListInterger(
  List<int> lista1,
  List<int> lista2,
) {
  // relacionar duas listas de inteiros,e retornar somente os inteiros que aparecem nas duas
  List<int> intersect = [];
  for (int i = 0; i < lista1.length; i++) {
    if (lista2.contains(lista1[i])) {
      intersect.add(lista1[i]);
    }
  }
  return intersect;
}

dynamic stringtoJson(String string) {
  // converter string para json
  return json.decode(string);
}

bool? filterContains(
  String? stringSearch,
  String? stringKey,
) {
  if (stringSearch == null || stringKey == null) {
    return null;
  }

  return stringSearch.toLowerCase().contains(stringKey.toLowerCase());
}

bool? regexEspacoeBarra(String? string) {
  if (string == null) {
    return false;
  }
  RegExp regex = RegExp(r'^\s+$|^\/.*');
  return regex.hasMatch(string);
}

bool regexEspaco(String? string) {
  if (string == null) {
    return false;
  }
  RegExp regex = RegExp(r'^\s+$');
  return regex.hasMatch(string);
}

String? filtroRelatorios(
  String? status,
  String? nomeContato,
  String? numeroContato,
  String? protocolo,
  String? conexao,
  String? setor,
  String? colabuser,
  DateTime? dtInicio,
  DateTime? dtFinal,
) {
  // Lista para armazenar os filtros
  List<String> filtros = [];

  // Adiciona filtros somente se os argumentos não forem null
  if (status != null) {
    filtros.add('Status=ilike.%25$status%25');
  }
  if (nomeContato != null) {
    filtros.add('nome_contato=ilike.%25$nomeContato%25');
  }
  if (numeroContato != null) {
    filtros.add('numero_contato=ilike.%25$numeroContato%25');
  }
  if (protocolo != null) {
    filtros.add('Protocolo=ilike.%25$protocolo%25');
  }
  if (conexao != null) {
    filtros.add('conexao_nomenclatura=ilike.%25$conexao%25');
  }
  if (setor != null) {
    filtros.add('Setor_nomenclatura=ilike.%25$setor%25');
  }
  if (colabuser != null) {
    filtros.add('colabuser_nome=ilike.%25$colabuser%25');
  }
  if (dtInicio != null) {
    filtros.add('created_at=gte.${dtInicio.toIso8601String()}');
  }
  if (dtFinal != null) {
    filtros.add('created_at=lte.${dtFinal.toIso8601String()}');
  }

  // Verifica se há filtros a serem aplicados
  if (filtros.isEmpty) {
    return null; // Retorna null se não houver filtros
  }

  // Constrói a linha de filtros
  String linhaFiltros = filtros.join('&');
  return linhaFiltros;
}

DateTime? formatJsonDate(dynamic json) {
  // format json string date to data time
  if (json == null) return null;
  try {
    final dateString = json.toString();
    final date = DateTime.parse(dateString);
    return date;
  } catch (e) {
    return null;
  }
}

int? jsonLength(dynamic json) {
  // uma função que retorna o numero de objetos de um json
  if (json is Map) {
    return json.length;
  } else if (json is List) {
    return json.length;
  } else {
    return null;
  }
}
