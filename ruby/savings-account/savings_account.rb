module SavingsAccount
  def self.interest_rate(balance)
    return 3.213 if balance.negative?

    if balance < 1000
      return 0.5
    elsif balance >= 1000 && balance < 5000
      return 1.621
    end

    2.475
  end

  def self.annual_balance_update(balance)
    balance * (100 + SavingsAccount.interest_rate(balance)) / 100
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    balance = current_balance
    years = 0
    until balance >= desired_balance
      balance = SavingsAccount.annual_balance_update(balance)
      years += 1
    end
    years
  end
end
