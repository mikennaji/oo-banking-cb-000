class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status


  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction

    if @sender.balance < self.amount || @sender.valid? === false ||self.status === "complete" || @sender.status === "closed" || @receiver.status === "closed"
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      @sender.balance -= self.amount
      @receiver.balance += self.amount
      self.status = "complete"
   end
  end


def reverse_transfer

  if self.status === "complete"
    @sender.balance += self.amount
    @receiver.balance -= self.amount
    self.status = "reversed"
  else

  end
end

end
