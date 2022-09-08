class User:
    count = 0

    def __init__(self, name, login, password):
        self.__name = name
        self.__login = login
        self.__password = password
        User.count += 1

    @property
    def name(self):
        return self.__name

    @name.setter
    def name(self, name):
        self.__name = name

    @property
    def login(self):
        return self.__login

    @login.setter
    def login(self):
        raise AttributeError("Can't set login")

    @property
    def password(self):
        raise AttributeError("Password is unreadable")

    @password.setter
    def password(self, password):
        self.__password = password

    def show_info(self):
        return (f'Name: {self.name}, Login: {self.login}')


class SuperUser(User):
    count = 0

    def __init__(self, name, login, password, role):
        super().__init__(name, login, password)
        self.__role = role
        SuperUser.count += 1

    @property
    def role(self):
        return self.__role

    @role.setter
    def role(self, role):
        self.__role = role

    def show_info(self):
        return super().show_info() + f', role {self.role}'
        # print(f'Name: {self.name}, Login: {self.login}, Role: {self.role}')





user1 = User("Tom", "Admin", 'Queen')
user2 = User("Nick", 'English', "Life")
user3 = User("Maria", "Maria99", "London")
admin1 = SuperUser("Coleen", "Coleen1", "Freedom", "Administrator")
admin2 = SuperUser("Katrin", "Kat", "Equality", "Developer")
# user1.show_info()
admin1.show_info()
print(f'Users in the system: {User.count}')
print(f'Superusers in the system: {SuperUser.count}')
user3.name = "Ringo Star"
print(user3.name)
print(user2.login)
# user2.login = 'geo'
user1.password = "Pa$$word"
# print(user1.password)