class Emailer < ActionMailer::Base
   default from: "no-reply@lp-dw.com"

   def contact(data, sent_at = Time.now)
      @name = data["name_contact"]
      @email = data["email_contact"]
      @recipient = "l.ricard@faclab.org"
      @message = data["message_contact"]
      mail(to: @recipient, subject: 'Site LP: Contact')
   end

   def send_mail_interview(email,date, sent_at = Time.now)
    @date = date
    mail(to: email, subject: 'LP : Entretien de motivation')
   end

  def welcome_applicant (applicant)
    @applicant = applicant
    mail(to: applicant.email, subject: 'LP : Inscription LPDWSIM')
  end

  def reminder (applicant)
    mail( to: applicant.email, subject: '[LPDW] Candidature en cours')
  end

   def error_tips(params)
     @admin_mail = "jdmangubu@gmail.com"
     @params = params
     if @params[:email].empty? || @params[:description].empty?
       false
     else
       mail( to: @admin_mail, subject: '[LPDW] Erreur bon plans')
     end
   end

end
