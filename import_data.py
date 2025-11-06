import sqlite3

# Connect to database
conn = sqlite3.connect('movies.db')
cursor = conn.cursor()

# Import users (pipe-separated)
print("Importing users...")
with open('u.user', 'r', encoding='latin-1') as f:
    for line in f:
        data = line.strip().split('|')
        cursor.execute('INSERT INTO users VALUES (?, ?, ?, ?, ?)', data)

# Import movies (pipe-separated) 
print("Importing movies...")
with open('u.item', 'r', encoding='latin-1') as f:
    for line in f:
        data = line.strip().split('|')
        # Pad with None if less than 24, or trim if more than 24
        data = (data + [None] * 24)[:24]
        cursor.execute('INSERT INTO movies VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', data)

# Import ratings (tab-separated)
print("Importing ratings...")
with open('u.data', 'r', encoding='latin-1') as f:
    for line in f:
        data = line.strip().split('\t')
        cursor.execute('INSERT INTO ratings VALUES (?, ?, ?, ?)', data)

conn.commit()
conn.close()
print("All data imported successfully!")