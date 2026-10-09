CREATE TABLE students (
    id           BIGSERIAL PRIMARY KEY,
    user_id      BIGINT       NOT NULL UNIQUE REFERENCES users(id),
    nim          VARCHAR(12)  NOT NULL UNIQUE CHECK (nim ~ '^[0-9]{12}$'),
    nama         VARCHAR(150) NOT NULL,
    prodi        VARCHAR(100) NOT NULL,
    angkatan     INT          NOT NULL CHECK (angkatan BETWEEN 1000 AND 9999),
    ipk_terakhir NUMERIC(3,2) NOT NULL DEFAULT 0 CHECK (ipk_terakhir BETWEEN 0 AND 4),
    deleted_at   TIMESTAMPTZ,
    created_at   TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_students_deleted_at ON students(deleted_at);
