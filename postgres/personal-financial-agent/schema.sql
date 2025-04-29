-- Usuários identificados por número de telefone
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    phone_number_wp VARCHAR(40),
    name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tipos de transações financeiras (renda ou despesa)
CREATE TABLE transaction_types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL CHECK (name IN ('income', 'expense'))
);

-- Categorias opcionais (ex: Alimentação, Transporte, Salário)
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    is_default BOOLEAN DEFAULT TRUE
);

-- Transações lançadas pelo usuário
CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    type_id INTEGER NOT NULL REFERENCES transaction_types(id),
    category_id INTEGER REFERENCES categories(id),
    amount NUMERIC(12,2) NOT NULL CHECK (amount >= 0),
    description TEXT,
    transaction_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Logs de erros
CREATE TABLE error_logs (
    id SERIAL PRIMARY KEY,
    presence VARCHAR(200) NOT NULL,
    error VARCHAR(200) NOT NULL,
    metadata TEXT
);
