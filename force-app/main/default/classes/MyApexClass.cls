public class MyApexClass {
    public static String getGreeting() {
        return 'Hello from GitHub Actions Deployment!';
    }

    public static List<Account> getAccounts() {
        return [SELECT Id, Name, Industry FROM Account LIMIT 10];
    }

    public static void createAccount(String accountName, String industry) {
        Account acc = new Account();
        acc.Name = accountName;
        acc.Industry = industry;
        insert acc;
    }

    public static Account getAccountById(String accountId) {
        return [SELECT Id, Name, Industry, BillingCity FROM Account WHERE Id = :accountId LIMIT 1];
    }

    public static void updateAccountIndustry(String accountId, String newIndustry) {
        Account acc = [SELECT Id FROM Account WHERE Id = :accountId LIMIT 1];
        acc.Industry = newIndustry;
        update acc;
    }
}