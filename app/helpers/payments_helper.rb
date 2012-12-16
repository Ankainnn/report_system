module PaymentsHelper
  def client_fio_normalize(fi_and_phone)
    fi_and_phone.split(" - ").first
  end
end
