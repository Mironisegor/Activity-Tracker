-- SQL schema reflecting the Core Data model defined in Resources/DB.xcdatamodeld
-- Types use SQLite-compatible affinities; UUID/Date stored as TEXT for portability.

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS Gear (
    id TEXT PRIMARY KEY,
    name TEXT,
    weight REAL DEFAULT 0,
    -- rides relationship handled via Ride.gear_id foreign key
    created_at TEXT DEFAULT (DATETIME('now'))
);

CREATE TABLE IF NOT EXISTS "User" (
    id TEXT PRIMARY KEY,
    name TEXT,
    uses_metric_system INTEGER, -- BOOLEAN stored as 0/1
    weight REAL DEFAULT 0
    -- rides relationship handled via Ride.user_id foreign key
);

CREATE TABLE IF NOT EXISTS Ride (
    id TEXT PRIMARY KEY,
    name TEXT,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL,
    deleted_at TEXT,
    gear_id TEXT,
    summary_id TEXT UNIQUE,
    track_id TEXT UNIQUE,
    user_id TEXT,
    FOREIGN KEY (gear_id) REFERENCES Gear(id) ON DELETE SET NULL,
    FOREIGN KEY (summary_id) REFERENCES RideSummary(id) ON DELETE CASCADE,
    FOREIGN KEY (track_id) REFERENCES Track(id) ON DELETE SET NULL,
    FOREIGN KEY (user_id) REFERENCES "User"(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS RideSummary (
    id TEXT PRIMARY KEY,
    ride_id TEXT UNIQUE,
    avg_power REAL DEFAULT 0,
    avg_speed REAL NOT NULL DEFAULT 0,
    distance REAL NOT NULL DEFAULT 0,
    duration REAL NOT NULL DEFAULT 0,
    elevation_gain REAL DEFAULT 0,
    max_speed REAL NOT NULL DEFAULT 0,
    FOREIGN KEY (ride_id) REFERENCES Ride(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Track (
    id TEXT PRIMARY KEY,
    name TEXT,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL,
    ride_id TEXT UNIQUE,
    region_id TEXT UNIQUE,
    FOREIGN KEY (ride_id) REFERENCES Ride(id) ON DELETE SET NULL,
    FOREIGN KEY (region_id) REFERENCES TrackRegion(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS TrackRegion (
    id TEXT PRIMARY KEY,
    track_id TEXT UNIQUE,
    latitude_center REAL DEFAULT 0,
    latitude_delta REAL DEFAULT 0,
    longitude_center REAL DEFAULT 0,
    longitude_delta REAL DEFAULT 0,
    FOREIGN KEY (track_id) REFERENCES Track(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS TrackPoint (
    id TEXT PRIMARY KEY,
    track_id TEXT,
    name TEXT,
    latitude REAL NOT NULL DEFAULT 0,
    longitude REAL NOT NULL DEFAULT 0,
    elevation REAL DEFAULT 0,
    speed REAL DEFAULT 0,
    timestamp TEXT,
    FOREIGN KEY (track_id) REFERENCES Track(id) ON DELETE SET NULL
);

