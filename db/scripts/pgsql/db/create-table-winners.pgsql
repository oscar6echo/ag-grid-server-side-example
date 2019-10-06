-- DROP TABLE IF EXISTS winners;

CREATE TABLE winners (
    athlete         TEXT NOT NULL,
    age             INT,
    country         TEXT,
    year            INT,
    date            TIMESTAMP,
    sport           TEXT,
    gold            INT,
    silver          INT,
    bronze          INT,
    total           INT
);

COMMENT ON TABLE winners IS 'olympic medal winners';

COMMENT ON COLUMN winners.athlete IS 'firstname lastname of athlete';
COMMENT ON COLUMN winners.age IS 'age at competition';
COMMENT ON COLUMN winners.country IS 'origin county';
COMMENT ON COLUMN winners.year IS 'year of olympic competition';
COMMENT ON COLUMN winners.date IS 'date of competition';
COMMENT ON COLUMN winners.sport IS 'competition category';
COMMENT ON COLUMN winners.gold IS 'total number of gold medals for these olympics';
COMMENT ON COLUMN winners.silver IS 'total number of silver medals for these olympics';
COMMENT ON COLUMN winners.silver IS 'total number of silver medals for these olympics';
COMMENT ON COLUMN winners.bronze IS 'total number of bronze medals for these olympics';
COMMENT ON COLUMN winners.total IS 'total number of any metal medals for these olympics';

-- data from https://raw.githubusercontent.com/ag-grid/ag-grid/master/packages/ag-grid-docs/src/olympicWinners.json
