//
//  main.swift
//  WBBank
//
//  Created by Назар Ткаченко on 22.06.2024.
//

struct Account {
    var accountNumber: Int
    var balance: Double
}

final class Bank {
    private var accounts: [Account] = []

    func addAccount(account: Account) {
        accounts.append(account)
    }

    func deposit(accountNumber: Int, amount: Double) {
        if let index = accounts.firstIndex(where: { $0.accountNumber == accountNumber }) {
            accounts[index].balance += amount
        } else {
            print("Аккаунт с номером \(accountNumber) не найден.")
        }
    }

    func transfer(fromAccountNumber: Int, toAccountNumber: Int, amount: Double) {
        guard let fromAccountIndex = accounts.firstIndex(where: { $0.accountNumber == fromAccountNumber }),
              let toAccountIndex = accounts.firstIndex(where: { $0.accountNumber == toAccountNumber }) else {
            print("Один или оба счета не найдены.")
            return
        }

        if accounts[fromAccountIndex].balance >= amount {
            accounts[fromAccountIndex].balance -= amount
            accounts[toAccountIndex].balance += amount
        } else {
            print("Недостаточно средств на счету \(fromAccountNumber).")
        }
    }

    func printAccounts() {
        for account in accounts {
            print("Номер счета \(account.accountNumber): баланс \(account.balance)")
        }
    }
}

//MARK: - Выполнение программы

let bank = Bank()

bank.addAccount(account: Account(accountNumber: 101, balance: 500))
bank.addAccount(account: Account(accountNumber: 102, balance: 1000))
bank.addAccount(account: Account(accountNumber: 103, balance: 1500))

print("Состояние счетов до выполнения операций:")
bank.printAccounts()

bank.deposit(accountNumber: 101, amount: 300)
bank.deposit(accountNumber: 101, amount: 200)
bank.transfer(fromAccountNumber: 102, toAccountNumber: 103, amount: 300)

print("\nСостояние счетов после выполнения операций:")
bank.printAccounts()
