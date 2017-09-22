# Pagination

You are given a list of apartment listings in descending order of popularity.
You must paginate these listings, where there are `n` number of entries per page.
However, there is a rule that, if possible, no two entries on a given page may have the same lister.

You'll be given an array of strings.
The response should be a multi-line string, where there is an empty space between pages of the pagination.

The data is organized as such:

```
address, popularity, lister_id
```

Take the following set of data:

```
123 abc st., 100, 1
124 abc st., 99, 2
125 abc st., 97, 1
126 bcd st., 80, 3
127 bcd st., 79, 2
130 dce st., 78, 1
131 dce st., 77, 2
132 dce st., 70, 3
133 asd st., 60, 1
```

This should be returned in the following format:

```
123 abc st., 100, 1
124 abc st., 99, 2
126 bcd st., 80, 3

125 abc st., 97, 1
127 bcd st., 79, 2
132 dce st., 70, 3

130 dce st., 78, 1
131 dce st., 77, 2
133 asd st., 60, 1
```
