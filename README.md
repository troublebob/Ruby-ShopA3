Ruby-ShopA3
===========

Ruby Assignment 3
30070 Worksheet: Extending the Shop Assignment
1. This worksheet involves extending the Shop assignment. You may use your own 
solution to start with, or the sample solution that has been provided.
A DiscountedProduct is like a Product, but has an additional data member, 
discount, which denotes the percentage discount that is to be applied to the 
gross price. The to_s method for a DiscountedProduct appends 
“DISCOUNTED” to the string it outputs. Using inheritance, implement the 
DiscountedItem class, overriding the gross_price and to_s methods appropriately. 
A FreeProduct is also like a Product, but but its gross price is zero, regardless of 
its net price. Again, use inheritance to create this class.
The shop is running a sale, where Ties are reduced by 10%, Hats are half-price 
and Handkerchiefs are free. Update your script to reflect this, and create a 
suitable new data file to test with. 
Notes:
Don’t forget the test cases! Try writing the test cases before you write the code.
There’s no need to submit your solution to this worksheet this week, but you will be 
asked to extend the Shop example again and submit it, and this work will be graded 
as part of the submission.
The format of the input file doesn’t change. A sample input file might be:
Bag ! ! 100.0!100
Hat ! ! 50.0 !10
Scarf ! ! 20.0!5
Handkerchief! 5.0 !50 
Tie! ! ! 15.0!30
So the knowledge that Hats and Ties are discounted and Handkerchiefs are free is in 
the script that reads the file, not in the file itself