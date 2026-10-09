CREATE TABLE enrollments (
    id              BIGSERIAL PRIMARY KEY,
    student_id      BIGINT      NOT NULL REFERENCES students(id),
    course_id       BIGINT      NOT NULL REFERENCES courses(id),
    tahun_akademik  VARCHAR(20) NOT NULL,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_enrollment UNIQUE (student_id, course_id, tahun_akademik)
);

CREATE INDEX idx_enrollments_course_id ON enrollments(course_id);
