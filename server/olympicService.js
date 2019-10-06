import { Client } from 'pg';

// const connectionString = 'postgres://aggrid:pwdd@localhost:5432/olympics';
const username = '';
const password = '';
const dnbame = '';
const connectionString = `postgres://${username}:${password}@localhost:5432/${dnbame}`;

const connection = new Client({ connectionString });
connection.connect();

// connection.query('select count (*) from winners;', (err, result) => {
//   if (err) {
//     console.log('ERROR');
//     console.log(err);
//   } else {
//     console.log('SUCCESS');
//     console.log(result);
//   }
// });

export function fetchRows(args, resultCallback) {
  connection.query(buildSql(args), resultCallback);
}

const buildSql = (args) => {
  console.log(args);

  let SQL =
    select(args) +
    from() +
    where(args) +
    groupBy(args) +
    orderBy(args) +
    limit(args) +
    ';';

  console.log(`DEBUG -------------- \n`);
  console.log(JSON.stringify(args));
  console.log(`\n ${SQL} \n`);

  return SQL;
};

const select = (args) => {
  if (args.rowGroups.length > 0) {
    let groupsToUse = args.rowGroups.slice(
      args.groupKeys.length,
      args.groupKeys.length + 1
    );
    if (groupsToUse.length > 0) {
      return (
        'SELECT ' +
        groupsToUse.map((group) => group.field).join(', ') +
        ', sum(gold) as gold, sum(silver) as silver, sum(bronze) as bronze '
      );
    }
  }
  return 'SELECT *';
};

const from = () => ' FROM public.winners';

const where = (args) => {
  let rowGroups = args.rowGroups;
  let groupKeys = args.groupKeys;
  let whereClause = '';
  if (groupKeys) {
    for (let i = 0; i < groupKeys.length; i++) {
      whereClause += i === 0 ? ' WHERE ' : ' AND ';
      whereClause += `${rowGroups[i].field} = '${groupKeys[i]}'`;
    }
  }
  return whereClause;
};

const groupBy = (args) => {
  let groupBy = '';
  if (args.rowGroups.length > 0) {
    let groupsToUse = args.rowGroups.slice(
      args.groupKeys.length,
      args.groupKeys.length + 1
    );
    if (groupsToUse.length > 0) {
      groupBy +=
        ' GROUP BY ' + groupsToUse.map((group) => group.field).join(', ');
    }
  }
  return groupBy;
};

const orderBy = (args) => {
  if (args.sorting && args.sorting.length > 0) {
    return (
      ' ORDER BY ' + args.sorting.map((s) => `${s.colId} ${s.sort}`).join(', ')
    );
  }
  return '';
};

const limit = (args) => {
  if (args.endRow) {
    let pageSize = args.endRow - args.startRow;
    // return ` LIMIT ${args.startRow}, ${pageSize + 1}`;
    return ` LIMIT ${pageSize} OFFSET ${args.startRow}`;
  }
  return '';
};
