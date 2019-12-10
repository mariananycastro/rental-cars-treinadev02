class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category

  validates :start_date, :end_date, presence: true
  validate :end_date_must_be_greater_than_start_date

  #validate no singular pq eh um metodo que eu criei, não faz parte dos  metodos padroes
  # :end_date_must_be_greater_than_start_date metodo dentro do model rental

  def end_date_must_be_greater_than_start_date
    #return unless start_date.present? || end_date.present?
    if start_date.blank? || end_date.blank?

      #ou .present!, pq ai vai aparecer nil e '', vazio e com string vazia, string vazia.present? = true,
      # e com o presente dá false
      
      return errors.add(:base, 'Data devem existir')
      #base - tem algum erro no objeto, algum atributo esta errado e dá um erro geral no objeto
    elsif end_date <= start_date
      errors.add(:end_date, 'deve ser maior que data de início')
      #erro deve aparece ao preencher end_data
    end
  end

end
