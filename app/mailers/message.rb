class Message < ActionMailer::Base
  # デフォルトでの送信元のアドレス
  default from: "hidetaka.koh@gmail.com"

  def hello(name)
    @name = name
    mail(
      to:      'hidetaka.48691001@icloud.com',
      subject: 'Mail from Message',
    ) do |format|
      format.html
    end
  end
end