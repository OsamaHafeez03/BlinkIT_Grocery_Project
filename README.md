# SQL-Based Grocery Sales Analysis

This repository contains a comprehensive SQL script for analyzing grocery sales data. The script performs data cleaning, calculates key performance indicators (KPIs), and generates aggregated insights from the grocery_data table. This analysis aims to uncover patterns related to sales performance across different product categories, outlet types, and locations.
# 🚀  Project Overview
The primary goal of this project is to use SQL to transform raw sales data into actionable business intelligence. The script is structured into three main parts:
## Initial Setup & Exploration: ##  Basic setup and initial queries to understand the dataset's scope.
# Data Cleaning: A crucial step to standardize inconsistent data for accurate analysis.
# KPI Analysis: A deep dive into various business metrics to measure performance.
# 🔧 Data Cleaning 
Before analysis, data consistency is ensured by standardizing the Item_Fat_Content column. Values like 'LF', 'low fat', and 'reg' are mapped to unified categories 'Low Fat' and 'Regular'.

# 📊 Key Performance Indicators (KPIs) Analyzed # 

The script calculates several core metrics to provide a multi-faceted view of the business.
# General KPIs
# Total Sales (in Millions): # The overall revenue generated.
# Average Sales: # The average value per transaction.
# Total Item Count: # The total number of items recorded.
# Average Item Rating: # The average customer rating across all items.

#⚙️ How to Use

# Database Setup: # Create a database (e.g., Blinkit).
# Data Import: # Import your dataset into a table named grocery_data.
# Execute Script: # Run this SQL script in your preferred SQL client (e.g., MySQL Workbench, DBeaver, command line) connected to your database.
