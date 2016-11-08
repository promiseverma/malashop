module AccountsHelper

	def get_balance(account)
		debit, credit = 0, 0
		balance = Account.where("customer_id = ? and id <= ?", account.customer_id, account.id)
		debit = balance.map(&:debit).compact.inject(0){|sum,x| sum + x } if balance.map(&:debit).any?
		credit = balance.map(&:credit).compact.inject(0){|sum,x| sum + x } if balance.map(&:credit).any?
		return debit - credit
	end

end
