Three tables - users, channels, messages
Each message has 1 user and 1 channel so it holds 2 foreign keys
Used timestampz(TIMESTAMP WITH TIME ZONE) because different users have different timezones and the time could be the same but different time zone 