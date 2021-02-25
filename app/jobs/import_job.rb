require 'csv'

class ImportJob < ApplicationJob
  queue_as :default

  def perform(csv)
    csv_options = { col_sep: ';', quote_char: nil, headers: :first_row, encoding: "ISO8859-1" }
    intercommunality_form = {
      "CA" => "ca",
      "CU" => "cu",
      "CC" => "cc",
      "METRO" => "met"
    }

    CSV.foreach(csv, csv_options) do |row|
      intercommunality = Intercommunality.where(name: row['nom_complet'], siren: row['siren_epci'], form: intercommunality_form[row['form_epci']]).first_or_create
      commune = Commune.where(code_insee: row['insee'], name: row['nom_com'], population: row['pop_total']).first_or_create
    end
  end
end
