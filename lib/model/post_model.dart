class Country_model {
  Data? data;
  String? status;

  Country_model({this.data, this.status});

  Country_model.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  PaginationMeta? paginationMeta;
  String? lastUpdate;
  List<Rows>? rows;

  Data({this.paginationMeta, this.lastUpdate, this.rows});

  Data.fromJson(Map<String, dynamic> json) {
    paginationMeta = json['paginationMeta'] != null
        ? new PaginationMeta.fromJson(json['paginationMeta'])
        : null;
    lastUpdate = json['last_update'];
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(new Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paginationMeta != null) {
      data['paginationMeta'] = this.paginationMeta!.toJson();
    }
    data['last_update'] = this.lastUpdate;
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaginationMeta {
  int? currentPage;
  int? currentPageSize;
  int? totalPages;
  int? totalRecords;

  PaginationMeta(
      {this.currentPage,
        this.currentPageSize,
        this.totalPages,
        this.totalRecords});

  PaginationMeta.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    currentPageSize = json['currentPageSize'];
    totalPages = json['totalPages'];
    totalRecords = json['totalRecords'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['currentPageSize'] = this.currentPageSize;
    data['totalPages'] = this.totalPages;
    data['totalRecords'] = this.totalRecords;
    return data;
  }
}

class Rows {
  String? country;
  String? countryAbbreviation;
  String? totalCases;
  String? newCases;
  String? totalDeaths;
  String? newDeaths;
  String? totalRecovered;
  String? activeCases;
  String? seriousCritical;
  String? casesPerMillPop;
  String? flag;

  Rows(
      {this.country,
        this.countryAbbreviation,
        this.totalCases,
        this.newCases,
        this.totalDeaths,
        this.newDeaths,
        this.totalRecovered,
        this.activeCases,
        this.seriousCritical,
        this.casesPerMillPop,
        this.flag});

  Rows.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    countryAbbreviation = json['country_abbreviation'];
    totalCases = json['total_cases'];
    newCases = json['new_cases'];
    totalDeaths = json['total_deaths'];
    newDeaths = json['new_deaths'];
    totalRecovered = json['total_recovered'];
    activeCases = json['active_cases'];
    seriousCritical = json['serious_critical'];
    casesPerMillPop = json['cases_per_mill_pop'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['country_abbreviation'] = this.countryAbbreviation;
    data['total_cases'] = this.totalCases;
    data['new_cases'] = this.newCases;
    data['total_deaths'] = this.totalDeaths;
    data['new_deaths'] = this.newDeaths;
    data['total_recovered'] = this.totalRecovered;
    data['active_cases'] = this.activeCases;
    data['serious_critical'] = this.seriousCritical;
    data['cases_per_mill_pop'] = this.casesPerMillPop;
    data['flag'] = this.flag;
    return data;
  }
}