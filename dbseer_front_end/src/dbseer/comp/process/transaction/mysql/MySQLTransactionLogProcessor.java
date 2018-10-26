/*
 * Copyright 2013 Barzan Mozafari
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package dbseer.comp.process.transaction.mysql;

import dbseer.comp.data.Statement;
import dbseer.comp.data.Transaction;
import dbseer.comp.process.transaction.TransactionLogProcessor;
import dbseer.gui.DBSeerConstants;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by Dong Young Yoon on 1/2/16.
 *
 * Processes the MySQL/MariaDB DB log generated by tpmfilter from MaxScale.
 */
public class MySQLTransactionLogProcessor extends TransactionLogProcessor
{
	private int txCounter;
	private ConcurrentHashMap<Long, ArrayList<Transaction> > transactions;
	private String delimiter;
	private String queryDelimiter;

	public MySQLTransactionLogProcessor(String delimiter, String queryDelimiter)
	{
		this.txCounter = 0;
		this.transactions = new ConcurrentHashMap<Long, ArrayList<Transaction> >();
		this.delimiter = delimiter;
		this.queryDelimiter = queryDelimiter;
	}

	@Override
	public List<Transaction> getTransactions(long timestamp)
	{
		return transactions.remove(timestamp);
	}

	@Override
	public Set<Long> getTimestamps()
	{
		return transactions.keySet();
	}

	@Override
	public void handle(String line) throws Exception
	{
		String[] columns = line.split(delimiter);

		Transaction tx = new Transaction();
		long timestamp = Long.parseLong(columns[0]);
		String server = columns[1];

		tx.setId(txCounter++);
		tx.setEndTime(timestamp);
		tx.setServerName(server);
		tx.setHostName(columns[2]);
		tx.setLatency(Long.parseLong(columns[3]));
		tx.setNumTable(DBSeerConstants.MAX_NUM_TABLE);

		String queryString = columns[5];
		String[] queries = queryString.split(queryDelimiter);
		String[] latencies = columns[4].split(queryDelimiter);

		int count = 0;
		for (String query : queries)
		{
			// parse query statement.
			Statement statement = parseStatement(tx, query);
			if (statement == null)
			{
				continue;
			}

			tx.addStatement(statement);
			statement.setTransaction(tx);
			statement.setLatency(Double.parseDouble(latencies[count++]));
		}

		ArrayList<Transaction> txList = transactions.get(timestamp);
		if (txList == null)
		{
			txList = new ArrayList<Transaction>();
			transactions.put(timestamp, txList);
		}
		txList.add(tx);

	}
}
