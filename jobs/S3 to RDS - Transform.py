import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

args = getResolvedOptions(sys.argv, ['JOB_NAME'])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

# Script generated for node Amazon S3
AmazonS3_node1712523087215 = glueContext.create_dynamic_frame.from_catalog(database="raw-database", table_name="load00000001_csv", transformation_ctx="AmazonS3_node1712523087215")

# Script generated for node Change Schema
ChangeSchema_node1712523097141 = ApplyMapping.apply(frame=AmazonS3_node1712523087215, mappings=[("col1", "string", "Nome", "string"), ("col3", "string", "Curso", "string"), ("col5", "string", "Professor", "string")], transformation_ctx="ChangeSchema_node1712523097141")

# Script generated for node Microsoft SQL Server
MicrosoftSQLServer_node1712526626642 = glueContext.write_dynamic_frame.from_catalog(frame=ChangeSchema_node1712523097141, database="rds-database", table_name="testdb_dbo_estudantes", transformation_ctx="MicrosoftSQLServer_node1712526626642")

job.commit()