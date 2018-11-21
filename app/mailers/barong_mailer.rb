# frozen_string_literal: true

class BarongMailer < ApplicationMailer
  def verification_email(email, token)
    @email = email
    @confirmation_link = ENV.fetch('BARONG_ACCOUNT_EMAIL_CONFIRMATION_URL_TEMPLATE').gsub(/#\{token\}/, token)
    mail(to: @email, subject: '"Hesap Doğrulama İşlemi - Confirmation Instructions')
  end

  def password_reset_email(email, token)
    @email = email
    @confirmation_link = ENV.fetch('BARONG_ACCOUNT_PASSWORD_RESET_URL_TEMPLATE').gsub(/#\{token\}/, token)
    mail(to: @email, subject: 'Şifre Sıfırlama - Reset Password Instructions')
  end

  def unlock_instructions(email, token)
    @email = email
    @confirmation_link = ENV.fetch('BARONG_ACCOUNT_UNLOCK_URL_TEMPLATE').gsub(/#\{token\}/, token)
    mail(to: @email, subject: 'Hesap Kilidi Açma - Unlock Account Instructions')
  end

  def document_verified(email)
    @email = email
    @link = ENV.fetch('BARONG_ACCOUNT_SIGN_IN_URL')
    mail(to: @email, subject: 'Hesabınız Onaylanmıştır - Your Identity Was Approved')
  end
end
