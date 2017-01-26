
1.what is the meaning of 'q' and what does 'count' mean?  
'q': A UTF-8, URL-encoded search query of 500 characters maximum, including operators. Queries may additionally be limited by complexity.
'count': The number of tweets to return per page, up to a maximum of 100. Defaults to 15. This was formerly the “rpp” parameter in the old Search API.

2.what datastructure is search-results?    
dictionary

3.why do we code like: search_results['statuses']?  
Because the 'search_results' is a dictionary, we need use index to get detailed information we want.

4.what datastructure is result?  
It is dictionary
