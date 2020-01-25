/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */
 drop table Roles if exists;
create table Roles 
(
    id int not null unique
        generated always as
        identity(start with 1, increment by 1),
    name varchar(255)  not null primary key 
);
drop table UserInfo if exists;
create table UsersInfo 
(
    id int not null primary key
        generated always as
        identity(start with 1, increment by 1),
    name varchar(255) not null,
    surname varchar(255) not null
);
drop table Users if exists;
create table Users
(
    id int not null unique
        generated always as
        identity(start with 1, increment by 1),
    email varchar(255)  not null primary key,
    password varchar(255) not null,
    info int not null unique
        references UsersInfo(id),
    role int references Roles(id)
);
drop table Orders if exists;
create table Orders
(
    id int not null primary key
        generated always as
        identity(start with 1, increment by 1),
    users int not null 
        references Users(id),
    created timestamp not null 
);
drop table Suppliers if exists;
create table Suppliers 
(
    id int not null unique
        generated always as
        identity(start with 1, increment by 1),
    name varchar(255) not null primary key,
    address varchar(255),
    phone varchar(255) not null,
    representative varchar(255)
);
drop table Product if exists;
create table Products 
(
    id int not null unique
        generated always as
        identity(start with 1, increment by 1),
    code varchar(255) not null primary key,
    title varchar(255),
    supplier int not null 
        references Suppliers(id),
    initial_price double not null,
    retail_value double not null
);
drop table Order2Products  if exists;
create table Order2Products 
(
    orders int not null 
        references Orders(id),
    products int not null
        references Products(id)
);
