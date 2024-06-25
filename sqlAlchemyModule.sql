# Import the SQLAlchemy module
from sqlalchemy import create_engine

# Create a connection to the MySQL database
engine = create_engine("mysql+pymysql://root:password@localhost/my_database")

# Create a DataFrame from the CSV file
df = pd.read_csv("my_data.csv")

# Insert the data into the database
df.to_sql("my_table", engine, if_exists="replace")