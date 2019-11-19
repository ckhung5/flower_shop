# flower_shop
This is a flower calculator to calculate total of a flower order. 

# How to Run it
Remember to install jq for pretty json print

```
./script/start.rb | jq .
```

Adjust different numbers in __input.json__ file for different outcome

# Assumptions
1. Incoming order will be represented using JSON
2. Result will be rounded into decimal of 2
3. There is no repeated order in each series
4. Output result will be JSON. 